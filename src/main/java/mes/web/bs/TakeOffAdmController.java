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
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.bs.AchieveAdmVo;
import mes.domain.bs.TakeOffAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.tm.StockAdjustAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.bs.AchieveAdmService;
import mes.service.bs.TakeOffAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.tm.StockAdjustAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.bm.CommonCodeAdmController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping
public class TakeOffAdmController {
	
	@Inject
	private TakeOffAdmService takeOffAdmService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private ItemPartAdmService itemPartAdmService;
	@Inject
	private LocationAdmService locationAdmService;
	@Inject
	private StockAdjustAdmService stockAdjustAdmService;
	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	@Inject
	private OutWhsAdmService outWhsAdmService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(CommonCodeAdmController.class);
	
	//자제출고(사출) 페이지
	@RequestMapping(value = "/bssc0240", method = RequestMethod.GET)
	public String bssc0240(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//공통코드 조회
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("149"); //출고구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> outGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("outGubun", outGubunList);
		
		commonCodeVo.setBaseGroupCd("079"); //품목구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("102"); // 거래구분
		List<CommonCodeAdmVo> dealGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("dealGubunList", dealGubunList);
		
		return "bs/bssc0240";
	}
	
	//자제출고(봉제) 페이지
	@RequestMapping(value = "/bssc0241", method = RequestMethod.GET)
	public String bssc0241(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//공통코드 조회
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("149"); //출고구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> outGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("outGubun", outGubunList);
		
		commonCodeVo.setBaseGroupCd("079"); //품목구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("102"); // 거래구분
		List<CommonCodeAdmVo> dealGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("dealGubunList", dealGubunList);
		
		return "bs/bssc0241";
	}
	
