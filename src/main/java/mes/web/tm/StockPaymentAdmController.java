package mes.web.tm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.tm.StockAdjustAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.cm.Constants;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class StockPaymentAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(StockPaymentAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	@Inject
	private StockPaymentAdmService stockPaymentAdmService;

	// 현재고현황(사출) 메인
	@RequestMapping(value = "/tmsc0050", method = RequestMethod.GET)
	public String tmsc0050(Locale locale, Model model) throws Exception {
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

		return "tm/tmsc0050";
	}

	// 현재고현황(봉제) 메인
	@RequestMapping(value = "/tmsc0051", method = RequestMethod.GET)
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

		return "tm/tmsc0051";
	}

	// 수불부 현황 메인
	@RequestMapping(value = "/iosc0330", method = RequestMethod.GET)
	public String iosc0330(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();

		commonCodeVo.setBaseGroupCd("112"); // 구분
		List<CommonCodeAdmVo> commonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", commonList);

		commonCodeVo.setBaseGroupCd("079"); // 품목
		commonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", commonList);

		return "io/iosc0330";
	}

	// 수불관리 조회(코드별)
	@RequestMapping(value = "tm/stockPaymentAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리 조회: " + stockPaymentAdmVo);
		try {

			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmList(stockPaymentAdmVo);
			if (list == null || list.size() == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
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

	// 수불관리 상세조회
	@RequestMapping(value = "tm/stockPaymentAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리 조회: " + stockPaymentAdmVo);
		try {

			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmVo);
			if (list == null || list.size() == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
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
	
	// 수불관리 상세조회_현재고현황
	@RequestMapping(value = "tm/stockPaymentAdmReadByItem", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmReadByItem(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리 조회: " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if(stockPaymentAdmVo.getSpCd()!=null && !stockPaymentAdmVo.getSpCd().equals("")) {
				list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmVo);
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

	// 수불관리 조회(바코드별) - 현재고현황
	@RequestMapping(value = "tm/stockPaymentAdmBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리(바코드별) 조회: " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if (stockPaymentAdmVo.getItemSeq() != null && !stockPaymentAdmVo.getItemSeq().equals("")) {
				list = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if (list == null || list.size() == 0) {
					list = new ArrayList<StockPaymentAdmVo>();
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

	// 수불관리 조회(바코드별) - 재고조정관리
	@RequestMapping(value = "tm/stockPaymentAdmBarcodeList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmBarcodeList2(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리(바코드별) 조회: " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
			if (list == null || list.size() == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
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
	
	// 수불관리 조회(바코드별) - 재고조정관리-serverSide 추가
	@RequestMapping(value = "tm/stockPaymentAdmBarcodeList3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmBarcodeList3(StockPaymentAdmVo stockPaymentAdmVo, HttpServletRequest request)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고조정관리 조회: " + stockPaymentAdmVo);
		try {
			
			/*
			 * String start = request.getParameter("start"); String length =
			 * request.getParameter("length"); String searchVal =
			 * request.getParameter("search[value]"); String ordDir =
			 * request.getParameter("order[0][dir]"); String ordColumnIdx =
			 * request.getParameter("order[0][column]"); String ordColumn =
			 * request.getParameter("columns["+ ordColumnIdx +"][data]");
			 * 
			 * logger.info("start = "+ start + ",length = " +length + ",searchVal = "
			 * +searchVal + ",ordColumn = " +ordColumn + ",ordDir = " +ordDir);
			 * 
			 * stockPaymentAdmVo.setSearchVal(searchVal); ordColumn =
			 * Utils.convert2UnderscoreCase(ordColumn); stockPaymentAdmVo.setOrdDir(ordDir);
			 * stockPaymentAdmVo.setOrdColumn(ordColumn); stockPaymentAdmVo.setStart(start);
			 * stockPaymentAdmVo.setLength(length);
			 */
			
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
			if (list == null || list.size() == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
			}
			
			/*
			 * int totalCount = 0; if(list.size() > 0) { totalCount =
			 * list.get(0).getTotalCount(); } jsonData.put("recordsTotal", totalCount);
			 * jsonData.put("recordsFiltered", totalCount);
			 */
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 수불관리 조회(창고별)
	@RequestMapping(value = "tm/stockPaymentAdmLocList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmLocList(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리(창고별) 조회: " + stockPaymentAdmVo);
		try {
			stockPaymentAdmVo.setRealQtyOption("Y");
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmLocList(stockPaymentAdmVo);
			if (list == null || list.size() == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
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

	// 수불관리 조회(구역별)
	@RequestMapping(value = "tm/stockPaymentAdmAreaList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmAreaList(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리(창고별) 조회: " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if (stockPaymentAdmVo.getItemSeq() != null && !stockPaymentAdmVo.getItemSeq().equals("")) {
				stockPaymentAdmVo.setRealQtyOption("Y");
				list = stockPaymentAdmService.stockPaymentAdmAreaList(stockPaymentAdmVo);

				if (list == null || list.size() == 0) {
					list = new ArrayList<StockPaymentAdmVo>();
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

	// 수불관리 등록
	@RequestMapping(value = "tm/stockPaymentAdmCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preInOutWhsAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불관리 등록 : " + stockPaymentAdmVo);
		try {

			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);

			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 재고위치관리
	// 재고조회 팝업 목록조회
	@RequestMapping(value = "tm/stockLocAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockLocAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("재고위치관리조회 : " + stockPaymentAdmVo);
			List<StockPaymentAdmVo> list;
			List<StockPaymentAdmVo> list2 = new ArrayList<StockPaymentAdmVo>();

			if (stockPaymentAdmVo.getArray() == null || stockPaymentAdmVo.getArray().length == 0) {
				list = new ArrayList<StockPaymentAdmVo>();
			} else {
				list = stockPaymentAdmService.stockLocList(stockPaymentAdmVo);
				for (int i = 0; i < list.size(); i++) {
					if (list.get(i).getRealQty() != null && !list.get(i).getRealQty().equals("0.000")) {
						list2.add(list.get(i));
					}

				}
			}

			jsonData.put("data", list2);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 재고조회 팝업 DTL테이블 초기화
	@RequestMapping(value = "tm/locationTempTableReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationTempTableReset(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고위치 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// PDA(재고현황)
	@RequestMapping(value = "tm/countStockPaymentQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> v(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			// 입고관리 테이블의 바코드 존재 여부 확인
			int inOutBarcodeCheck = stockPaymentAdmService.inOutBarcodeCheck(stockPaymentAdmVo);
			if (inOutBarcodeCheck > 0) {
				stockPaymentAdmVo = stockPaymentAdmService.itemInfoAdmRead1(stockPaymentAdmVo);
				jsonData.put("data", stockPaymentAdmVo);
				jsonData.put("result", "ok");
			} else {
				// 제품입출고관리 테이블의 바코드 존재 여부 확인
				int itemBarcodeCheck = stockPaymentAdmService.itemBarcodeCheck(stockPaymentAdmVo);
				if (itemBarcodeCheck == 0) {
					jsonData.put("result", "empty");
				} else {
					stockPaymentAdmVo = stockPaymentAdmService.itemInfoAdmRead2(stockPaymentAdmVo);
					jsonData.put("data", stockPaymentAdmVo);
					jsonData.put("result", "ok");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// ================================== 모니터링(재고현황)
	// =======================================
	// 모니터링(원자재) 메인
	@RequestMapping(value = "/mmsc0030", method = RequestMethod.GET)
	public String mmsc0030(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> spGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("spGubunVal", spGubunList);

		return "mm/mmsc0030";
	}

	// 원자재 모니터링(봉제) 메인
	@RequestMapping(value = "/mmsc0300", method = RequestMethod.GET)
	public String mmsc0300(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> spGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("spGubunVal", spGubunList);

		return "mm/mmsc0300";
	}

	// 원자재 목록조회
	@RequestMapping(value = "tm/stockPaymentAdmDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockPaymentAdmDtlList(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("원자재 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmDtlList(stockPaymentAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 원자재 창고별 현재고 목록조회
	@RequestMapping(value = "tm/locationToStockPayment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationToStockPayment(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("원자재 창고별 현재고 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.locationToStockPayment(stockPaymentAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 원자재 창고별 입고일자별 현재고 목록조회
	@RequestMapping(value = "tm/locationDateToStockPayment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationDateToStockPayment(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("원자재 창고별 입고일자별 현재고 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.locationDateToStockPayment(stockPaymentAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 창고별 LOT 목록조회
	@RequestMapping(value = "tm/locationToLot", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationToLot(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고별 LOT 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.locationToLot(stockPaymentAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 위치별 품목 재고 목록조회
	@RequestMapping(value = "tm/floorToStockPayment", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> floorToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("위치별 품목 재고 목록조회 : " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.floorToStockPayment(stockPaymentAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 모니터링(제품) 메인
	@RequestMapping(value = "/mmsc0170", method = RequestMethod.GET)
	public String mmsc0170(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> spGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("spGubunVal", spGubunList);

		return "mm/mmsc0170";
	}

	// PDA(재고현황)
	@RequestMapping(value = "tm/locationGroupStockQtyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationGroupStockQtyList(StockPaymentAdmVo stockPaymentAdmVo,
			HttpSession session) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if (stockPaymentAdmVo.getBarcodeNo() != null && !stockPaymentAdmVo.getBarcodeNo().equals("")) {
				list = stockPaymentAdmService.locationGroupStockQtyList(stockPaymentAdmVo);
				if (list == null || list.size() == 0) {
					list = new ArrayList<StockPaymentAdmVo>();
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
	
	// PDA(재고현황) - 바코드 스캔
	@RequestMapping(value = "tm/locationGroupStockBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationGroupStockBarcodeList(StockPaymentAdmVo stockPaymentAdmVo, HttpSession session) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if (stockPaymentAdmVo.getBarcodeNo() != null && !stockPaymentAdmVo.getBarcodeNo().equals("")) {
				list = stockPaymentAdmService.locationGroupStockQtyList(stockPaymentAdmVo);
				if (list == null || list.size() == 0) {
					jsonData.put("result", "empty");
				} else {
					jsonData.put("data", list);
					jsonData.put("result", "ok");
				}
			} else {
				jsonData.put("result", "empty");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 재고반영 수정
	@RequestMapping(value = "tm/stockMovement", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockMovement(@RequestBody List<Map<String, Object>> stockAdjustAdmList)
			throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			// 입고할 창고, 구역, 위치
			String locationNo = stockAdjustAdmList.get(0).get("locationNo").toString();
			String locationCd = stockAdjustAdmList.get(0).get("locationCd").toString();
			
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
			List<StockPaymentAdmVo> outList = new ArrayList<StockPaymentAdmVo>();
			List<StockPaymentAdmVo> inList = new ArrayList<StockPaymentAdmVo>();
			
			for (Map<String, Object> m : stockAdjustAdmList) {
				// 수불관리 출고 시작
				StockPaymentAdmVo stockPaymentAdmOutVo = new StockPaymentAdmVo();
				stockPaymentAdmOutVo.setSpNo(spNo);
				stockPaymentAdmOutVo.setSpType(m.get("spType").toString());
				stockPaymentAdmOutVo.setSpCd(m.get("spCd").toString());
				stockPaymentAdmOutVo.setSpGubun("002");
				stockPaymentAdmOutVo.setSpSubGubun("이동출고");
				stockPaymentAdmOutVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmOutVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("spQty").toString()))));
				stockPaymentAdmOutVo.setBarcodeNo(m.get("barcodeNo").toString());
				stockPaymentAdmOutVo.setSourceNo(m.get("barcodeNo").toString());
				stockPaymentAdmOutVo.setLocationNo(m.get("outLocationNo").toString());
				stockPaymentAdmOutVo.setLocationCd(m.get("outLocationCd").toString());
				stockPaymentAdmOutVo.setRegId(Utils.getUserId());
				outList.add(stockPaymentAdmOutVo);

				// 수불관리 입고 시작
				StockPaymentAdmVo stockPaymentAdmInVo = new StockPaymentAdmVo();
				stockPaymentAdmInVo.setSpNo(spNo);
				stockPaymentAdmInVo.setSpType(m.get("spType").toString());
				stockPaymentAdmInVo.setSpCd(m.get("spCd").toString());
				stockPaymentAdmInVo.setSpGubun("001");
				stockPaymentAdmInVo.setSpSubGubun("이동입고");
				stockPaymentAdmInVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmInVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("spQty").toString()))));
				stockPaymentAdmInVo.setBarcodeNo(m.get("barcodeNo").toString());
				stockPaymentAdmInVo.setSourceNo(m.get("barcodeNo").toString());
				stockPaymentAdmInVo.setLocationNo(locationNo);
				stockPaymentAdmInVo.setLocationCd(locationCd);
				stockPaymentAdmInVo.setRegId(Utils.getUserId());
				inList.add(stockPaymentAdmInVo);
			}
			
			//이동출고 수불
			for ( int finishIdx = 0; finishIdx < outList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= outList.size()) {
					List<StockPaymentAdmVo> tempList = outList.subList(finishIdx, outList.size());
					stockPaymentAdmService.stockPaymentAdmMultiCreate(tempList);
				} else {
					List<StockPaymentAdmVo> tempList = outList.subList(finishIdx, finishIdx+50);
					stockPaymentAdmService.stockPaymentAdmMultiCreate(tempList);
				}
			}
			
			//이동입고 수불
			for ( int finishIdx = 0; finishIdx < inList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= inList.size()) {
					List<StockPaymentAdmVo> tempList = inList.subList(finishIdx, inList.size());
					stockPaymentAdmService.stockPaymentAdmMultiCreate(tempList);
				} else {
					List<StockPaymentAdmVo> tempList = inList.subList(finishIdx, finishIdx+50);
					stockPaymentAdmService.stockPaymentAdmMultiCreate(tempList);
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
	
	
	// 재고반영 수정
	@RequestMapping(value = "tm/stockMultiMovement", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> stockMultiMovement(@RequestBody List<Map<String, Object>> stockAdjustAdmList)throws Exception {
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			// 입고할 창고, 구역, 위치
			String locationNo = stockAdjustAdmList.get(0).get("locationNo").toString();
			String locationCd = stockAdjustAdmList.get(0).get("locationCd").toString();
			
			List<StockPaymentAdmVo> stockOutInsList = new ArrayList<StockPaymentAdmVo>();
			List<StockPaymentAdmVo> stockInInsList = new ArrayList<StockPaymentAdmVo>();
			
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
			int spSeq;
			
			for (Map<String, Object> m : stockAdjustAdmList) {
				stockPaymentAdmVo = new StockPaymentAdmVo();
				
				stockPaymentAdmVo.setSpNo(spNo);
				
				// 수불관리 출고 시작
				spSeq = Integer.parseInt(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpSeq(Integer.toString(spSeq));
				stockPaymentAdmVo.setSpType(m.get("spType").toString());
				stockPaymentAdmVo.setSpCd(m.get("spCd").toString());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("이동출고");
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("spQty").toString()))));
				stockPaymentAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setSourceNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setLocationNo(m.get("outLocationNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("outLocationCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockOutInsList.add(stockPaymentAdmVo);
				spSeq++;

				// 수불관리 입고 시작
				stockPaymentAdmVo.setSpSeq(Integer.toString(spSeq));
				logger.info("spSeq:"+stockPaymentAdmVo.getSpSeq());
				stockPaymentAdmVo.setSpType(m.get("spType").toString());
				stockPaymentAdmVo.setSpCd(m.get("spCd").toString());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("이동입고");
				stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
				stockPaymentAdmVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("spQty").toString()))));
				stockPaymentAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setSourceNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setLocationNo(locationNo);
				stockPaymentAdmVo.setLocationCd(locationCd);
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockInInsList.add(stockPaymentAdmVo);
				spSeq++;
			}
			
			for(int i=0; i<stockOutInsList.size(); i++) {
				stockPaymentAdmService.stockPaymentAdmMultiCreate(stockOutInsList);
			}
			for(int i=0; i<stockInInsList.size(); i++) {
				stockPaymentAdmService.stockPaymentAdmMultiCreate(stockInInsList);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 라벨 프린터용 상세보기
	@RequestMapping(value = "tm/listForLabel", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> listForLabel(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("라벨 출력 조회: " + stockPaymentAdmVo);
		try {

			StockPaymentAdmVo labelList = stockPaymentAdmService.listForLabel(stockPaymentAdmVo);
			jsonData.put("data", labelList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 수불부 현황 목록조회
	@RequestMapping(value = "tm/stockPaymentStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentStatusList(StockPaymentAdmVo stockPaymentAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수불부 현황 목록조회: " + stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentStatusList(stockPaymentAdmVo);
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
