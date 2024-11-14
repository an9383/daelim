package mes.web.io;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.Util;

import lombok.Data;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.InspAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.domain.tm.StockAdjustAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.InspAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.io.PurchaseOrderAdmService;
import mes.service.qm.ItemInspectAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class OutWhsAdmController {

	private static final Logger logger = LoggerFactory.getLogger(OutWhsAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private OutWhsAdmService outWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	@Inject
	private PurchaseOrderAdmService purchaseOrderAdmService;
	
	@Inject
	private ItemInspectAdmService itemInspectAdmService;
	
	@Inject
	private InspAdmService inspAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	//자제출고 페이지
	@RequestMapping(value = "/iosc0140", method = RequestMethod.GET)
	public String iosc0140(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "io/iosc0140";
	}
	
	//자제출고(봉제) 페이지
	@RequestMapping(value = "/iosc0141", method = RequestMethod.GET)
	public String iosc0141(Locale locale, Model model) throws Exception {
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
		
		return "io/iosc0141";
	}
	
	//개별출고 페이지
	@RequestMapping(value = "/iosc0180", method = RequestMethod.GET)
	public String iosc0180(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0180";
	}
	
	//자재출고현황(사출) 페이지
	@RequestMapping(value = "/iosc0150", method = RequestMethod.GET)
	public String iosc0150(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		List<CommonCodeAdmVo> list = new ArrayList<CommonCodeAdmVo>();
		CommonCodeAdmVo vo = new CommonCodeAdmVo();
		vo.setBaseGroupCd("073");
		vo.setEtc1("사출");
		list = commonCodeAdmService.CommonCodeList(vo);
		model.addAttribute("locCd",list);
		
		return "io/iosc0150";
	}
	
	//자재출고현황(봉제) 페이지
	@RequestMapping(value = "/iosc0260", method = RequestMethod.GET)
	public String iosc0260(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		List<CommonCodeAdmVo> list = new ArrayList<CommonCodeAdmVo>();
		CommonCodeAdmVo vo = new CommonCodeAdmVo();
		vo.setBaseGroupCd("073");
		vo.setEtc1("봉제");
		list = commonCodeAdmService.CommonCodeList(vo);
		model.addAttribute("locCd",list);
		
		return "io/iosc0260";
	}
	
	//외주입고(봉제) 메인
	@RequestMapping(value = "/iosc0340", method = RequestMethod.GET)
	public String iosc0340(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
		List<CommonCodeAdmVo> inspectYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectYn", inspectYnList);

		commonCodeVo.setBaseGroupCd("075"); // 추가수량에 대한 무료/유료
		List<CommonCodeAdmVo> payYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("payYn", payYnList);
		

		return "io/iosc0340";
	}
	
	//현재고현황(봉제) 메인
	@RequestMapping(value = "/tmsc0340", method = RequestMethod.GET)
	public String tmsc0051(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverMonthFrom", DateUtil.getDay("yyyy-mm-dd", -365));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> commonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubunList", commonList);
		
		commonCodeVo.setBaseGroupCd("112"); // 사출/봉제
		commonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubunList", commonList);
		
		commonCodeVo.setBaseGroupCd("073"); // 창고코드
		commonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("locCd", commonList);
		
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		List<OutWhsAdmVo> sheetCorpList = outWhsAdmService.sheetCorpList(outWhsAdmVo);
		model.addAttribute("corpList", sheetCorpList);
		
		List<OutWhsAdmVo> sheetItemList = outWhsAdmService.sheetItemList(outWhsAdmVo);
		model.addAttribute("itemList", sheetItemList);
		
		List<OutWhsAdmVo> sheetPartList = outWhsAdmService.sheetPartList(outWhsAdmVo);
		model.addAttribute("partList", sheetPartList);
		
		//List<OutWhsAdmVo> sheetOutQtyList = outWhsAdmService.sheetOutQtyList(outWhsAdmVo);
		//model.addAttribute("outQtyList", sheetOutQtyList);
		
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		inOutWhsAdmVo.setSearchMonth(DateUtil.getCurrentYyyymmdd().substring(0,6));
		List<InOutWhsAdmVo> dayList = inOutWhsAdmService.dayList(inOutWhsAdmVo);
		
		model.addAttribute("dayList", dayList);
		model.addAttribute("serverMon", DateUtil.getCurrentYyyymmdd().substring(0,4)+"-"+DateUtil.getCurrentYyyymmdd().substring(4,6));
		
		
		return "tm/tmsc0340";
	}
	
	//협력사출고 페이지
	@RequestMapping(value = "/tmsc0350", method = RequestMethod.GET)
	public String tmsc0350(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		return "tm/tmsc0350";
	}
		
	//자재출고 목록조회
	@RequestMapping(value = "io/outWhsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outWhsAdmList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 목록조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outWhsAdmList = outWhsAdmService.outWhsAdmList(outWhsAdmVo);
			jsonData.put("data", outWhsAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고(봉제) 부모테이블 목록조회
	@RequestMapping(value = "io/outWhsAdmParentList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outWhsAdmParentList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 목록조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outWhsAdmParentList = outWhsAdmService.outWhsAdmParentList(outWhsAdmVo);
			jsonData.put("data", outWhsAdmParentList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고 목록조회
	@RequestMapping(value = "io/preOutWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsAdmRead(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 상세조회 : " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> preOutWhsAdmRead = outWhsAdmService.preOutWhsAdmRead(outWhsAdmVo);
			jsonData.put("data", preOutWhsAdmRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고현황(봉제) 목록조회
	@RequestMapping(value = "io/preOutWhsSewingList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsSewingList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고현황(봉제) 목록조회 : " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> list = new ArrayList<OutWhsAdmVo>();
			if ( outWhsAdmVo.getLocationCd() != null && !outWhsAdmVo.getLocationCd().equals("") ) { //창고값이 있어야 조회
				String preOutWhsGubun = outWhsAdmVo.getPreOutWhsGubun();
				if (preOutWhsGubun.equals("barc")) {//lot별 조회
					list = outWhsAdmService.preOutWhsBarcList(outWhsAdmVo);
				} else if (preOutWhsGubun.equals("date")) {//일별 조회
					list = outWhsAdmService.preOutWhsDateList(outWhsAdmVo);
				} else if (preOutWhsGubun.equals("item")) {//월별 조회
					list = outWhsAdmService.preOutWhsItemList(outWhsAdmVo);
				} else {//예상치 못한 오류
					list = outWhsAdmService.preOutWhsBarcList(outWhsAdmVo);
				}
			}
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고 목록조회
	@RequestMapping(value = "io/preOutWhsAdmRead2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preOutWhsAdmRead2(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 상세조회 : "+outWhsAdmVo);
		try {
			List<OutWhsAdmVo> preOutWhsAdmRead = new ArrayList<OutWhsAdmVo>();
			if(outWhsAdmVo.getWorkOrdNo()!=null && !outWhsAdmVo.getWorkOrdNo().equals("")) {
				preOutWhsAdmRead = outWhsAdmService.preOutWhsAdmRead(outWhsAdmVo);
			}
			
			jsonData.put("data", preOutWhsAdmRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//선입선출 상세조회(사출)
	@RequestMapping(value = "io/barcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeList(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회 : "+outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				logger.info("재고수불테이블로 확인!!!!!");
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun("001");
				stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("Y");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if ( stockList.size() == 0 ) {
					jsonData.put("result","fail");
					jsonData.put("message", "등록되지 않은 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				}else {
					//for문 돌리면서 0보다 큰 값만 나오도록 하고, 투입가능한 것도 아래에 위치별로 나오도록 수정!
					logger.info("remainQty ; "+stockList.get(0).getRealQty().toString());
					if(stockList.get(0).getRealQty().toString().equals("0.000") || stockList.get(0).getRealQty().toString().equals("0")) {
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
					}else {
						StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
						stockTempVo.setRealQtyOption("Y");
						stockTempVo.setBarcodeNo("");
						stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
						stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
						stockTempVo.setLocationCd(vo.getLocationCd());
						stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
						
						if(vo.getLocationCd().equals("001")) {
							stockTempVo.setFifoOption("Y"); //원재료
						}else {
							stockTempVo.setFifoOption2("Y"); //제품
						}
						stockTempVo.setFifoOrderOption("Y");
						
						List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
						
						if(stockList.get(0).getItemFifoGubun().equals("002") 
								|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
							jsonData.put("result", "ok");
							jsonData.put("message", "투입 가능한 LOT 입니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
						}else {
							jsonData.put("result","fifo");
							jsonData.put("message", "이전LOT가 있습니다.");
							jsonData.put("itemNm", stockList.get(0).getSpNm());
							jsonData.put("remainQty", stockList.get(0).getRealQty());
							jsonData.put("data", stockTempList);
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//선입선출 상세조회(봉제)
	@RequestMapping(value = "io/barcodeListByBongjae", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeListByBongjae(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회 : "+outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				logger.info("재고수불테이블로 확인!!!!!");
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun("002");
				stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("Y");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(stockList.size()==0) {
					jsonData.put("result","fail");
					jsonData.put("message", "등록되지 않았거나 "+vo.getLocationNm() +"창고에 없는 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				}else {
					StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
					stockTempVo.setRealQtyOption("Y");
					stockTempVo.setBarcodeNo("");
					stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
					stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					stockTempVo.setLocationCd(vo.getLocationCd());
					stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
					
					if(vo.getLocationCd().equals("006")) { 
						stockTempVo.setFifoOption3("Y");
					}else {
						stockTempVo.setFifoOption4("Y");
					}
					stockTempVo.setFifoOrderOption("Y");
					
					List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
					
					if(stockList.get(0).getItemFifoGubun().equals("002") 
							|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
						jsonData.put("result", "ok");
						jsonData.put("message", "투입 가능한 LOT 입니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
					}else {
						jsonData.put("result","fifo");
						jsonData.put("message", "이전LOT가 있습니다.");
						jsonData.put("itemNm", stockList.get(0).getSpNm());
						jsonData.put("remainQty", stockList.get(0).getRealQty());
						jsonData.put("data", stockTempList);
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고(봉제) - 바코드 상세조회
	@RequestMapping(value = "io/matrlBarcodeRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> matrlBarcodeRead(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("바코드 상세조회: " + outWhsAdmVo);
		try {
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				
				//재고수불테이블로 확인
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun("002");
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("Y");
				stockPaymentAdmVo.setRealStockPage("Y");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if ( stockList.size() == 0 ) {
					jsonData.put("result","fail");
					jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
				} else {
					//for문 돌리면서 0보다 큰 값만 나오도록 하고, 투입가능한 것도 아래에 위치별로 나오도록 수정!
					StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
					stockTempVo.setRealQtyOption("Y");
					stockTempVo.setBarcodeNo("");
					stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
					stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					stockTempVo.setLocationCd(stockList.get(0).getLocationCd());
					stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
					stockTempVo.setBarcodeList(vo.getBarcodeList());
					
					if(stockTempVo.getLocationCd().equals("006")) {
						stockTempVo.setFifoOption3("Y");
					}else {
						stockTempVo.setFifoOption4("Y");
					}
					
					List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
					
					if(stockList.get(0).getItemFifoGubun().equals("002") 
							|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) {
						jsonData.put("result", "ok");
						jsonData.put("message", "추가되었습니다.");
						jsonData.put("data", stockList);
					}else {
						jsonData.put("result","fail");
						jsonData.put("message", "이전LOT가 있습니다.");
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//자재출고(공통) 상세조회
	@RequestMapping(value = "io/barcodeCommonList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeCommonList(InOutWhsAdmVo vo ,OutWhsAdmVo vo2) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo2 = new OutWhsAdmVo();
		logger.info("바코드 상세조회 : "+vo);
		try {
			
			if(vo.getBarcodeNo()!=null && !vo.getBarcodeNo().equals("")) {
				//자재입고 확인
				inOutWhsAdmVo = inOutWhsAdmService.inOutWhsAdmBarcodeRead(vo);	//입고 테이블 조회
				
				if(inOutWhsAdmVo==null) {
					
					vo2.setBarcodeNo(vo.getBarcodeNo());
					vo2.setLocationCd("001");
					outWhsAdmVo2 = outWhsAdmService.itemPartRead(vo2);		//수불관리 테이블 조회
					
					if(outWhsAdmVo2==null) {
						jsonData.put("result", "empty");
					}else {
						if(outWhsAdmVo2.getRemainQty()==0.000 || outWhsAdmVo2.getRemainQty()==null) {
							jsonData.put("result", "notRemainQty");
						}else {
							/*
							 * int preOutQty = outWhsAdmService.getConsumpt(outWhsAdmVo);
							 * logger.info("출고량(총소모량):"+preOutQty);
							 * 
							 * jsonData.put("preOutQty", preOutQty);
							 */
							jsonData.put("data", outWhsAdmVo2);
							jsonData.put("result", "ok");
						}
					}
					
				}else {
					
					//자재상태가 가입고, 수입검사, 승인상태인지 확인
					if(inOutWhsAdmVo.getStatusCd().equals("S")||inOutWhsAdmVo.getStatusCd().equals("I")||inOutWhsAdmVo.getStatusCd().equals("A")) {
						jsonData.put("result", "notInWhs");
					}else if(inOutWhsAdmVo.getStatusCd().equals("P")){
						jsonData.put("result", "already");
					}else {
						
						//남은수량 확인
						if(inOutWhsAdmVo.getRemainQty().equals("0.000") || inOutWhsAdmVo.getRemainQty()==null) {
							jsonData.put("result", "notRemainQty");
						}else {
							/*
							 * int preOutQty = outWhsAdmService.getConsumpt(outWhsAdmVo);
							 * logger.info("출고량(총소모량):"+preOutQty);
							 * 
							 * jsonData.put("preOutQty", preOutQty);
							 */
							jsonData.put("data", inOutWhsAdmVo);
							jsonData.put("result", "ok");
						}
					}
				}
			}else {
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//출고수량과 총소료량 비교 조회 
	@RequestMapping(value = "io/compareConsumptPreOutQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> compareConsumptPreOutQty(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 출고량과 총소요량조회 : "+outWhsAdmVo);
		try {

			int count = 0;
			
			List<OutWhsAdmVo> list = outWhsAdmService.compareConsumptPreOutQty(outWhsAdmVo);
			
			if(list.size()==0) {
				jsonData.put("result", "notConfirm");
				jsonData.put("message", "미출고된 자재가 있습니다. 확인해주세요.");
			}else {

				for(int i=0; i<list.size(); i++) {
					
					if(list.get(i).getDiffQty().equals("N")) count++;
				}
				
				if(count==0) {
					
					//작지 테이블에 확정컬럼 추가
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "notConfirm");
					jsonData.put("message", "미출고된 자재가 있습니다. 확인해주세요.");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
		
	//자재출고(봉제) 등록
	@RequestMapping(value = "io/outWhsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outWhsAdmCreate(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("자재출고(봉제) 등록: " + outWhsAdmList);
		try {
			//outSlipNo(출고전표번호) 생성
			String today = DateUtil.getToday("YYYYMMdd");
			outWhsAdmVo.setToday(today);
			String outSlipNo = today + "-" + outWhsAdmService.getOutSlipNo(outWhsAdmVo);
			outWhsAdmVo.setOutSlipNo(outSlipNo);
			
			for(Map<String, Object> m : outWhsAdmList) {
				// 1.자재출고관리(TB_OUT_WHS_ADM) 데이터 등록
				String outSlipSeq = outWhsAdmService.getOutSlipSeq(outWhsAdmVo);
				outWhsAdmVo.setOutSlipSeq(outSlipSeq);
				outWhsAdmVo.setOutGubun(m.get("outGubun").toString());
				outWhsAdmVo.setLotNo(m.get("lotNo").toString());
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setItemSeq(m.get("itemSeq").toString());
				outWhsAdmVo.setOutQty(m.get("outQty").toString());
				outWhsAdmVo.setUseQty("0"); //사용수량 - 출고하는 동시에 사용되는 경우는 없으니 0으로 하드코딩
				outWhsAdmVo.setOutWhsDate(m.get("outWhsDate").toString());
				outWhsAdmVo.setOutWorker(m.get("outWorker").toString());
				outWhsAdmVo.setLocationNo(m.get("preLocationNo").toString());
				outWhsAdmVo.setLocationCd(m.get("preLocationCd").toString());
				outWhsAdmVo.setOutLocationNo(m.get("locationNo").toString());
				outWhsAdmVo.setOutLocationCd(m.get("locationCd").toString());
				outWhsAdmVo.setStatusCd(m.get("statusCd").toString());
				outWhsAdmVo.setInWhsDesc(m.get("inWhsDesc").toString());
				outWhsAdmVo.setRegId(Utils.getUserId());
				int outReturnCheck = outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
					
				// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 데이터 등록
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				// 2-1. 자재출고 or 이동출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun(m.get("inWhsCheck").toString().equals("Y") ? "이동출고" : "자재출고"); //이동출고 or 자재출고
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getOutWhsDate());
				stockPaymentAdmVo.setSpQty(outWhsAdmVo.getOutQty());
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo("O" + outSlipNo + "-" + outSlipSeq);
				stockPaymentAdmVo.setLocationNo(m.get("preLocationNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("preLocationCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				int stockReturnCheck1 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				// 2-2. 이동입고
				if ( m.get("inWhsCheck").toString().equals("Y") ) {
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
					stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
					stockPaymentAdmVo.setSpGubun("001");
					stockPaymentAdmVo.setSpSubGubun("이동입고");
					stockPaymentAdmVo.setSpDate(outWhsAdmVo.getOutWhsDate());
					stockPaymentAdmVo.setSpQty(outWhsAdmVo.getOutQty());
					stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo("O" + outSlipNo + "-" + outSlipSeq);
					stockPaymentAdmVo.setLocationNo(m.get("locationNo").toString());
					stockPaymentAdmVo.setLocationCd(m.get("locationCd").toString());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					int stockReturnCheck2 = stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
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
	
	//개별출고 등록
	@RequestMapping(value = "io/preOutWhsAdmCommonCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> preOutWhsAdmCommonCreate(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("개별출고 등록 : "+outWhsAdmList);
		try {
			
			for(Map<String, Object> m : outWhsAdmList) {
				//출고테이블
				
				if(m.get("poNo").toString().equals("null") || m.get("poNo").toString()==null) {
					//발주번호
					String today = DateUtil.getToday("YYMMdd");
					String poNoSeq = inOutWhsAdmService.getPoNo(today);
					String poNo = "I"+today+"-"+poNoSeq;
					
					outWhsAdmVo.setPoNo(poNo);
					outWhsAdmVo.setPoSeq(0);
					outWhsAdmVo.setInSeq(0);
					outWhsAdmVo.setLotNo(m.get("barcodeNo").toString());
				}else {
					outWhsAdmVo.setPoNo(m.get("poNo").toString());
					outWhsAdmVo.setPoSeq(Integer.parseInt(m.get("poSeq").toString()));
					outWhsAdmVo.setInSeq(Integer.parseInt(m.get("inSeq").toString()));
					outWhsAdmVo.setLotNo(m.get("lotNo").toString());
				}
					
				outWhsAdmVo.setOutSeq(0);
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				outWhsAdmVo.setPartCd(m.get("partCd").toString());
				outWhsAdmVo.setPartRev(m.get("partRev").toString());
				outWhsAdmVo.setPreOutQty(Float.parseFloat(m.get("preOutQty").toString()));
				outWhsAdmVo.setLocationCd(m.get("locationCd").toString());
				outWhsAdmVo.setAreaCd(m.get("areaCd").toString());
				outWhsAdmVo.setFloorCd(m.get("floorCd").toString());
				outWhsAdmVo.setLocationNo(m.get("locationNo").toString());
				outWhsAdmVo.setStatusCd("O");
				outWhsAdmVo.setPreOutWhsDate(outWhsAdmList.get(0).get("preOutWhsDate").toString());
				outWhsAdmVo.setPreWorkCharger(outWhsAdmList.get(0).get("preWorkCharger").toString());
				outWhsAdmVo.setInWhsDesc(outWhsAdmList.get(0).get("inWhsDesc").toString());
				outWhsAdmVo.setOutCase(outWhsAdmList.get(0).get("outCase").toString());
			
					
				outWhsAdmVo.setRegId(Utils.getUserId());
				outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				//출고테이블에 해당 바코드 여부확인
				//출고테이블 update
				/*if(outWhsAdmService.barcodeExsitCheck(outWhsAdmVo)>0) {	
					
					logger.info("존재함");
					
					outWhsAdmVo.setUpdId(Utils.getUserId());
					outWhsAdmService.updatePreOutQty(outWhsAdmVo);
					
				//출고테이블 create	
				}else {													
					
					logger.info("존재NONONONO");
					
					outWhsAdmVo.setRegId(Utils.getUserId());
					outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				}
				*/
				//입고 테이블 update
				if(outWhsAdmVo.getPoNo()!=null && !outWhsAdmVo.getPoNo().equals("")) {
					outWhsAdmService.updateRemainQty(outWhsAdmVo);
				}
					
				//수불테이블 Create
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType("001");
				stockPaymentAdmVo.setSpCd(outWhsAdmVo.getPartCd());
				stockPaymentAdmVo.setSpRev(outWhsAdmVo.getPartRev());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getPreOutWhsDate());
				stockPaymentAdmVo.setSpQty(Float.toString(outWhsAdmVo.getPreOutQty()));
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(outWhsAdmVo.getLocationCd());
				stockPaymentAdmVo.setAreaCd(outWhsAdmVo.getAreaCd());
				stockPaymentAdmVo.setFloorCd(outWhsAdmVo.getFloorCd());
				stockPaymentAdmVo.setLocationNo(outWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
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
	
	
	//자재출고 출고량 수정
	@RequestMapping(value = "io/updatePreOutQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updatePreOutQty(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		logger.info("자재출고 출고량 수정 : "+outWhsAdmList);
		try {
			outWhsAdmVo.setUpdId(Utils.getUserId());
			
			for(Map<String, Object> m : outWhsAdmList) {
				
				outWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				
				//입고수량과 비교해야함
				
				
				outWhsAdmService.updatePreOutQty(outWhsAdmVo);
				
				//입출고 남은수량 수정
				outWhsAdmService.updateRemainQty(outWhsAdmVo);
				
				jsonData.put("result", "ok");
					
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//자재출고 확정여부수정
	@RequestMapping(value = "io/updateConfirmYn", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateConfirmYn(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고 확정여부 수정 : "+outWhsAdmVo);
		try {
			outWhsAdmVo.setUpdId(Utils.getUserId());
			
			outWhsAdmService.updateConfirmYn(outWhsAdmVo);
			jsonData.put("result", "ok");
		
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고현황 작지번호 모달 조회
	@RequestMapping(value = "io/workOrdNoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdNoList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고현황 작지번호 모달 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> workOrdNoList = outWhsAdmService.workOrdNoList(outWhsAdmVo);
			jsonData.put("data", workOrdNoList);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//협력사출고 등록
	@RequestMapping(value = "io/supplyOutCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> supplyOutCreate(InOutWhsAdmVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("협력사출고 vo: " + outWhsAdmVo);
		try {
			if ( vo.getBarcodeNo() != null && !vo.getBarcodeNo().equals("") ) { //1. 바코드 입력 확인
				//재고수불테이블로 확인
				stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
				stockPaymentAdmVo.setMainGubun("002");
				stockPaymentAdmVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				stockPaymentAdmVo.setRealQtyOption("Y");
				stockPaymentAdmVo.setRealStockPage("Y");
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if ( stockList.size() == 0 ) { //2번 오류 필터
					jsonData.put("result","fail");
					jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
					jsonData.put("itemNm", "");
					jsonData.put("remainQty", "0");
				} else { //2. 수불데이터 확인
	             	DeliveryOrderAdmVo doaVo = new DeliveryOrderAdmVo();
	             	doaVo.setLotNo(vo.getBarcodeNo());
	             	doaVo.setCheckNullCorpOutYn("Y"); //협력사출고가 아닌 데이터가 등록되었는 지 확인하는 기능
	             	int targetTotalQty = deliveryOrderAdmService.getTargetQty(doaVo);
					
	             	if ( targetTotalQty <= 0 ) { //3. 협력사출고 말고 다른 출고를 했는지 확인
	             		itemPartAdmVo.setItemSeq(stockList.get(0).getItemSeq());
						itemPartAdmVo = itemPartAdmService.itemPartDtlList(itemPartAdmVo);
						if ( itemPartAdmVo.getSupplyType() != null && !itemPartAdmVo.getSupplyType().equals("001") ) { //4. 사급(유상)일 경우만 가능
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(stockList.get(0).getItemSeq());
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							stockTempVo.setLocationCd(stockList.get(0).getLocationCd());
							stockTempVo.setFifoBarcodeNo(vo.getBarcodeNo());
							stockTempVo.setBarcodeList(vo.getBarcodeList());
							
							if(stockTempVo.getLocationCd().equals("006")) {
								stockTempVo.setFifoOption3("Y");
							}else {
								stockTempVo.setFifoOption4("Y");
							}
							
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockList.get(0).getItemFifoGubun().equals("002") 
									|| (stockList.get(0).getItemFifoGubun().equals("001") && stockTempList.size()<=0)) { //5. 선입선출 확인
								jsonData.put("result", "ok");
								jsonData.put("message", "추가되었습니다.");
								jsonData.put("data", stockList);
							} else { //5번 오류 필터
								jsonData.put("result", "fail");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
						} else { //4번 오류 필터
							jsonData.put("result", "fail");
							jsonData.put("message", "사급 품목이 아닙니다. 확인해주세요.");
						}
	             	} else { //3번 오류 필터
						jsonData.put("result", "fail");
						jsonData.put("message", "이미 출하 된 바코드 입니다.");
					}
				}
			} else { //1번 오류 필터
				jsonData.put("data", inOutWhsAdmVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수주상세별 출고 모니터링 조회
	@RequestMapping(value = "io/outMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outMonitoringList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.outMonitoringList(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
			}
			jsonData.put("data", list);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//재공창고현항
	//재공창고 기본조회
	@RequestMapping(value = "io/wareHouseList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> wareHouseList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.wareHouseList(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
			}
			jsonData.put("data", list);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//재공창고 상세조회
	@RequestMapping(value = "io/wareHouseRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> wareHouseRead(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수주상세별 출고 모니터링 조회 : "+outWhsAdmVo);
		try {
			
			List<OutWhsAdmVo> list = outWhsAdmService.wareHouseRead(outWhsAdmVo);
			if(list==null) {
				list = new ArrayList<OutWhsAdmVo>();
			}
			jsonData.put("data", list);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//외주입고(봉제) 목록조회
	@RequestMapping(value = "io/outsourcingWhsList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingWhsList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주입고(봉제) 목록조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outsourcingWhsList = outWhsAdmService.outsourcingWhsList(outWhsAdmVo);
			jsonData.put("data", outsourcingWhsList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고(봉제) 외주사 조회
	@RequestMapping(value = "io/outscDealList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outscDealList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주입고(봉제) 외주사 조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outscDealList = outWhsAdmService.outscDealList(outWhsAdmVo);
			jsonData.put("data", outscDealList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고(봉제) 등록, 수정
	@RequestMapping(value="io/outscWhsCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outscWhsCreate(@RequestBody List<Map<String, Object>> inOutWhsAdmList) throws Exception{
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("io/outscWhsCreate: " + inOutWhsAdmVo);
		try {
			//1번 필터: 남은 자재가 있는지 확인
			OutWhsAdmVo owaListVo = new OutWhsAdmVo();
			owaListVo.setItemSeq(inOutWhsAdmList.get(0).get("itemSeq").toString());
			owaListVo.setLocationNo(inOutWhsAdmList.get(0).get("outLocationNo").toString());
			owaListVo.setInQty(inOutWhsAdmList.get(0).get("sumInQty").toString());
			owaListVo.setCheckRemainQty("Y"); //남은자재 확인하는 조회조건
			List<OutWhsAdmVo> oawList = outWhsAdmService.outBomInputConsumpt(owaListVo);
			
			if ( oawList.size() <= 0 ) { //1번 필터
				// 1. 자재출고관리 데이터 수정 (TB_OUT_WHS_ADM-USE_QTY)
				OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
				outWhsAdmVo.setItemSeq(inOutWhsAdmList.get(0).get("itemSeq").toString());
				outWhsAdmVo.setLocationNo(inOutWhsAdmList.get(0).get("outLocationNo").toString());
				outWhsAdmVo.setInQty(inOutWhsAdmList.get(0).get("sumInQty").toString());
				int checkReturnUuo = outWhsAdmService.updateUseqtyPlus(outWhsAdmVo); //주의! 무조건 1번 필터를 거치고 실행되어야 한다.
				
				// 외주처에 있는 자재 조회 (to 4. 자재출고 수불데이터 등록)
				OutWhsAdmVo owaStockListVo = new OutWhsAdmVo();
				owaStockListVo.setItemSeq(inOutWhsAdmList.get(0).get("itemSeq").toString());
				owaStockListVo.setLocationNo(inOutWhsAdmList.get(0).get("outLocationNo").toString());
				owaStockListVo.setInQty(inOutWhsAdmList.get(0).get("sumInQty").toString());
				List<OutWhsAdmVo> oawStockList = outWhsAdmService.outBomInputConsumpt(owaStockListVo);
				
				// 2. 구매발주관리 데이터 등록
				PurchaseOrderAdmVo purchaseOrderAdmVo = new PurchaseOrderAdmVo();
				String toDay = DateUtil.getToday("YYMMdd");
				purchaseOrderAdmVo.setToday(toDay);
				String poNoSeq = purchaseOrderAdmService.getPoNo(purchaseOrderAdmVo);
				String poNo = "O" + toDay + "-" + poNoSeq;
				purchaseOrderAdmVo.setPoNo(poNo);
				purchaseOrderAdmVo.setDealCorpCd(inOutWhsAdmList.get(0).get("dealCorpCd").toString());
				purchaseOrderAdmVo.setMainChargr(inOutWhsAdmList.get(0).get("mainChargr").toString());
				purchaseOrderAdmVo.setPoDate(DateUtil.getToday("YYYYMMdd"));
				purchaseOrderAdmVo.setReceiptGubun("002");
				purchaseOrderAdmVo.setPoDesc("");
				purchaseOrderAdmVo.setRegId(Utils.getUserId());
				purchaseOrderAdmService.purchaseOrderAdmCreate(purchaseOrderAdmVo);
				
				inOutWhsAdmVo.setPoNo(poNo);
				inOutWhsAdmVo.setItemSeq(inOutWhsAdmList.get(0).get("itemSeq").toString());
				inOutWhsAdmVo.setItemCd(inOutWhsAdmList.get(0).get("itemCd").toString());
				inOutWhsAdmVo.setOrdQty(inOutWhsAdmList.get(0).get("ordQty").toString());
				
				int count = 0;
				for(Map<String, Object> m :inOutWhsAdmList) {
					// 3. 구매발주상세 데이터 등록
					String poSeq = purchaseOrderAdmService.getPoSeq(purchaseOrderAdmVo).toString();
					purchaseOrderAdmVo.setPoSeq(poSeq);
					purchaseOrderAdmVo.setItemSeq(m.get("itemSeq").toString());
					purchaseOrderAdmVo.setOrdQty(m.get("preInWhsQty").toString());
					purchaseOrderAdmVo.setDlvDate(m.get("preInWhsDate").toString());
					purchaseOrderAdmVo.setPoStatus("003");
					purchaseOrderAdmService.purchaseOrderDtlCreate(purchaseOrderAdmVo);
					
					if ( m.get("inSlipNo").toString().equals("") || m.get("inSlipNo").toString()==null ) {
						if ( count == 0 ) {
							String today = DateUtil.getToday("YYYYMMdd");
							inOutWhsAdmVo.setToday(today);
							String inSlipNo = inOutWhsAdmService.getInSlipNo(inOutWhsAdmVo);
							inOutWhsAdmVo.setInSlipNo(today+"-"+inSlipNo);
							count++;
						}
					} else {
						inOutWhsAdmVo.setInSlipNo(m.get("inSlipNo").toString());
					}
					inOutWhsAdmVo.setPoSeq(poSeq);
					inOutWhsAdmVo.setPreInWhsDate(m.get("preInWhsDate").toString());
					inOutWhsAdmVo.setPreInWhsQty(m.get("preInWhsQty").toString());
					inOutWhsAdmVo.setLotNo(m.get("lotNo").toString());
					
					String date = inOutWhsAdmVo.getItemSeq() + "-" + inOutWhsAdmVo.getPreInWhsDate().substring(2, 8);
					String barcodeSeq = inOutWhsAdmService.getBarcodeSeq(date);
					String barcodeNo = date + "-" + barcodeSeq;
					if ( m.get("inSlipNo").toString().equals("") || m.get("inSlipNo").toString()==null ) { //등록
						inOutWhsAdmVo.setInSlipSeq(inOutWhsAdmService.getInSlipSeq(inOutWhsAdmVo));
						inOutWhsAdmVo.setInSeq(inOutWhsAdmService.getInSeq(inOutWhsAdmVo));
						inOutWhsAdmVo.setBarcodeNo(barcodeNo);
						inOutWhsAdmVo.setRegId(Utils.getUserId());
						inOutWhsAdmVo.setLocationCd(m.get("locationCd").toString());
						inOutWhsAdmVo.setAreaCd(m.get("areaCd").toString());
						inOutWhsAdmVo.setFloorCd(m.get("floorCd").toString());
						inOutWhsAdmVo.setLocationNo(m.get("locationNo").toString());
						inOutWhsAdmService.preInOutWhsAdmCreate(inOutWhsAdmVo);
					} else { //수정
						inOutWhsAdmVo.setInSlipSeq(m.get("inSlipSeq").toString());
						inOutWhsAdmVo.setInSeq(m.get("inSeq").toString());
						inOutWhsAdmVo.setLocationCd(m.get("locationCd").toString());
						inOutWhsAdmVo.setAreaCd(m.get("areaCd").toString());
						inOutWhsAdmVo.setFloorCd(m.get("floorCd").toString());
						inOutWhsAdmVo.setLocationNo(m.get("locationNo").toString());
						inOutWhsAdmVo.setUpdId(Utils.getUserId());
						inOutWhsAdmService.preInOutWhsAdmUpdate(inOutWhsAdmVo);
					}
					
					// 4. 자재출고 수불데이터 등록
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
					
					for ( OutWhsAdmVo outVo : oawStockList ) {
						float needQty = Float.parseFloat(outVo.getNeedQty());
						while (needQty > 0) {
							outWhsAdmVo.setItemSeq(outVo.getItemSeq());
							OutWhsAdmVo tempVo = outWhsAdmService.outscFifoRead(outWhsAdmVo); //이것도 출고관리 데이터를 따르도록 변경해야 함.
							
							stockPaymentAdmVo.setSpNo(spNo);
							stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
							stockPaymentAdmVo.setSpType(outVo.getItemGubun());
							stockPaymentAdmVo.setSpCd(outVo.getItemSeq());
							stockPaymentAdmVo.setSpGubun("002");
							stockPaymentAdmVo.setSpSubGubun("자재출고");
							stockPaymentAdmVo.setSpDate(m.get("preInWhsDate").toString());
							stockPaymentAdmVo.setBarcodeNo(tempVo.getBarcodeNo());
							stockPaymentAdmVo.setSourceNo(barcodeNo);
							stockPaymentAdmVo.setLocationNo(m.get("outLocationNo").toString());
							stockPaymentAdmVo.setLocationCd(m.get("outLocationCd").toString());
							stockPaymentAdmVo.setRegId(Utils.getUserId());
							
							float realQty = Float.parseFloat(tempVo.getRealQty());
							//투입보다 생산량이 많을 경우  
							if ( realQty < needQty ) {
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(realQty)));  //출고량
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								needQty = needQty - realQty;
							} else {
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(needQty)));
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								needQty = 0;
							}
						}
					}
					
				}
				jsonData.put("result", "ok");
			} else { //1번 필터
				jsonData.put("result", "fail");
				jsonData.put("message", "외주처에 있는 자재가 부족합니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고(봉제) 자재불출 확인
	@RequestMapping(value = "io/outBomInputConsumpt", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outBomInputConsumpt(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주입고(봉제) 자재불출 확인: " + outWhsAdmVo);
		try {
			outWhsAdmVo.setServerDate(DateUtil.getToday("YYYYMMdd"));
			List<OutWhsAdmVo> outBomInputConsumpt = outWhsAdmService.outBomInputConsumpt(outWhsAdmVo);
			if (outBomInputConsumpt.size() > 0 && outBomInputConsumpt.size() == outBomInputConsumpt.get(0).getTotalCount()) {
				jsonData.put("inWhsCheck", "ok");
			} else {
				jsonData.put("inWhsCheck", "no");
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고(봉제) 자재출고 확인
	@RequestMapping(value = "io/outBomInputList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outBomInputList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주입고(봉제) 자재출고 확인: " + outWhsAdmVo);
		try {
			outWhsAdmVo.setServerDate(DateUtil.getToday("YYYYMMdd"));
			List<OutWhsAdmVo> outBomInputList = outWhsAdmService.outBomInputList(outWhsAdmVo);
			jsonData.put("data", outBomInputList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고(봉제) 삭제
	@RequestMapping(value = "io/outscWhsDelete", method = RequestMethod.GET) //vo를 여러 개 가지고 있으면 유지보수가 어려움. vo 1개만으로 기능 구현되도록 수정해야 함.
	public @ResponseBody Map<String, Object> outscWhsDelete(PurchaseOrderAdmVo purchaseOrderAdmVo, InOutWhsAdmVo inOutWhsAdmVo, StockPaymentAdmVo stockPaymentAdmVo, OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("io/outscWhsDelete: " + inOutWhsAdmVo);
		try {
			if ( inOutWhsAdmVo.getInSlipNo() != null || !inOutWhsAdmVo.getInSlipNo().equals("") ) {
				if ( !inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo).equals("S") ) { // 아직 가입고 상태인지 확인
					if ( stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmVo).size() > 1 ) {
						jsonData.put("result", "fail");
						jsonData.put("message", "승인 한 후 입출고가 발생하여 삭제를 할 수 없습니다.");
					} else {
						//1. 자재출고관리 데이터 수정 (TB_OUT_WHS_ADM-USE_QTY)
						OutWhsAdmVo owaVo = new OutWhsAdmVo();
						owaVo.setItemSeq( outWhsAdmVo.getOwaVoItemSeq() );
						owaVo.setLocationNo( outWhsAdmVo.getOwaVoLocationNo() );
						owaVo.setInQty( outWhsAdmVo.getOwaVoInQty() );
						int checkReturnUum = outWhsAdmService.updateUseqtyMinus(owaVo);
						
						//2. 재고수불관리 데이터 삭제(자재 및 제품)
						StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
						stockVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
						stockPaymentAdmService.stockPaymentAdmDelete(stockVo);
						
						//3. 구매발주상세 데이터 삭제
						purchaseOrderAdmService.purchaseOrderDtlDelete(purchaseOrderAdmVo);
						
						//4. 구매발주관리 데이터 삭제
						if(purchaseOrderAdmService.purchaseOrderPrintToList(purchaseOrderAdmVo).size()==0) {
							purchaseOrderAdmService.purchaseOrderDelete(purchaseOrderAdmVo);
						}
						
						//5. 입고등록 데이터 삭제
						inOutWhsAdmService.preInOutWhsAdmDelete(inOutWhsAdmVo);
						
						//6. 수입검사데이터 삭제
						ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
						itemInspectAdmVo.setInSlipNo(inOutWhsAdmVo.getInSlipNo());
						itemInspectAdmVo.setInSlipSeq(inOutWhsAdmVo.getInSlipSeq());
						itemInspectAdmService.itemInspectAdmDelete(itemInspectAdmVo);
						itemInspectAdmService.itemInspectFaultyTypeDelete(itemInspectAdmVo);
						
						ItemInspectAdmVo itemInspectCountVo = new ItemInspectAdmVo();
						itemInspectCountVo.setInSlipNo(inOutWhsAdmVo.getInSlipNo());
						//DTL이 없다면
						if(itemInspectAdmService.countInspectAdmList(itemInspectCountVo)==0) {
							itemInspectAdmService.itemInspectMasterAdmDelete(itemInspectAdmVo);
							InspAdmVo inspAdmVo = new InspAdmVo();
							inspAdmVo.setInspResultGubun("003");
							inspAdmVo.setInspSourceNo(inOutWhsAdmVo.getInSlipNo());
							inspAdmService.inspResultAdmDelete(inspAdmVo);
						}
						
						jsonData.put("result", "ok");
						jsonData.put("message", "삭제되었습니다.");
					}
				} else {
					//1. 자재출고관리 데이터 수정 (TB_OUT_WHS_ADM-USE_QTY)
					OutWhsAdmVo owaVo = new OutWhsAdmVo();
					owaVo.setItemSeq( outWhsAdmVo.getOwaVoItemSeq() );
					owaVo.setLocationNo( outWhsAdmVo.getOwaVoLocationNo() );
					owaVo.setInQty( outWhsAdmVo.getOwaVoInQty() );
					int checkReturnUum = outWhsAdmService.updateUseqtyMinus(owaVo);
					
					//2. 재고수불관리 데이터 삭제 (자재)
					StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
					stockVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
					stockPaymentAdmService.stockPaymentAdmDelete(stockVo);
					
					//3. 구매발주상세 데이터 삭제
					purchaseOrderAdmService.purchaseOrderDtlDelete(purchaseOrderAdmVo);
					
					//4. 구매발주관리 데이터 삭제
					if(purchaseOrderAdmService.purchaseOrderPrintToList(purchaseOrderAdmVo).size()==0) {
						purchaseOrderAdmService.purchaseOrderDelete(purchaseOrderAdmVo);
					}
					
					//5. 입고등록 데이터 삭제
					inOutWhsAdmService.preInOutWhsAdmDelete(inOutWhsAdmVo);
					
					jsonData.put("result", "ok");
					jsonData.put("message", "삭제되었습니다.");
				}
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "입고되지 않은 항목입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주재고현황 목록조회
	@RequestMapping(value = "io/outInventoryList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outInventoryList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주재고현황 목록조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outInventoryList = new ArrayList<OutWhsAdmVo>();
			if(outWhsAdmVo.getSideView()!=null && outWhsAdmVo.getSideView().equals("Y")) {
				outWhsAdmVo.setServerDate(DateUtil.getToday("YYYYMMdd"));
				outInventoryList = outWhsAdmService.outInventoryList(outWhsAdmVo);
			}
			
			jsonData.put("data", outInventoryList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주재고현황 상세조회
	@RequestMapping(value = "io/outInventoryDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outInventoryDtlList(OutWhsAdmVo outWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("외주재고현황 상세조회: " + outWhsAdmVo);
		try {
			List<OutWhsAdmVo> outInventoryList = new ArrayList<OutWhsAdmVo>();
			if(outWhsAdmVo.getItemSeq()!=null && !outWhsAdmVo.getItemSeq().equals("")) {
				outInventoryList = outWhsAdmService.outInventoryDtlList(outWhsAdmVo);
			}
			
			jsonData.put("data", outInventoryList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재출고(봉제) 삭제
	@RequestMapping(value = "/io/outWhsAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outWhsAdmDelete(@RequestBody List<Map<String, Object>> outWhsAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재출고(봉제) 삭제: " + outWhsAdmList);
		try {
			//삭제 필터링
			OutWhsAdmVo owaListVo = new OutWhsAdmVo();
			owaListVo.setChkOutWhsAdmDelete("Y");
			owaListVo.setOwaIdxList(outWhsAdmList.get(0).get("owaIdxList").toString());
			List<OutWhsAdmVo> owaList = outWhsAdmService.outWhsAdmList(owaListVo);
			if ( owaList.size() <= 0 ) { //1. 이미 사용된 데이터가 없으면
				for(Map<String, Object> m :outWhsAdmList) {
					OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();
					outWhsAdmVo.setOutSlipNo(m.get("outSlipNo").toString());
					outWhsAdmVo.setOutSlipSeq(m.get("outSlipSeq").toString());
					
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					stockPaymentAdmVo.setSourceNo("O" + outWhsAdmVo.getOutSlipNo() + "-" + outWhsAdmVo.getOutSlipSeq());
					
					if ( stockPaymentAdmVo.getSourceNo() != null && !stockPaymentAdmVo.getSourceNo().equals("") ) { //sourceNo의 값이 없으면 데이터 전체가 삭제되니 주의해야 함
						// 1. 자재출고관리(TB_OUT_WHS_ADM) 삭제
						outWhsAdmService.tbOutWhsAdmDel(outWhsAdmVo);
						
						// 2. 재고수불관리(TB_STOCK_PAYMENT_ADM) 삭제
						stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
						
						jsonData.put("result", "ok");	
					} else {
						jsonData.put("result", "error");
						jsonData.put("message", Utils.getErrorMessage());
						break;
					}
				}
			} else { //1번 필터
	    		jsonData.put("result", "fail");
	    		jsonData.put("message", owaList.get(0).getBarcodeNo() + "항목이 이미 사용되어 삭제할 수 없습니다.");
	    	}
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}