	//List - 그룸화
	@RequestMapping(value="bs/takeOffAdmGroupList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> takeOffAdmGroupList(TakeOffAdmVo takeOffAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<TakeOffAdmVo> takeOffAdmGroupList = takeOffAdmService.takeOffAdmGroupList(takeOffAdmVo);
			jsonData.put("data", takeOffAdmGroupList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//List
	@RequestMapping(value="bs/takeOffAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> takeOffAdmList(TakeOffAdmVo takeOffAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        List<TakeOffAdmVo> takeOffAdmList = takeOffAdmService.takeOffAdmList(takeOffAdmVo);
	        jsonData.put("data", takeOffAdmList);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
	//반출등록(사출) - 품목조회
	@RequestMapping(value="bs/takeOffItemInjectList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> takeOffItemInjectList(TakeOffAdmVo takeOffAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<TakeOffAdmVo> list = new ArrayList<TakeOffAdmVo>();
			jsonData.put("data", list);
			
			if ( takeOffAdmVo.getKindDealCorpCd().equals("btnAdd") ) { //추가
				List<TakeOffAdmVo> takeOffInjectList = takeOffAdmService.takeOffInjectList(takeOffAdmVo);
				jsonData.put("data", takeOffInjectList);
			} else if ( takeOffAdmVo.getKindDealCorpCd().equals("btnNewAdd") ) { //신규추가
				List<TakeOffAdmVo> takeOffCustomerList = takeOffAdmService.takeOffCustomerList(takeOffAdmVo);
				jsonData.put("data", takeOffCustomerList);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//반출등록(봉제) - 품목조회
	@RequestMapping(value="bs/takeOffItemList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> takeOffItemList(TakeOffAdmVo takeOffAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        List<TakeOffAdmVo> list = new ArrayList<TakeOffAdmVo>();
	        jsonData.put("data", list);
	        
	        if ( takeOffAdmVo.getKindDealCorpCd().equals("001") ) { //고객사
	        	List<TakeOffAdmVo> takeOffCustomerList = takeOffAdmService.takeOffCustomerList(takeOffAdmVo);
	        	jsonData.put("data", takeOffCustomerList);
	        } else if ( takeOffAdmVo.getKindDealCorpCd().equals("003") ) { //외주사
	        	List<TakeOffAdmVo> takeOffOutsourcingList = takeOffAdmService.takeOffOutsourcingList(takeOffAdmVo);
	        	jsonData.put("data", takeOffOutsourcingList);
	        }
	        
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}

	//Read
	@RequestMapping(value="bs/takeOffAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> takeOffAdmRead(TakeOffAdmVo takeOffAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        takeOffAdmVo = takeOffAdmService.takeOffAdmRead(takeOffAdmVo);
	        jsonData.put("data", takeOffAdmVo);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
	//반출등록(사출) 등록
	@RequestMapping(value = "bs/takeOffAdmInjectCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffAdmInjectCreate(@RequestBody List<Map<String, Object>> takeOffAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("반출등록(사출) 등록: " + takeOffAdmList);
		try {
			//부적합관리(사출) 창고 조회
			LocationAdmVo locationAdmVo = new LocationAdmVo();
			locationAdmVo.setMainGubun(takeOffAdmList.get(0).get("mainGubun").toString());
			locationAdmVo.setLocCd(takeOffAdmList.get(0).get("locCd").toString());
			List<LocationAdmVo> locationAdmList = locationAdmService.locationAdmRead(locationAdmVo);
			
			for(Map<String, Object> m : takeOffAdmList) {
				// 1.반출등록관리(TB_TAKEOFF_ADM) 데이터 등록
				TakeOffAdmVo takeOffAdmVo = new TakeOffAdmVo();
				takeOffAdmVo.setItemSeq(m.get("itemSeq").toString());
				takeOffAdmVo.setToQty(m.get("toQty").toString());
				takeOffAdmVo.setBeforeLocNo(m.get("beforeLocNo").toString());
				takeOffAdmVo.setAfterLocNo(locationAdmList.get(0).getLocNo());
				takeOffAdmVo.setToDate(m.get("toDate").toString());
				takeOffAdmVo.setToWorker(m.get("toWorker").toString());
				takeOffAdmVo.setPrcssYn(m.get("prcssYn").toString());
				takeOffAdmVo.setRegId(Utils.getUserId());
				
				//바코드 생성
				String barcodeNo = "";
				if ( m.get("kindDealCorpCd").toString().equals("btnAdd") ) {
					barcodeNo = m.get("barcodeNo").toString();
				} else {
					takeOffAdmVo.setBarcodeNo("T" + m.get("itemSeq").toString() + "-" + m.get("toDate").toString().substring(2, 8) + "-");
					barcodeNo = takeOffAdmService.getTakeOffBarcodeNo(takeOffAdmVo);
				}
				takeOffAdmVo.setBarcodeNo(barcodeNo);
				
				String toacReturn = takeOffAdmService.takeOffAdmCreate(takeOffAdmVo);
				
				// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 데이터 등록
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				// 2-1. 제품입고 or 이동출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
				stockPaymentAdmVo.setSpGubun("001"); //입고
				stockPaymentAdmVo.setSpSubGubun("제품입고"); //제품입고
				stockPaymentAdmVo.setSpDate(takeOffAdmVo.getToDate());
				stockPaymentAdmVo.setSpQty(takeOffAdmVo.getToQty());
				stockPaymentAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo("bssc0241_TO_" + toacReturn); // 양식: bssc0241_idx
				stockPaymentAdmVo.setLocationNo(locationAdmList.get(0).getLocNo());
				stockPaymentAdmVo.setLocationCd(locationAdmList.get(0).getLocCd());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				int stockReturnCheck1 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//반출등록(봉제) 등록
	@RequestMapping(value = "bs/takeOffAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffAdmCreate(@RequestBody List<Map<String, Object>> takeOffAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("반출등록(봉제) 등록: " + takeOffAdmList);
		try {
			//부적합관리(봉제) 창고 조회
			LocationAdmVo locationAdmVo = new LocationAdmVo();
			locationAdmVo.setMainGubun(takeOffAdmList.get(0).get("mainGubun").toString());
			locationAdmVo.setLocCd(takeOffAdmList.get(0).get("locCd").toString());
			List<LocationAdmVo> locationAdmList = locationAdmService.locationAdmRead(locationAdmVo);
			
			for(Map<String, Object> m : takeOffAdmList) {
				// 1.반출등록관리(TB_TAKEOFF_ADM) 데이터 등록
				TakeOffAdmVo takeOffAdmVo = new TakeOffAdmVo();
				takeOffAdmVo.setItemSeq(m.get("itemSeq").toString());
				takeOffAdmVo.setToQty(m.get("toQty").toString());
				takeOffAdmVo.setBeforeLocNo(m.get("beforeLocNo").toString());
				takeOffAdmVo.setAfterLocNo(locationAdmList.get(0).getLocNo());
				takeOffAdmVo.setToDate(m.get("toDate").toString());
				takeOffAdmVo.setToWorker(m.get("toWorker").toString());
				takeOffAdmVo.setPrcssYn(m.get("prcssYn").toString());
				takeOffAdmVo.setRegId(Utils.getUserId());
				
				//바코드 생성
				String barcodeNo = "";
				if ( m.get("kindDealCorpCd").toString().equals("003") ) {
					barcodeNo = m.get("barcodeNo").toString();
				} else {
					takeOffAdmVo.setBarcodeNo("T" + m.get("itemSeq").toString() + "-" + m.get("toDate").toString().substring(2, 8) + "-");
					barcodeNo = takeOffAdmService.getTakeOffBarcodeNo(takeOffAdmVo);
				}
				takeOffAdmVo.setBarcodeNo(barcodeNo);
				
				String toacReturn = takeOffAdmService.takeOffAdmCreate(takeOffAdmVo);
				
				// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 데이터 등록
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				// 2-1. 제품입고 or 이동출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
				stockPaymentAdmVo.setSpGubun(m.get("kindDealCorpCd").toString().equals("003") ? "002" : "001"); //출고 or 입고
				stockPaymentAdmVo.setSpSubGubun(m.get("kindDealCorpCd").toString().equals("003") ? "이동출고" : "제품입고"); //이동출고 or 제품입고
				stockPaymentAdmVo.setSpDate(takeOffAdmVo.getToDate());
				stockPaymentAdmVo.setSpQty(takeOffAdmVo.getToQty());
				stockPaymentAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo("bssc0241_TO_" + toacReturn); // 양식: bssc0241_idx
				stockPaymentAdmVo.setLocationNo(m.get("kindDealCorpCd").toString().equals("003") ? m.get("beforeLocNo").toString() : locationAdmList.get(0).getLocNo());
				stockPaymentAdmVo.setLocationCd(m.get("kindDealCorpCd").toString().equals("003") ? m.get("beforeLocCd").toString() : locationAdmList.get(0).getLocCd());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				int stockReturnCheck1 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				// 2-2. 이동입고
				if ( m.get("kindDealCorpCd").toString().equals("003") ) {
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
					stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
					stockPaymentAdmVo.setSpGubun("001");
					stockPaymentAdmVo.setSpSubGubun("이동입고");
					stockPaymentAdmVo.setSpDate(takeOffAdmVo.getToDate());
					stockPaymentAdmVo.setSpQty(takeOffAdmVo.getToQty());
					stockPaymentAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo("bssc0241_TO_" + toacReturn); // 양식: bssc0241_idx
					stockPaymentAdmVo.setLocationNo(locationAdmList.get(0).getLocNo());
					stockPaymentAdmVo.setLocationCd(locationAdmList.get(0).getLocCd());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					int stockReturnCheck2 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					
					// 자재출고관리 데이터 수정 (TB_OUT_WHS_ADM-USE_QTY)
					OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
					outWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
					outWhsAdmVo.setLocationNo(m.get("beforeLocNo").toString());
					outWhsAdmVo.setInQty(takeOffAdmVo.getToQty());
					int checkReturnUuo = outWhsAdmService.updateToffUseqtyPlus(outWhsAdmVo);
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
	
	//반출등록 - 처리결과 등록
	@RequestMapping(value = "bs/takeOffPrcssCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffPrcssCreate(TakeOffAdmVo takeOffAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("반출등록 - 처리결과 등록: " + takeOffAdmVo);
		try {
			// 1.반출등록관리(TB_TAKEOFF_ADM) 데이터 수정
			TakeOffAdmVo takeOffAdmTempVo = new TakeOffAdmVo();
			takeOffAdmTempVo.setIdx(takeOffAdmVo.getIdx());
			takeOffAdmTempVo.setPrcssYn(takeOffAdmVo.getPrcssYn());
			takeOffAdmTempVo.setFairQty(takeOffAdmVo.getFairQty());
			takeOffAdmTempVo.setFaultyQty(takeOffAdmVo.getFaultyQty());
			int toacReturnCheck = takeOffAdmService.takeOffAdmUpdate(takeOffAdmTempVo);
			
			// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 데이터 등록
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			// 2-1. 이동출고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpType(takeOffAdmVo.getItemGubun());
			stockPaymentAdmVo.setSpCd(takeOffAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("002");
			stockPaymentAdmVo.setSpSubGubun("이동출고");
			stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
			stockPaymentAdmVo.setSpQty(takeOffAdmVo.getFairQty());
			stockPaymentAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo("bssc0241_PR_" + takeOffAdmVo.getIdx());
			stockPaymentAdmVo.setLocationNo(takeOffAdmVo.getBeforeLocNo());
			stockPaymentAdmVo.setLocationCd(takeOffAdmVo.getBeforeLocCd());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			int stockReturnCheck1 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			// 2-2. 이동입고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpType(takeOffAdmVo.getItemGubun());
			stockPaymentAdmVo.setSpCd(takeOffAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("이동입고");
			stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
			stockPaymentAdmVo.setSpQty(takeOffAdmVo.getFairQty());
			stockPaymentAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo("bssc0241_PR_" + takeOffAdmVo.getIdx());
			stockPaymentAdmVo.setLocationNo(takeOffAdmVo.getAfterLocNo());
			stockPaymentAdmVo.setLocationCd(takeOffAdmVo.getAfterLocCd());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			int stockReturnCheck2 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			if(takeOffAdmVo.getItemGubun().equals("001")) {
				// 3. 제품입고관리(TB_ITEM_WHS_ADM) 데이터 등록
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(takeOffAdmVo.getBarcodeNo());	
				itemWhsAdmVo.setItemSeq(takeOffAdmVo.getItemSeq());	
				itemWhsAdmVo.setWorkOrdNo("");
				itemWhsAdmVo.setInDate(DateUtil.getToday("yyyymmdd"));					
				itemWhsAdmVo.setInQty(Integer.parseInt(takeOffAdmVo.getFairQty()));
				itemWhsAdmVo.setInLoc(takeOffAdmVo.getAfterLocCd());
				itemWhsAdmVo.setInArea("");
				itemWhsAdmVo.setInFloor("");
				itemWhsAdmVo.setLocationNo(takeOffAdmVo.getAfterLocNo());
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//Update
	@RequestMapping(value="bs/takeOffAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffAdmUpdate(TakeOffAdmVo takeOffAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        takeOffAdmVo.setUpdId(Utils.getUserNumber());
	        takeOffAdmService.takeOffAdmUpdate(takeOffAdmVo);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}

	//반출등록(봉제) 삭제
	@RequestMapping(value="bs/takeOffAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffAdmDelete(@RequestBody List<Map<String, Object>> takeOffAdmList) throws Exception{
		logger.info("bs/takeOffAdmDelete: " + takeOffAdmList);
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	    	TakeOffAdmVo takeOffOverlapVo = new TakeOffAdmVo();
	    	takeOffOverlapVo.setPrcssYn("Y"); //처리결과 된 것
	    	takeOffOverlapVo.setIdxList(takeOffAdmList.get(0).get("idxList").toString());
	    	List<TakeOffAdmVo> takeOffOverlapList = takeOffAdmService.takeOffAdmList(takeOffOverlapVo);
	    	if ( takeOffOverlapList.size() == 0 ) { //1. 처리결과가 된 데이터가 없으면
	    		Boolean stockCheck = true;
	    		for(Map<String, Object> m :takeOffAdmList) {
	    			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
	    			stockPaymentAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
					stockPaymentAdmVo.setRegDate(m.get("regDate").toString());
					if ( stockPaymentAdmService.includeStockYn(stockPaymentAdmVo) > 0 ) {
						jsonData.put("message", m.get("barcodeNo").toString() + " 항목이<br>반출등록 이후 입출고가 발생하여 삭제할 수 없습니다.");
						stockCheck = false;
						break;
					}
	    		}
				
				if (stockCheck) { //2. 반출등록 이후 입출고가 발생되지 않았으면
	    			for(Map<String, Object> m :takeOffAdmList) {
			    		//1. 반출등록 데이터 삭제 (TB_TAKEOFF_ADM)
			    		TakeOffAdmVo takeOffAdmVo = new TakeOffAdmVo();
			    		takeOffAdmVo.setIdx(m.get("idx").toString());
				        takeOffAdmService.takeOffAdmDelete(takeOffAdmVo);
				        
				        // 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 삭제
				        StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
				        stockAdjustAdmVo.setBarcodeNo("bssc0241_TO_" + m.get("idx").toString()); //SOURCE_NO
				        stockAdjustAdmService.stockPaymentAdmDelete(stockAdjustAdmVo);
				        
				        //3. 자재출고관리 데이터 수정 (TB_OUT_WHS_ADM-USE_QTY)
				        if ( m.get("beforeLocCd").toString().equals("017") ) { //외주사에서 반출한 것인지 확인
							OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
							outWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
							outWhsAdmVo.setLocationNo(m.get("beforeLocNo").toString());
							outWhsAdmVo.setInQty(m.get("toQty").toString());
							int checkReturnUum = outWhsAdmService.updateToffUseqtyMinus(outWhsAdmVo);
				        }
			    	}
			        jsonData.put("result", "ok");
	    		} else { //2번 필터
	    			jsonData.put("result", "fail");
	    		}
	    	} else { //1번 필터
	    		jsonData.put("result", "fail");
	    		jsonData.put("message", "처리완료된 항목은 삭제할 수 없습니다.");
	    	}
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
	//반출등록(봉제) 처리취소
	@RequestMapping(value="bs/takeOffAdmCancel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> takeOffAdmCancel(@RequestBody List<Map<String, Object>> takeOffAdmList) throws Exception{
		logger.info("bs/takeOffAdmCancel: " + takeOffAdmList);
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			TakeOffAdmVo takeOffOverlapVo = new TakeOffAdmVo();
			takeOffOverlapVo.setPrcssYn("N"); //처리결과 안된 것
			takeOffOverlapVo.setIdxList(takeOffAdmList.get(0).get("idxList").toString());
			List<TakeOffAdmVo> takeOffOverlapList = takeOffAdmService.takeOffAdmList(takeOffOverlapVo);
			if ( takeOffOverlapList.size() == 0 ) { //1. 처리결과가 안된 데이터가 없으면
				Boolean stockCheck = true;
	    		for(Map<String, Object> m :takeOffAdmList) {
	    			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
	    			stockPaymentAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
					stockPaymentAdmVo.setRegDate(m.get("regDate").toString());
					if ( stockPaymentAdmService.includeStockYn(stockPaymentAdmVo) > 0 ) {
						jsonData.put("message", m.get("barcodeNo").toString() + " 항목이<br>반출처리 이후 입출고가 발생하여 취소할 수 없습니다.");
						stockCheck = false;
						break;
					}
	    		}
	    		
	    		if (stockCheck) { //2. 반출처리 이후 입출고가 발생되지 않았으면
	    			for(Map<String, Object> m :takeOffAdmList) {
						//1. 반출등록 데이터 수정 (TB_TAKEOFF_ADM)
						TakeOffAdmVo takeOffAdmVo = new TakeOffAdmVo();
						takeOffAdmVo.setIdx(m.get("idx").toString());
						takeOffAdmVo.setPrcssYn("N"); //처리결과 N
						takeOffAdmVo.setUpdId(Utils.getUserId());
						takeOffAdmService.takeOffAdmUpdate(takeOffAdmVo);
						
						// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 삭제
						StockAdjustAdmVo stockAdjustAdmVo = new StockAdjustAdmVo();
						stockAdjustAdmVo.setBarcodeNo("bssc0241_PR_" + m.get("idx").toString()); //SOURCE_NO
						stockAdjustAdmService.stockPaymentAdmDelete(stockAdjustAdmVo);
						
						if(m.get("itemGubun").toString().equals("001")) {
							// 3. 제품입고관리(TB_ITEM_WHS_ADM) 데이터 삭제
							ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
							itemWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
							itemWhsAdmService.itemOutWhsDelete(itemWhsAdmVo);
						}
					}
					jsonData.put("result", "ok");
	    		} else { //2번 필터
	    			jsonData.put("result", "fail");
	    		}
			} else { //1번 필터
	    		jsonData.put("result", "fail");
	    		jsonData.put("message", "처리완료된 항목만 취소할 수 있습니다.");
	    	}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}