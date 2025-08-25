package mes.web.tm;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.domain.tm.PrcssUserReportVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.PrcssCodeAdmService;
import mes.service.tm.PrcssUserReportService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PrcssUserReportController {
	
	@Inject
	private PrcssUserReportService prcssUserReportService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private PrcssCodeAdmService prcssCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(PrcssUserReportController.class);
	
	//생산 작업일보 로그인 페이지
	@RequestMapping(value = "/auth/tmsc0370", method = RequestMethod.GET)
	public String tmsc0370(Model model) throws Exception {
		logger.info("생산 작업일보 로그인 페이지");
		try {
			PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
			prcssCodeAdmVo.setPrcssType("001"); // 마스터만 조회되도록
			List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);
			model.addAttribute("prcssCode", prcssCodeAdmList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "auth/tmsc0370";
	}
	
	//생산 작업일보 로그아웃
	@RequestMapping(value = "/auth/logoutPrcss", method = {RequestMethod.GET,RequestMethod.POST})
	public void logoutPrcss(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		session.invalidate();
		Cookie cookieUserId = new Cookie("userId", null);
		cookieUserId.setMaxAge(0);
		cookieUserId.setPath("/");
		response.addCookie(cookieUserId);
		//Cookie cookieUserPw = new Cookie("userPw", null);
		//cookieUserPw.setMaxAge(0);
		//cookieUserPw.setPath("/");
		//response.addCookie(cookieUserPw);
		response.sendRedirect("/auth/tmsc0370");
	}
	
	//생산 작업일보 등록 메인
	@RequestMapping(value = "/tmsc0371", method = RequestMethod.GET)
	public String tmsc0371(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("생산 작업일보 등록");
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("099"); // 차종
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemModelList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemModel", itemModelList);
		
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		prcssCodeAdmVo.setPrcssCd(Utils.getUserDepartmentCd().split("\\|")[0]); // TB_PRCSS_USER_ADM - PRCSS_IDX
		List<PrcssCodeAdmVo> workDtlList = prcssCodeAdmService.prcssCodeSubList(prcssCodeAdmVo);
		model.addAttribute("workDtl", workDtlList);
		
		prcssCodeAdmVo.setPrcssType("001");
		model.addAttribute("prcssNm", prcssCodeAdmService.prcssCodeAdmRead(prcssCodeAdmVo).getPrcssNm());
		
		return "tm/tmsc0371";
	}
	
	//작업자별 작업일보 조회 메인
	@RequestMapping(value = "/wmsc0290", method = RequestMethod.GET)
	public String wmsc0290(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("작업자별 작업일보 조회");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("099");
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemModelList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemModel", itemModelList); //차종
		
		PrcssCodeAdmVo prcssCodeAdmVo = new PrcssCodeAdmVo();
		List<PrcssCodeAdmVo> puaIdxList = prcssCodeAdmService.prcssUserAdmList(prcssCodeAdmVo);
		model.addAttribute("puaIdx", puaIdxList); // 작업자
		
		prcssCodeAdmVo.setPrcssType("001"); // 마스터만 조회되도록
		List<PrcssCodeAdmVo> prcssCodeAdmList = prcssCodeAdmService.prcssCodeAdmList(prcssCodeAdmVo);
		model.addAttribute("prcssCode", prcssCodeAdmList); //공정
		
		return "wm/wmsc0290";
	}
	
	//list
	@RequestMapping(value="tm/prcssUserReportList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> prcssUserReportList(PrcssUserReportVo prcssUserReportVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업자별 작업일보 조회: " + prcssUserReportVo);
		try {
			List<PrcssUserReportVo> list = prcssUserReportService.prcssUserReportList(prcssUserReportVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//create
	@RequestMapping(value="tm/prcssUserReportCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> prcssUserReportCreate(PrcssUserReportVo prcssUserReportVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업자별 작업일보 등록 :" + prcssUserReportVo);
		try {
			prcssUserReportVo.setRegId(Utils.getUserNumber());
			prcssUserReportService.prcssUserReportCreate(prcssUserReportVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}