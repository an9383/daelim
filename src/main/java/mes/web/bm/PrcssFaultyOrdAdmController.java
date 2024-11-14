package mes.web.bm;

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
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.bm.PrcssFaultyOrdAdmVo;
import mes.domain.sm.MenuInfoAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.service.bm.PrcssFaultyOrdAdmService;
import mes.web.ut.Utils;

@Controller
public class PrcssFaultyOrdAdmController {
	private static final Logger logger = LoggerFactory.getLogger(PrcssFaultyOrdAdmController.class);


	@Inject
	private PrcssFaultyOrdAdmService prcssFaultyOrdAdmService;
	
	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 공정불량관리(봉제) 페이지
	@RequestMapping(value = "/bmsc0092", method = RequestMethod.GET)
	public String bmsc0092(Locale locale, Model model) throws Exception {
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("155"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> regYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("regYn", regYnList);
			
			PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
			prcssCodeAdmVo.setMainGubun("002");
			prcssCodeAdmVo.setPrcssType("001");
			List<PrcssCodeAdmVo> prcssList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);
			model.addAttribute("prcssList", prcssList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0092";
	}
	
	//목록조회
	@RequestMapping(value = "/bm/prcssFaultyOrdAdmlistAll", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssFaultyOrdAdmlistAll(PrcssFaultyOrdAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("목록조회 : " +vo);
		try {
			List<PrcssFaultyOrdAdmVo> list = prcssFaultyOrdAdmService.listAll(vo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//조회
	@RequestMapping(value = "/bm/prcssFaultyOrdAdmlist", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssFaultyOrdAdmlist(PrcssFaultyOrdAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("목록조회 : " +vo);
		try {
			List<PrcssFaultyOrdAdmVo> list = new ArrayList<PrcssFaultyOrdAdmVo>();
			if(vo.getPrcssCd()!=null && !vo.getPrcssCd().equals("")) {
				list = prcssFaultyOrdAdmService.list(vo);
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
	
	//등록
	@RequestMapping(value = "/bm/prcssFaultyOrdAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssFaultyOrdAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			PrcssFaultyOrdAdmVo delVo = new PrcssFaultyOrdAdmVo();
			delVo.setPrcssCd(list.get(0).get("prcssCd").toString());
			delVo.setItemSeq(list.get(0).get("itemSeq").toString());
			prcssFaultyOrdAdmService.delete(delVo);
			
			List<PrcssFaultyOrdAdmVo> insList = new ArrayList<PrcssFaultyOrdAdmVo>();
			
			for(Map<String, Object> m :list) {
				PrcssFaultyOrdAdmVo insVo = new PrcssFaultyOrdAdmVo();
				insVo.setFaultyOrd(m.get("faultyOrd").toString());
				insVo.setPrcssCd(m.get("prcssCd").toString());
				insVo.setItemSeq(m.get("itemSeq").toString());
				insVo.setFaultyCd(m.get("faultyCd").toString());
				insVo.setUseYn(m.get("useYn").toString());
				insVo.setUpdId(Utils.getUserNumber());		
				insList.add(insVo);
			}
			
			for ( int finishIdx = 0; finishIdx < insList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= insList.size()) {
					List<PrcssFaultyOrdAdmVo> tempList = insList.subList(finishIdx, insList.size());
					prcssFaultyOrdAdmService.create(tempList);
					logger.info("공정불량 일괄등록" + finishIdx+ ": " + tempList);
				} else {
					List<PrcssFaultyOrdAdmVo> tempList = insList.subList(finishIdx, finishIdx+50);
					prcssFaultyOrdAdmService.create(tempList);
					logger.info("공정불량 일괄등록" + finishIdx+ ": " + tempList);
				}
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		
		return jsonData;
		
	}
	
	//삭제
	@RequestMapping(value = "/bm/prcssFaultyOrdAdmBatchDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssFaultyOrdAdmBatchDelete(PrcssFaultyOrdAdmVo prcssFaultyOrdAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("vo:"+prcssFaultyOrdAdmVo);
			prcssFaultyOrdAdmService.delete(prcssFaultyOrdAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		
		return jsonData;
	}
	
	
	//등록
	@RequestMapping(value = "/bm/prcssFaultyOrdAdmBatchCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssFaultyOrdAdmBatchCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<PrcssFaultyOrdAdmVo> insList = new ArrayList<PrcssFaultyOrdAdmVo>();
			
			for(Map<String, Object> m :list) {
				PrcssFaultyOrdAdmVo insVo = new PrcssFaultyOrdAdmVo();
				insVo.setFaultyOrd(m.get("faultyOrd").toString());
				insVo.setPrcssCd(m.get("prcssCd").toString());
				insVo.setItemSeq(m.get("itemSeq").toString());
				insVo.setFaultyCd(m.get("faultyCd").toString());
				insVo.setUseYn(m.get("useYn").toString());
				insVo.setUpdId(Utils.getUserNumber());		
				insList.add(insVo);
			}
			
			for ( int finishIdx = 0; finishIdx < insList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= insList.size()) {
					List<PrcssFaultyOrdAdmVo> tempList = insList.subList(finishIdx, insList.size());
					prcssFaultyOrdAdmService.create(tempList);
					logger.info("공정불량 일괄등록" + finishIdx+ ": " + tempList);
				} else {
					List<PrcssFaultyOrdAdmVo> tempList = insList.subList(finishIdx, finishIdx+50);
					prcssFaultyOrdAdmService.create(tempList);
					logger.info("공정불량 일괄등록" + finishIdx+ ": " + tempList);
				}
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		
		return jsonData;
		
	}
	
	//조회
	@RequestMapping(value = "/bm/baseInfoAdmFTList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoAdmFTList(PrcssFaultyOrdAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("목록조회 : " +vo);
		try {
			List<PrcssFaultyOrdAdmVo> list = new ArrayList<PrcssFaultyOrdAdmVo>();
			if(vo.getPrcssCd()!=null && !vo.getPrcssCd().equals("")) {
				list = prcssFaultyOrdAdmService.baseInfoAdmFTList(vo);
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
	
	
}
