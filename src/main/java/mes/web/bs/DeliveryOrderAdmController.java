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
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.qm.ItemCompleteAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DeliveryOrderAdmController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private ItemCompleteAdmService itemCompleteAdmService;

	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	// 출고의뢰등록 메인
	@RequestMapping(value = "/bssc0050", method = RequestMethod.GET)
	public String bssc0050(Locale locale, Model model) throws Exception {
		logger.info("출고의뢰등록 메인");
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

		return "bs/bssc0050";
	}
	

	// 출고외릐현황 메인
	@RequestMapping(value = "/bssc0060", method = RequestMethod.GET)
	public String bssc0060(Locale locale, Model model) throws Exception {
		logger.info("출고외릐현황 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);

		commonCodeVo.setBaseGroupCd("044"); // 국내/국외
		List<CommonCodeAdmVo> inexGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inexGubun", inexGubunList);

		commonCodeVo.setBaseGroupCd("045"); // 수주구분
		List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("contGubun", contGubunList);

		commonCodeVo.setBaseGroupCd("047"); // 스페셜/표준
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);

		commonCodeVo.setBaseGroupCd("046"); // 확정여부
		List<CommonCodeAdmVo> confirmYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("confirmYn", confirmYnList);
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 발주처
		dealCorpAdmVo.setDealGubun("001");
		List<DealCorpAdmVo> dealCorpList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("poCorpNmgubun", dealCorpList );

		return "bs/bssc0060";
	}
	
	// 출고외릐현황 메인
	@RequestMapping(value = "/bssc0061", method = RequestMethod.GET)
	public String bssc0061(Locale locale, Model model) throws Exception {
		logger.info("출고외릐현황 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);

		commonCodeVo.setBaseGroupCd("044"); // 국내/국외
		List<CommonCodeAdmVo> inexGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inexGubun", inexGubunList);

		commonCodeVo.setBaseGroupCd("045"); // 수주구분
		List<CommonCodeAdmVo> contGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("contGubun", contGubunList);

		commonCodeVo.setBaseGroupCd("047"); // 스페셜/표준
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);

		commonCodeVo.setBaseGroupCd("046"); // 확정여부
		List<CommonCodeAdmVo> confirmYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("confirmYn", confirmYnList);
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 발주처
		dealCorpAdmVo.setDealGubun("001");
		List<DealCorpAdmVo> dealCorpList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("poCorpNmgubun", dealCorpList );

		return "bs/bssc0061";
	}
	
	// 영업(미출고현황) 메인
	@RequestMapping(value = "/bssc0090", method = RequestMethod.GET)
	public String bssc0090(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "bs/bssc0090";
	}
		
	//출고의뢰등록 목록조회
	@RequestMapping(value="bs/deliveryOrderAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 목록조회
	@RequestMapping(value="bs/deliveryOrderAdmListNew" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmListNew(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmListNew(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 상세 목록 조회
	@RequestMapping(value="bs/deliveryOrderAdmListDtl" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmListDtl(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 상세 목록 조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmListDtl(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 상세조회
	@RequestMapping(value="bs/deliveryOrderAdmRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 상세조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmRead;
			
//			if(deliveryOrderAdmVo.getDoNo()==null || deliveryOrderAdmVo.getDoNo().equals("")) {
//				deliveryOrderAdmRead = new ArrayList<DeliveryOrderAdmVo>();
//				
//			}else {
				deliveryOrderAdmRead = deliveryOrderAdmService.deliveryOrderAdmRead(deliveryOrderAdmVo);
//			}
			jsonData.put("data", deliveryOrderAdmRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 등록
	@RequestMapping(value="bs/deliveryOrderAdmCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmCreate(@RequestBody List<Map<String, Object>> deliveryOrderAdmList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		logger.info("출고의뢰등록 등록 : "+ deliveryOrderAdmVo);
		try {
			
			//출고요청번호 가져오기
			String date = DateUtil.getToday("yyyyMMdd");
			String doNoSeq = deliveryOrderAdmService.getDoNo(date);
			
			deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
			deliveryOrderAdmVo.setOrdGubun(deliveryOrderAdmList.get(0).get("ordGubun").toString());
			deliveryOrderAdmVo.setDoCorpCd(deliveryOrderAdmList.get(0).get("doCorpCd").toString());
			deliveryOrderAdmVo.setDoDate(deliveryOrderAdmList.get(0).get("doDate").toString());
			deliveryOrderAdmVo.setRegId(Utils.getUserId());
			
			deliveryOrderAdmService.deliveryOrderAdmCreate(deliveryOrderAdmVo);
				
			for(Map<String, Object> m :deliveryOrderAdmList) {
				
				if(m.get("poCorpCd").toString()==null || m.get("poCorpCd").toString().equals("")) {
					
					//deliveryOrderAdmService.deliveryOrderAdmDelete(deliveryOrderAdmVo);
					jsonData.put("result", "notPoCorpCd");
					
				}else {
					//출고의뢰시퀀스 가져오기
					int doSeq = deliveryOrderAdmService.getDoSeq(deliveryOrderAdmVo);
					
					deliveryOrderAdmVo.setDoSeq(doSeq);
					deliveryOrderAdmVo.setPoCorpCd(m.get("poCorpCd").toString());
					deliveryOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
					deliveryOrderAdmVo.setTargetQty(m.get("targetQty").toString());
					deliveryOrderAdmVo.setDlvDate(m.get("dlvDate").toString());
					
					deliveryOrderAdmService.deliveryOrderDtlCreate(deliveryOrderAdmVo);
					
					jsonData.put("result", "ok");
				}
			}
			
		
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 수정
	@RequestMapping(value="bs/deliveryOrderAdmUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmUpdate(@RequestBody List<Map<String, Object>> deliveryOrderAdmList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		logger.info("출고의뢰등록 수정 : "+ deliveryOrderAdmVo);
		try {
			
			//출고요청번호 가져오기
			//String date = DateUtil.getToday("yyyyMMdd");
			//String doNoSeq = deliveryOrderAdmService.getDoNo(date);
			
			//deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
			deliveryOrderAdmVo.setDoNo(deliveryOrderAdmList.get(0).get("doNo").toString());
			deliveryOrderAdmVo.setOrdGubun(deliveryOrderAdmList.get(0).get("ordGubun").toString());
			deliveryOrderAdmVo.setDoCorpCd(deliveryOrderAdmList.get(0).get("doCorpCd").toString());
			deliveryOrderAdmVo.setDoDate(deliveryOrderAdmList.get(0).get("doDate").toString());
			deliveryOrderAdmVo.setRegId(Utils.getUserId());
			deliveryOrderAdmVo.setUpdId(Utils.getUserId());
			
			deliveryOrderAdmService.deliveryOrderAdmUpdate(deliveryOrderAdmVo);
			
			deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmVo);
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				
				if(m.get("poCorpCd").toString()==null || m.get("poCorpCd").toString().equals("")) {
					jsonData.put("result", "notPoCorpCd");
				}else {
				//출고의뢰시퀀스 가져오기
				int doSeq = deliveryOrderAdmService.getDoSeq(deliveryOrderAdmVo);
				
				deliveryOrderAdmVo.setDoSeq(doSeq);
				deliveryOrderAdmVo.setPoCorpCd(m.get("poCorpCd").toString());
				deliveryOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
				deliveryOrderAdmVo.setTargetQty(m.get("targetQty").toString());
				deliveryOrderAdmVo.setDlvDate(m.get("dlvDate").toString());
				
				deliveryOrderAdmService.deliveryOrderDtlCreate(deliveryOrderAdmVo);
				}
			}
		
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 수정
	@RequestMapping(value="bs/deliveryOrderDtlUpdate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderDtlUpdate(@RequestBody List<Map<String, Object>> deliveryOrderAdmList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		logger.info("출고의뢰등록 수정 : "+ deliveryOrderAdmVo);
		try {
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				
				deliveryOrderAdmVo.setDoNo(m.get("doNo").toString());
				deliveryOrderAdmVo.setDoSeq(Integer.parseInt(m.get("doSeq").toString()));
				deliveryOrderAdmVo.setTargetQty(m.get("targetQty").toString());
				deliveryOrderAdmVo.setOutputQty(m.get("outputQty").toString());
				deliveryOrderAdmVo.setInspectDate(m.get("inspectDate").toString());
				deliveryOrderAdmVo.setOutputDate(m.get("outputDate").toString());
				deliveryOrderAdmVo.setDoDate(m.get("doDate").toString());
				deliveryOrderAdmVo.setUpdId(Utils.getUserId());
				 
				deliveryOrderAdmService.deliveryOrderDtlUpdate(deliveryOrderAdmVo);
				deliveryOrderAdmService.deliveryOrderAdmUpdate(deliveryOrderAdmVo);
			}
		
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//출고의뢰등록 삭제
	@RequestMapping(value="bs/deliveryOrderAdmDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderDtlDelete(@RequestBody List<Map<String, Object>> deliveryOrderAdmList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		logger.info("출고의뢰등록 수정 : "+ deliveryOrderAdmVo);
		try {
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				
				deliveryOrderAdmVo.setDoNo(m.get("doNo").toString());
				 
				deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmVo);
				deliveryOrderAdmService.deliveryOrderAdmDelete(deliveryOrderAdmVo);
			}
		
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//미출고현황 목록조회
	@RequestMapping(value="bs/undeliveryOrderAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> undeliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			List<DeliveryOrderAdmVo> deliveryOrderAdmList2 = new ArrayList<DeliveryOrderAdmVo>();
			
			for(int i=0; i<deliveryOrderAdmList.size(); i++) {
				if(deliveryOrderAdmList.get(i).getDoStatus().equals("001") || deliveryOrderAdmList.get(i).getDoStatus().equals("002")) {
					deliveryOrderAdmList2.add(deliveryOrderAdmList.get(i));
					
				}
			}
			jsonData.put("data", deliveryOrderAdmList2);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	

	//출고마감 마감상태 수정
	@RequestMapping(value="bs/doStatusUpdate" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> doStatusUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고마감 마감상태수정 : "+ deliveryOrderAdmVo);
		try {
			deliveryOrderAdmService.doStatusUpdate(deliveryOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//삭제
	@RequestMapping(value="bs/deliveryOrderDtlDelete", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> deliveryOrderDtlDelete(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//삭제
	@RequestMapping(value="bs/deliveryOrderDtlDeleteList", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> deliveryOrderDtlDeleteList(@RequestBody List<Map<String, Object>> deliveryOrderAdmList) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			for(Map<String, Object> m :deliveryOrderAdmList) {	
				//출하요청인경우
				if(m.get("doStatus").toString().equals("001")) {
					//2.TB_DELIVERY_ORDER_DTL 삭제
					DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
					deliveryOrderAdmVo.setDoNo(m.get("doNo").toString());
					deliveryOrderAdmVo.setDoSeq(Integer.parseInt(m.get("doSeq").toString()));
					deliveryOrderAdmVo.setDoSeqCheck("Y");
					deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmVo);		
					
					//3.TB_DELIVERY_ORDER_ADM 삭제
					if(deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmVo)==0) {
						deliveryOrderAdmService.deliveryOrderAdmDelete(deliveryOrderAdmVo);
					}
				}else {
					//2.TB_DELIVERY_ORDER_DTL 삭제
					DeliveryOrderAdmVo deliveryOrderAdmDeleteVo = new DeliveryOrderAdmVo();
					deliveryOrderAdmDeleteVo.setDoNo(m.get("doNo").toString());
					deliveryOrderAdmDeleteVo.setDoSeq(Integer.parseInt(m.get("doSeq").toString()));
					deliveryOrderAdmDeleteVo.setDoSeqCheck("Y");
					deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmDeleteVo);
					
					//3.TB_DELIVERY_ORDER_ADM 삭제
					if(deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmDeleteVo)==0) {
						deliveryOrderAdmService.deliveryOrderAdmDelete(deliveryOrderAdmDeleteVo);
					}
					
					ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
					itemCompleteAdmVo.setDoNo(m.get("doNo").toString());
					itemCompleteAdmVo.setDoNoSub(m.get("doNoSub").toString());
					
					//협력사출고건은 완제품검사 테이블 수정/삭제 x
					if(itemCompleteAdmService.itemInspectQtyRead(itemCompleteAdmVo)!=null) {
						
						//1.TB_STOCK_PAYMENT_ADM 삭제
						StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
						stockPaymentAdmVo.setBarcodeNo(m.get("lotNo").toString());
						stockPaymentAdmVo.setSpSubGubun("제품출고");
						stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
						
						//4.TB_ITEM_COMPLETE_ADM 삭제
						itemCompleteAdmVo.setIcaSeq(m.get("doSeq").toString());
						itemCompleteAdmService.deleteComplete(itemCompleteAdmVo);
						
						//5. TB_ITEM_COMPLETE_MASTER_ADM 수정/삭제
						itemCompleteAdmVo.setDoNoSev(m.get("doNoSub").toString());
						if(itemCompleteAdmService.itemCompleteAdmList(itemCompleteAdmVo).size()==0) {
							itemCompleteAdmService.deleteMasterComplete(itemCompleteAdmVo);
						}else {
							int inspectCnt = Integer.parseInt(itemCompleteAdmService.read(itemCompleteAdmVo).getInspectCnt());
							itemCompleteAdmVo.setInspectCnt(Integer.toString(inspectCnt-Integer.parseInt(m.get("outQty").toString())));
							itemCompleteAdmVo.setUpdId(Utils.getUserNumber());
							itemCompleteAdmService.itemCompleteMasterUpdate(itemCompleteAdmVo);
						}
						
						//6.TB_ITEM_WHS_ADM 수정
						ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
						itemWhsAdmVo.setBarcodeNo(m.get("lotNo").toString());
						itemWhsAdmVo.setUpdId(Utils.getUserNumber());
						itemWhsAdmVo.setOutDate("");
						itemWhsAdmVo.setOutQty(Integer.parseInt(m.get("outQty").toString())*-1);
						itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);;
						
					}else {
						//1.TB_STOCK_PAYMENT_ADM 삭제
						StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
						stockPaymentAdmVo.setBarcodeNo(m.get("lotNo").toString());
						stockPaymentAdmVo.setSpSubGubun("협력사출고");
						stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
						
					}
					
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
		
	
	//PDA 출고요청 페이지 ============================================================================================================================
	
	//출고의뢰등록 데이터 리셋
	@RequestMapping(value="bs/deliveryOrderAdmReset" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmReset(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = new ArrayList<DeliveryOrderAdmVo>();;
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고의뢰등록 등록
	@RequestMapping(value="bs/deliveryOrderAdmPdaCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmPdaCreate(@RequestBody List<Map<String, Object>> deliveryOrderAdmList) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		logger.info("bs/deliveryOrderAdmPdaCreate : "+ deliveryOrderAdmVo);
		try {
			//1. 필터링
			boolean status = true;
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		        itemWhsAdmVo.setBarcodeNo(m.get("lotNo").toString());
		        List<ItemWhsAdmVo> itemWhsAdmList = itemWhsAdmService.itemWhsAdmMainList(itemWhsAdmVo);
		        if ( itemWhsAdmList.size() > 0 && itemWhsAdmList.get(0).getInQty() > 0 ) { //1번 필터
					int inQty = itemWhsAdmList.get(0).getInQty(); //재고수량
					
					DeliveryOrderAdmVo vo = new DeliveryOrderAdmVo();
					vo.setLotNo(m.get("lotNo").toString());
					int targetTotalQty = deliveryOrderAdmService.getTargetQty(vo); //요청수량
					int targetQty = inQty - targetTotalQty;
					
					//출고할 수량이 있는지 확인
					if ( targetQty <= 0 ) { //2번 필터
						status = false;
						jsonData.put("message", m.get("lotNo").toString() + "항목에 출하요청 할 수 있는 수량이 부족합니다.");
						break;
					}
		    	} else {
					status = false;
					jsonData.put("message", m.get("lotNo").toString() + "항목에 출하요청 할 수 있는 수량이 부족합니다.");
					break;
				}
			}
			
			if (status) {
				//2. 등록
				String date = DateUtil.getToday("yyyyMMdd");
				String doNoSeq = deliveryOrderAdmService.getDoNo(date);
				
				deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
				deliveryOrderAdmVo.setDoDate(deliveryOrderAdmList.get(0).get("outputDate").toString());
				deliveryOrderAdmVo.setRegId(Utils.getUserId());
				deliveryOrderAdmService.deliveryOrderAdmCreate(deliveryOrderAdmVo);
				
				int doSeq = 1;
				for(Map<String, Object> m :deliveryOrderAdmList) {
					deliveryOrderAdmVo = new DeliveryOrderAdmVo();
					deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
					deliveryOrderAdmVo.setDoSeq(doSeq);
					deliveryOrderAdmVo.setLotNo(m.get("lotNo").toString());
					deliveryOrderAdmVo.setPoCorpCd(m.get("poCorpCd").toString());
					deliveryOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
					deliveryOrderAdmVo.setTargetQty(m.get("targetQty").toString());
					deliveryOrderAdmVo.setRemainQty(m.get("targetQty").toString());
					deliveryOrderAdmVo.setOutputQty("0");
					deliveryOrderAdmVo.setOutputDate(m.get("outputDate").toString());
					deliveryOrderAdmVo.setDoStatus("001");
					deliveryOrderAdmVo.setRegId(Utils.getUserId());
					String doNoSev = deliveryOrderAdmService.getDoNoSev(deliveryOrderAdmVo);
					deliveryOrderAdmVo.setDoNoSev(doNoSev);
					deliveryOrderAdmService.deliveryOrderDtlCreate(deliveryOrderAdmVo);
					doSeq++;
				}
				
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//출고현황 목록조회
	@RequestMapping(value="bs/deliveryOrderAdmTotalList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmTotalList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmTotalList(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고현황 상세조회
	@RequestMapping(value="bs/deliveryOrderAdmDetailList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmDetailList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmDetailList(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고현황 삭제
	@RequestMapping(value="bs/deliveryOrderAdmDetailDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmDetailDelete(@RequestBody List<Map<String, Object>> deliveryOrderAdmList,DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 삭제 : "+ deliveryOrderAdmVo);
		try {
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				 
				//2.TB_DELIVERY_ORDER_DTL 삭제
				DeliveryOrderAdmVo deliveryOrderAdmDeleteVo = new DeliveryOrderAdmVo();
				deliveryOrderAdmDeleteVo.setDoNo(m.get("doNo").toString());
				deliveryOrderAdmDeleteVo.setDoSeq(Integer.parseInt(m.get("doSeq").toString()));
				deliveryOrderAdmDeleteVo.setDoSeqCheck("Y");
				deliveryOrderAdmService.deliveryOrderDtlDelete(deliveryOrderAdmDeleteVo);
				
				//3.TB_DELIVERY_ORDER_ADM 삭제
				if(deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmDeleteVo)==0) {
					deliveryOrderAdmService.deliveryOrderAdmDelete(deliveryOrderAdmDeleteVo);
				}
				
				ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
				itemCompleteAdmVo.setDoNo(m.get("doNo").toString());
				itemCompleteAdmVo.setDoNoSub(m.get("doNoSub").toString());
				
				//협력사출고건은 완제품검사 테이블 수정/삭제 x
				if(itemCompleteAdmService.itemInspectQtyRead(itemCompleteAdmVo)!=null) {
					//1.TB_STOCK_PAYMENT_ADM 삭제
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					stockPaymentAdmVo.setBarcodeNo(m.get("lotNo").toString());
					stockPaymentAdmVo.setSpSubGubun("제품출고");
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
					
					//4.TB_ITEM_COMPLETE_ADM 삭제
					itemCompleteAdmVo.setIcaSeq(m.get("doSeq").toString());
					itemCompleteAdmService.deleteComplete(itemCompleteAdmVo);
					
					//5. TB_ITEM_COMPLETE_MASTER_ADM 수정/삭제
					itemCompleteAdmVo.setDoNoSev(m.get("doNoSub").toString());
					if(itemCompleteAdmService.itemCompleteAdmList(itemCompleteAdmVo).size()==0) {
						itemCompleteAdmService.deleteMasterComplete(itemCompleteAdmVo);
					}else {
						int inspectCnt = Integer.parseInt(itemCompleteAdmService.read(itemCompleteAdmVo).getInspectCnt());
						itemCompleteAdmVo.setInspectCnt(Integer.toString(inspectCnt-Integer.parseInt(m.get("outQty").toString())));
						itemCompleteAdmVo.setUpdId(Utils.getUserNumber());
						itemCompleteAdmService.itemCompleteMasterUpdate(itemCompleteAdmVo);
					}
					
					//6. TB_ITEM_WHS_ADM 수정
					ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
					itemWhsAdmVo.setOutDate("");
					itemWhsAdmVo.setOutQty(Integer.parseInt(m.get("outQty").toString())*-1);
					itemWhsAdmVo.setBarcodeNo(m.get("lotNo").toString());
					itemWhsAdmVo.setUpdId(Utils.getUserNumber());
					itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);
				} else {
					//협력사출고건
					//1.TB_STOCK_PAYMENT_ADM 삭제
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					//doSeq에 +1을 하는 이유 : 협력사출고 등록 시(bs/deliveryOrderAdmPda0350Create 참고) 수불데이터 등록할 때 +1해서 잘못 등록이 되었기 때문이다.
					stockPaymentAdmVo.setSourceNo( m.get("doNo").toString() + "-" + (Integer.parseInt(m.get("doSeq").toString())+1) );
					stockPaymentAdmVo.setSpSubGubun("협력사출고");
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
				}
				
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//협력사 출고 등록
	@RequestMapping(value="bs/deliveryOrderAdmPda0350Create" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmPda0350Create(@RequestBody List<Map<String, Object>> deliveryOrderAdmList)  throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("협력사출고 등록 : "+ deliveryOrderAdmVo);
		try {
			//출고요청번호 가져오기
			String date = DateUtil.getToday("yyyyMMdd");
			String doNoSeq = deliveryOrderAdmService.getDoNo(date);
			
			deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
			deliveryOrderAdmVo.setDoDate(deliveryOrderAdmList.get(0).get("outputDate").toString());
			deliveryOrderAdmVo.setRegId(Utils.getUserId());
			deliveryOrderAdmService.deliveryOrderAdmCreate(deliveryOrderAdmVo);
			
			int doSeq = 1;
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
			
			for(Map<String, Object> m :deliveryOrderAdmList) {
				
				deliveryOrderAdmVo = new DeliveryOrderAdmVo();
				deliveryOrderAdmVo.setDoNo(date+"-"+doNoSeq);
				deliveryOrderAdmVo.setDoSeq(doSeq);
				deliveryOrderAdmVo.setPoCorpCd(m.get("poCorpCd").toString());
				deliveryOrderAdmVo.setLotNo(m.get("lotNo").toString());
				deliveryOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
				deliveryOrderAdmVo.setTargetQty(m.get("targetQty").toString());
				deliveryOrderAdmVo.setRemainQty("0");
				deliveryOrderAdmVo.setOutputQty(m.get("targetQty").toString());
				deliveryOrderAdmVo.setOutputDate(m.get("outputDate").toString());
				deliveryOrderAdmVo.setDoStatus("003");
				deliveryOrderAdmVo.setCorpOutYn("Y"); //협력사출고유무
				deliveryOrderAdmVo.setRegId(Utils.getUserId());
				String doNoSev = deliveryOrderAdmService.getDoNoSev(deliveryOrderAdmVo);
				deliveryOrderAdmVo.setDoNoSev(doNoSev);
				deliveryOrderAdmService.deliveryOrderDtlCreate(deliveryOrderAdmVo);
				doSeq++; //원래 이 코드는 for문 맨 아래에 있어야 하는데 이미 잘못 등록된 데이터들이 많기 때문에 가만히 냅두기로 함 - 2023.10.13
				
				// 제품정보READ
				ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
				itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
				itemPartAdmVo=itemPartAdmService.itemPartDtlList(itemPartAdmVo);
				
				// 수불관리 출고 시작
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(itemPartAdmVo.getItemGubun());
				stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("협력사출고");
				stockPaymentAdmVo.setSpDate(m.get("outputDate").toString());
				stockPaymentAdmVo.setSpQty(m.get("targetQty").toString());
				stockPaymentAdmVo.setBarcodeNo(m.get("lotNo").toString());
				stockPaymentAdmVo.setSourceNo(date+"-"+doNoSeq+"-"+doSeq);
				stockPaymentAdmVo.setLocationNo(m.get("locNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("locCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}
