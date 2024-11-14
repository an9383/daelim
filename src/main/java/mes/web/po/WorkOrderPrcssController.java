package mes.web.po;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.po.EqWorkHisAdmVo;
import mes.domain.po.WorkOrderFaultyTypeVo;
import mes.domain.po.WorkOrderJajuInspectVo;
import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderNonOperationVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.qm.UnfitAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.tm.StockMatrlAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemMotorService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.po.EqWorkHisAdmService;
import mes.service.po.WorkOrderFaultyTypeService;
import mes.service.po.WorkOrderJajuInspectService;
import mes.service.po.WorkOrderMatrlService;
import mes.service.po.WorkOrderNonOperationService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.po.WorkOrderService;
import mes.service.qm.UnfitAdmService;
import mes.service.sm.MatrlUserService;
import mes.service.tm.StockMatrlAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderPrcssController { 

	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	
	@Inject
	private WorkOrderService workOrderService;

	@Inject
	private WorkOrderPrcssService workOrderPrcssService;

	@Inject
	private WorkOrderMatrlService workOrderMatrlService;

	@Inject
	private WorkOrderJajuInspectService workOrderJajuInspectService;

	@Inject
	private WorkOrderNonOperationService workOrderNonOperationService;

	@Inject
	private CommonCodeAdmService commonCodeService;

	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;

	@Inject
	private OutWhsAdmService outWhsAdmService;

	@Inject
	private WorkOrderFaultyTypeService workOrderFaultyTypeService;

	@Inject
	private BaseInfoAdmService baseInfoAdmService;

	@Inject
	private ItemMotorService itemMotorService;

	@Inject
	private EquipCodeAdmService equipCodeAdmService;

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EqWorkHisAdmService eqWorkHisAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private StockMatrlAdmService stockMatrlAdmService;
	
	@Inject
	private MatrlUserService matrlUserService;

	@Inject
	private LocationAdmService locationAdmService;
	
	@Inject
	private UnfitAdmService unfitAdmService;

	@Value("${file.itemStandardPath}")
	private String file_Item_Standard_Path;

	private static final Logger logger = LoggerFactory.getLogger(WorkOrderPrcssController.class);

	
	// 생산실적관리(사출) 메인
	@RequestMapping(value = "/posc0020", method = RequestMethod.GET)
		public String posc0020(Locale locale, Model model) throws Exception {

		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		prcssCodeAdmVo.setPrcssType("002");
		List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);

		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("prcssMidList", prcssCodeAdmList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");

		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		logger.info(baseInfoAdmList.toString());
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();

		commonCodeVo.setBaseGroupCd("060"); // 사용여부
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prcssCd", poscCd);
		
		commonCodeVo.setBaseGroupCd("113"); // 작업방식
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workMethod", poscCd);
		
		commonCodeVo.setBaseGroupCd("114"); // 작업구분
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workGubun", poscCd);
		
		commonCodeVo.setBaseGroupCd("115"); // 비가동구분
		commonCodeVo.setUseYn("001");
		poscCd = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("noGubun", poscCd);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("091"); // 품목구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> itemGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("060"); // 긴급여부
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> workEmerYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("workEmerYn", workEmerYnList);
		
		commonCodeVo.setBaseGroupCd("118"); // 검사취출
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> inspectGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectGubun", inspectGubunList);
		
		commonCodeVo.setBaseGroupCd("121"); // 작업조건차수
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> histSeqList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("histSeq", histSeqList);
		
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		commonCodeVo.setBaseGroupCd("140"); // 퍼징구분
		List<CommonCodeAdmVo> fuzzGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("fuzzGubun", fuzzGubunList);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		return "po/posc0020";
	}
	
	
	//생산실적(봉제)_new 메인
	@RequestMapping(value = "/wmsc0270", method = RequestMethod.GET)
	public String wmsc0270(Locale locale, Model model, HttpServletRequest request) throws Exception {
		logger.info("생산실적(봉제) 메인");
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
			
			model.addAttribute("userNm", Utils.getUserNm());	
			model.addAttribute("userNumber", Utils.getUserNumber());
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("060"); // 긴급여부
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> workEmerYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("workEmerYn", workEmerYnList);
			
			commonCodeVo.setBaseGroupCd("114"); // 작업구분
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> workGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("workGubun", workGubunList);
			
			commonCodeVo.setBaseGroupCd("091"); // 품목구분
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> itemGubunList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemGubunList);
			
			commonCodeVo.setBaseGroupCd("118"); // 검사취출
			commonCodeVo.setUseYn("001"); 
			List<CommonCodeAdmVo> inspectGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectGubun", inspectGubunList);
			
			commonCodeVo.setBaseGroupCd("072"); // 판정
			List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("judge", judgeList);
			
			commonCodeVo.setBaseGroupCd("128"); // 실행여부
			List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("silhang", silhangList);
			
			MatrlUserVo matrlUserVo = new MatrlUserVo();
			matrlUserVo.setDepartmentCd("007"); // 부서가 생산인 사람만
			matrlUserVo.setEmpCd("001"); //근무중인 사람만
			List<MatrlUserVo> userList = matrlUserService.listAll(matrlUserVo);
			model.addAttribute("userList", userList);
			
			PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
			prcssCodeAdmVo.setUserNumber(Utils.getUserNumber());
			prcssCodeAdmVo.setPrcssGubun("002");
			List<PrcssCodeAdmVo> prcssWorkerAdmList = prcssCodeAdmService.prcssWorkerAdmList(prcssCodeAdmVo);
			model.addAttribute("prcssCdVal", prcssWorkerAdmList.size() > 0 ? prcssWorkerAdmList.get(0).getPrcssCd() : "");
			
			PrcssCodeAdmVo prcssCodeAdmVo2 = new PrcssCodeAdmVo();
			prcssCodeAdmVo2.setPrcssType("001");
			prcssCodeAdmVo2.setMainGubun("002");
			List<PrcssCodeAdmVo> prcssList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo2);
			model.addAttribute("prcssList", prcssList);
			
			BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo(); //불량유형
			baseInfoAdmVo.setBaseInfoType("FT");
			baseInfoAdmVo.setEtc1("002");
			baseInfoAdmVo.setBaseInfoGubun("003");
			List<BaseInfoAdmVo> faultyTypeList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
			model.addAttribute("faultyTypeList", faultyTypeList);
			
			//승인관리
			String menuUrl = "";
			String requestURI = request.getRequestURI();
			menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
			model.addAttribute("menuUrl", menuUrl);
			model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0270";
	}
	
	// 생산실적(봉제)
	@RequestMapping(value = "/posc0050", method = RequestMethod.GET)
	public String posc0050(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		return "po/posc0050";
	}
	

	// 생산실적등록 목록 조회(사출)
	@RequestMapping(value = "/po/workOrderPrcssList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회(사출): " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = workOrderPrcssService.workOrderPrcssList(workOrderPrcssVo);
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 생산실적등록 목록 조회(봉제)
	@RequestMapping(value = "/po/workOrderPrcssListByBongjea", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssListByBongjea(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회(봉제): " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
			if ( workOrderPrcssVo.getMiddlePrcssCd() != null && !workOrderPrcssVo.getMiddlePrcssCd().equals("") ) {
				workOrderPrcssList = workOrderPrcssService.workOrderPrcssListByBongjea(workOrderPrcssVo);
			}
			jsonData.put("data", workOrderPrcssList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 초/중/종물 공정검사 유무
	@RequestMapping(value = "/po/workOrdInspectYnList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdInspectYnList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
		try {
			WorkOrderPrcssVo vo = workOrderPrcssService.workOrdInspectYnList(workOrderPrcssVo);
			
			if(vo!=null) {
				if(vo.getMdInspectYn()==null || vo.getMdInspectYn().equals("001")) {
					if(vo.getApprovalCho().equals("OK") && vo.getApprovalJung().equals("OK") && vo.getApprovalJong().equals("OK")) {
						jsonData.put("result", "ok");
					}else {
						jsonData.put("result", "fail");
					}
				}else {
					if(vo.getApprovalCho().equals("OK") && vo.getApprovalJong().equals("OK")) {
						jsonData.put("result", "ok");
					}else {
						jsonData.put("result", "fail");
					}
				}
			}else {
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 초/중/종물 공정검사 유무
	@RequestMapping(value = "/po/workOrdInspectDone", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdInspectDone(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산실적등록 목록조회: " + workOrderPrcssVo);
		try {
			//초/중/종물 생산실적등록유무
			if(workOrderPrcssService.workOrdInspectDone(workOrderPrcssVo)>0) {
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 중공정 목록조회
	@RequestMapping(value = "/po/workOrderMiddlePrcssList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderMiddlePrcssList(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("중공정 목록조회: " + workOrderVo);
		try {
			List<WorkOrderVo> workOrderDataList = workOrderService.readMiddlePrcss(workOrderVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 소공정 공정별 설비목록조회
	@RequestMapping(value = "/po/prcssToEquipList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssToEquipList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("소공정 공정별 설비목록조회: " + prcssCodeAdmVo);
		try {
			prcssCodeAdmVo = prcssCodeAdmService.prcssToEquipList(prcssCodeAdmVo);
			jsonData.put("data", prcssCodeAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	

	//작지 등록처리(사출)
	@RequestMapping(value = "/po/workOrdAdd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAdd(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리(사출): " + workOrderPrcssVo);
		try {
			int workOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
			workOrderPrcssVo.setWorkOrdSeq(workOrdSeq);
			workOrderPrcssVo.setMiddlePrcssCd("");
			workOrderPrcssVo.setMinorPrcssCd("");
			workOrderPrcssVo.setOrdLotNo(getOrdLotNo(workOrderPrcssVo));
			workOrderPrcssVo.setRegId(Utils.getUserId());
			workOrderPrcssService.create(workOrderPrcssVo);
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderVo.setUpdId(Utils.getUserNumber());
			workOrderService.update(workOrderVo);
			
			if(workOrderPrcssVo.getWorkStatus().equals("003")) { 
				WorkOrderPrcssVo vo = new WorkOrderPrcssVo(); 
				vo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				vo.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
				vo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				vo.setUpdId(Utils.getUserId()); 
				workOrderPrcssService.update(vo); 
			}
			 
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQtyVal", outputQty);
			jsonData.put("fairQtyVal", fairQty);
			
			jsonData.put("count", 0);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 작지 등록처리(봉제)
	@RequestMapping(value = "/po/workOrdAddByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAddByBongjae(WorkOrderPrcssVo workOrderPrcssVo,WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리 시작(po/workOrdAddByBongjae): " + workOrderPrcssVo);
		try {
			String locCd = workOrderPrcssVo.getLocCd();			//공정창고코드
			String locNo = workOrderPrcssVo.getLocationNo(); 	//공정창고번호
			
			String inLocCd = workOrderPrcssVo.getInLoc();		//품목정보 등록창고코드
			String inLocNo = workOrderPrcssVo.getInLocNo();		//품목정보 등록창고번호
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.update(workOrderVo);
			
			//작업지시 등록 시작<============================================================= 
			int boxCount = Integer.parseInt(workOrderPrcssVo.getBoxCount());
			int outputQty = Integer.parseInt(workOrderPrcssVo.getOutputQty());
			int fairQty = Integer.parseInt(workOrderPrcssVo.getFairQty());
			int faultyQty = Integer.parseInt(workOrderPrcssVo.getFaultyQty());
			int quot = 0;
			 
			quot = fairQty / boxCount;
			if (fairQty % boxCount != 0) {
				quot += 1;
			}
			
			List<WorkOrderPrcssVo> workOrderPrcssInsList = new ArrayList<WorkOrderPrcssVo>();			//양/불 LOT	
			List<WorkOrderPrcssVo> workOrderPrcssInsFairList = new ArrayList<WorkOrderPrcssVo>();		//양품LOT	
			
			int ordLotSeq = 0; //OrdLotNo 생성 변수
			String ordLotNoString = ""; //OrdLotNo 생성 변수
			int workOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
			for (int i = 0; i < quot; i++) {
				WorkOrderPrcssVo workOrderPrcssInsVo = new WorkOrderPrcssVo();
				workOrderPrcssInsVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				workOrderPrcssInsVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
				workOrderPrcssInsVo.setMinorPrcssCd(workOrderPrcssVo.getMinorPrcssCd());
				workOrderPrcssInsVo.setWorkOrdSeq(workOrdSeq);
				workOrderPrcssInsVo.setWorkStatus("002");
				workOrderPrcssInsVo.setItemSeq(workOrderPrcssVo.getItemSeq());
				workOrderPrcssInsVo.setItemGubun(workOrderPrcssVo.getItemGubun());
				workOrderPrcssInsVo.setOrdDate(workOrderPrcssVo.getOrdDate());
				workOrderPrcssInsVo.setWorkChargr(workOrderPrcssVo.getWorkChargr());
				workOrderPrcssInsVo.setTargetQty(workOrderPrcssVo.getTargetQty());
				workOrderPrcssInsVo.setWorkChargrNm(workOrderPrcssVo.getWorkChargrNm());
				workOrderPrcssInsVo.setItemCusNm(workOrderPrcssVo.getItemCusNm());
				if (fairQty >= boxCount) {
					workOrderPrcssInsVo.setFairQty(Integer.toString(boxCount));
					workOrderPrcssInsVo.setOutputQty(Integer.toString(boxCount));
					fairQty -= boxCount;
				} else {
					workOrderPrcssInsVo.setFairQty(Integer.toString(fairQty));
					workOrderPrcssInsVo.setOutputQty(Integer.toString(fairQty));
					fairQty = 0;
				}
				workOrderPrcssInsVo.setFaultyQty("0");
				workOrderPrcssInsVo.setEtcQty(workOrderPrcssVo.getEtcQty());
				workOrderPrcssInsVo.setOutQty(workOrderPrcssVo.getOutQty());
				workOrderPrcssInsVo.setRemainQty(workOrderPrcssVo.getRemainQty());
				workOrderPrcssInsVo.setPackYn(workOrderPrcssVo.getPackYn());
				workOrderPrcssInsVo.setLabelPrintYn(workOrderPrcssVo.getLabelPrintYn());
				workOrderPrcssInsVo.setWorkStartTime(workOrderPrcssVo.getWorkStartTime());
				workOrderPrcssInsVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				workOrderPrcssInsVo.setInLoc(locCd);
				workOrderPrcssInsVo.setLocationNo(locNo);
				workOrderPrcssInsVo.setOrdLotNoDate(workOrderPrcssVo.getOrdLotNoDate());
				workOrderPrcssInsVo.setItemUnitNm(workOrderPrcssVo.getItemUnit());
				workOrderPrcssInsVo.setRegId(Utils.getUserNumber());
				
				workOrderPrcssInsList.add(workOrderPrcssInsVo);
				
				//OrdLotNo 생성
				if (i == 0) {
					ordLotNoString = getOrdLotNoListByBongjae(workOrderPrcssInsVo);
					WorkOrderPrcssVo workOrderPrcssTempVo = new WorkOrderPrcssVo();
					workOrderPrcssTempVo.setOrdLotNo(ordLotNoString);
					ordLotSeq = Integer.parseInt(workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssTempVo));
				} else { ordLotSeq++; }
				String ordLotNo = ordLotNoString + String.format("%04d", ordLotSeq);
				workOrderPrcssInsVo.setOrdLotNo(ordLotNo);
				workOrderPrcssInsFairList.add(workOrderPrcssInsVo);
				
				workOrdSeq++;
			}
			
			for ( int finishIdx = 0; finishIdx < workOrderPrcssInsFairList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= workOrderPrcssInsFairList.size()) {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsFairList.subList(finishIdx, workOrderPrcssInsFairList.size());
					workOrderPrcssService.createList(tempList);
					logger.info("실적등록 데이터(TB_WORK_ORDER_PRCSS) 등록 " + finishIdx+ ": " + tempList);
				} else {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsFairList.subList(finishIdx, finishIdx+50);
					workOrderPrcssService.createList(tempList);
					logger.info("실적등록 데이터(TB_WORK_ORDER_PRCSS) 등록 " + finishIdx+ ": " + tempList);
				}
			}
			
			//불량 LOT 생성
			int faultyWorkOrdSeq = 0; //불량등록 시 필요함
			if ( faultyQty != 0 ) {
				WorkOrderPrcssVo workOrderPrcssInsFaultyVo = new WorkOrderPrcssVo();
				workOrderPrcssInsFaultyVo = new WorkOrderPrcssVo();
				workOrderPrcssInsFaultyVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				workOrderPrcssInsFaultyVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
				workOrderPrcssInsFaultyVo.setMinorPrcssCd(workOrderPrcssVo.getMinorPrcssCd());
				faultyWorkOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
				workOrderPrcssInsFaultyVo.setWorkOrdSeq(faultyWorkOrdSeq);
				workOrderPrcssInsFaultyVo.setWorkStatus("003");
				workOrderPrcssInsFaultyVo.setItemSeq(workOrderPrcssVo.getItemSeq());
				workOrderPrcssInsFaultyVo.setItemGubun(workOrderPrcssVo.getItemGubun());
				workOrderPrcssInsFaultyVo.setOrdDate(workOrderPrcssVo.getOrdDate());
				workOrderPrcssInsFaultyVo.setWorkChargr(workOrderPrcssVo.getWorkChargr());
				workOrderPrcssInsFaultyVo.setTargetQty(workOrderPrcssVo.getTargetQty());
				workOrderPrcssInsFaultyVo.setWorkChargrNm(workOrderPrcssVo.getWorkChargrNm());
				workOrderPrcssInsFaultyVo.setItemCusNm(workOrderPrcssVo.getItemCusNm());
				workOrderPrcssInsFaultyVo.setFairQty("0");
				workOrderPrcssInsFaultyVo.setOutputQty(Integer.toString(faultyQty));
				workOrderPrcssInsFaultyVo.setFaultyQty(Integer.toString(faultyQty));
				workOrderPrcssInsFaultyVo.setEtcQty(workOrderPrcssVo.getEtcQty());
				workOrderPrcssInsFaultyVo.setOutQty(workOrderPrcssVo.getOutQty());
				workOrderPrcssInsFaultyVo.setRemainQty(workOrderPrcssVo.getRemainQty());
				workOrderPrcssInsFaultyVo.setPackYn(workOrderPrcssVo.getPackYn());
				workOrderPrcssInsFaultyVo.setLabelPrintYn(workOrderPrcssVo.getLabelPrintYn());
				workOrderPrcssInsFaultyVo.setWorkStartTime("");
				workOrderPrcssInsFaultyVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				workOrderPrcssInsFaultyVo.setInLoc(locCd);
				workOrderPrcssInsFaultyVo.setLocationNo(locNo);
				workOrderPrcssInsFaultyVo.setOrdLotNoDate(workOrderPrcssVo.getOrdLotNoDate());
				workOrderPrcssInsFaultyVo.setItemUnitNm(workOrderPrcssVo.getItemUnit());
				workOrderPrcssInsFaultyVo.setRegId(Utils.getUserNumber());
				
				ordLotNoString = getOrdLotNoListByBongjae(workOrderPrcssInsFaultyVo);
				WorkOrderPrcssVo workOrderPrcssTempVo = new WorkOrderPrcssVo();
				workOrderPrcssTempVo.setOrdLotNo(ordLotNoString);
				ordLotSeq = Integer.parseInt(workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssTempVo));
				String ordLotNo = ordLotNoString + String.format("%04d", ordLotSeq);
				workOrderPrcssInsFaultyVo.setOrdLotNo(ordLotNo);
				
				workOrderPrcssService.create(workOrderPrcssInsFaultyVo);
				workOrderPrcssInsList.add(workOrderPrcssInsFaultyVo);
				logger.info("불량 LOT 생성: " + workOrderPrcssInsFaultyVo);
			}
			
			//=============================================================>작업지시 등록 끝
			//제품 입고 수불 시작=============================================================>
			List<ItemWhsAdmVo> itemWhsAdmCreateList = new ArrayList<ItemWhsAdmVo>();
			List<StockPaymentAdmVo> stockPaymentAdmList = new ArrayList<StockPaymentAdmVo>();
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
			for (int j = 0; j < workOrderPrcssInsFairList.size(); j++) {
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssInsFairList.get(j).getOrdLotNo());
				itemWhsAdmVo.setItemSeq(workOrderPrcssInsFairList.get(j).getItemSeq());
				itemWhsAdmVo.setWorkOrdNo(workOrderPrcssInsFairList.get(j).getWorkOrdNo());
				itemWhsAdmVo.setInDate(workOrderPrcssInsFairList.get(j).getOrdLotNoDate());
				itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssInsFairList.get(j).getFairQty()));
				itemWhsAdmVo.setInLoc(inLocCd);
				itemWhsAdmVo.setLocationNo(inLocNo);
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				
				itemWhsAdmCreateList.add(itemWhsAdmVo);
				
				//수불테이블 Create
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpType(workOrderPrcssInsFairList.get(j).getItemGubun());
				stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
				stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
				stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(inLocCd);
				stockPaymentAdmVo.setLocationNo(inLocNo);
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmList.add(stockPaymentAdmVo);
			}
			for ( int finishIdx = 0; finishIdx < itemWhsAdmCreateList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= itemWhsAdmCreateList.size()) {
					List<ItemWhsAdmVo> tempList = itemWhsAdmCreateList.subList(finishIdx, itemWhsAdmCreateList.size());
					itemWhsAdmService.itemWhsAdmListCreate(tempList);
					logger.info("제품 입출고관리 데이터(TB_ITEM_WHS_ADM) 등록" + finishIdx+ ": " + tempList);
				} else {
					List<ItemWhsAdmVo> tempList = itemWhsAdmCreateList.subList(finishIdx, finishIdx+50);
					itemWhsAdmService.itemWhsAdmListCreate(tempList);
					logger.info("제품 입출고관리 데이터(TB_ITEM_WHS_ADM) 등록" + finishIdx+ ": " + tempList);
				}
			}
			for ( int finishIdx = 0; finishIdx < stockPaymentAdmList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= stockPaymentAdmList.size()) {
					List<StockPaymentAdmVo> tempList = stockPaymentAdmList.subList(finishIdx, stockPaymentAdmList.size());
					stockPaymentAdmService.stockPaymentAdmListCreate(tempList);
					logger.info("제품 입고 수불데이터 등록" + finishIdx+ ": " + tempList);
				} else {
					List<StockPaymentAdmVo> tempList = stockPaymentAdmList.subList(finishIdx, finishIdx+50);
					stockPaymentAdmService.stockPaymentAdmListCreate(tempList);
					logger.info("제품 입고 수불데이터 등록" + finishIdx+ ": " + tempList);
				}
			}
			
			//BOM 목록조회
			ItemPartAdmVo bomVo = new ItemPartAdmVo();
			bomVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
			bomVo.setItemLvlEqual("0");
			List<ItemPartAdmVo> bomList = itemPartAdmService.itemMotorEbomList(bomVo);	//bom리스트
			
			if ( bomList.size() > 0 ) {
				//등록시간 단축중인 코드; 매퍼에서 한번에 실행
				for ( int finishIdx = 0; finishIdx < workOrderPrcssInsList.size(); finishIdx+=50 ) {
					if ( finishIdx+50 >= workOrderPrcssInsList.size()) {
						List<WorkOrderPrcssVo> tempList = workOrderPrcssInsList.subList(finishIdx, workOrderPrcssInsList.size());
						int returnCheck = workOrderPrcssService.matrlStockPaymentCreate(tempList);
						if (returnCheck > 0) logger.info("자재 입고 수불데이터 등록 " + finishIdx+ ": " + tempList);
					} else {
						List<WorkOrderPrcssVo> tempList = workOrderPrcssInsList.subList(finishIdx, finishIdx+50);
						int returnCheck = workOrderPrcssService.matrlStockPaymentCreate(tempList);
						if (returnCheck > 0) logger.info("자재 입고 수불데이터 등록 " + finishIdx+ ": " + tempList);
					}
				}
				
				//원본 코드
//				String spNo2 = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
//				List<WorkOrderMatrlVo> WorkOrderMatrlUpdateList = new ArrayList<WorkOrderMatrlVo>();
//				for (int k = 0; k < workOrderPrcssInsList.size(); k++) {
//					for ( int j = 0; j < bomList.size(); j++ ) {
//						float totalSanSangQty = Float.parseFloat(workOrderPrcssInsList.get(k).getOutputQty()); //생산량
//						float consumpt = Float.parseFloat(bomList.get(j).getItemConsumpt()); //소요량
//						float remainQty = ( totalSanSangQty * consumpt );	//생산량 * 소요량
						
//						while ( remainQty > 0 ) {
//							WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
//							workOrderMatrlUpdVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
//							workOrderMatrlUpdVo.setWorkProgNo(workOrderMatrlVo.getWorkProgNo());
//							workOrderMatrlUpdVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
//							workOrderMatrlUpdVo.setOrdLotNo(workOrderPrcssInsList.get(k).getOrdLotNo());
//							workOrderMatrlUpdVo.setLocationCd(locCd);
//							workOrderMatrlUpdVo.setItemSeq(bomList.get(j).getItemSeq());
							
//							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoListByBongjae(workOrderMatrlUpdVo);	//자재투입 데이터
//							logger.info("자재투입 데이터 조회: " + vo);
//							if ( vo == null ) {
//								jsonData.put("result", "lack");
//								jsonData.put("message", "자재가 부족합니다.");
//								logger.info("자재부족!!!-> 사실 여기로 들어오면 오류임!");
//								break;
//							}
							
//							float totalMatrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
							
//							StockPaymentAdmVo stockPaymentAdmVo2 = new StockPaymentAdmVo();
//							stockPaymentAdmVo2.setSpNo(spNo2);
//							stockPaymentAdmVo2.setSpType(vo.getItemGubun());
//							stockPaymentAdmVo2.setSpCd(vo.getItemSeq());
//							stockPaymentAdmVo2.setSpGubun("002");
//							stockPaymentAdmVo2.setSpSubGubun("자재투입");
//							stockPaymentAdmVo2.setSpDate(DateUtil.getToday("yyyymmdd"));
//							stockPaymentAdmVo2.setBarcodeNo(vo.getBarcodeNo());
//							stockPaymentAdmVo2.setSourceNo(workOrderPrcssInsList.get(k).getOrdLotNo());
//							stockPaymentAdmVo2.setLocationCd(locCd);
//							stockPaymentAdmVo2.setLocationNo(locNo);
//							stockPaymentAdmVo2.setRegId(Utils.getUserId());
							
							//투입보다 생산량이 많을 경우  
//							if ( totalMatrlQty < remainQty ) {
//								stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
//								stockPaymentAdmService.stockPaymentAdmSeqCreate(stockPaymentAdmVo2);
//								logger.info("자재 입고 수불데이터 등록: " + stockPaymentAdmVo2);
//								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
//								remainQty = remainQty - totalMatrlQty;
//							} else {
//								stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(remainQty)));
//								stockPaymentAdmService.stockPaymentAdmSeqCreate(stockPaymentAdmVo2);
//								logger.info("자재 입고 수불데이터 등록: " + stockPaymentAdmVo2);
//								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(remainQty)));
//								remainQty = 0;
//							}
							
//							workOrderMatrlUpdVo.setBarcodeNo(vo.getBarcodeNo());
//							
//							WorkOrderMatrlVo weWorkVo = new WorkOrderMatrlVo();
//							weWorkVo.setBarcodeNo(vo.getBarcodeNo());
//							weWorkVo.setWorkStatus("WE");
//							List<WorkOrderMatrlVo> workOrdMatrlProgressList = workOrderMatrlService.workOrdMatrlProgressList(weWorkVo);
//							if ( workOrdMatrlProgressList.size() > 1 ) {
//								for ( int i = 0; i < workOrdMatrlProgressList.size(); i++ ) {
//									workOrderMatrlUpdVo.setWorkOrdNo(workOrdMatrlProgressList.get(i).getWorkOrdNo());
//									workOrderMatrlUpdVo.setWorkProgNo(workOrdMatrlProgressList.get(i).getWorkProgNo());
//									workOrderMatrlUpdVo.setMiddlePrcssCd(workOrdMatrlProgressList.get(i).getMiddlePrcssCd());
//									workOrderMatrlUpdVo.setBarcodeNo(workOrdMatrlProgressList.get(i).getBarcodeNo());
//									WorkOrderMatrlUpdateList.add(workOrderMatrlUpdVo);
//								}
//							} else {
//								WorkOrderMatrlUpdateList.add(workOrderMatrlUpdVo);
//							}
//							jsonData.put("result", "ok");
//						}
//					}
//				}
				//너무 많아지면 변수가 너무 많아 진행못하기에 쪼개야함 현재 50개마다 쪼갬
//				for ( int finishIdx = 0; finishIdx < WorkOrderMatrlUpdateList.size(); finishIdx+=50 ) {
//					if ( finishIdx+50 >= WorkOrderMatrlUpdateList.size()) {
//						List<WorkOrderMatrlVo> tempList = WorkOrderMatrlUpdateList.subList(finishIdx, WorkOrderMatrlUpdateList.size());
//						workOrderMatrlService.workOrdMatrlListEdit(tempList);
//					} else {
//						List<WorkOrderMatrlVo> tempList = WorkOrderMatrlUpdateList.subList(finishIdx, finishIdx+50);
//						workOrderMatrlService.workOrdMatrlListEdit(tempList);	
//					}
//				}
			}

			jsonData.put("workOrderPrcssInsList", workOrderPrcssInsList);
			jsonData.put("workOrdSeq", Integer.toString(faultyWorkOrdSeq)); //불량등록 시 필요함
			jsonData.put("result", "ok");
			logger.info("작지 등록처리 끝(po/workOrdAddByBongjae)");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	
	// 작지 등록처리(봉제)
	@RequestMapping(value = "/po/workOrdAddByBongjae2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAddByBongjae2(WorkOrderPrcssVo workOrderPrcssVo,WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리 시작(po/workOrdAddByBongjae): " + workOrderPrcssVo);
		try {
			String locCd = workOrderPrcssVo.getLocCd();			//공정창고코드
			String locNo = workOrderPrcssVo.getLocationNo(); 	//공정창고번호
			
			String inLocCd = workOrderPrcssVo.getInLoc();		//품목정보 등록창고코드
			String inLocNo = workOrderPrcssVo.getInLocNo();		//품목정보 등록창고번호
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();  
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.update(workOrderVo);
			
			//작업지시 등록 시작<============================================================= 
			int boxCount = Integer.parseInt(workOrderPrcssVo.getBoxCount());
			int outputQty = Integer.parseInt(workOrderPrcssVo.getOutputQty());
			int fairQty = Integer.parseInt(workOrderPrcssVo.getFairQty());
			int faultyQty = Integer.parseInt(workOrderPrcssVo.getFaultyQty());
			int quot = 0;
			 
			quot = fairQty / boxCount;
			if (fairQty % boxCount != 0) {
				quot += 1;
			}
			
			List<WorkOrderPrcssVo> workOrderPrcssInsList = new ArrayList<WorkOrderPrcssVo>();			//양/불 LOT	
			List<WorkOrderPrcssVo> workOrderPrcssInsFairList = new ArrayList<WorkOrderPrcssVo>();		//양품LOT	
			
			int ordLotSeq = 0; //OrdLotNo 생성 변수
			String ordLotNoString = ""; //OrdLotNo 생성 변수
			int workOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
			for (int i = 0; i < quot; i++) {
				WorkOrderPrcssVo workOrderPrcssInsVo = new WorkOrderPrcssVo();
				workOrderPrcssInsVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				workOrderPrcssInsVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
				workOrderPrcssInsVo.setMinorPrcssCd(workOrderPrcssVo.getMinorPrcssCd());
				workOrderPrcssInsVo.setWorkOrdSeq(workOrdSeq);
				workOrderPrcssInsVo.setWorkStatus("002");
				workOrderPrcssInsVo.setItemSeq(workOrderPrcssVo.getItemSeq());
				workOrderPrcssInsVo.setItemGubun(workOrderPrcssVo.getItemGubun());
				workOrderPrcssInsVo.setOrdDate(workOrderPrcssVo.getOrdDate());
				workOrderPrcssInsVo.setWorkChargr(workOrderPrcssVo.getWorkChargr());
				workOrderPrcssInsVo.setTargetQty(workOrderPrcssVo.getTargetQty());
				workOrderPrcssInsVo.setWorkChargrNm(workOrderPrcssVo.getWorkChargrNm());
				workOrderPrcssInsVo.setItemCusNm(workOrderPrcssVo.getItemCusNm());
				if (fairQty >= boxCount) {
					workOrderPrcssInsVo.setFairQty(Integer.toString(boxCount));
					workOrderPrcssInsVo.setOutputQty(Integer.toString(boxCount));
					fairQty -= boxCount;
				} else {
					workOrderPrcssInsVo.setFairQty(Integer.toString(fairQty));
					workOrderPrcssInsVo.setOutputQty(Integer.toString(fairQty));
					fairQty = 0;
				}
				workOrderPrcssInsVo.setFaultyQty("0");
				workOrderPrcssInsVo.setEtcQty(workOrderPrcssVo.getEtcQty());
				workOrderPrcssInsVo.setOutQty(workOrderPrcssVo.getOutQty());
				workOrderPrcssInsVo.setRemainQty(workOrderPrcssVo.getRemainQty());
				workOrderPrcssInsVo.setPackYn(workOrderPrcssVo.getPackYn());
				workOrderPrcssInsVo.setLabelPrintYn(workOrderPrcssVo.getLabelPrintYn());
				workOrderPrcssInsVo.setWorkStartTime(workOrderPrcssVo.getWorkStartTime());
				workOrderPrcssInsVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				workOrderPrcssInsVo.setInLoc(locCd);
				workOrderPrcssInsVo.setLocationNo(locNo);
				workOrderPrcssInsVo.setOrdLotNoDate(workOrderPrcssVo.getOrdLotNoDate());
				workOrderPrcssInsVo.setItemUnitNm(workOrderPrcssVo.getItemUnit());
				workOrderPrcssInsVo.setRegId(Utils.getUserNumber());
				
				workOrderPrcssInsVo.setUseQty(workOrderPrcssVo.getOutputQty());
				workOrderPrcssInsList.add(workOrderPrcssInsVo);
				
				//OrdLotNo 생성
				if (i == 0) {
					ordLotNoString = getOrdLotNoListByBongjae(workOrderPrcssInsVo);
					WorkOrderPrcssVo workOrderPrcssTempVo = new WorkOrderPrcssVo();
					workOrderPrcssTempVo.setOrdLotNo(ordLotNoString);
					ordLotSeq = Integer.parseInt(workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssTempVo));
				} else { ordLotSeq++; }
				String ordLotNo = ordLotNoString + String.format("%04d", ordLotSeq);
				workOrderPrcssInsVo.setOrdLotNo(ordLotNo);
				workOrderPrcssInsFairList.add(workOrderPrcssInsVo);
				
				workOrdSeq++;
			}
			
			for ( int finishIdx = 0; finishIdx < workOrderPrcssInsFairList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= workOrderPrcssInsFairList.size()) {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsFairList.subList(finishIdx, workOrderPrcssInsFairList.size());
					workOrderPrcssService.createList(tempList);
					//logger.info("실적등록 데이터(TB_WORK_ORDER_PRCSS) 등록 " + finishIdx+ ": " + tempList);
				} else {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsFairList.subList(finishIdx, finishIdx+50);
					workOrderPrcssService.createList(tempList);
					//logger.info("실적등록 데이터(TB_WORK_ORDER_PRCSS) 등록 " + finishIdx+ ": " + tempList);
				}
			}
			
			//불량 LOT 생성
			int faultyWorkOrdSeq = 0; //불량등록 시 필요함
			if ( faultyQty != 0 ) {
				WorkOrderPrcssVo workOrderPrcssInsFaultyVo = new WorkOrderPrcssVo();
				workOrderPrcssInsFaultyVo = new WorkOrderPrcssVo();
				workOrderPrcssInsFaultyVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				workOrderPrcssInsFaultyVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
				workOrderPrcssInsFaultyVo.setMinorPrcssCd(workOrderPrcssVo.getMinorPrcssCd());
				faultyWorkOrdSeq = workOrderPrcssService.getWorkOrdSeq(workOrderPrcssVo);
				workOrderPrcssInsFaultyVo.setWorkOrdSeq(faultyWorkOrdSeq);
				workOrderPrcssInsFaultyVo.setWorkStatus("003");
				workOrderPrcssInsFaultyVo.setItemSeq(workOrderPrcssVo.getItemSeq());
				workOrderPrcssInsFaultyVo.setItemGubun(workOrderPrcssVo.getItemGubun());
				workOrderPrcssInsFaultyVo.setOrdDate(workOrderPrcssVo.getOrdDate());
				workOrderPrcssInsFaultyVo.setWorkChargr(workOrderPrcssVo.getWorkChargr());
				workOrderPrcssInsFaultyVo.setTargetQty(workOrderPrcssVo.getTargetQty());
				workOrderPrcssInsFaultyVo.setWorkChargrNm(workOrderPrcssVo.getWorkChargrNm());
				workOrderPrcssInsFaultyVo.setItemCusNm(workOrderPrcssVo.getItemCusNm());
				workOrderPrcssInsFaultyVo.setFairQty("0");
				workOrderPrcssInsFaultyVo.setOutputQty(Integer.toString(faultyQty));
				workOrderPrcssInsFaultyVo.setFaultyQty(Integer.toString(faultyQty));
				workOrderPrcssInsFaultyVo.setEtcQty(workOrderPrcssVo.getEtcQty());
				workOrderPrcssInsFaultyVo.setOutQty(workOrderPrcssVo.getOutQty());
				workOrderPrcssInsFaultyVo.setRemainQty(workOrderPrcssVo.getRemainQty());
				workOrderPrcssInsFaultyVo.setPackYn(workOrderPrcssVo.getPackYn());
				workOrderPrcssInsFaultyVo.setLabelPrintYn(workOrderPrcssVo.getLabelPrintYn());
				workOrderPrcssInsFaultyVo.setWorkStartTime("");
				workOrderPrcssInsFaultyVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
				workOrderPrcssInsFaultyVo.setInLoc(locCd);
				workOrderPrcssInsFaultyVo.setLocationNo(locNo);
				workOrderPrcssInsFaultyVo.setOrdLotNoDate(workOrderPrcssVo.getOrdLotNoDate());
				workOrderPrcssInsFaultyVo.setItemUnitNm(workOrderPrcssVo.getItemUnit());
				workOrderPrcssInsFaultyVo.setRegId(Utils.getUserNumber());
				workOrderPrcssInsFaultyVo.setUseQty(workOrderPrcssVo.getOutputQty());
				ordLotNoString = getOrdLotNoListByBongjae(workOrderPrcssInsFaultyVo);
				WorkOrderPrcssVo workOrderPrcssTempVo = new WorkOrderPrcssVo();
				workOrderPrcssTempVo.setOrdLotNo(ordLotNoString);
				ordLotSeq = Integer.parseInt(workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssTempVo));
				String ordLotNo = ordLotNoString + String.format("%04d", ordLotSeq);
				workOrderPrcssInsFaultyVo.setOrdLotNo(ordLotNo);
				
				workOrderPrcssService.create(workOrderPrcssInsFaultyVo);
				workOrderPrcssInsList.add(workOrderPrcssInsFaultyVo);
				//logger.info("불량 LOT 생성: " + workOrderPrcssInsFaultyVo);
			}
			
			//=============================================================>작업지시 등록 끝
			//제품 입고 수불 시작=============================================================>
			List<ItemWhsAdmVo> itemWhsAdmCreateList = new ArrayList<ItemWhsAdmVo>();
			List<StockPaymentAdmVo> stockPaymentAdmList = new ArrayList<StockPaymentAdmVo>();
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
			for (int j = 0; j < workOrderPrcssInsFairList.size(); j++) {
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssInsFairList.get(j).getOrdLotNo());
				itemWhsAdmVo.setItemSeq(workOrderPrcssInsFairList.get(j).getItemSeq());
				itemWhsAdmVo.setWorkOrdNo(workOrderPrcssInsFairList.get(j).getWorkOrdNo());
				itemWhsAdmVo.setInDate(workOrderPrcssInsFairList.get(j).getOrdLotNoDate());
				itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssInsFairList.get(j).getFairQty()));
				itemWhsAdmVo.setInLoc(inLocCd);
				itemWhsAdmVo.setLocationNo(inLocNo);
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				
				itemWhsAdmCreateList.add(itemWhsAdmVo);
				
				//수불테이블 Create
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpType(workOrderPrcssInsFairList.get(j).getItemGubun());
				stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
				stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
				stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(inLocCd);
				stockPaymentAdmVo.setLocationNo(inLocNo);
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmList.add(stockPaymentAdmVo);
			}
			for ( int finishIdx = 0; finishIdx < itemWhsAdmCreateList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= itemWhsAdmCreateList.size()) {
					List<ItemWhsAdmVo> tempList = itemWhsAdmCreateList.subList(finishIdx, itemWhsAdmCreateList.size());
					itemWhsAdmService.itemWhsAdmListCreate(tempList);
					//logger.info("제품 입출고관리 데이터(TB_ITEM_WHS_ADM) 등록" + finishIdx+ ": " + tempList);
				} else {
					List<ItemWhsAdmVo> tempList = itemWhsAdmCreateList.subList(finishIdx, finishIdx+50);
					itemWhsAdmService.itemWhsAdmListCreate(tempList);
					//logger.info("제품 입출고관리 데이터(TB_ITEM_WHS_ADM) 등록" + finishIdx+ ": " + tempList);
				}
			}
			for ( int finishIdx = 0; finishIdx < stockPaymentAdmList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= stockPaymentAdmList.size()) {
					List<StockPaymentAdmVo> tempList = stockPaymentAdmList.subList(finishIdx, stockPaymentAdmList.size());
					stockPaymentAdmService.stockPaymentAdmListCreate(tempList);
					//logger.info("제품 입고 수불데이터 등록" + finishIdx+ ": " + tempList);
				} else {
					List<StockPaymentAdmVo> tempList = stockPaymentAdmList.subList(finishIdx, finishIdx+50);
					stockPaymentAdmService.stockPaymentAdmListCreate(tempList);
					//logger.info("제품 입고 수불데이터 등록" + finishIdx+ ": " + tempList);
				}
			}
			
			
			logger.info("!!!!!!!!!!!!!!!!!!!"+workOrderPrcssInsList);
			
			
			//수불 STOCK 테이블 INS
			int returnCheck = workOrderPrcssService.matrlStockPaymentCreate2(workOrderPrcssInsList.get(0));
			if (returnCheck > 0) logger.info("자재투입 수불 STOCK 데이터 등록 ");
			
			
			//수불 MATRL 테이블 INS
			for ( int finishIdx = 0; finishIdx < workOrderPrcssInsList.size(); finishIdx+=50 ) {
				if ( finishIdx+50 >= workOrderPrcssInsList.size()) {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsList.subList(finishIdx, workOrderPrcssInsList.size());
					int returnCheck2 = workOrderPrcssService.matrlStockMatrlCreate(tempList);
					if (returnCheck2 > 0) logger.info("자재투입 수불 MATRL 데이터 등록 " + finishIdx+ ": " + tempList);
				} else {
					List<WorkOrderPrcssVo> tempList = workOrderPrcssInsList.subList(finishIdx, finishIdx+50);
					int returnCheck2 = workOrderPrcssService.matrlStockMatrlCreate(tempList);
					if (returnCheck2 > 0) logger.info("자재투입 수불 MATRL 데이터 등록 " + finishIdx+ ": " + tempList);
				}
			}
					
			jsonData.put("workOrderPrcssInsList", workOrderPrcssInsList);
			jsonData.put("workOrdSeq", Integer.toString(faultyWorkOrdSeq)); //불량등록 시 필요함
			jsonData.put("result", "ok");
			//logger.info("작지 등록처리 끝(po/workOrdAddByBongjae)");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//작지 수정처리(사출)
	@RequestMapping(value = "/po/workOrdEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEdit(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리(사출): " + workOrderPrcssVo);
		try {
			//예외처리 
			String workStatus = workOrderPrcssService.workOrdPrcssReadDtl(workOrderPrcssVo).getWorkStatus();
			if(workStatus.equals("001")) {	//생산상태가 진행중인 경우
				workOrderPrcssVo.setUpdId(Utils.getUserId());
				workOrderPrcssService.update(workOrderPrcssVo);
				
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());	
				itemWhsAdmVo.setItemSeq(workOrderPrcssVo.getItemSeq());	
				itemWhsAdmVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				itemWhsAdmVo.setInDate(workOrderPrcssVo.getOrdLotNoDate());					
				itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssVo.getFairQty()));
				
				itemWhsAdmVo.setInLoc(workOrderPrcssVo.getInLoc());
				itemWhsAdmVo.setInArea(workOrderPrcssVo.getInArea());
				itemWhsAdmVo.setInFloor(workOrderPrcssVo.getInFloor());
				itemWhsAdmVo.setLocationNo(workOrderPrcssVo.getLocationNo());
				itemWhsAdmVo.setRegId(Utils.getUserId());
				itemWhsAdmVo.setUpdId(Utils.getUserId());
				
				if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
					itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
				}else {
					itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
				}
				
				String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
					
				//수불테이블 Create
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType("001");
				stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("제품입고");
				stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
				stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
				stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(itemWhsAdmVo.getInLoc());
				stockPaymentAdmVo.setAreaCd(itemWhsAdmVo.getInArea());
				stockPaymentAdmVo.setFloorCd(itemWhsAdmVo.getInFloor());
				stockPaymentAdmVo.setLocationNo(itemWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "overlap");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//작지 수정처리(봉제)
	@RequestMapping(value = "/po/workOrdEditByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEditByBongjae(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리(봉제): " + workOrderPrcssVo);
		try {
			//WorkOrderPrcssVo workOrderPrcssUpdVo = new WorkOrderPrcssVo();
			//workOrderPrcssUpdVo.setOrdLotNo(workOrderPrcssVo.getOrdLotNo());
			//workOrderPrcssUpdVo.setWorkStatus(workOrderPrcssVo.getWorkStatus());
			//workOrderPrcssUpdVo.setWorkEndTime(workOrderPrcssVo.getWorkEndTime());
			//workOrderPrcssUpdVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			//workOrderPrcssUpdVo.setWorkOrdSeq(workOrderPrcssVo.getWorkOrdSeq());
			//workOrderPrcssUpdVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
			//workOrderPrcssUpdVo.setUpdId(Utils.getUserId());
			//workOrderPrcssService.update(workOrderPrcssUpdVo);
			
			//제품 봉제 창고 입력
			itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());	
			itemWhsAdmVo.setItemSeq(workOrderPrcssVo.getItemSeq());	
			itemWhsAdmVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			itemWhsAdmVo.setInDate(workOrderPrcssVo.getOrdLotNoDate());					
			itemWhsAdmVo.setInQty(Integer.parseInt(workOrderPrcssVo.getFairQty()));
			itemWhsAdmVo.setInLoc(workOrderPrcssVo.getInLoc());
			itemWhsAdmVo.setLocationNo(workOrderPrcssVo.getLocationNo());
			itemWhsAdmVo.setRegId(Utils.getUserId());
			itemWhsAdmVo.setUpdId(Utils.getUserId());
			
			if(itemWhsAdmService.existItemWhsAdm(itemWhsAdmVo) > 0) {
				itemWhsAdmService.itemWhsAdmUpdate(itemWhsAdmVo);
			}else {
				itemWhsAdmService.itemWhsAdmCreate(itemWhsAdmVo);
			}
			
			String spNo = stockPaymentAdmService.getSpNo(workOrderPrcssVo.getOrdLotNoDate());
				
			//수불테이블 Create
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(workOrderPrcssVo.getItemGubun());
			stockPaymentAdmVo.setSpCd(itemWhsAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("제품입고");
			stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getInDate());
			stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getInQty()));
			stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(itemWhsAdmVo.getInLoc());
			stockPaymentAdmVo.setAreaCd(itemWhsAdmVo.getInArea());
			stockPaymentAdmVo.setFloorCd(itemWhsAdmVo.getInFloor());
			stockPaymentAdmVo.setLocationNo(itemWhsAdmVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			//잔량처리
			float outputQty = Float.parseFloat(workOrderPrcssVo.getOutputQty());		//생산수량
			logger.info("outputQty:"+outputQty);
			if(outputQty==0) {
				jsonData.put("result", "fail");
				jsonData.put("message", "생산실적을 등록해주세요.");
			}else {
				//BOM 목록조회
				ItemPartAdmVo bomVo = new ItemPartAdmVo();	
				bomVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
				List<ItemPartAdmVo> bomList =  itemPartAdmService.itemMotorEbomList(bomVo);	//bom리스트
				
				if(bomList.size()>0) {
					String spNo2 = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
					for(int i=0; i<bomList.size(); i++) {
						float remainQty = outputQty;
						
						while(remainQty>0) {
							WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
							workOrderMatrlUpdVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
							workOrderMatrlUpdVo.setWorkProgNo(workOrderMatrlVo.getWorkProgNo());
							workOrderMatrlUpdVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
							workOrderMatrlUpdVo.setOrdLotNo(workOrderMatrlVo.getOrdLotNo());
							workOrderMatrlUpdVo.setLocationCd(workOrderMatrlVo.getLocationCd());
							workOrderMatrlUpdVo.setItemSeq(bomList.get(i).getItemSeq());
							
							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoListByBongjae(workOrderMatrlUpdVo);	//자재투입 데이터
							if(vo==null) {
								jsonData.put("result", "lack");
								jsonData.put("message", "자재가 부족합니다.");
								break;
							}
							
							float matrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
							float consumpt = Float.parseFloat(bomList.get(i).getItemConsumpt()); //소요량
							float totalSanSangQty = (remainQty*consumpt);	//생산량
							float totalMatrlQty = matrlQty;
							
							logger.info("matrlQty:"+matrlQty);
							logger.info("consumpt:"+consumpt);
							logger.info("totalMatrlQty:"+totalSanSangQty); 
							
							stockPaymentAdmVo.setSpNo(spNo2);
							stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
							stockPaymentAdmVo.setSpType(vo.getItemGubun());
							stockPaymentAdmVo.setSpCd(vo.getItemSeq());
							stockPaymentAdmVo.setSpGubun("002");
							stockPaymentAdmVo.setSpSubGubun("자재투입");
							stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
							stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
							stockPaymentAdmVo.setSourceNo(workOrderMatrlUpdVo.getOrdLotNo());
							stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
							stockPaymentAdmVo.setLocationNo(vo.getLocationNo());
							stockPaymentAdmVo.setRegId(Utils.getUserId());
							
							//투입보다 생산량이 많을 경우  310
							if(totalMatrlQty<totalSanSangQty) {	//100<300
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
								remainQty = totalSanSangQty-totalMatrlQty;
							}else {
								stockPaymentAdmVo.setSpQty(Float.toString(Math.round(totalSanSangQty)));
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalSanSangQty)));
								remainQty = 0;
							}
							workOrderMatrlUpdVo.setBarcodeNo(vo.getBarcodeNo());
							workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlUpdVo);
							jsonData.put("result", "ok");
						}
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
	
	// 작지 삭제처리
	@RequestMapping(value = "/po/workOrdDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdDel(WorkOrderPrcssVo workOrderPrcssVo,WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작지 수정처리: " + workOrderPrcssVo);
		try {
			
			//작업지시 불량수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setFaultyQty(workOrderPrcssVo.getFaultyQty());
			workOrderService.prcssDelFaultyUpdate(workOrderVo);
			
			workOrderVo.setOutputQty(workOrderPrcssVo.getOutputQty());
			workOrderService.workOrdOutputDelete(workOrderVo);
			
			//생산실적 삭제
			workOrderPrcssService.workOrderPrcssDelete(workOrderPrcssVo);
			
			//불량 삭제
			workOrderFaultyTypeVo.setMinorPrcssCd("0");
			workOrderFaultyTypeVo.setMiddlePrcssCd("0");
			workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			
			if(workOrderPrcssVo.getWorkStatus().equals("002")) {
				//제품입출고 테이블 삭제
				itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getBarcodeNo());
				itemWhsAdmService.itemOutWhsDelete(itemWhsAdmVo);
				
				//수불관리 테이블 삭제
				stockPaymentAdmVo.setSourceNo(workOrderPrcssVo.getBarcodeNo());
				stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
			}
			
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQty", outputQty);
			jsonData.put("faultyQty", faultyQty);
			jsonData.put("fairQty", fairQty);
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//생산 lotNo 생성(사출)
	public String getOrdLotNo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		
		EquipCodeAdmVo eqVo = new EquipCodeAdmVo();
		eqVo.setEquipCd(workOrderPrcssVo.getEquipCd());
		String eqInitial = equipCodeAdmService.equipCodeAdmRead(eqVo).getEquipInitial();
		
		String yearString = workOrderPrcssVo.getOrdLotNoDate().substring(2,4);
		String monString = workOrderPrcssVo.getOrdLotNoDate().substring(4,6);
		String dayString = workOrderPrcssVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		String ordLotNoString = "DR"+eqInitial+yearString+mString+dayString;
		workOrderPrcssVo.setOrdLotNo(ordLotNoString);
		String ordLotSeq = workOrderPrcssService.getOrdlotNo(workOrderPrcssVo);
		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNo;
	}
	
	//생산 lotNo 생성(봉제)
	public String getOrdLotNoByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		
		String yearString = workOrderPrcssVo.getOrdLotNoDate().substring(2,4);
		String monString = workOrderPrcssVo.getOrdLotNoDate().substring(4,6);
		String dayString = workOrderPrcssVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		String preString ="";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		if(workOrderPrcssVo.getWorkStatus()!=null && workOrderPrcssVo.getWorkStatus().equals("002")) {
			preString = "DR";
		}else {
		
			preString = "FDR";	
		}
		
		String ordLotNoString = preString+yearString+mString+dayString;
		workOrderPrcssVo.setOrdLotNo(ordLotNoString);
		String ordLotSeq = workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssVo);
		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNo;
	}
	
	//생산 lotNo 생성(봉제) - list로 한꺼번에 등록하기 위한 함수
	public String getOrdLotNoListByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		
		String yearString = workOrderPrcssVo.getOrdLotNoDate().substring(2,4);
		String monString = workOrderPrcssVo.getOrdLotNoDate().substring(4,6);
		String dayString = workOrderPrcssVo.getOrdLotNoDate().substring(6,8);
		String mString = "";
		String preString ="";
		
		switch (monString) {
			case "01": mString="A"; break;case "02": mString="B"; break;case "03": mString="C"; break;
			case "04": mString="D"; break;case "05": mString="E"; break;case "06": mString="F"; break;
			case "07": mString="G"; break;case "08": mString="H"; break;case "09": mString="I"; break;
			case "10": mString="J"; break;case "11": mString="K"; break;case "12": mString="L"; break;
			default: break;
		}
		
		if(workOrderPrcssVo.getWorkStatus()!=null && workOrderPrcssVo.getWorkStatus().equals("002")) {
			preString = "DR";
		}else {
		
			preString = "FDR";	
		}
		
		String ordLotNoString = preString+yearString+mString+dayString;
