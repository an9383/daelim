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
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bs.DeliveryProcDtlVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bs.DeliveryProcDtlService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DeliveryProcDtlController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryProcDtlController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private DeliveryProcDtlService deliveryProcDtlService ;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	

	// 출고처리 메인
	@RequestMapping(value = "/bssc0100", method = RequestMethod.GET)
	public String bssc0100(Locale locale, Model model) throws Exception {
		logger.info("출고처리 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("058"); // 오더구분
		List<CommonCodeAdmVo> ordGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("ordGubun", ordGubunList);
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 발주처
		dealCorpAdmVo.setDealGubun("001");
		List<DealCorpAdmVo> dealCorpList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("poCorpNmgubun", dealCorpList );

		return "bs/bssc0100";
	}
	

	
	// 영업(출고마감) 메인
	@RequestMapping(value = "/bssc0080", method = RequestMethod.GET)
	public String bssc0080(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("061"); //출고상태
		List<CommonCodeAdmVo> bssc0080List = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("doStatusGubun", bssc0080List);
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> dealCorpList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("doCorpNmgubun", dealCorpList );
		
		return "bs/bssc0080";
	}
	
	
	// 출고처리 목록조회
	@RequestMapping(value="bs/deliveryProcDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<DeliveryProcDtlVo> deliveryProcDtlList =  deliveryProcDtlService.deliveryProcDtlList(deliveryProcDtlVo);
			jsonData.put("data", deliveryProcDtlList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	// 출고처리 상세조회
	@RequestMapping(value="bs/deliveryProcDtlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> deliveryProcDtlRead(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고처리 상세조회 : "+deliveryProcDtlVo);
		try {
			List<DeliveryProcDtlVo> deliveryProcDtlList;
			if(deliveryProcDtlVo.getDoNo()==null || deliveryProcDtlVo.getDoNo().equals("")) {
				deliveryProcDtlList = new ArrayList<DeliveryProcDtlVo>();
			}else {
				 deliveryProcDtlList =  deliveryProcDtlService.deliveryProcDtlRead(deliveryProcDtlVo);
			}
			
			jsonData.put("data", deliveryProcDtlList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}


	//출고처리 등록
	@RequestMapping(value="bs/deliveryProcDtlCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryProcDtlCreate(@RequestBody List<Map<String, Object>> deliveryProcDtlList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryProcDtlVo deliveryProcDtlVo = new DeliveryProcDtlVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		
		logger.info("출고처리 등록 : "+ deliveryProcDtlVo);
		try {
			
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			
			deliveryProcDtlVo.setDoNo(deliveryProcDtlList.get(0).get("doNo").toString());
			deliveryProcDtlVo.setDoSeq(Integer.parseInt(deliveryProcDtlList.get(0).get("doSeq").toString()));
			deliveryProcDtlVo.setItemSeq(deliveryProcDtlList.get(0).get("itemSeq").toString());
			deliveryProcDtlVo.setRegId(Utils.getUserId());
			
			int targetQty = Integer.parseInt((deliveryProcDtlList.get(0).get("targetQty").toString()));
			int sum = Integer.parseInt((deliveryProcDtlList.get(0).get("sum").toString()));
			
			if(sum <= targetQty) {
				for(Map<String, Object> m :deliveryProcDtlList) {
					
					//출고처리상세 시퀀스
					int doDtlSeq = deliveryProcDtlService.getDoDtlSeq(deliveryProcDtlVo);
					
					deliveryProcDtlVo.setDoDtlSeq(doDtlSeq);
					deliveryProcDtlVo.setOutputDtlQty(Integer.parseInt(m.get("outputDtlQty").toString()));
					deliveryProcDtlVo.setBarcodeNo(m.get("barcodeNo").toString());
					deliveryProcDtlVo.setDoDtlDate(m.get("doDtlDate").toString());
				
					deliveryProcDtlService.deliveryProcDtlCreate(deliveryProcDtlVo);
					
					itemWhsAdmVo.setBarcodeNo(deliveryProcDtlVo.getBarcodeNo());
					itemWhsAdmVo.setOutQty(deliveryProcDtlVo.getOutputDtlQty());
					itemWhsAdmVo.setOutDate(deliveryProcDtlVo.getDoDtlDate());
					itemWhsAdmVo.setUpdId(Utils.getUserId());
					
					itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);
					
					
					//수불테이블 Create
					logger.info("수불테이블 등록 시작");
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType("002");
					stockPaymentAdmVo.setSpCd(deliveryProcDtlVo.getItemSeq());
					stockPaymentAdmVo.setSpGubun("002");
					stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getOutDate());
					stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getOutQty()));
					stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
					
					stockPaymentAdmVo.setLocationNo(m.get("barcodeNo").toString());
					stockPaymentAdmVo.setLocationCd(m.get("inLoc").toString());
					stockPaymentAdmVo.setAreaCd(m.get("inArea").toString());
					stockPaymentAdmVo.setFloorCd(m.get("inFloor").toString());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					logger.info("수불테이블 등록 끝");
					
				}
				
				//출고의뢰상세 수정
				if((targetQty-sum) ==0) {
					deliveryProcDtlVo.setDoStatus("003");
				}else {
					deliveryProcDtlVo.setDoStatus("002");
				}
				
				deliveryProcDtlVo.setOutputQty(sum);
				deliveryProcDtlVo.setRemainQty(targetQty-sum);
				deliveryProcDtlService.deliveryOrderDtlUpdate(deliveryProcDtlVo);
				
				jsonData.put("result", "ok");
				
			}else {
				jsonData.put("result", "excess");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고처리 수정
	@RequestMapping(value="bs/deliveryProcDtlUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryProcDtlUpdate(@RequestBody List<Map<String, Object>> deliveryProcDtlList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryProcDtlVo deliveryProcDtlVo = new DeliveryProcDtlVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		logger.info("출고처리 수정 : "+ deliveryProcDtlVo);
		try {
			
			deliveryProcDtlVo.setDoNo(deliveryProcDtlList.get(0).get("doNo").toString());
			deliveryProcDtlVo.setDoSeq(Integer.parseInt(deliveryProcDtlList.get(0).get("doSeq").toString()));
			deliveryProcDtlVo.setItemSeq(deliveryProcDtlList.get(0).get("itemSeq").toString());
			deliveryProcDtlVo.setRegId(Utils.getUserId());
			
			int targetQty = Integer.parseInt((deliveryProcDtlList.get(0).get("targetQty").toString()));
			int sum = Integer.parseInt((deliveryProcDtlList.get(0).get("sum").toString()));
			
			//출고처리상세 전체 삭제
			deliveryProcDtlService.deliveryProcDtlDelete(deliveryProcDtlVo);
			
			if(sum <= targetQty) {
				for(Map<String, Object> m :deliveryProcDtlList) {
					
					//출고처리상세 시퀀스
					int doDtlSeq = deliveryProcDtlService.getDoDtlSeq(deliveryProcDtlVo);
					
					deliveryProcDtlVo.setDoDtlSeq(doDtlSeq);
					deliveryProcDtlVo.setOutputDtlQty(Integer.parseInt(m.get("outputDtlQty").toString()));
					deliveryProcDtlVo.setBarcodeNo(m.get("barcodeNo").toString());
					deliveryProcDtlVo.setDoDtlDate(m.get("doDtlDate").toString());
					deliveryProcDtlService.deliveryProcDtlCreate(deliveryProcDtlVo);
					
					itemWhsAdmVo.setBarcodeNo(deliveryProcDtlVo.getBarcodeNo());
					
					itemWhsAdmService.itemOutWhsResetUpdate(itemWhsAdmVo);
					
					itemWhsAdmVo.setOutQty(deliveryProcDtlVo.getOutputDtlQty());
					itemWhsAdmVo.setOutDate(deliveryProcDtlVo.getDoDtlDate());
					itemWhsAdmVo.setUpdId(Utils.getUserId());
					
					itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);
				}
				
				//출고의뢰상세 수정
				if((targetQty-sum) ==0) {
					deliveryProcDtlVo.setDoStatus("003");
				}else {
					deliveryProcDtlVo.setDoStatus("002");
				}
				deliveryProcDtlVo.setOutputQty(sum);
				deliveryProcDtlVo.setRemainQty(targetQty-sum);
				deliveryProcDtlService.deliveryOrderDtlUpdate(deliveryProcDtlVo);
				
				jsonData.put("outputQty", sum);
				jsonData.put("remainQty", targetQty-sum);
				jsonData.put("result", "ok");
				
			}else {
				jsonData.put("result", "excess");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	// 바코드별 제품출고 모니터링 조회 
	@RequestMapping(value="bs/itemWhsAdmMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("바코드별 제품출고 모니터링 조회 : "+deliveryProcDtlVo);
		try {
			
			List<DeliveryProcDtlVo> list = deliveryProcDtlService.itemWhsAdmMonitoringList(deliveryProcDtlVo);
			if(list==null) {
				list = new ArrayList<>();
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
		
}
