package mes.web.qm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.math3.geometry.spherical.oned.ArcsSet.Split;
import org.apache.poi.util.Units;
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
import mes.domain.qm.UnfitAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.UnfitAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;


@Controller
public class UnfitAdmController {
	private static final Logger logger = LoggerFactory.getLogger(UnfitAdmController.class);
	
	@Inject
	private UnfitAdmService unfitAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	
	//부적합관리대장(수입,공정,출하) 페이지
	@RequestMapping(value = "/qmsc0170")
	public String qmsc0170(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		return "qm/qmsc0170";
	}
	
	//부적합관리대장(봉제) 페이지
	@RequestMapping(value = "/qmsc0250")
	public String qmsc0250(Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("138"); // 부적합관리대장구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("139"); // 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		commonCodeVo.setBaseGroupCd("156"); // 봉제 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitBjProc", unfitList);
		
		return "qm/qmsc0250";
	}
	
	// 부적합창고현황 메인
	@RequestMapping(value = "/tmsc0390", method = RequestMethod.GET)
	public String tmsc0390(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverMonthFrom", DateUtil.getDay("yyyy-mm-dd", -365));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();

		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		List<CommonCodeAdmVo> commonList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubunList", commonList);

		commonCodeVo.setBaseGroupCd("112"); // 사출/봉제
		commonList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubunList", commonList);

		commonCodeVo.setBaseGroupCd("073"); // 창고코드
		commonList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("locCd", commonList);

		commonCodeVo.setBaseGroupCd("157"); // 사출/봉제 부적합관리구분
		commonList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubunList", commonList);
		
		return "tm/tmsc0390";
	}
	
	//부적합관리현황 메인
	@RequestMapping(value = "/qmsc0260", method = RequestMethod.GET)
	public String qmsc0260(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverMonth", DateUtil.getToday("yyyy-mm-dd").substring(0, 7));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("157"); // 사출/봉제 부적합관리구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("156"); // 봉제 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitProc", unfitList);
		
		commonCodeVo.setBaseGroupCd("112"); // 공정
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", unfitList);
		
		commonCodeVo.setBaseGroupCd("156"); // 봉제 부적합처리
		commonCodeVo.setUseYn("001");
		unfitList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("unfitBjProc", unfitList);
		
