package mes.web.bs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bs.BizOrderAdmVo;
import mes.domain.bs.BizOrderConsumptVo;
import mes.domain.io.BizOrderMrpVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.BizOrderAdmService;
import mes.service.bs.BizOrderConsumptService;
import mes.service.io.BizOrderMrpService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BizOrderConsumptController {

	private static final Logger logger = LoggerFactory.getLogger(BizOrderConsumptController.class);


	@Inject
	private BizOrderConsumptService bizOrderConsumptService;
	
	@Inject
	private BizOrderMrpService bizOrderMrpService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	// 소요량분석(사출) 메인
	@RequestMapping(value = "/iosc0130", method = RequestMethod.GET)
	public String iosc0130(Locale locale, Model model) throws Exception {
		logger.info("소요량분석(사출) 메인 시작");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -30));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "io/iosc0130";
	}
	
	// 소요량분석(봉제) 메인
	@RequestMapping(value = "/iosc0290", method = RequestMethod.GET)
	public String iosc0290(Locale locale, Model model) throws Exception {
		logger.info("소요량분석(봉제) 메인 시작");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -30));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("148"); //생산구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> CommonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubunList", CommonCodeList);
		
		
		return "io/iosc0290";
	}
	
	// 소요량코드 목록조회
	@RequestMapping(value = "bs/bizOrderMrpList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> bizOrderMrpList(BizOrderMrpVo bizOrderMrpVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			List<BizOrderMrpVo> list = bizOrderMrpService.listAll(bizOrderMrpVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	// 소요량코드 상세조회
	@RequestMapping(value = "bs/bizOrderMrpRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> bizOrderMrpRead(BizOrderMrpVo bizOrderMrpVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			bizOrderMrpVo = bizOrderMrpService.read(bizOrderMrpVo);
			jsonData.put("data", bizOrderMrpVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	// 소요량코드 등록
	@RequestMapping(value = "bs/bizOrderMrpCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> bizOrderMrpCreate(BizOrderMrpVo bizOrderMrpVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			int seq = bizOrderMrpService.seq(bizOrderMrpVo.getMrpYear() + bizOrderMrpVo.getMrpMon());
			bizOrderMrpVo.setMrpNo("M" + bizOrderMrpVo.getMrpYear() + bizOrderMrpVo.getMrpMon() + "-" + String.format("%03d",seq));
			bizOrderMrpVo.setMrpSeq(1);
			bizOrderMrpVo.setConfirmYn("002");
			bizOrderMrpVo.setRegId(Utils.getUserId());
			bizOrderMrpService.create(bizOrderMrpVo);
			jsonData.put("data", bizOrderMrpVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	// 소요량코드 수정
	@RequestMapping(value = "bs/bizOrderMrpUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> bizOrderMrpUpdate(BizOrderMrpVo bizOrderMrpVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			bizOrderMrpService.update(bizOrderMrpVo);
			jsonData.put("data", bizOrderMrpVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	// 소요량코드 삭제
	@RequestMapping(value = "bs/bizOrderMrpDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> bizOrderMrpDelete(BizOrderMrpVo bizOrderMrpVo, BizOrderConsumptVo bizOrderConsumptVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("소요량코드 삭제");
		try {
			bizOrderMrpService.delete(bizOrderMrpVo);
			bizOrderConsumptService.bizOrderConsumptDelete(bizOrderConsumptVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	// 소요량분석 목록 삭제
	@RequestMapping(value = "bs/bizOrderConsumptDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> bizOrderConsumptDelete(BizOrderMrpVo bizOrderMrpVo, BizOrderConsumptVo bizOrderConsumptVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("소요량분석 목록 삭제");
		try {
			bizOrderConsumptService.bizOrderConsumptDelete(bizOrderConsumptVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 소요량분석 목록조회
	@RequestMapping(value = "bs/bizOrderConsumptList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> bizOrderConsumptList(BizOrderConsumptVo bizOrderConsumptVo){
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("소요량분석 목록조회"+bizOrderConsumptVo);
		try {
			List<BizOrderConsumptVo> list = new ArrayList<BizOrderConsumptVo>();
				
			String reloadCheck = bizOrderConsumptVo.getReloadCheck();
			if(reloadCheck.equals("reload")) {
				logger.info("1111111");
				
				list =  bizOrderConsumptService.bizOrderConsumptList(bizOrderConsumptVo);
				if(bizOrderConsumptVo.getItemSeqArray()==null||bizOrderConsumptVo.getItemSeqArray().length==0) {
					logger.info("222222");
					list = new ArrayList<BizOrderConsumptVo>();
				}
			}else {
				logger.info("333333");
				list =  bizOrderConsumptService.bizOrderConsumptRead(bizOrderConsumptVo);
				
				if(list.size()==0) {
					logger.info("444444");
					list =  new ArrayList<BizOrderConsumptVo>();
					jsonData.put("editCheck", false);
				} else {
					jsonData.put("editCheck", true);
				}
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	
	//소요량분석 등록
	@RequestMapping(value="bs/bizOrderConsumptCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preInOutWhsAdmCreate(@RequestBody List<Map<String, Object>> bizOrderList) throws Exception{
		BizOrderConsumptVo bizOrderConsumptVo = new BizOrderConsumptVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			
			bizOrderConsumptVo.setMrpNo(bizOrderList.get(0).get("mrpNo").toString());
			bizOrderConsumptVo.setMrpSeq(bizOrderList.get(0).get("mrpSeq").toString());
			bizOrderConsumptService.bizOrderConsumptDelete(bizOrderConsumptVo);
			
			List<BizOrderConsumptVo> BizOrderConsumptList = new ArrayList<BizOrderConsumptVo>();
			
			for(Map<String, Object> m :bizOrderList) {
				
				if(m.get("itemSeq")!=null && !m.get("itemSeq").equals("")) {
					BizOrderConsumptVo bizOrderConsumptInsVo = new BizOrderConsumptVo();
					
					bizOrderConsumptInsVo.setMrpNo(bizOrderList.get(0).get("mrpNo").toString());
					bizOrderConsumptInsVo.setMrpSeq(bizOrderList.get(0).get("mrpSeq").toString());
					bizOrderConsumptInsVo.setItemSeq(m.get("itemSeq").toString());
					bizOrderConsumptInsVo.setTmQty(m.get("tmQty").toString());
					bizOrderConsumptInsVo.setOrdPredQty(m.get("ordPredQty").toString());
					bizOrderConsumptInsVo.setMonPlanQty(m.get("monPlanQty").toString());
					bizOrderConsumptInsVo.setOrdCorpCd(m.get("ordCorpCd").toString());
					bizOrderConsumptInsVo.setReqQty(m.get("reqQty").toString());
					bizOrderConsumptInsVo.setUnuseQty("0");
					bizOrderConsumptInsVo.setAvailStock("0");
					bizOrderConsumptInsVo.setPurPredQty("0");
					bizOrderConsumptInsVo.setOriginOrdQty("0");
					bizOrderConsumptInsVo.setStockUseYn("001");
					bizOrderConsumptInsVo.setRegId(Utils.getUserId());
					
					BizOrderConsumptList.add(bizOrderConsumptInsVo);
				}
			}
			
			for(int finishIdx = 0;finishIdx < BizOrderConsumptList.size();finishIdx+=100) {
				logger.info("현재: " + finishIdx);
				if(finishIdx+100 >= BizOrderConsumptList.size()) {
					List<BizOrderConsumptVo> tempList = BizOrderConsumptList.subList(finishIdx, BizOrderConsumptList.size());
					bizOrderConsumptService.bizOrderConsumptListCreate(tempList);
				} else {
					List<BizOrderConsumptVo> tempList = BizOrderConsumptList.subList(finishIdx, finishIdx+100);
					bizOrderConsumptService.bizOrderConsumptListCreate(tempList);
				}
				
			}
			
			
			jsonData.put("result", "ok");
				
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
		
	// 소요량코드 확정
	@RequestMapping(value = "bs/bizOrderMrpConfirm" , method = RequestMethod.POST)
	public @ResponseBody Map<String , Object> bizOrderMrpUpdateStatus(BizOrderMrpVo bizOrderMrpVo){
		BizOrderConsumptVo bizOrderConsumptVo = new BizOrderConsumptVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			bizOrderConsumptVo.setMrpNo(bizOrderMrpVo.getMrpNo());
			bizOrderConsumptVo.setMrpSeq(Integer.toString(bizOrderMrpVo.getMrpSeq()));
			bizOrderConsumptVo.setMainGubun(bizOrderMrpVo.getMainGubun());
			if ( bizOrderMrpVo.getConfirmYn().equals("001") ) {
				
				//소요량 존재여부확인
				List<BizOrderConsumptVo> list = bizOrderConsumptService.bizOrderConsumptRead(bizOrderConsumptVo);
				if(list.size()==0) {
					jsonData.put("result", "fail");
					jsonData.put("message", "소요량분석후에 확정할 수 있습니다.");
				}else {
					
					bizOrderMrpService.updateStatus(bizOrderMrpVo);
					jsonData.put("result", "ok");
					jsonData.put("message", "확정되었습니다.");
				}
			} else {
				//발주 존재여부확인
				if(bizOrderMrpService.getPurchaseExist(bizOrderMrpVo)==0) {
					bizOrderMrpService.updateStatus(bizOrderMrpVo);
					jsonData.put("result", "ok");
					jsonData.put("message", "확정취소되었습니다.");
				}else {
					jsonData.put("result", "fail");
					jsonData.put("message", "발주처리된 건입니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
		
	
	
	
}