//		workOrderPrcssVo.setOrdLotNo(ordLotNoString);
//		String ordLotSeq = workOrderPrcssService.getOrdlotNoByBongjae(workOrderPrcssVo);
//		String ordLotNo = ordLotNoString+ordLotSeq;
		
		return ordLotNoString;
	}

	
	// 작지 생산LOT별 수정처리
	@RequestMapping(value = "/po/workOrdPrcssEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEdit(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(workOrderPrcssVo);
			
			// 작업지시 생산수량 수정
			WorkOrderVo workOrderVo = new WorkOrderVo();
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
			workOrderVo.setOutputQty(workOrderPrcssVo.getDiffOutputQty());
			workOrderService.update(workOrderVo);
			
			// 총 생산수량
			String outputQty = workOrderService.workOrdRead(workOrderVo).getOutputQty();
			String faultyQty = workOrderService.workOrdRead(workOrderVo).getFaultyQty();
			float fairQty = Float.parseFloat(outputQty)-Float.parseFloat(faultyQty);
			
			logger.info("생산수량:"+outputQty);
			logger.info("불량수량:"+faultyQty);
			logger.info("양품수량:"+fairQty);
			
			jsonData.put("outputQtyVal", outputQty);
			jsonData.put("fairQtyVal", fairQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 작지 생산LOT별 수정처리(봉제)
	@RequestMapping(value = "/po/workOrdPrcssEditByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEditByBongjae(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리(봉제): " + list);
		try {
			
			for(Map<String, Object> m :list) {
				WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
				workOrderPrcssVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderPrcssVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(m.get("workOrdSeq").toString()));
				workOrderPrcssVo.setWorkChargr(m.get("workChargr").toString());
				workOrderPrcssVo.setInspectGubun(m.get("inspectGubun").toString());
				workOrderPrcssVo.setUpdId(Utils.getUserId());
				workOrderPrcssService.update(workOrderPrcssVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작지 생산LOT별 삭제처리(봉제)
	@RequestMapping(value = "/po/workOrdPrcssDelByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssDelByBongjae(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 삭제처리(봉제): " + list);
		try {
			
			//예외처리
			for(Map<String, Object> m :list) {
				DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
				deliveryOrderAdmVo.setLotNo(m.get("ordLotNo").toString());
				if(deliveryOrderAdmService.deliveryOrderDtlExist(deliveryOrderAdmVo)>0) {
					jsonData.put("result", "fail");
					jsonData.put("message", ""+m.get("ordLotNo").toString()+"는 이미 출하요청한 LOTNO입니다. 확인해주세요.");
					return jsonData;
				}else {
					WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
					workOrderMatrlVo.setBarcodeNo(m.get("ordLotNo").toString());
					if(workOrderMatrlService.workOrdMatrlRead(workOrderMatrlVo).size()>0) {
						jsonData.put("result", "fail");
						jsonData.put("message", ""+m.get("ordLotNo").toString()+"는 이미 다른 작업지시에 투입한 LOTNO입니다. 확인해주세요.");
						return jsonData;
					}
				}
			}
			
			//생산실적 모아서 한번에 처리
			
			//자재투입 수불 수량 수정,조정입고
			//해당 LOTNO의 BOM기준으로 
			
			
			for(Map<String, Object> m :list) {
				
				//자재투입 수불 수량 수정
				//해당 LOTNO의 BOM기준으로 
				StockMatrlAdmVo matrlvo = new StockMatrlAdmVo();
				matrlvo.setSourceNo(m.get("ordLotNo").toString());
				List<StockMatrlAdmVo> matrlList = stockMatrlAdmService.stockMatrlAdmList(matrlvo);
				stockPaymentAdmService.stockPaymentAdmWorkCancleCreate(matrlList);
				
				//자재투입 상세 수불 삭제
				StockMatrlAdmVo vo = new StockMatrlAdmVo();
				vo.setSourceNo(m.get("ordLotNo").toString());
				stockMatrlAdmService.stockMatrlAdmDelete(vo);
				
				//제품 수불 삭제
				StockPaymentAdmVo ItemVo = new StockPaymentAdmVo();
				ItemVo.setBarcodeNo(m.get("ordLotNo").toString());
				stockPaymentAdmService.stockPaymentAdmDelete(ItemVo);
				
				//생산실적등록 삭제
				WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
				workOrderPrcssVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(m.get("workOrdSeq").toString()));
				workOrderPrcssVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderPrcssService.workOrderPrcssDelete(workOrderPrcssVo);
				
				//제품입고등록 삭제
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(m.get("ordLotNo").toString());
				itemWhsAdmService.itemOutWhsDelete(itemWhsAdmVo);
				
				//불량등록 삭제
				WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
				workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
				
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	// 작지 생산LOT별 수정처리
	@RequestMapping(value = "/po/workOrdPrcssEdit2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdPrcssEdit2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 생산LOT별 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(workOrderPrcssVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	// 작지번호 스캔
	@RequestMapping(value = "/po/workOrdNoScan", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdNoScan(WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지번호 스캔: " + workOrderVo);
		try {
			if (workOrderService.chekWorkOrdExsit(workOrderVo) == 0) {
				jsonData.put("message", "등록되지않은 작지번호입니다.");
				jsonData.put("result", "fail");
			} else {
				workOrderVo = workOrderService.workOrdRead(workOrderVo);
				jsonData.put("data", workOrderVo);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업지시 공정별 자재투입 목록조회(ADM)
	@RequestMapping(value = "/po/workOrdMatrlListAdm", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(ADM): " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrdMatrlListAdm(workOrderMatrlVo);
			
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시별 투입자재내역 - 봉제
	@RequestMapping(value = "/po/workOrdMatrlBarcodeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlBarcodeList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시별 투입자재내역 - 봉제: " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrdMatrlBarcodeList = workOrderMatrlService.workOrdMatrlBarcodeList(workOrderMatrlVo);
			jsonData.put("data", workOrdMatrlBarcodeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
		
	// 작업지시 공정별 자재투입 목록조회(ADM)-봉제
	@RequestMapping(value = "/po/workOrdMatrlListAdmByBongjea", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListAdmByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(ADM)-봉제: " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrdMatrlListAdmByBongjea(workOrderMatrlVo);
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 작업지시 공정별 자재투입 누계조회(ADM)-봉제
	@RequestMapping(value = "/po/workOrderMatrlAccList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재투입 품목별 누계: " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrderMatrlAccList(workOrderMatrlVo);
			
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 공정별 자재투입 목록조회(ADM)-봉제
	@RequestMapping(value = "/po/workOrdMatrlListAdmByBongjea2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListAdmByBongjea2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(ADM)-봉제: " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrdMatrlListAdmByBongjea2(workOrderMatrlVo);
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 작업지시 공정별 자재투입 누계조회(ADM)-봉제
	@RequestMapping(value = "/po/workOrderMatrlAccList2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderMatrlAccList2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재투입 품목별 누계: " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = workOrderMatrlService.workOrderMatrlAccList2(workOrderMatrlVo);
			
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시별 투입자재내역 - 봉제
	@RequestMapping(value = "/po/workOrdMatrlAccList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시별 투입자재 누적내역 - 봉제: " + workOrderMatrlVo);
		try {
			WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlAccList(workOrderMatrlVo);
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 작업지시 공정별 자재투입 목록조회(DTL)
	@RequestMapping(value = "/po/workOrdMatrlListDtl", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 목록조회(DTL): " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> workOrderMatrlList = new ArrayList<WorkOrderMatrlVo>();
			workOrderMatrlList = workOrderMatrlService.workOrdMatrlListDtl(workOrderMatrlVo);
			logger.info(workOrderMatrlList.toString());
			jsonData.put("data", workOrderMatrlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	// 자재투입(사출) - 선입선출 O
	@RequestMapping(value = "/po/matrlBarcodeNoScan", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScan(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			//등록된 바코드인지 확인
			StockPaymentAdmVo stockStockVo = new StockPaymentAdmVo();
			stockStockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			if(stockPaymentAdmService.includeStockYn(stockStockVo)>0) {
				
				//bom에 등록된 바코드인지 확인
				StockPaymentAdmVo stockBomVo = new StockPaymentAdmVo();
				stockBomVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				stockBomVo.setWorkPlaceMatrlUpperItemSeq(workOrderMatrlVo.getItemSeq());
				stockBomVo.setMainGubun("001");
				
				if(stockPaymentAdmService.includeBomYn(stockBomVo)>0) {
					StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
					stockVo.setRealQtyOption("Y");
					stockVo.setLocationCd(workOrderMatrlVo.getLocationCd());
					stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					stockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				
					if (stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size() > 0 ) {
						stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).get(0);	
						if(workOrderMatrlService.workOrdMatrlListByBongjea(workOrderMatrlVo)>0) {
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 투입된 바코드입니다.");
						}else {
							WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
							matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
							matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
							matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
							matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
							matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
							matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
							matrlVo.setTotalConsumpt(Float.parseFloat((stockPaymentAdmVo.getRealQty())));
							matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
							matrlVo.setRegId(Utils.getUserId());
							workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
							
							jsonData.put("result", "ok");
							jsonData.put("message", "자재투입되었습니다.");
						}
					} else { 
						stockVo.setLocationCd("001"); 
						if (stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size() > 0 ) {
							stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).get(0);
								
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
							stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							//선입선출 조건
							stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
							stockTempVo.setFifoOption("Y");
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
									|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
								
								//이동전표 발생
								String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
								
								//1.출고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("002");
								stockPaymentAdmVo.setSpSubGubun("이동출고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								//입고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("001");
								stockPaymentAdmVo.setSpSubGubun("이동입고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
								matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
								matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
								matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
								matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
								matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
								matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
								matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
								matrlVo.setRegId(Utils.getUserId());
								workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
								
								jsonData.put("result", "ok");
								jsonData.put("message", "자재투입되었습니다.");
							}else {
								jsonData.put("result","fifo");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
					
						} else {
							jsonData.put("result", "fail");
							jsonData.put("message", "원자재 창고 및 공정 창고에 없는 바코드입니다.");		
						}
					}
				} else {
					jsonData.put("result", "fail");
					jsonData.put("message", "BOM에 등록되지 않은 바코드입니다.");		
				}
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요.");		
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	/*
	// 자재투입(사출)
	@RequestMapping(value = "/po/matrlBarcodeNoScan", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScan(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			logger.info("1.바코드별 재고파악");
			StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
			stockVo.setRealQtyOption("Y");
			stockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			stockVo.setLocationCd(workOrderMatrlVo.getLocationCd());
			stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			
			if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).size()<=0) {
				logger.info("2.해당 창고에 바코드 존재파악");
				logger.info("2-1.해당 창고에 없을 경우");
				
				String locationCdVal = workOrderMatrlVo.getLocationCd().equals("003")?"004":"003";
				String locationNmVal = workOrderMatrlVo.getLocationCd().equals("003")?"사출2호기":"사출1호기";
				
				StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
				stockVo2.setRealQtyOption("Y");
				stockVo2.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				stockVo2.setLocationCd(locationCdVal);
				stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				
				if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).size()>0) {
					stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).get(0);
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("남은잔량이 없는 바코드입니다.");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						if(workOrderMatrlService.getMatrlWorkStatus(workOrderMatrlVo).equals("Y")) {
							
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
							stockTempVo.setLocationCd(locationCdVal);
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							//선입선출 조건
							stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
							stockTempVo.setFifoOption("Y");
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
									|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
								jsonData.put("result", "popup");
								jsonData.put("message", locationNmVal+"창고에 자재가 있습니다. 그래도 투입하시겠습니까?");
							}else {
								jsonData.put("result","fifo");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
						}else {
							logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료가 아님");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 진행 중인 작업지시에 투입된 바코드입니다.");
						}
					}
				}else {
					logger.info("해당 바코드가 원재료 창고에 있을 경우");
					
					StockPaymentAdmVo stockVo3 = new StockPaymentAdmVo();
					stockVo3.setRealQtyOption("Y");
					stockVo3.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
					stockVo3.setLocationCd("001");
					stockVo3.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					
					if(stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).size()>0) {
						stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo3).get(0);
						if(stockPaymentAdmVo.getRealQty()=="0.000") {
							logger.info("남은잔량이 없는 바코드입니다.");
							jsonData.put("result", "fail");
							jsonData.put("message", "남은잔량이 없는 바코드입니다.");
						}else {
							logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
							ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
							itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
							itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
							itemPartVo.setItemLvl("0");
							
							if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
									
									//이동전표 발생
									String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
									
									//1.출고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("002");
									stockPaymentAdmVo.setSpSubGubun("이동출고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									//입고
									stockPaymentAdmVo.setSpNo(spNo);
									stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
									stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
									stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
									stockPaymentAdmVo.setSpGubun("001");
									stockPaymentAdmVo.setSpSubGubun("이동입고");
									stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
									stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
									stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
									stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
									stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
									stockPaymentAdmVo.setRegId(Utils.getUserId());
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "자재투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 제품의 개발관리에 등록되어 있는 자재");
								jsonData.put("result", "fail");
								jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
							}
						}
					}else {
						logger.info("입고되지 않은 바코드이거나 잔량이 없음");
						jsonData.put("result", "fail");
						jsonData.put("message", "입고되지 않았거나 남은잔량이 없는 바코드입니다.");
					}
				}
			}else {
				stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo).get(0);	
				
				logger.info("2-2.해당 창고에 있을 경우");
				ItemPartAdmVo itemPartVo = new ItemPartAdmVo();
				itemPartVo.setItemSeq(workOrderMatrlVo.getItemSeq());
				itemPartVo.setLowerItemSeq(stockPaymentAdmVo.getItemSeq());
				itemPartVo.setItemLvl("0");
				
				logger.info("3.해당 제품의 개발관리에 포함되어 있는지 파악");
				if(itemPartAdmService.itemMotorEbomList(itemPartVo).size()!=0) {
					logger.info("3-1.해당 제품의 개발관리에 등록되어 있는 자재인 경우");
					
					logger.info("4.남은수량 파악");
					logger.info("realqty:");
					if(stockPaymentAdmVo.getRealQty()=="0.000") {
						logger.info("4-1.남은수량이 없는 경우");
						jsonData.put("result", "fail");
						jsonData.put("message", "남은잔량이 없는 바코드입니다.");
					}else {
						logger.info("4-2.남은수량이 있는 경우");
						logger.info("5.자재투입내역에 있는지 파악");
						if(workOrderMatrlService.workOrdMatrlList(workOrderMatrlVo)>0) {
							logger.info("5-1.자재투입내역에 있는 자재");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 투입된 바코드입니다.");
						}else {
							logger.info("5-2.자재투입내역에 있는 자재");
							String matrlWorkStatus = workOrderMatrlService.getMatrlWorkStatus(workOrderMatrlVo);
							if(matrlWorkStatus==null || matrlWorkStatus.equals("Y")) {
								
								StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
								stockTempVo.setRealQtyOption("Y");
								stockTempVo.setBarcodeNo("");
								stockTempVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								stockTempVo.setLocationCd("001");
								stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
								//선입선출 조건
								stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockTempVo.setFifoOption("Y");
								List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
								
								if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
										|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
										
									logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료임");
									WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
									matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
									matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
									matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
									matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
									matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
									matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
									matrlVo.setTotalConsumpt(Float.parseFloat((stockPaymentAdmVo.getRealQty())));
									matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
									matrlVo.setRegId(Utils.getUserId());
									workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
									
									jsonData.put("result", "ok");
									jsonData.put("message", "자재투입되었습니다.");
								}else {
									jsonData.put("result","fifo");
									jsonData.put("message", "이전LOT가 있습니다.");
								}
							}else {
								logger.info("해당 바코드가 투입된 모든 작업지시번호의 상태가 작업종료가 아님");
								jsonData.put("result", "fail");
								jsonData.put("message", "이미 진행 중인 작업지시에 투입된 바코드입니다.");
							}
						}
					}
				}else {
					logger.info("3-2.해당 제품의 개발관리에 등록되어있지 않은 자재인 경우");
					jsonData.put("result", "fail");
					jsonData.put("message", "해당 제품의 개발관리에 등록되어 있지 않는 자재바코드입니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	*/
	
	// 자재투입(봉제) - 선입선출 O
	@RequestMapping(value = "/po/matrlBarcodeNoScanByBongjea", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScanByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			
			//등록된 바코드인지 확인
			logger.info("0.등록 유무 파악");
			StockPaymentAdmVo stockStockVo = new StockPaymentAdmVo();
			stockStockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			if(stockPaymentAdmService.includeStockYn(stockStockVo)>0) {
				
				//bom에 등록된 바코드인지 확인
				logger.info("00.개발관리 등록 유무 파악");
				StockPaymentAdmVo stockBomVo = new StockPaymentAdmVo();
				stockBomVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				stockBomVo.setWorkPlaceMatrlUpperItemSeq(workOrderMatrlVo.getItemSeq());
				stockBomVo.setMainGubun("002");
				
				if(stockPaymentAdmService.includeBomYn(stockBomVo)>0) {
					logger.info("1.바코드별 재고파악");
					StockPaymentAdmVo stockVo = new StockPaymentAdmVo();
					stockVo.setRealQtyOption("Y");
					stockVo.setLocationCd(workOrderMatrlVo.getLocationCd());
					stockVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
					stockVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				
					List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo);
					logger.info("2.해당 창고에 바코드 존재파악");
					if (list.size() > 0 ) {
						
						logger.info("5.자재투입내역에 있는지 파악");
						if(workOrderMatrlService.workOrdMatrlListByBongjea(workOrderMatrlVo)>0) {
							logger.info("5-1.자재투입내역에 있는 자재");
							jsonData.put("result", "fail");
							jsonData.put("message", "이미 투입된 바코드입니다.");
						}else {
							logger.info("5-2.자재투입내역에 있는 자재");
							WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
							matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
							matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
							matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
							matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
							matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
							matrlVo.setItemSeq(list.get(0).getItemSeq());
							matrlVo.setTotalConsumpt(Float.parseFloat((list.get(0).getRealQty())));
							matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
							matrlVo.setRegId(Utils.getUserId());
							workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
							
							jsonData.put("result", "ok");
							jsonData.put("message", "자재투입되었습니다.");
						}
					} else { 
						logger.info("2-1.해당 공정 창고에 없을 경우 -> 원자재 창고에 있을 경우!");
						stockVo.setLocationCd("006"); 
						list = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo);
						if (list.size() > 0 ) {
							stockPaymentAdmVo = list.get(0);
								
							StockPaymentAdmVo stockTempVo = new StockPaymentAdmVo();
							stockTempVo.setRealQtyOption("Y");
							stockTempVo.setBarcodeNo("");
							stockTempVo.setItemSeq(list.get(0).getItemSeq());
							stockTempVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
							stockTempVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
							//선입선출 조건
							stockTempVo.setFifoBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
							stockTempVo.setFifoOption3("Y");
							List<StockPaymentAdmVo> stockTempList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockTempVo);	
							
							if(stockPaymentAdmVo.getItemFifoGubun().equals("002")
									|| (stockPaymentAdmVo.getItemFifoGubun().equals("001")&&stockTempList.size()<=0)) {
								
								//이동전표 발생
								String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
								
								//1.출고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("002");
								stockPaymentAdmVo.setSpSubGubun("이동출고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								//입고
								stockPaymentAdmVo.setSpNo(spNo);
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
								stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("001");
								stockPaymentAdmVo.setSpSubGubun("이동입고");
								stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
								stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
								stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
								stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
								
								WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
								matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
								matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
								matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
								matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
								matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
								matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
								matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
								matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
								matrlVo.setRegId(Utils.getUserId());
								workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
								
								jsonData.put("result", "ok");
								jsonData.put("message", "자재투입되었습니다.");
							}else {
								jsonData.put("result","fifo");
								jsonData.put("message", "이전LOT가 있습니다.");
							}
					
						} else {
							logger.info("입고되지 않은 바코드이거나 잔량이 없음");
							jsonData.put("result", "fail");
							jsonData.put("message", "원자재 창고 및 공정 창고에 없는 바코드입니다.");		
						}
					}
				} else {
					logger.info("BOM에 등록되지 않은 바코드입니다.");
					jsonData.put("result", "fail");
					jsonData.put("message", "BOM에 등록되지 않은 바코드입니다.");		
				}
			} else {
				logger.info("등록되지 않은 바코드입니다.");
				jsonData.put("result", "fail");
				jsonData.put("message", "등록되지 않은 바코드입니다. 확인해주세요.");		
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 자재투입(봉제) - 선입선출 X (이전자재조회)
	@RequestMapping(value = "/po/matrlBarcodeNoScanByBongjeaNoFifo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScanByBongjeaNoFifo(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			logger.info("1.자재투입내역에 있는지 파악");
			if(workOrderMatrlService.workOrdMatrlListByBongjea(workOrderMatrlVo)>0) {
				logger.info("1-1.자재투입내역에 없는 자재");
				jsonData.put("result", "fail");
				jsonData.put("message", "이미 투입된 바코드입니다.");
			} else {
				logger.info("1-2.자재투입내역에 있는 자재");		
							
				WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
				matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
				matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
				matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
				matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
				matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
				matrlVo.setItemSeq(workOrderMatrlVo.getMatrlItemSeq());
				matrlVo.setTotalConsumpt(Float.parseFloat(workOrderMatrlVo.getMatrlRealQty()));
				matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
				matrlVo.setRegId(Utils.getUserId());
				workOrderMatrlService.workOrdMatrlAdd(matrlVo); 
				
				jsonData.put("result", "ok");
				jsonData.put("message", "자재투입되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 투입취소
	@RequestMapping(value = "/po/moveMatrlDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moveMatrlDel(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("투입취소: " + workOrderPrcssVo);
		try {
			if ( Integer.parseInt(workOrderPrcssVo.getUseQty()) <= 0 ) {
				WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
				workOrderMatrlVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo());
				workOrderMatrlVo.setMiddlePrcssCd(workOrderPrcssVo.getMiddlePrcssCd());
				workOrderMatrlVo.setBarcodeNo(workOrderPrcssVo.getBarcodeNo());
				workOrderMatrlService.workOrdMatrlDel(workOrderMatrlVo);
				logger.info("자재투입 테이블 삭제");
				
				List<WorkOrderMatrlVo> workOrdMatrlProgressList = workOrderMatrlService.workOrdMatrlProgressList(workOrderMatrlVo);
				if ( workOrdMatrlProgressList.size() <= 0 ) {
					//투입 사용량 수정
					StockPaymentAdmVo stockPaymentAdmReadVo = new StockPaymentAdmVo();
					stockPaymentAdmReadVo.setLocationCd(workOrderPrcssVo.getLocCd());
					stockPaymentAdmReadVo.setSourceNo(workOrderPrcssVo.getBarcodeNo());
					
					List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmReadVo);
					for(int i=0; i<list.size(); i++) {
						if ( list.get(i).getSpSubGubun().equals("이동입고") ) {
							StockPaymentAdmVo stockPaymentAdmDelVo = new StockPaymentAdmVo();
							stockPaymentAdmDelVo.setSpNo(list.get(i).getSpNo());         // 조건에 spNo만 있으면 관계없는 데이터들도 삭제됨 
							stockPaymentAdmDelVo.setSourceNo(list.get(i).getSourceNo()); // 그래서 삭제 조건에 sourceNo 추가 - 2023.10.19
							stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmDelVo);
							logger.info("수불테이블 이동출고/입고 삭제");
						}
					}
				}
				
				jsonData.put("message", "투입취소 되었습니다.");
				jsonData.put("result", "ok");
			} else {
				jsonData.put("message", "이미 생산실적에 투입된 자재입니다.");
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//자재투입(이동)
	@RequestMapping(value = "/po/moveMatrlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moveMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("작업지시 공정별 자재투입 barcode Scan: " + workOrderMatrlVo);
		try {
			String locationCdVal = workOrderMatrlVo.getLocationCd().equals("003")?"004":"003";
			
			StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
			stockVo2.setRealQtyOption("Y");
			stockVo2.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			stockVo2.setLocationCd(locationCdVal);
			stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			
			stockPaymentAdmVo = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2).get(0);
					
			//이동전표 발생
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
			
			//1.출고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("002");
			stockPaymentAdmVo.setSpSubGubun("이동출고");
			stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
			stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
			stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationNo(stockPaymentAdmVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			//입고
			stockPaymentAdmVo.setSpNo(spNo);
			stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
			stockPaymentAdmVo.setSpType(stockPaymentAdmVo.getSpType());
			stockPaymentAdmVo.setSpCd(stockPaymentAdmVo.getItemSeq());
			stockPaymentAdmVo.setSpGubun("001");
			stockPaymentAdmVo.setSpSubGubun("이동입고");
			stockPaymentAdmVo.setSpDate(workOrderMatrlVo.getMatrlDate());
			stockPaymentAdmVo.setSpQty(stockPaymentAdmVo.getRealQty());
			stockPaymentAdmVo.setBarcodeNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setSourceNo(stockPaymentAdmVo.getBarcodeNo());
			stockPaymentAdmVo.setLocationCd(workOrderMatrlVo.getLocationCd());
			stockPaymentAdmVo.setLocationNo(workOrderMatrlVo.getLocationNo());
			stockPaymentAdmVo.setRegId(Utils.getUserId());
			stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
			
			WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
			matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
			matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
			matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
			matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
			matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			matrlVo.setItemSeq(stockPaymentAdmVo.getItemSeq());
			matrlVo.setTotalConsumpt(Float.parseFloat(stockPaymentAdmVo.getRealQty()));
			matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
			matrlVo.setRegId(Utils.getUserId());
			workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
				
			jsonData.put("result", "ok");
			jsonData.put("message", "자재투입되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	//이전자재투입
	@RequestMapping(value = "po/preMatrlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> preMatrlList(StockPaymentAdmVo stockPaymentAdmVo,WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if(stockPaymentAdmVo.getLocationCd()!=null && !stockPaymentAdmVo.getLocationCd().equals("")) {
				
				List<StockPaymentAdmVo> stockList = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				jsonData.put("data", stockList);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("message", "창고가 등록되어 있지 않은 작업지시번호입니다.");
				jsonData.put("result", "fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 작업지시 공정별 자재투입 수정
	@RequestMapping(value = "/po/workOrdMatrlEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 자재투입 수정: " + workOrderMatrlVo);
		try {
			workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//자재투입 BOM 기준으로 모든 자재투입여부 
	@RequestMapping(value = "/po/getMatrlBomInputStatus", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getMatrlBomInputStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재투입 BOM 기준으로 모든 자재투입여부 : " + workOrderMatrlVo);
		try {
			String status = workOrderMatrlService.getMatrlBomInputStatus(workOrderMatrlVo);
			
			jsonData.put("data", status);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//자재투입 BOM 기준으로 모든 자재 소요량계산
	@RequestMapping(value = "/po/getMatrlBomInputConsumpt", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getMatrlBomInputConsumpt(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재투입 BOM 기준으로 모든 자재 소요량계산 : " + workOrderMatrlVo);
		try {
			List<WorkOrderMatrlVo> list = new ArrayList<WorkOrderMatrlVo>();
			
			if(workOrderMatrlVo.getWorkOrdQty()!=null && !workOrderMatrlVo.getWorkOrdQty().equals("")) {
				list = workOrderMatrlService.getMatrlBomInputConsumpt(workOrderMatrlVo);
				if(list.size()>0) {
					jsonData.put("result", "lack");
				}else {
					jsonData.put("result", "ok");
				}
			}else {
				jsonData.put("data", list);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// -------------자주검사-------------
	// 자주검사 초기화
	@RequestMapping(value = "/po/workOrderJajuInspectReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectReset(WorkOrderJajuInspectVo workOrderJajuInspectVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자주검사 초기화");
		try {
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList = new ArrayList<WorkOrderJajuInspectVo>();
			jsonData.put("data", workOrderJajuInspectList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 조회
	@RequestMapping(value = "/po/workOrderJajuInspectRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			/*
			 * int existData =
			 * workOrderJajuInspectService.existWorkOrderJajuInspect(workOrderJajuInspectVo)
			 * ; if(existData>0) { List<WorkOrderJajuInspectVo> workOrderJajuInspectList =
			 * workOrderJajuInspectService.workOrderJajuInspectRead(workOrderJajuInspectVo);
			 * jsonData.put("data", workOrderJajuInspectList); } else {
			 * List<WorkOrderJajuInspectVo> workOrderJajuInspectList =
			 * workOrderJajuInspectService.jajuInspectRead(workOrderJajuInspectVo);
			 * jsonData.put("data", workOrderJajuInspectList); } jsonData.put("result",
			 * "ok");
			 * 
			 */
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList = workOrderJajuInspectService
					.workOrderJajuInspectRead(workOrderJajuInspectVo);
			jsonData.put("data", workOrderJajuInspectList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 관리항목 조회
	@RequestMapping(value = "/po/workOrderJajuInspectItemNmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectItemNmList(
			WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int existData = workOrderJajuInspectService.existWorkOrderJajuInspect(workOrderJajuInspectVo);
			List<WorkOrderJajuInspectVo> workOrderJajuInspectList;
			String itemNm = "";
			if (existData > 0) {
				workOrderJajuInspectList = workOrderJajuInspectService.workOrderJajuInspectRead(workOrderJajuInspectVo);
				itemNm = workOrderJajuInspectList.get(0).getItemNm();
			} else {
				workOrderJajuInspectList = workOrderJajuInspectService.jajuInspectRead(workOrderJajuInspectVo);
				for (int i = 0; i < 5; i++) {
					// 관리 항목이 값이 없으면
					if (i + 1 > workOrderJajuInspectList.size()) {
						if (i == 4) {

						} else {
							itemNm += "/";
						}
					}
					// 관리 항목이 값이 있으면
					else {
						if (i == 4) {
							itemNm += workOrderJajuInspectList.get(i).getItemNm();
						} else {
							itemNm += workOrderJajuInspectList.get(i).getItemNm() + "/";
						}
					}
				}
			}
			logger.info("값 : " + itemNm);
			jsonData.put("itemNmList", itemNm);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 등록
	@RequestMapping(value = "/po/workOrderJajuInspectCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderJajuInspectCreate(
			@RequestBody List<Map<String, Object>> workCondContList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderJajuInspectVo workOrderJajuInspectVo = new WorkOrderJajuInspectVo();
		logger.info("자주검사 등록 : " + workOrderJajuInspectVo);
		try {
			int sequence = 1;
			workOrderJajuInspectVo.setWorkOrdNo(workCondContList.get(0).get("workOrdNo").toString());
			workOrderJajuInspectVo.setWorkOrdSeq(workCondContList.get(0).get("workOrdSeq").toString());
			workOrderJajuInspectVo.setMinorPrcssCd(workCondContList.get(0).get("minorPrcssCd").toString());
			workOrderJajuInspectVo.setMiddlePrcssCd(workCondContList.get(0).get("middlePrcssCd").toString());
			for (Map<String, Object> m : workCondContList) {
				if (sequence == 1) {
					workOrderJajuInspectService.workOrderJajuInspectDelete(workOrderJajuInspectVo);
				}

				if (m.get("itemCont").toString().equals("allDelete")) {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderJajuInspectVo.setJajuSeq(sequence);
				workOrderJajuInspectVo.setJajuDesc(m.get("jajuDesc").toString());
				workOrderJajuInspectVo.setJajuRegDate(m.get("jajuRegDate").toString());
				workOrderJajuInspectVo.setItemNm(m.get("itemNm").toString());
				workOrderJajuInspectVo.setItemCont(m.get("itemCont").toString());
				workOrderJajuInspectVo.setRegId(Utils.getUserId().toString());
				// 첫번째 수정하기전 삭제후 등록

				workOrderJajuInspectService.workOrderJajuInspectCreate(workOrderJajuInspectVo);
				sequence++;
			}
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 자주검사 수정
	@RequestMapping(value = "/po/workOrderJajuInspectUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderJajuInspectUpdate(
			@RequestBody List<Map<String, Object>> workCondContList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderJajuInspectVo workOrderJajuInspectVo = new WorkOrderJajuInspectVo();
		try {
			int sequence = 1;
			workOrderJajuInspectVo.setWorkOrdNo(workCondContList.get(0).get("workOrdNo").toString());
			workOrderJajuInspectVo.setWorkOrdSeq(workCondContList.get(0).get("workOrdSeq").toString());
			workOrderJajuInspectVo.setMinorPrcssCd(workCondContList.get(0).get("minorPrcssCd").toString());
			workOrderJajuInspectVo.setMiddlePrcssCd(workCondContList.get(0).get("middlePrcssCd").toString());

			for (Map<String, Object> m : workCondContList) {
				workOrderJajuInspectVo.setJajuSeq(sequence);
				workOrderJajuInspectVo.setJajuDesc(m.get("jajuDesc").toString());
				workOrderJajuInspectVo.setJajuRegDate(m.get("jajuRegDate").toString());
				workOrderJajuInspectVo.setItemNm(m.get("itemNm").toString());
				workOrderJajuInspectVo.setItemCont(m.get("itemCont").toString());
				workOrderJajuInspectVo.setRegId(Utils.getUserId().toString());
				;

				// 첫번째 수정하기전 삭제후 등록
				if (sequence == 1) {
					workOrderJajuInspectService.workOrderJajuInspectDelete(workOrderJajuInspectVo);
				}

				workOrderJajuInspectService.workOrderJajuInspectCreate(workOrderJajuInspectVo);
				sequence++;
			}

			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// -------------비가동등록-------------
	// 비가동등록 초기화
	@RequestMapping(value = "/po/workOrderNonOperationReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderJajuInspectReset(WorkOrderNonOperationVo workOrderNonOperationVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderNonOperationVo> WorkOrderNonOperationList = new ArrayList<WorkOrderNonOperationVo>();
			jsonData.put("data", WorkOrderNonOperationList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 비가동등록 조회
	@RequestMapping(value = "/po/workOrderNonOperationRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderNonOperationRead(WorkOrderNonOperationVo workOrderNonOperationVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			logger.info("비가동 데이터 : " + workOrderNonOperationVo);
			if (workOrderNonOperationVo.getWorkOrdNo() == "") {

				List<WorkOrderNonOperationVo> WorkOrderNonOperationList = new ArrayList<WorkOrderNonOperationVo>();
				jsonData.put("data", WorkOrderNonOperationList);
				jsonData.put("result", "ok");
				logger.info("비가동 데이터가 없어..");
				return jsonData;
			}
			logger.info("비가동 데이터가 있어..");
			List<WorkOrderNonOperationVo> WorkOrderNonOperationList = workOrderNonOperationService
					.workOrderNonOperationRead(workOrderNonOperationVo);
			jsonData.put("data", WorkOrderNonOperationList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 비가동등록 등록
	@RequestMapping(value = "/po/workOrderNonOperationCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationCreate(
			@RequestBody List<Map<String, Object>> WorkOrderNonOperationList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderNonOperationVo workOrderNonOperationVo = new WorkOrderNonOperationVo();
		try {
			int sequence = 1;
			workOrderNonOperationVo.setWorkOrdNo(WorkOrderNonOperationList.get(0).get("workOrdNo").toString());
			workOrderNonOperationVo.setWorkOrdSeq("0");
			workOrderNonOperationVo.setMinorPrcssCd("0");
			workOrderNonOperationVo.setMiddlePrcssCd("0");
			for (Map<String, Object> m : WorkOrderNonOperationList) {
				if (sequence == 1) {
					workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
				}
				if (m.get("noGubun").toString() == "") {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderNonOperationVo.setNoSeq(Integer.toString(sequence));
				workOrderNonOperationVo.setNoGubun(m.get("noGubun").toString());
				workOrderNonOperationVo.setNoReason(m.get("noReason").toString());
				workOrderNonOperationVo.setNoStartTime(m.get("noStartTime").toString());
				workOrderNonOperationVo.setNoEndTime(m.get("noEndTime").toString());
				workOrderNonOperationVo.setNoStartDate(m.get("noStartDate").toString());
				workOrderNonOperationVo.setNoEndDate(m.get("noEndDate").toString());
				workOrderNonOperationVo.setNoTime(m.get("noTime").toString());
				//workOrderNonOperationVo.setNoDesc(m.get("noDesc").toString());
				workOrderNonOperationVo.setRegId(Utils.getUserId().toString());

				workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
				sequence++;
			}
			//workOrderNonOperationService.workOrderPrcssNonOperation(workOrderNonOperationVo);
			
			//작업지시서 상태값 수정
			workOrderVo.setWorkOrdNo(workOrderNonOperationVo.getWorkOrdNo());
			workOrderVo.setWorkStatusCd("NS");
			workOrderService.update(workOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 비가동등록 수정
	@RequestMapping(value = "/po/workOrderNonOperationUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationUpdate(WorkOrderVo workOrderVo,WorkOrderMatrlVo workOrderMatrlVo,WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		logger.info("가동시작/가종종료 버튼 클릭");
		try {
			
			//가동시작일 경우
			if(workOrderNonOperationVo.getNoStartDate()!=null && !workOrderNonOperationVo.getNoStartTime().equals("")) {
				if(!workOrderService.workOrdRead(workOrderVo).getWorkStatusCd().equals("PS")) {
					String noSeq = workOrderNonOperationService.createNoSeq(workOrderNonOperationVo);
					workOrderNonOperationVo.setNoSeq(noSeq);
					workOrderNonOperationVo.setRegId(Utils.getUserId().toString());
					workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
					
					workOrderService.update(workOrderVo);
					
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "noRespon");
				}
			
				
			//가동종료일 경우
			}else {
				if(!workOrderService.workOrdRead(workOrderVo).getWorkStatusCd().equals("PE")) {
					
					//자재잔량
					float fuzzQty = Float.parseFloat(workOrderVo.getFuzzQty())*0.001F;
					float runnerQty = Float.parseFloat(workOrderVo.getRunnerQty())*0.001F;
					float addQty = fuzzQty+runnerQty;
					
					int outputQty = workOrderPrcssService.workOrdPrcssDayQty(workOrderPrcssVo);	//생산수량
					float remainQty = 0;
					
		
					if(outputQty==0) {
						jsonData.put("result", "fail");
						jsonData.put("message", "생산실적을 등록해주세요.");
					}else {
						workOrderNonOperationVo.setNoSeq(workOrderNonOperationService.getNoSeq(workOrderNonOperationVo));	//비가동 등록 시작
						List<WorkOrderNonOperationVo> list = workOrderNonOperationService.workOrderNonOperationRead(workOrderNonOperationVo);
						int count = 0;
						do {
							
							WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoList(workOrderMatrlVo);	//자재투입 데이터
							if(vo==null) {
								jsonData.put("result", "lack");
								jsonData.put("message", "자재가 부족합니다.");
							}else {
								float matrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
								
								ItemPartAdmVo partVo = new ItemPartAdmVo();	
								partVo.setItemSeq(vo.getItemSeq());
								partVo.setUpperItemSeq(workOrderMatrlVo.getItemSeq());
								List<ItemPartAdmVo> partList =  itemPartAdmService.itemMotorEbomList(partVo);
								float consumpt = Float.parseFloat(partList.get(0).getItemConsumpt()); //소요량
								
								logger.info("count:"+count);
								if(count==0) {
									remainQty = (outputQty*consumpt)+addQty; 
									logger.info("remain값 한번만 실행");	//생산량(한번만 실행)
								} 
								
								logger.info("matrlQty:"+matrlQty);
								logger.info("consumpt:"+consumpt);
								logger.info("remainQty:"+remainQty);	//100
								
								
								stockPaymentAdmVo.setSpNo(stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")));
								stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
								stockPaymentAdmVo.setSpType(vo.getItemGubun());
								stockPaymentAdmVo.setSpCd(vo.getItemSeq());
								stockPaymentAdmVo.setSpGubun("002");
								stockPaymentAdmVo.setSpSubGubun("자재투입");
								stockPaymentAdmVo.setSpDate(list.get(0).getNoStartDate());
								stockPaymentAdmVo.setBarcodeNo(vo.getBarcodeNo());
								stockPaymentAdmVo.setSourceNo(vo.getBarcodeNo());
								stockPaymentAdmVo.setLocationCd(vo.getLocationCd());
								stockPaymentAdmVo.setAreaCd(vo.getAreaCd());
								stockPaymentAdmVo.setFloorCd(vo.getFloorCd());
								stockPaymentAdmVo.setLocationNo(vo.getLocationNo());
								stockPaymentAdmVo.setRegId(Utils.getUserId());
								
								//투입보다 생산량이 많을 경우  310
								if(matrlQty<remainQty) {	//100<300
									logger.info(matrlQty+"<<<<<"+remainQty);
									stockPaymentAdmVo.setSpQty(Float.toString(Math.round(matrlQty)));  //출고량
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									workOrderMatrlVo.setUseQty(Integer.toString(Math.round(matrlQty))); //사용량
									remainQty = remainQty-matrlQty;
									logger.info("remainQty:"+remainQty);
								}else {
									logger.info(matrlQty+">>>>>"+remainQty);
									stockPaymentAdmVo.setSpQty(Float.toString(Math.round(remainQty)));
									stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
									
									workOrderMatrlVo.setUseQty(Integer.toString(Math.round(remainQty)));
									remainQty = 0;
									logger.info("remainQty:"+remainQty);
								}
								
								workOrderMatrlVo.setBarcodeNo(vo.getBarcodeNo());
								workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
							}
							
							
							workOrderNonOperationVo.setNoStartDate(list.get(0).getNoStartDate());
							workOrderNonOperationVo.setNoStartTime(list.get(0).getNoStartTime());
							workOrderNonOperationVo.setUpdId(Utils.getUserId().toString());
							workOrderNonOperationService.workOrderNonOperationUpdate(workOrderNonOperationVo);
							workOrderService.update(workOrderVo);
							
							count++;
							jsonData.put("result", "ok");
						}while(remainQty>0);
					}
				}else {
					jsonData.put("result", "noRespon");
				}
			}
			
			logger.info("금형!!!");
			WorkOrderVo workOrderMoldVo = new WorkOrderVo();
			workOrderMoldVo.setWorkOrdNo(workOrderVo.getWorkOrdNo());
			WorkOrderVo moldVo = workOrderService.workOrdList(workOrderMoldVo).get(0);
			String status = moldVo==null || moldVo.getMoldNo()==null || moldVo.getMoldLocation()==null?"ERROR":"SUCCESS";
			logger.info("확인상태:"+status);
			logger.info("금형번호:"+moldVo.getMoldNo());
			logger.info("금형위치:"+moldVo.getMoldLocation());
			if(status=="ERROR") {
				workOrderMoldVo.setWorkOrdNo(workOrderVo.getWorkOrdNo());
				moldVo = workOrderService.workOrdList(workOrderMoldVo).get(0);
			}
			jsonData.put("moldNo", moldVo.getMoldNo());
			jsonData.put("moldLocation", moldVo.getMoldLocation());
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//비가동 삭제
	@RequestMapping(value = "/po/workOrderNonOperationDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationDelete(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderNonOperationVo.setMinorPrcssCd("0");
			workOrderNonOperationVo.setMiddlePrcssCd("0");
			workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 생산실적 수집
	// 생산수량 변경
	@RequestMapping(value = "/po/workOrderPrcssQtyUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderPrcssQtyUpdate(WorkOrderPrcssVo workOrderPrcssVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderPrcssVo.setUpdId(Utils.getUserId().toString());
			workOrderPrcssService.workOrderPrcssQtyUpdate(workOrderPrcssVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업지시 공정별 불량유형
	// --------------------------------------------------------------------------

	//불량코드별 불량수량 합계
	@RequestMapping(value = "/po/getFaultyTypeSumQty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getFaultyTypeSumQty(WorkOrderFaultyTypeVo workOrderFaultyTypeVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			jsonData.put("data", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업지시 공정별 불량유형 목록조회
	@RequestMapping(value = "/po/workOrderFaultyTypeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFaultyTypeList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 공정별 불량유형 목록조회: " + workOrderFaultyTypeVo);
		try {
			List<WorkOrderFaultyTypeVo> workOrderFaultyTypeList = workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo);
			jsonData.put("data", workOrderFaultyTypeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 작업지시 공정별 불량유형 삭제
	@RequestMapping(value = "/po/workOrderFaultyTypeDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFaultyTypeDelete(@RequestBody List<Map<String, Object>> list)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작업지시 공정별 불량유형 목록조회: " + workOrderFaultyTypeVo);
		try {
			for(Map<String, Object> m : list) {
				UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
				unfitAdmVo.setUnfitLot(m.get("ordLotNo").toString());
				if(unfitAdmService.unfitAdmCheck(unfitAdmVo)==0) {
					//자재정산한거 삭제!
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					stockPaymentAdmVo.setSourceNo(m.get("ordLotNo").toString());
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
					
					WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
					workOrderPrcssVo.setWorkOrdNo(m.get("workOrdNo").toString());
					workOrderPrcssVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
					workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(m.get("workOrdSeq").toString()));
					workOrderPrcssService.workOrderPrcssDelete(workOrderPrcssVo);
					
					WorkOrderFaultyTypeVo workOrdeFaultyTypeVo = new WorkOrderFaultyTypeVo();
					workOrdeFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
					workOrdeFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
					workOrdeFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
					workOrdeFaultyTypeVo.setFaultyTypeSeq(m.get("faultyTypeSeq").toString());
					workOrdeFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
					workOrderFaultyTypeService.deleteAll(workOrdeFaultyTypeVo);
					
					jsonData.put("result", "ok");
					jsonData.put("message", "삭제되었습니다.");
				}else {
					jsonData.put("result", "fail");
					jsonData.put("messgae", "부적합관리대장에 이미 등록힌 LOTNO입니다.");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
		
	//작업지시 불량등록(사출)
	@RequestMapping(value = "/po/workOrdInsertQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdInsertQty(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작업지시 불량등록(사출): " + workOrderPrcssVo);
		try {
			//작업지시 총 불량수정
			workOrderVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			workOrderVo.setFaultyQty(workOrdList.get(0).get("faultyQtySum").toString());
			workOrderService.update(workOrderVo);
			
			workOrderVo.setOutputQty(workOrdList.get(0).get("outputQty").toString());
			workOrderService.workOrdOutputUpdate(workOrderVo);
			
			workOrderPrcssVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			
			ArrayList<String> list1 = new ArrayList<String>();
			ArrayList<Integer> list2 = new ArrayList<Integer>();
			int count =0;
 			for(Map<String, Object> m :workOrdList) {
				if(list1.size()>0) {
					for(int i=0; i<list1.size(); i++) {
						if(list1.get(i).equals(m.get("workOrdSeq").toString())) {
							int faultyQty =  list2.get(i)+Integer.parseInt(m.get("faultyQty").toString());
							logger.info("불량수량:"+faultyQty);
							list2.set(i, faultyQty);
							count++;
							break;
						}
					}
					if(count==0) {
						list1.add(m.get("workOrdSeq").toString());
						list2.add(Integer.parseInt(m.get("faultyQty").toString()));
					}
					count=0;
				}else {
					list1.add(m.get("workOrdSeq").toString());
					list2.add(Integer.parseInt(m.get("faultyQty").toString()));
				}
			}
			
			for(int i=0; i<list1.size(); i++) {
				workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(list1.get(i)));
				workOrderPrcssVo.setFaultyQty(Integer.toString(list2.get(i)));
				workOrderPrcssService.updateQty(workOrderPrcssVo);		
			}
			
			//작업지시 lotNo별 불량유형 등록 
			for(Map<String, Object> m :workOrdList) {
				
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd("0");
				workOrderFaultyTypeVo.setMiddlePrcssCd("0");
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyCavity(m.get("faultyCavity").toString());
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				//작업지시 lotNo별 불량유형이 있을 경우 -> 수정
				if(workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size()!=0) {
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
				  
				}else {
					//작업지시 lotNo별 불량유형이 없을 경우 -> 등록
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo); 
				}
			}
			
			workOrderFaultyTypeVo.setWorkGubun(workOrdList.get(0).get("workGubun").toString());
			workOrderFaultyTypeVo.setFaultyTypeCd("000026");
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			logger.info("초기허용불량수:"+faultyTypeSumQty);
			jsonData.put("faultyTypeSumQty", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//작업지시 불량등록(봉제)
	@RequestMapping(value = "/po/workOrdFaultyCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyCreate(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		logger.info("작업지시 불량등록(봉제)");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		try {
			if(workOrdList.get(0).get("workOrdNo")!=null && !workOrdList.get(0).get("workOrdNo").equals("")) {
				//1. 불량등록 데이터 전체 삭제
				workOrderFaultyTypeVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
				workOrderFaultyTypeVo.setMiddlePrcssCd(workOrdList.get(0).get("middlePrcssCd").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd(workOrdList.get(0).get("minorPrcssCd").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(workOrdList.get(0).get("workOrdSeq").toString());
				workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
				
				//2. 작업지시 lotNo별 불량유형 등록 
				for(Map<String, Object> m :workOrdList) {
					
					workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
					workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
					workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
					workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
					workOrderFaultyTypeVo.setFaultyTypeSeq("0");
					workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
					workOrderFaultyTypeVo.setFaultyCavity("");
					workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
					workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
					workOrderFaultyTypeVo.setApprovalYn("");
					workOrderFaultyTypeVo.setFaultyTypeDesc("");
					
					//작업지시 lotNo별 불량유형이 있을 경우 -> 수정
					if (workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size() > 0) {
						workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
						workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
					} else {
						//작업지시 lotNo별 불량유형이 없을 경우 -> 등록
						workOrderFaultyTypeVo.setRegId(Utils.getUserId());
						workOrderFaultyTypeService.createList(workOrderFaultyTypeVo);
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

	//작업지시 불량 수정(봉제)
	@RequestMapping(value = "/po/workOrdFaultyQty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyQty(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		try {
			Map<String, Object> workOrderPrcssVo = workOrdList.get(0);
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
			stockPaymentAdmVo.setSourceNo(workOrderPrcssVo.get("ordLotNo").toString());
			List<StockPaymentAdmVo> list = stockPaymentAdmService.stockPaymentAdmRead(stockPaymentAdmVo);
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getSpSubGubun().equals("자재투입")) {
					int spQty = Integer.parseInt(list.get(i).getSpQty());
					WorkOrderMatrlVo workOrderMatrlVo = new WorkOrderMatrlVo();
					workOrderMatrlVo.setUseQty(Integer.toString((spQty*-1)));
					workOrderMatrlVo.setWorkOrdNo(workOrderPrcssVo.get("workOrdNo").toString());
					workOrderMatrlVo.setMiddlePrcssCd(workOrderPrcssVo.get("middlePrcssCd").toString());
					workOrderMatrlVo.setBarcodeNo(list.get(i).getBarcodeNo());
					workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlVo);
				}
			}
			
			stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
			
			workOrderFaultyTypeVo.setWorkOrdNo(workOrderPrcssVo.get("workOrdNo").toString());
			workOrderFaultyTypeVo.setMiddlePrcssCd(workOrderPrcssVo.get("middlePrcssCd").toString());
			workOrderFaultyTypeVo.setMinorPrcssCd(workOrderPrcssVo.get("minorPrcssCd").toString());
			workOrderFaultyTypeVo.setWorkOrdSeq(workOrderPrcssVo.get("workOrdSeq").toString());
			workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			
			WorkOrderPrcssVo updVo = new WorkOrderPrcssVo();
			updVo.setWorkOrdNo(workOrderPrcssVo.get("workOrdNo").toString());
			updVo.setWorkOrdSeq(Integer.parseInt(workOrderPrcssVo.get("workOrdSeq").toString()));
			updVo.setWorkChargr(workOrderPrcssVo.get("workChargr").toString());
			updVo.setInspectGubun(workOrderPrcssVo.get("inspectGubun").toString());
			updVo.setUpdId(Utils.getUserId());
			workOrderPrcssService.update(updVo);
			
			WorkOrderPrcssVo updQtyVo = new WorkOrderPrcssVo();
			updQtyVo.setWorkOrdNo(workOrderPrcssVo.get("workOrdNo").toString());
			updQtyVo.setWorkOrdSeq(Integer.parseInt(workOrderPrcssVo.get("workOrdSeq").toString()));
			updQtyVo.setOutputQty(workOrderPrcssVo.get("outputQty").toString());
			updQtyVo.setFairQty(workOrderPrcssVo.get("fairQty").toString());
			updQtyVo.setFaultyQty(workOrderPrcssVo.get("faultyQty").toString());
			workOrderPrcssService.updateQtybong(updQtyVo);
			
			for (Map<String, Object> m :workOrdList) {
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyCavity("");
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setApprovalYn("");
				workOrderFaultyTypeVo.setFaultyTypeDesc("");
				
				if (workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size() > 0) { //작업지시 lotNo별 불량유형이 있을 경우 -> 수정
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.workOrderFaultyTypeQtyUpdate(workOrderFaultyTypeVo);
				} else { //작업지시 lotNo별 불량유형이 없을 경우 -> 등록
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo);
				}
				
			}
			
			//BOM 목록조회
			ItemPartAdmVo bomVo = new ItemPartAdmVo();	
			bomVo.setUpperItemSeq(workOrderPrcssVo.get("itemSeq").toString());
			List<ItemPartAdmVo> bomList =  itemPartAdmService.itemMotorEbomList(bomVo);	//bom리스트
			
			if(bomList.size()>0) {
				String spNo2 = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
				
				for(int j=0; j<bomList.size(); j++) {
					float consumpt = Float.parseFloat(bomList.get(j).getItemConsumpt()); //소요량
					float totalSanSangQty = Float.parseFloat(workOrderPrcssVo.get("outputQty").toString());
					float remainQty = (totalSanSangQty*consumpt);	//생산량
					while(remainQty>0) {
						WorkOrderMatrlVo workOrderMatrlUpdVo = new WorkOrderMatrlVo();
						workOrderMatrlUpdVo.setWorkOrdNo(workOrderPrcssVo.get("workOrdNo").toString());
						workOrderMatrlUpdVo.setWorkProgNo(workOrderPrcssVo.get("middlePrcssCd").toString());
						workOrderMatrlUpdVo.setMiddlePrcssCd(workOrderPrcssVo.get("middlePrcssCd").toString());
						workOrderMatrlUpdVo.setOrdLotNo(workOrderPrcssVo.get("ordLotNo").toString());
						workOrderMatrlUpdVo.setLocationCd(workOrderPrcssVo.get("locationCd").toString());		//공정창고
						workOrderMatrlUpdVo.setItemSeq(bomList.get(j).getItemSeq());					
						
						WorkOrderMatrlVo vo = workOrderMatrlService.workOrdMatrlFifoListByBongjae(workOrderMatrlUpdVo);	//자재투입 데이터
						if(vo==null) {
							jsonData.put("result", "lack");
							jsonData.put("message", "자재가 부족합니다.");
							break;
						}
						
						float totalMatrlQty = Float.parseFloat(vo.getRealQty());	//자재 남은투입수량
						
						StockPaymentAdmVo stockPaymentAdmVo2 = new StockPaymentAdmVo();
						stockPaymentAdmVo2.setSpNo(spNo2);
						stockPaymentAdmVo2.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo2));
						stockPaymentAdmVo2.setSpType(vo.getItemGubun());
						stockPaymentAdmVo2.setSpCd(vo.getItemSeq());
						stockPaymentAdmVo2.setSpGubun("002");
						stockPaymentAdmVo2.setSpSubGubun("자재투입");
						stockPaymentAdmVo2.setSpDate(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo2.setBarcodeNo(vo.getBarcodeNo());
						stockPaymentAdmVo2.setSourceNo(workOrderPrcssVo.get("ordLotNo").toString());
						stockPaymentAdmVo2.setLocationCd(vo.getLocationCd());	
						stockPaymentAdmVo2.setLocationNo(vo.getLocationNo());	
						stockPaymentAdmVo2.setRegId(Utils.getUserId());
						
						//투입보다 생산량이 많을 경우  
						if(totalMatrlQty<remainQty) {	
							stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(totalMatrlQty)));  //출고량
							stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo2);
							workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(totalMatrlQty))); //사용량
							remainQty = remainQty-totalMatrlQty;
						}else {
							stockPaymentAdmVo2.setSpQty(Float.toString(Math.round(remainQty)));
							stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo2);
							workOrderMatrlUpdVo.setUseQty(Integer.toString(Math.round(remainQty)));
							remainQty = 0;
						}
						workOrderMatrlUpdVo.setBarcodeNo(vo.getBarcodeNo());
						workOrderMatrlService.workOrdMatrlEdit(workOrderMatrlUpdVo);
						jsonData.put("result", "ok");
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
	
	
	// 작업지시 불량 삭제
	@RequestMapping(value = "/po/workOrdFaultyDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdFaultyDelete(WorkOrderFaultyTypeVo workOrderFaultyTypeVo,WorkOrderVo workOrderVo, WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<WorkOrderFaultyTypeVo> list =  workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo);
			if(list.size()!=0) {
				//작업지시 총 불량수정
				workOrderVo.setFaultyQty(Integer.toString(Integer.parseInt(workOrderVo.getFaultyQty())-Integer.parseInt(workOrderFaultyTypeVo.getFaultyTypeQty())));
				workOrderService.update(workOrderVo);
				
				//작업지시 생산lot별 불량수정
				workOrderPrcssVo.setFaultyQty(workOrderFaultyTypeVo.getFaultyTypeQty());
				workOrderPrcssService.workOrdPrcssFaultyQtyDelete(workOrderPrcssVo);	
				
				//불량삭제
				workOrderFaultyTypeVo.setMinorPrcssCd("0");
				workOrderFaultyTypeVo.setMiddlePrcssCd("0");
				workOrderFaultyTypeService.deleteAll(workOrderFaultyTypeVo);
			}
			
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	};

	// 작업지시 공정별 불량유형 목록조회
	@RequestMapping(value = "/po/workOrderFaultyApprove", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFaultyApprove(
			@RequestBody List<Map<String, Object>> workOrderFaultyType) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작업지시 공정별 불량유형 승인조회: " + workOrderFaultyType);
		try {

			workOrderFaultyTypeVo.setWorkOrdNo(workOrderFaultyType.get(0).get("workOrdNo").toString());
			workOrderFaultyTypeVo.setWorkOrdSeq(workOrderFaultyType.get(0).get("workOrdSeq").toString());
			workOrderFaultyTypeVo.setMinorPrcssCd(workOrderFaultyType.get(0).get("minorPrcssCd").toString());
			workOrderFaultyTypeVo.setMiddlePrcssCd(workOrderFaultyType.get(0).get("middlePrcssCd").toString());
			workOrderFaultyTypeVo.setUpdId(Utils.getUserId());

			for (Map<String, Object> m : workOrderFaultyType) {

				workOrderFaultyTypeVo.setFaultyTypeSeq(m.get("faultyTypeSeq").toString());
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setApprovalYn("001");

				// 승인 등록
				workOrderFaultyTypeService.approvalUpdate(workOrderFaultyTypeVo);
			}

			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업표준서
	// --------------------------------------------------------------------------

	// 작업표준서 다운로드
	@RequestMapping(value = "/po/workStandardDownload", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workStandardDownload(HttpServletResponse res, HttpServletRequest req, WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		ItemMotorVo vo = new ItemMotorVo();
		try {

			itemMotorVo.setItemCd(workOrderPrcssVo.getItemCd());
			itemMotorVo.setItemRev(workOrderPrcssVo.getItemRev());
		

			vo = itemMotorService.itemWorkStandardRead(itemMotorVo);

			if (vo == null) {
				jsonData.put("result", "notExist");
			} else {
				if (vo.getWorkStandard() == null) {
					jsonData.put("result", "downOk");
				} else {
					String workStandard = new String(Base64.encodeBase64(vo.getWorkStandard()));
					jsonData.put("data", workStandard);
					jsonData.put("result", "openOk");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업표준서 보기
	@RequestMapping(value = "/po/workStandardDownloadNew", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workStandardDownloadNew(HttpServletResponse res, HttpServletRequest req, ItemMotorVo vo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		
		try {

			itemMotorVo.setItemSeq(vo.getItemSeq());
			itemMotorVo.setWorkStandardSeq(vo.getWorkStandardSeq());
		

			vo = itemMotorService.itemWorkStandardPreView(itemMotorVo);

			if (vo == null) {
				jsonData.put("result", "notExist");
			} else {
				if (vo.getWorkStandard() == null) {
					jsonData.put("result", "downOk");
				} else {
					String workStandard = new String(Base64.encodeBase64(vo.getWorkStandard()));
					jsonData.put("data", workStandard);
					jsonData.put("result", "openOk");
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작업표준서 download
	@RequestMapping(value = "/po/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req, ItemMotorVo itemMotorVo)
			throws Exception {
		ItemMotorVo vo = new ItemMotorVo();
		try {
			// 파일명 가져오기
			vo = itemMotorService.itemWorkStandardRead(itemMotorVo);
			String dFile = vo.getWorkStandardNm();
			logger.info(dFile);
			String newFileName = itemMotorVo.getPrcssCd() + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info(newFileName);
			String path = file_Item_Standard_Path + "\\" + itemMotorVo.getItemCd() + "\\" + itemMotorVo.getItemRev()
					+ "\\" + newFileName;

			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}

			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 작업표준서 이미지 파일 외  파일 download
	@RequestMapping(value = "/po/downloadFileNew", method = RequestMethod.GET)
	public @ResponseBody void downloadFileNew(HttpServletResponse res, HttpServletRequest req, ItemMotorVo itemMotorVo)
			throws Exception {
		ItemMotorVo vo = new ItemMotorVo();
		try {
			// 파일명 가져오기
			vo = itemMotorService.itemWorkStandardPreView(itemMotorVo);
			String dFile = vo.getWorkStandardNm();
			logger.info(dFile);
			String newFileName = vo.getItemSeq() + vo.getWorkStandardSeq() + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info(newFileName);
			String path = file_Item_Standard_Path + "/" + vo.getItemSeq() + "/" + vo.getWorkStandardSeq()+ "/" + newFileName;

			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}

			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 작지별 소공정 모니터링 목록조회
	@RequestMapping(value = "/po/workOrdPrcssMonitoringList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrdPrcssMonitoringList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			List<WorkOrderPrcssVo> list = workOrderPrcssService.workOrdPrcssMonitoringList(workOrderPrcssVo);
			if (list == null) {
				list = new ArrayList<>();
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
	
	
	
	// 작업조건
	// --------------------------------------------------------------------------
	
	//작업지시 작업조건 유무
	@RequestMapping(value = "/po/eqWorkHisAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> eqWorkHisAdmListCount(EqWorkHisAdmVo eqWorkHisAdmVo, EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		EqWorkHisAdmVo vo = new EqWorkHisAdmVo();
		EquipCodeAdmVo eqCondVo = new EquipCodeAdmVo();
		EquipCodeAdmVo eqStandVo = new EquipCodeAdmVo();
		logger.info("작업지시 작업조건 목록 vo:"+eqWorkHisAdmVo);
		try {

			int count = eqWorkHisAdmService.listCount(eqWorkHisAdmVo);
			if(count>0) {
				logger.info("이미 등록된 작업조건이 있음");
				vo = eqWorkHisAdmService.listAll(eqWorkHisAdmVo);
				jsonData.put("data", vo);
				jsonData.put("result", "ok");
				return jsonData;
			}else {
				logger.info("이미 등록된 작업조건이 없음:"+ equipCodeAdmVo);
				
				equipCodeAdmVo.setWorkcondiCheck("stand");
				eqStandVo = equipCodeAdmService.eqWorkStandAdmRead(equipCodeAdmVo);
				
				equipCodeAdmVo.setWorkcondiCheck("cond");
				eqCondVo = equipCodeAdmService.eqWorkStandAdmRead(equipCodeAdmVo);
				
				jsonData.put("standData", eqStandVo);
				jsonData.put("condData", eqCondVo);
				jsonData.put("result", "ok");
				return jsonData;
			}

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
	//작업지시 작업조건 등록
	@RequestMapping(value = "/po/eqWorkHisAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> eqWorkHisAdmCreate(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+eqWorkHisAdmVo);
		try {

			if(eqWorkHisAdmService.listCount(eqWorkHisAdmVo)>0) {
				eqWorkHisAdmVo.setUpdId(Utils.getUserId());
				eqWorkHisAdmService.update(eqWorkHisAdmVo);
				
				logger.info("작업조건 수정완료");
			}else {
				eqWorkHisAdmVo.setRegId(Utils.getUserId());
				eqWorkHisAdmService.create(eqWorkHisAdmVo);
				logger.info("작업조건 등록완료");
			}

			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//작업지시 생산시간,비가동시간 계산
	@RequestMapping(value = "/po/getWorkTimeMin", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkTimeMin(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+workOrderPrcssVo);
		try {
	
			String workTime = workOrderPrcssService.getWorkTime(workOrderPrcssVo);  
			String workNonTime = workOrderNonOperationService.getWorkNonTime(workOrderNonOperationVo); 
			
			int realWorkTime = 0;
			int nonWorkTime = 0;
			
			//생산실적 시간이 없을 경우
			if(workTime!=null && workTime!="") {
				realWorkTime = Integer.parseInt(workTime);
			}
			
			//비가동 시간이 없을 경우
			if(workNonTime!=null && workNonTime!="") {
				nonWorkTime = Integer.parseInt(workNonTime);
			}
			
			jsonData.put("realWorkTime", realWorkTime);
			jsonData.put("nonWorkTime", nonWorkTime);
			jsonData.put("result", "ok");
	
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	
		return jsonData;
	}
	
	//작업지시 생산시간,비가동시간 계산
	@RequestMapping(value = "/po/getWorkTime", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getWorkTime(WorkOrderPrcssVo workOrderPrcssVo, WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시 작업조건 vo:"+workOrderPrcssVo);
		try {
	
			String workTime = workOrderPrcssService.getWorkTime(workOrderPrcssVo);  
			String workNonTime = workOrderNonOperationService.getWorkNonTime(workOrderNonOperationVo); 
			
			int realWorkHour = 0;
			int realWorkMin = 0;
			int nonWorkHour = 0;
			int nonWorkMin = 0;
			
			//생산실적 시간이 없을 경우
			if(workTime!=null && workTime!="") {
				int realWorkTime = Integer.parseInt(workTime) - Integer.parseInt(workNonTime);
				
				if(realWorkTime>=60) {
					realWorkHour = realWorkTime/60;
					realWorkMin = realWorkTime%60;
				}else {
					realWorkMin = realWorkTime;
				}
			}
			
			int nonWorkTime = Integer.parseInt(workNonTime);
			
			if(nonWorkTime>=60) {
				nonWorkHour = nonWorkTime/60;
				nonWorkMin = nonWorkTime%60;
			}else {
				nonWorkMin = nonWorkTime;
			}
			
			jsonData.put("realWorkHour", realWorkHour);
			jsonData.put("realWorkMin", realWorkMin);
			jsonData.put("nonWorkHour", nonWorkHour);
			jsonData.put("nonWorkMin", nonWorkMin);
			jsonData.put("result", "ok");
	
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
	
		return jsonData;
	}
	
   // pda 출고요청 바코드 스캔 - 사출
   @RequestMapping(value = "/po/pdaLotNoScan", method = RequestMethod.GET)
   public @ResponseBody Map<String, Object> workOrderPrcss(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
      Map<String, Object> jsonData = new HashMap<String, Object>();
      logger.info("pda 출고요청 바코드 스캔 - 사출: " + workOrderPrcssVo);
      try {
         ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
         itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());
         itemWhsAdmVo.setItemGubun("001");
         
         List<ItemWhsAdmVo> itemWhsAdmList = itemWhsAdmService.itemWhsAdmMainList(itemWhsAdmVo);
         // 1. TB_STOCK_PAYMENT_ADM(재고수불관리 테이블)에서 해당 바코드 존재 여부 확인 
         if ( itemWhsAdmList.size() > 0 ) {
        	 if(itemWhsAdmList.get(0).getRemainQty()>0) {
        		int inQty = itemWhsAdmList.get(0).getInQty(); //재고수량
             	
             	DeliveryOrderAdmVo vo = new DeliveryOrderAdmVo();
             	vo.setLotNo(workOrderPrcssVo.getOrdLotNo());
             	int targetTotalQty = deliveryOrderAdmService.getTargetQty(vo); //요청수량
              	int targetQty = inQty-targetTotalQty;
              	
              	//출고할 수량이 있는지 확인
              	if ( targetQty > 0 ) {
     	           StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
     	           stockVo2.setRealQtyOption("Y");
     	           stockVo2.setBarcodeNo("");
     	           stockVo2.setItemSeq(itemWhsAdmList.get(0).getItemSeq());
     	           stockVo2.setLocationCd(itemWhsAdmList.get(0).getInLoc());
     	           stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
     	           stockVo2.setFifoBarcodeNo(workOrderPrcssVo.getOrdLotNo());
     	           stockVo2.setFifoOption4("Y");
     	           stockVo2.setBarcodeList(workOrderPrcssVo.getBarcodeList());
     	           List<StockPaymentAdmVo> stockList2 = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2);
     	           // 3. TB_STOCK_PAYMENT_ADM(재고수불관리 테이블)에서 선입선출 확인
     	           if(itemWhsAdmList.get(0).getItemFifoGubun().equals("002")
     	                 || ( itemWhsAdmList.get(0).getItemFifoGubun().equals("001") && stockList2.size() <= 0 )) {
     	              // 4. 거래처에 해당하는 품목인지 확인
     	              if ( workOrderPrcssVo.getPoCorpCd() != null && workOrderPrcssVo.getPoCorpCd().equals(itemWhsAdmList.get(0).getItemCus()) ) {
     	                 workOrderPrcssVo = workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo);
     	                 // 5. 생산실적을 통해 만든 품목이 불량인지 확인
     	                 if ( workOrderPrcssVo != null && workOrderPrcssVo.getWorkStatus().equals("003") ) {
     	                    jsonData.put("result", "fail");
     	                    jsonData.put("message", "불량 LOTNO입니다.");
     	                 } else {
     	                    WorkOrderPrcssVo workOrderPrcssVo2 = new WorkOrderPrcssVo();
     	                    workOrderPrcssVo2.setOrdLotNo(itemWhsAdmList.get(0).getBarcodeNo());
     	                    workOrderPrcssVo2.setItemSeq(itemWhsAdmList.get(0).getItemSeq());
     	                    workOrderPrcssVo2.setItemCd(itemWhsAdmList.get(0).getItemCd());
     	                    workOrderPrcssVo2.setFairQty(Integer.toString(targetQty));
     	                    logger.info("reminQty:"+Integer.toString(targetQty));
     	                    jsonData.put("data", workOrderPrcssVo2);
     	                    jsonData.put("result", "ok");
     	                 }
     	                 
     	              } else { // 4번 필터
     	                 jsonData.put("result", "fail");
     	                 jsonData.put("message", "해당 거래처에 출하하는 품목이 아닙니다. 확인해주세요.");
     	              }
     	           } else { // 3번 필터
     	              jsonData.put("result", "fifo");
     	              jsonData.put("message", "이전 LOT가 있습니다.");
     	           }
     	        } else { // 2번 필터
     	           jsonData.put("result", "fail");
     	           jsonData.put("message", "이미 요청되었거나 출고된 바코드입니다. 확인해주세요.");
     	        }
        	 }else {
        		 jsonData.put("result", "fail");
       	     	jsonData.put("message", "이미 출고한 제품입니다. 확인해주세요.");
         	 }
        	
      	 } else { // 1번 필터
	     	jsonData.put("result", "fail");
 	     	jsonData.put("message", "제품바코드가 아니거나 등록되지 않은 바코드 입니다. 확인해주세요.");
	     }
      } catch (Exception e) {
         e.printStackTrace();
         jsonData.put("result", "error");
         jsonData.put("message", Utils.getErrorMessage());
      }
      return jsonData;
   }
   
   

   // pda 출고요청 바코드 스캔 - 봉제
   @RequestMapping(value = "/po/pdaLotNoScanByBongjae", method = RequestMethod.GET)
   public @ResponseBody Map<String, Object> pdaLotNoScanByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
      Map<String, Object> jsonData = new HashMap<String, Object>();
      logger.info("pda 출고요청 바코드 스캔 - 봉제: " + workOrderPrcssVo);
      try {
         ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
         itemWhsAdmVo.setBarcodeNo(workOrderPrcssVo.getOrdLotNo());
         itemWhsAdmVo.setItemGubun("001");
         
         List<ItemWhsAdmVo> itemWhsAdmList = itemWhsAdmService.itemWhsAdmMainList(itemWhsAdmVo);
         // 1. TB_STOCK_PAYMENT_ADM(재고수불관리 테이블)에서 해당 바코드 존재 여부 확인 
         if ( itemWhsAdmList.size() > 0 ) {
        	 if(itemWhsAdmList.get(0).getRemainQty()>0) {
        		 int inQty = itemWhsAdmList.get(0).getInQty(); //재고수량
             	
             	DeliveryOrderAdmVo vo = new DeliveryOrderAdmVo();
             	vo.setLotNo(workOrderPrcssVo.getOrdLotNo());
             	int targetTotalQty = deliveryOrderAdmService.getTargetQty(vo); //요청수량
             	int targetQty = inQty-targetTotalQty;
             	
             	//출고할 수량이 있는지 확인
             	if ( targetQty > 0 ) {
     	           StockPaymentAdmVo stockVo2 = new StockPaymentAdmVo();
     	           stockVo2.setRealQtyOption("Y");
     	           stockVo2.setBarcodeNo("");
     	           stockVo2.setItemSeq(itemWhsAdmList.get(0).getItemSeq());
     	           stockVo2.setLocationCd(itemWhsAdmList.get(0).getInLoc());
     	           stockVo2.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
     	           stockVo2.setFifoBarcodeNo(workOrderPrcssVo.getOrdLotNo());
     	           stockVo2.setFifoOption4("Y");
     	           stockVo2.setBarcodeList(workOrderPrcssVo.getBarcodeList());
     	           List<StockPaymentAdmVo> stockList2 = stockPaymentAdmService.stockPaymentAdmBarcodeList(stockVo2);
     	           // 3. TB_STOCK_PAYMENT_ADM(재고수불관리 테이블)에서 선입선출 확인
     	           if(itemWhsAdmList.get(0).getItemFifoGubun().equals("002")
     	                 || ( itemWhsAdmList.get(0).getItemFifoGubun().equals("001") && stockList2.size() <= 0 )) {
     	              // 4. 거래처에 해당하는 품목인지 확인
     	              if ( workOrderPrcssVo.getPoCorpCd() != null && workOrderPrcssVo.getPoCorpCd().equals(itemWhsAdmList.get(0).getItemCus()) ) {
     	                 workOrderPrcssVo = workOrderPrcssService.workOrderPrcssRead(workOrderPrcssVo);
     	                 // 5. 생산실적을 통해 만든 품목이 불량인지 확인
     	                 if ( workOrderPrcssVo != null && workOrderPrcssVo.getWorkStatus().equals("003") ) {
     	                    jsonData.put("result", "fail");
     	                    jsonData.put("message", "불량 LOTNO입니다.");
     	                 } else {
     	                    WorkOrderPrcssVo workOrderPrcssVo2 = new WorkOrderPrcssVo();
     	                    workOrderPrcssVo2.setOrdLotNo(itemWhsAdmList.get(0).getBarcodeNo());
     	                    workOrderPrcssVo2.setItemSeq(itemWhsAdmList.get(0).getItemSeq());
     	                    workOrderPrcssVo2.setItemCd(itemWhsAdmList.get(0).getItemCd());
     	                    logger.info("reminQty:"+Integer.toString(itemWhsAdmList.get(0).getRemainQty()));
     	                    workOrderPrcssVo2.setFairQty(Integer.toString(targetQty));
     	                    jsonData.put("data", workOrderPrcssVo2);
     	                    jsonData.put("result", "ok");
     	                 }
     	                 
     	              } else { // 4번 필터
     	                 jsonData.put("result", "fail");
     	                 jsonData.put("message", "해당 거래처에 출하하는 품목이 아닙니다. 확인해주세요.");
     	              }
     	           } else { // 3번 필터
     	              jsonData.put("result", "fifo");
     	              jsonData.put("message", "이전 LOT가 있습니다.");
     	           }
             	} else { // 2번 필터
      	           jsonData.put("result", "fail");
      	           jsonData.put("message", "이미 요청된 바코드입니다. 확인해주세요.");
      	        }
        		 
        	 }else {
        		 jsonData.put("result", "fail");
      	     	jsonData.put("message", "이미 출고한 제품입니다. 확인해주세요.");
        	 }
        	
       	 } else { // 1번 필터
 	     	jsonData.put("result", "fail");
 	     	jsonData.put("message", "제품바코드가 아니거나 등록되지 않은 바코드 입니다. 확인해주세요.");
 	     }
      } catch (Exception e) {
         e.printStackTrace();
         jsonData.put("result", "error");
         jsonData.put("message", Utils.getErrorMessage());
      }
      return jsonData;
   }

	//생산실적(봉제)****************************************************************
	//소공정 조회
	@RequestMapping(value = "/po/workOrderPrcssCdList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderPrcssCdList(WorkOrderPrcssVo workOrderPrcssVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderPrcssVo> list = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getItemSeq()!=null && !workOrderPrcssVo.getItemSeq().equals("")) {
				list = workOrderPrcssService.workOrderPrcssCdList(workOrderPrcssVo);
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
	
	// 공정별 작지목록 조회
	@RequestMapping(value = "/po/prcssToWorkOrdNoList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssToWorkOrdNoList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정별 작지목록 조회: " + workOrderPrcssVo); 
		try {
			String workOrdNo = workOrderPrcssVo.getWorkOrdNo();
			
			if (workOrdNo.equals("")) { // 초기 상태
				List<WorkOrderPrcssVo> workOrderPrcssListEmpty = new ArrayList<WorkOrderPrcssVo>();
				jsonData.put("data", workOrderPrcssListEmpty);
				jsonData.put("result", "ok");
			} else {
				
				if (workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssVo).size() == 0) { // 해당 공정에 작지가 없을 경우
					WorkOrderPrcssVo workOrderPrcssInfo = new WorkOrderPrcssVo();
					workOrderPrcssInfo = workOrderPrcssService.getPrcssInfo(workOrderPrcssVo); // 해당 공정의 이전,이후 공정 정보 읽기
					if (workOrderPrcssInfo.getPrcssSeq().equals("1")) { // 해당 공정이 작지의 첫번째 공정일 경우
						List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
						WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
						workOrderPrcssList.add(workOrderPrcssEmpty);
						workOrderPrcssList.get(0).setWorkOrdNo(workOrdNo);

						WorkOrderVo workOrderVo = new WorkOrderVo();
						workOrderVo.setWorkOrdNo(workOrdNo);
						workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
						workOrderPrcssList.get(0).setWorkOrdSeq(1);
						workOrderPrcssList.get(0).setItemCd(workOrderVo.getItemCd());
						workOrderPrcssList.get(0).setItemNm(workOrderVo.getItemNm());
						workOrderPrcssList.get(0).setItemGubun(workOrderVo.getItemGubun());
						workOrderPrcssList.get(0).setItemGubunNm(workOrderVo.getItemGubunNm());
						workOrderPrcssList.get(0).setTargetQty(workOrderVo.getWorkOrdQty());
						workOrderPrcssList.get(0).setEquipCd(workOrderVo.getEquipCd());
						workOrderPrcssList.get(0).setEquipNm(workOrderVo.getEquipNm());
						workOrderPrcssList.get(0).setWorkStatus("");

						jsonData.put("data", workOrderPrcssList);
						jsonData.put("result", "ok");
					} else { // 해당 공정이 작지의 첫번째 공정이 아닐 경우
						logger.info(workOrderPrcssInfo.toString());
						WorkOrderPrcssVo workOrderPrcssNew = new WorkOrderPrcssVo();
						workOrderPrcssNew.setWorkOrdNo(workOrdNo);
						workOrderPrcssNew.setMinorPrcssCd(workOrderPrcssInfo.getPrevLowerPrcssCd());
						workOrderPrcssNew.setMiddlePrcssCd(workOrderPrcssInfo.getPrevMiddlePrcssCd());
						if (workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssNew).size() == 0) { // 이전 공정에 대한 작지도
																										// 없을 경우
							jsonData.put("data", "");
							jsonData.put("result", "ok");
						} else { // 이전공정에 작지가 있을 경우
							List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
							WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
							workOrderPrcssList.add(workOrderPrcssEmpty);
							workOrderPrcssList.get(0).setWorkOrdNo(workOrdNo);

							WorkOrderVo workOrderVo = new WorkOrderVo();
							workOrderVo.setWorkOrdNo(workOrdNo);
							workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
							workOrderPrcssList.get(0).setWorkOrdSeq(1);
							workOrderPrcssList.get(0).setItemCd(workOrderVo.getItemCd());
							workOrderPrcssList.get(0).setItemNm(workOrderVo.getItemNm());
							workOrderPrcssList.get(0).setItemGubun(workOrderVo.getItemGubun());
							workOrderPrcssList.get(0).setItemGubunNm(workOrderVo.getItemGubunNm());
							workOrderPrcssInfo.setWorkOrdNo(workOrdNo);
							workOrderPrcssList.get(0).setTargetQty(Integer.toString(workOrderPrcssService.getOutQty(workOrderPrcssInfo)));
							workOrderPrcssList.get(0).setEquipCd(workOrderVo.getEquipCd());
							workOrderPrcssList.get(0).setEquipNm(workOrderVo.getEquipNm());
							workOrderPrcssList.get(0).setWorkStatus("");

							if (workOrderPrcssService.getOutQty(workOrderPrcssInfo) == 0) {
								workOrderPrcssList.remove(0);
							}

							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						}
					}
				} else { // 해당 공정에 작지가 있을 경우
					List<WorkOrderPrcssVo> workOrderPrcssList = new ArrayList<WorkOrderPrcssVo>();
					workOrderPrcssList = workOrderPrcssService.workOrdPrcssListDtl(workOrderPrcssVo);

					WorkOrderPrcssVo workOrderPrcssInfo = new WorkOrderPrcssVo();
					workOrderPrcssInfo = workOrderPrcssService.getPrcssInfo(workOrderPrcssVo); // 해당 공정의 이전,이후 공정 정보 읽기

					boolean exsit = true;
					for (int i = 0; i < workOrderPrcssList.size(); i++) {
						if (workOrderPrcssList.get(i).getWorkStatus().equals("PD")) { // 대기상태인 작지가 있을 경우
							workOrderPrcssInfo.setWorkOrdNo(workOrdNo);
							if (!workOrderPrcssInfo.getPrcssSeq().equals("1")) { // 해당 공정이 작지의 첫번째 공정이 아닐 경우
								workOrderPrcssList.get(i).setTargetQty(Integer.toString(workOrderPrcssService.getOutToTargetSumNotPD(workOrderPrcssInfo)));
							}
							exsit = false;
							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
							break;
						}
					}
					if (exsit) { // 대기상태인 작지가 없을 경우
						workOrderPrcssVo.setPrevLowerPrcssCd(workOrderPrcssInfo.getPrevLowerPrcssCd());
						workOrderPrcssVo.setPrevMiddlePrcssCd(workOrderPrcssInfo.getPrevMiddlePrcssCd());
						if (workOrderPrcssService.getOutToTargetSum(workOrderPrcssVo) == 0) { // 이전공정출고수량이 현재공정에서 이미
																								// 투입되었을 경우
							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						} else {
							WorkOrderPrcssVo workOrderPrcssEmpty = new WorkOrderPrcssVo();
							workOrderPrcssList.add(workOrderPrcssEmpty);
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkOrdNo(workOrdNo);

							WorkOrderVo workOrderVo = new WorkOrderVo();
							workOrderVo.setWorkOrdNo(workOrdNo);
							workOrderVo = workOrderService.workOrdRead(workOrderVo); // 작업지시 정보 읽기
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkOrdSeq(workOrderPrcssList.size());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemCd(workOrderVo.getItemCd());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemNm(workOrderVo.getItemNm());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemGubun(workOrderVo.getItemGubun());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setItemGubunNm(workOrderVo.getItemGubunNm());

							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setTargetQty(Integer.toString(workOrderPrcssService.getOutToTargetSum(workOrderPrcssVo)));
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setEquipCd(workOrderVo.getEquipCd());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setEquipNm(workOrderVo.getEquipNm());
							workOrderPrcssList.get(workOrderPrcssList.size() - 1).setWorkStatus("");

							jsonData.put("data", workOrderPrcssList);
							jsonData.put("result", "ok");
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 작지 등록처리
	@RequestMapping(value = "/po/workOrdAdd2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdAdd2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 등록처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setWorkStartTime(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms").substring(0,19));
			workOrderPrcssVo.setRegId(Utils.getUserId());
			workOrderPrcssService.create(workOrderPrcssVo);
			
			jsonData.put("count", 0);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작지 수정처리
	@RequestMapping(value = "/po/workOrdEdit2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdEdit2(WorkOrderVo workOrderVo,WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작지 수정처리: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setWorkEndTime(DateUtil.getToday("yyyy-mm-dd hh:mm:ss:ms").substring(0,19));
			workOrderPrcssVo.setUpdId(Utils.getUserId());
			
			if(workOrderPrcssVo.getWorkStatus().equals("WC")) {
				workOrderPrcssService.update(workOrderPrcssVo);
				workOrderPrcssService.updateQtybong(workOrderPrcssVo);
				logger.info("작지 종료시 vo : "+workOrderPrcssVo);
				
			} else{
				workOrderPrcssService.update(workOrderPrcssVo);
			} 
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 비가동등록 등록
	@RequestMapping(value = "/po/workOrderNonOperationCreate2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationCreate2(
			@RequestBody List<Map<String, Object>> WorkOrderNonOperationList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderNonOperationVo workOrderNonOperationVo = new WorkOrderNonOperationVo();
		try {
			int sequence = 1;
			workOrderNonOperationVo.setWorkOrdNo(WorkOrderNonOperationList.get(0).get("workOrdNo").toString());
			workOrderNonOperationVo.setWorkOrdSeq(WorkOrderNonOperationList.get(0).get("workOrdSeq").toString());
			workOrderNonOperationVo.setMiddlePrcssCd(WorkOrderNonOperationList.get(0).get("middlePrcssCd").toString());
			workOrderNonOperationVo.setMinorPrcssCd(WorkOrderNonOperationList.get(0).get("minorPrcssCd").toString());
			for (Map<String, Object> m : WorkOrderNonOperationList) {
				if (sequence == 1) {
					workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
				}
				if (m.get("noGubun").toString() == "") {
					jsonData.put("result", "ok");
					return jsonData;
				}
				workOrderNonOperationVo.setNoSeq(Integer.toString(sequence));
				workOrderNonOperationVo.setNoGubun(m.get("noGubun").toString());
				workOrderNonOperationVo.setNoReason(m.get("noReason").toString());
				workOrderNonOperationVo.setNoStartTime(m.get("noStartTime").toString());
				workOrderNonOperationVo.setNoEndTime(m.get("noEndTime").toString());
				workOrderNonOperationVo.setNoStartDate(m.get("noStartDate").toString());
				workOrderNonOperationVo.setNoEndDate(m.get("noEndDate").toString());
				workOrderNonOperationVo.setNoTime(m.get("noTime").toString());
				workOrderNonOperationVo.setRegId(Utils.getUserId().toString());

				workOrderNonOperationService.workOrderNonOperationCreate(workOrderNonOperationVo);
				sequence++;
			}
			
			//작업지시서 상태값 수정
			workOrderVo.setWorkOrdNo(workOrderNonOperationVo.getWorkOrdNo());
			workOrderVo.setWorkStatusCd("NS");
			workOrderService.update(workOrderVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//비가동 삭제
	@RequestMapping(value = "/po/workOrderNonOperationDelete2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderNonOperationDelete2(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderNonOperationService.workOrderNonOperationDelete(workOrderNonOperationVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	// 작업지시 불량 등록
	@RequestMapping(value = "/po/workOrdInsertQty2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrdInsertQty2(@RequestBody List<Map<String, Object>> workOrdList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderPrcssVo workOrderPrcssVo = new WorkOrderPrcssVo();
		WorkOrderFaultyTypeVo workOrderFaultyTypeVo = new WorkOrderFaultyTypeVo();
		logger.info("작지 불량수량 입력: " + workOrderPrcssVo);
		try {
			//작업지시 총 불량수정
			workOrderPrcssVo.setWorkOrdNo(workOrdList.get(0).get("workOrdNo").toString());
			workOrderPrcssVo.setWorkOrdSeq(Integer.parseInt(workOrdList.get(0).get("workOrdSeq").toString()));
			workOrderPrcssVo.setMiddlePrcssCd(workOrdList.get(0).get("middlePrcssCd").toString());
			workOrderPrcssVo.setMinorPrcssCd(workOrdList.get(0).get("minorPrcssCd").toString());
			
			workOrderPrcssVo.setFairQty(workOrdList.get(0).get("fairQty").toString());
			workOrderPrcssVo.setFaultyQty(workOrdList.get(0).get("faultyQtySum").toString());
			workOrderPrcssService.updateQtybong(workOrderPrcssVo);
			
			for(Map<String, Object> m :workOrdList) {
				
				workOrderFaultyTypeVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workOrderFaultyTypeVo.setWorkOrdSeq(m.get("workOrdSeq").toString());
				workOrderFaultyTypeVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
				workOrderFaultyTypeVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				workOrderFaultyTypeVo.setFaultyTypeSeq("0");
				workOrderFaultyTypeVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				workOrderFaultyTypeVo.setFaultyTypeQty(m.get("faultyQty").toString());
				workOrderFaultyTypeVo.setFaultyTypeDate(m.get("faultyTypeDate").toString());
				workOrderFaultyTypeVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				
				logger.info("vo:"+workOrderFaultyTypeVo);
				logger.info("list size:"+workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size());
				//작업지시 lotNo별 불량유형이 있을 경우 -> 수정
				if(workOrderFaultyTypeService.listAll(workOrderFaultyTypeVo).size()!=0) {
					workOrderFaultyTypeVo.setUpdId(Utils.getUserId());
					workOrderFaultyTypeService.update(workOrderFaultyTypeVo);
				  
				}else {
					//작업지시 lotNo별 불량유형이 없을 경우 -> 등록
					workOrderFaultyTypeVo.setRegId(Utils.getUserId());
					workOrderFaultyTypeService.createList(workOrderFaultyTypeVo); 
				}
			}
			
			workOrderFaultyTypeVo.setFaultyTypeCd("000026");
			int faultyTypeSumQty = workOrderFaultyTypeService.getFaultyTypeSumQty(workOrderFaultyTypeVo);
			jsonData.put("faultyTypeSumQty", faultyTypeSumQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 자재투입(사출)
	@RequestMapping(value = "/po/matrlBarcodeNoScan2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlBarcodeNoScan2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재투입 vo: " + workOrderMatrlVo);
		try {
			WorkOrderMatrlVo matrlVo = new WorkOrderMatrlVo();
			matrlVo.setWorkOrdNo(workOrderMatrlVo.getWorkOrdNo());
			matrlVo.setWorkOrdSeq(workOrderMatrlVo.getWorkOrdSeq());
			matrlVo.setMinorPrcssCd(workOrderMatrlVo.getMinorPrcssCd());
			matrlVo.setMiddlePrcssCd(workOrderMatrlVo.getMiddlePrcssCd());
			matrlVo.setBarcodeNo(workOrderMatrlVo.getBarcodeNo());
			matrlVo.setItemSeq(workOrderMatrlVo.getBarcodeNo().substring(0,6));
			matrlVo.setMatrlDate(workOrderMatrlVo.getMatrlDate());
			matrlVo.setTotalConsumpt(Float.parseFloat("0.00"));
			matrlVo.setRegId(Utils.getUserId());
			workOrderMatrlService.workOrdMatrlAdd(matrlVo); // 작업지시 자재투입처리
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//불량등록 조회
	@RequestMapping(value = "/po/workOrderFaultyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량등록 조회: " + workOrderFaultyTypeVo);
		try {
			List<WorkOrderFaultyTypeVo> list = workOrderFaultyTypeService.workOrderFaultyList(workOrderFaultyTypeVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//이전 자재 조회
	@RequestMapping(value = "po/stockPaymentAdmBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이전 자재 조회: "+stockPaymentAdmVo);
		try {
			List<StockPaymentAdmVo> list = new ArrayList<StockPaymentAdmVo>();
			if(stockPaymentAdmVo.getLocationCd()!=null && !stockPaymentAdmVo.getLocationCd().equals("")) {
				list =  stockPaymentAdmService.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
				if(list==null || list.size()==0) {
					list = new ArrayList<StockPaymentAdmVo>();
				}
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
}