		return "qm/qmsc0260";
	}
	
	//부적합관리대장 목록조회
	@RequestMapping(value = "qm/unfitAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if (unfitAdmVo.getUnfitGubun().equals("001")) { //수입 
				list = unfitAdmService.unfitInspectAdmList(unfitAdmVo);
			} else if (unfitAdmVo.getUnfitGubun().equals("002")) { //공정
				if (unfitAdmVo.getMainGubun().equals("001")) { //사출
					list = unfitAdmService.unfitPrcssAdmInjectList(unfitAdmVo);
				} else { //봉제
					list = unfitAdmService.unfitPrcssAdmList(unfitAdmVo);
				}
			} else if (unfitAdmVo.getUnfitGubun().equals("003")) { //출하
				list = unfitAdmService.unfitCompleteAdmList(unfitAdmVo);
			} else { //단품불량 (봉제에만 있음)
				list = unfitAdmService.unfitPriceAdmList(unfitAdmVo);
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
	
	//부적합관리현황 목록조회
	@RequestMapping(value = "qm/unfitAdmSituList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리현황 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if (unfitAdmVo.getUnfitGubun().equals("001")) { //수입
				list = unfitAdmService.unfitInspectAdmSituList(unfitAdmVo);
			} else if (unfitAdmVo.getUnfitGubun().equals("002")) { //공정
				if (unfitAdmVo.getMainGubun().equals("001")) { //사출
					list = unfitAdmService.unfitPrcssAdmInjectSituList(unfitAdmVo);
				} else { //봉제
					list = unfitAdmService.unfitPrcssAdmSituList(unfitAdmVo);
				}
			} else if (unfitAdmVo.getUnfitGubun().equals("003")) { //출하
				list = unfitAdmService.unfitCompleteAdmSituList(unfitAdmVo);
			} else { //단품불량 (봉제에만 있음)
				list = unfitAdmService.unfitPriceAdmSituList(unfitAdmVo);
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
	
	//부적합관리대장(수입) 목록조회
	@RequestMapping(value = "qm/unfitInspectAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(수입) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitInspectAdmList = unfitAdmService.unfitInspectAdmList(unfitAdmVo);
			jsonData.put("data", unfitInspectAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(공정) 목록조회
	@RequestMapping(value = "qm/unfitPrcssAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(공정) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitPrcssAdmList = unfitAdmService.unfitPrcssAdmList(unfitAdmVo);
			jsonData.put("data", unfitPrcssAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(출하) 목록조회
	@RequestMapping(value = "qm/unfitCompleteAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(출하) 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> unfitCompleteAdmList = unfitAdmService.unfitCompleteAdmList(unfitAdmVo);
			jsonData.put("data", unfitCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(수입,공정,출하) 등록, 수정
	@RequestMapping(value = "qm/unfitAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(수입,공정,출하) 등록, 수정 : " + unfitAdmVo);
		try {
			if (unfitAdmService.unfitAdmCheck(unfitAdmVo) == 0) {//데이터가 없으면 등록
				//부적합번호(PK) 구하기
				String unfitToday = DateUtil.getToday("YYYYMMdd");
				unfitAdmVo.setUnfitToday(unfitToday);
				String unfitNo = unfitAdmService.getUnfitNo(unfitAdmVo);
				unfitAdmVo.setUnfitNo(unfitToday + "-" + unfitNo);
				
				unfitAdmVo.setRegId(Utils.getUserId());
				unfitAdmService.unfitAdmCreate(unfitAdmVo);
				jsonData.put("addEditCheck", "등록");
			} else {//데이터가 있으면 수정
				unfitAdmVo.setUpdId(Utils.getUserId());
				unfitAdmService.unfitAdmUpdate(unfitAdmVo);
				jsonData.put("addEditCheck", "수정");
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//불량유형 합계(공정)
	@RequestMapping(value = "qm/faultyTypeTotalList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(공정) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if (unfitAdmVo.getUnfitGubun().equals("001")) { //수입
				list = unfitAdmService.faultyTypeTotalList2(unfitAdmVo);
			} else if (unfitAdmVo.getUnfitGubun().equals("002")) { //공정
				if (unfitAdmVo.getMainGubun().equals("001")) { //사출
					list = unfitAdmService.faultyTypeTotalInjectList(unfitAdmVo);
				} else { //봉제
					list = unfitAdmService.faultyTypeTotalList(unfitAdmVo);
				}
			} else if (unfitAdmVo.getUnfitGubun().equals("003")) { //출하
				list = unfitAdmService.faultyTypeTotalList3(unfitAdmVo);
			} else { //단품불량 (봉제에만 있음)
				list = unfitAdmService.faultyTypeTotalList4(unfitAdmVo);
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
	
	//불량유형 합계(수입)
	@RequestMapping(value = "qm/faultyTypeTotalList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(수입) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.faultyTypeTotalList2(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//불량유형 합계(출하)
	@RequestMapping(value = "qm/faultyTypeTotalList3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량유형 합계(출하) : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.faultyTypeTotalList3(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//불량cavity
	@RequestMapping(value = "qm/faultyTypeCavityList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량cavity : " + unfitAdmVo);
		try {
			
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if(unfitAdmVo.getFaultyCd()!=null && !unfitAdmVo.getFaultyCd().equals("")) {
				list = unfitAdmService.faultyTypeCavityList(unfitAdmVo);
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
	
	//부적합관리대장(봉제) 결과 등록
	@RequestMapping(value = "qm/unfitResultCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultCreate(@RequestBody List<Map<String, Object>> unfitList) throws Exception {
		logger.info("부적합관리대장(봉제) 결과 등록 : qm/unfitResultCreate");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			//등록하기 전 먼저 이미 등록한 데이터가 있는 지 확인
			Object unfitNoAndLotArrayObj = unfitList.get(0).get("unfitNoAndLotArray");
			ArrayList<?> unfitNoAndLotArrayList = (ArrayList<?>) unfitNoAndLotArrayObj;
	        String[] unfitNoAndLotArray = unfitNoAndLotArrayList.toArray(new String[0]);
	        
			UnfitAdmVo unfitAdmListVo = new UnfitAdmVo();
			unfitAdmListVo.setUnfitNoAndLotArray(unfitNoAndLotArray);
			List<UnfitAdmVo> unfitResultList = unfitAdmService.unfitResultList(unfitAdmListVo);
			
			if ( unfitResultList.size() <= 0 ) {
				List<UnfitAdmVo> unfitResultInsList = new ArrayList<UnfitAdmVo>();
				for(Map<String, Object> m : unfitList) {
					UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
					unfitAdmVo.setUnfitNo(m.get("unfitNo").toString());
					unfitAdmVo.setUnfitGubun(m.get("unfitGubun").toString());
					unfitAdmVo.setItemSeq(m.get("itemSeq").toString());
					unfitAdmVo.setItemCus(m.get("itemCus").toString());
					unfitAdmVo.setUnfitLot(m.get("unfitLot").toString());
					unfitAdmVo.setUnfitProc(m.get("unfitProc").toString());
					unfitAdmVo.setUnfitFaultyDate(m.get("unfitFaultyDate").toString());
					unfitAdmVo.setUnfitFaultyChargr(m.get("unfitFaultyChargr").toString());
					unfitAdmVo.setUnfitPairCnt(m.get("unfitPairCnt").toString());
					unfitAdmVo.setUnfitFaultyCnt(m.get("unfitFaultyCnt").toString());
					unfitAdmVo.setUnfitOtherCnt(m.get("unfitOtherCnt").toString());
					unfitAdmVo.setUnfitDesc(m.get("unfitDesc").toString());
					unfitAdmVo.setRegId(Utils.getUserId());
					
					unfitResultInsList.add(unfitAdmVo);
				}
				
				//서버에서 지원하는 최대 매개변수의 제한으로 인해 나눠서 등록
				int parameterNum = 150;
				for ( int finishIdx = 0; finishIdx < unfitResultInsList.size(); finishIdx+=parameterNum ) {
					if ( finishIdx+parameterNum >= unfitResultInsList.size()) {
						List<UnfitAdmVo> tempList = unfitResultInsList.subList(finishIdx, unfitResultInsList.size());
						int returnCheck = unfitAdmService.unfitResultListCreate(tempList);
					} else {
						List<UnfitAdmVo> tempList = unfitResultInsList.subList(finishIdx, finishIdx+parameterNum);
						int returnCheck = unfitAdmService.unfitResultListCreate(tempList);
					}
				}
				jsonData.put("result", "ok");
			} else { //이미 등록된 데이터가 있음
				jsonData.put("result", "alreadyFail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(봉제) 결과 수정
	@RequestMapping(value = "qm/unfitResultUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultUpdate(@RequestBody List<Map<String, Object>> unfitList) throws Exception {
		logger.info("부적합관리대장(봉제) 결과 수정 : qm/unfitResultUpdate");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			for(Map<String, Object> m :unfitList) {
				UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
				unfitAdmVo.setUnfitResultNo(m.get("unfitResultNo").toString());
				unfitAdmVo.setUnfitProc(m.get("unfitProc").toString());
				unfitAdmVo.setUnfitFaultyDate(m.get("unfitFaultyDate").toString());
				unfitAdmVo.setUnfitFaultyChargr(m.get("unfitFaultyChargr").toString());
				unfitAdmVo.setUnfitPairCnt(m.get("unfitPairCnt").toString());
				unfitAdmVo.setUnfitFaultyCnt(m.get("unfitFaultyCnt").toString());
				unfitAdmVo.setUnfitOtherCnt(m.get("unfitOtherCnt").toString());
				unfitAdmVo.setUnfitDesc(m.get("unfitDesc").toString());
				unfitAdmVo.setUpdId(Utils.getUserId());
				unfitAdmService.unfitResultUpdate(unfitAdmVo);
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리현황(봉제) 결과 수정
	@RequestMapping(value = "qm/unfitResultLotUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultLotUpdate(@RequestBody List<Map<String, Object>> unfitList) throws Exception {
		logger.info("부적합관리대장(봉제) 결과 수정 : qm/unfitResultUpdate");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			for(Map<String, Object> m :unfitList) {
				
				
				UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
				logger.info("!!!!!!!!!!!!!!!"+m.get("unfitResultNoArray").toString().split(","));
				unfitAdmVo.setUnfitResultNoArray(m.get("unfitResultNoArray").toString().split(","));
				unfitAdmVo.setUnfitProc(m.get("unfitProc").toString());
				unfitAdmVo.setUnfitFaultyDate(m.get("unfitFaultyDate").toString());
				unfitAdmVo.setUnfitFaultyChargr(m.get("unfitFaultyChargr").toString());
				unfitAdmVo.setUnfitPairCnt(m.get("unfitPairCnt").toString());
				unfitAdmVo.setUnfitFaultyCnt(m.get("unfitFaultyCnt").toString());
				unfitAdmVo.setUnfitOtherCnt(m.get("unfitOtherCnt").toString());
				unfitAdmVo.setUnfitDesc(m.get("unfitDesc").toString());
				unfitAdmVo.setUpdId(Utils.getUserId());
				unfitAdmService.unfitResultUpdate2(unfitAdmVo);
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(봉제) 결과 삭제
	@RequestMapping(value = "qm/unfitResultDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> unfitResultDelete(UnfitAdmVo unfitAdmVo) throws Exception {
		logger.info("부적합관리대장(봉제) 결과 삭제 : qm/unfitResultDelete");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			unfitAdmService.unfitResultDelete(unfitAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장 조회
	@RequestMapping(value = "qm/unfitResultList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 조회: "+ unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.unfitResultList(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장 조회
	@RequestMapping(value = "qm/unfitResultStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitResultStatusList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 조회: "+ unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.unfitResultStatusList(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장 상세조회
	@RequestMapping(value = "/qm/unfitResultRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장 상세조회: "+ unfitAdmVo);
		try {
			unfitAdmVo = unfitAdmService.unfitResultRead(unfitAdmVo);
			jsonData.put("data", unfitAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}

	//부적합관리대장(사출) 우측 불량유형별 품명 조회
	@RequestMapping(value = "qm/unfitFaultyRight001List", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitFaultyRight001List(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(사출) 우측 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = unfitAdmService.unfitFaultyRight001List(unfitAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합관리대장(봉제) 우측 불량유형별 품명 조회
	@RequestMapping(value = "qm/unfitFaultyRightList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> unfitFaultyRightList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리대장(봉제) 우측 목록조회 : " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if (unfitAdmVo.getUnfitGubun().equals("002")) { //공정
				if (unfitAdmVo.getMainGubun().equals("001")) { //사출
					list = unfitAdmService.unfitFaultyRight002List(unfitAdmVo);
				} else { //봉제
					list = unfitAdmService.unfitFaultyRight002List(unfitAdmVo);
				}
			} else if (unfitAdmVo.getUnfitGubun().equals("004")) { //단품불량 (봉제에만 있음)
				list = unfitAdmService.unfitFaultyRight004List(unfitAdmVo);
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
	
	//부적합창고현황 메인 조회
	@RequestMapping(value = "qm/stockPaymentUnfitList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentUnfitList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합창고현황 메인 조회: " + unfitAdmVo);
		try {
			List<UnfitAdmVo> stockPaymentUnfitList = unfitAdmService.stockPaymentUnfitList(unfitAdmVo);
			jsonData.put("data", stockPaymentUnfitList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합창고현황 창고별 조회
	@RequestMapping(value = "qm/stockPaymentUnfitLocList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentUnfitLocList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합창고현황 창고별 조회: " + unfitAdmVo);
		try {
			List<UnfitAdmVo> stockPaymentUnfitLocList = unfitAdmService.stockPaymentUnfitLocList(unfitAdmVo);
			jsonData.put("data", stockPaymentUnfitLocList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부적합창고현황 바코드별 조회
	@RequestMapping(value = "qm/stockPaymentUnfitBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> stockPaymentUnfitBarcodeList(UnfitAdmVo unfitAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합창고현황 바코드별 조회: " + unfitAdmVo);
		try {
			List<UnfitAdmVo> list = new ArrayList<UnfitAdmVo>();
			if (unfitAdmVo.getItemSeq() != null && !unfitAdmVo.getItemSeq().equals("")) {
				list = unfitAdmService.stockPaymentUnfitBarcodeList(unfitAdmVo);
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
