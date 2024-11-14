package mes.web.bs;

import java.util.HashMap;
import java.util.List;
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
import mes.domain.bs.AchieveAdmVo;
import mes.domain.bs.ObjectiveAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.ObjectiveAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping
public class ObjectiveAdmController {
	
	@Inject
	private ObjectiveAdmService objectiveAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ObjectiveAdmController.class);
	
	@RequestMapping(value="/bssc0010",method = RequestMethod.GET)
	public String bssc0010(Model model) throws Exception{
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("069"); // KPI
		List<CommonCodeAdmVo> kpiList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("kpiCode", kpiList);
		
		return "bs/bssc0010";
	};
	
	//목표관리 목록 조회
	@RequestMapping(value = "bs/objectiveAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> objectiveAdmDataList(ObjectiveAdmVo objectiveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("목표관리 목록 조회: " + objectiveAdmVo);
		try {
			
			List<ObjectiveAdmVo> list = objectiveAdmService.listAll(objectiveAdmVo);
			
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
	
	//목표관리 모달 조회
	@RequestMapping(value = "bs/objectiveAdmReadDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> objectiveAdmReadDataList(ObjectiveAdmVo objectiveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("목표관리 모달 조회: " + objectiveAdmVo);
		try {
			
			List<ObjectiveAdmVo> list = objectiveAdmService.read(objectiveAdmVo);
			
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
	
	// 목표관리 등록
	@RequestMapping(value = "bs/objectiveAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> objectiveAdmCreate(@RequestBody List<Map<String, Object>> objectiveAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ObjectiveAdmVo objectiveAdmVo = new ObjectiveAdmVo();
		logger.info("목표관리 등록: " + objectiveAdmList);
		try {		
			objectiveAdmVo.setObjYear(objectiveAdmList.get(0).get("objYear").toString());
			objectiveAdmService.delete(objectiveAdmVo);
			for(Map<String, Object> m : objectiveAdmList) {		
				objectiveAdmVo = new ObjectiveAdmVo();
				objectiveAdmVo.setObjYear(m.get("objYear").toString());
				objectiveAdmVo.setKpi(m.get("kpi").toString());
				objectiveAdmVo.setObjGubun(m.get("objGubun").toString());
				objectiveAdmVo.setWeight(m.get("weight").toString());
				objectiveAdmVo.setJan(m.get("jan").toString());
				objectiveAdmVo.setFeb(m.get("feb").toString());
				objectiveAdmVo.setMar(m.get("mar").toString());
				objectiveAdmVo.setApr(m.get("apr").toString());
				objectiveAdmVo.setMay(m.get("may").toString());
				objectiveAdmVo.setJun(m.get("jun").toString());
				objectiveAdmVo.setJul(m.get("jul").toString());
				objectiveAdmVo.setAug(m.get("aug").toString());
				objectiveAdmVo.setSep(m.get("sep").toString());
				objectiveAdmVo.setOct(m.get("oct").toString());
				objectiveAdmVo.setNov(m.get("nov").toString());
				objectiveAdmVo.setDec(m.get("dec").toString());
				objectiveAdmVo.setRegId(Utils.getUserId());
				objectiveAdmService.create(objectiveAdmVo);
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


