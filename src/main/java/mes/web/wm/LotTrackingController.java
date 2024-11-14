package mes.web.wm;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class LotTrackingController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(LotTrackingController.class);
	
	//===================================== LOT추적상세 =========================================
	//LOT추적상세 메인
	@RequestMapping(value = "/wmsc0200", method = RequestMethod.GET)
	public String wmsc0200Main(Locale locale, Model model) throws Exception {
		logger.info("LOT추적상세");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0200";
	}
		
	//생산LOT현황 메인
	@RequestMapping(value = "/wmsc0080", method = RequestMethod.GET)
	public String wmsc0080Main(Locale locale, Model model) throws Exception {
		logger.info("생산LOT현황 메인");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0080";
	}
	
	//투입LOT현황 메인
	@RequestMapping(value = "/wmsc0090", method = RequestMethod.GET)
	public String wmsc0090Main(Locale locale, Model model) throws Exception {
		logger.info("투입LOT현황 메인");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0090";
	}
	
	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList1", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산LOT추적 목록조회: " + workOrderPrcssVo);
		try {
			//1.생산LOT추적
			List<WorkOrderPrcssVo> lotTrackList1 = new ArrayList<WorkOrderPrcssVo>();
			if(!workOrderPrcssVo.getLotTrackGubun().equals("")) {
				if(workOrderPrcssVo.getLotTrackGubun().equals("2")) {
					if(workOrderPrcssVo.getMainGubun().equals("002")) {
						lotTrackList1 = workOrderPrcssService.lotTrackList8(workOrderPrcssVo); //봉제
						logger.info("로트추적 성공!");	
					}else {
						lotTrackList1 = workOrderPrcssService.lotTrackList10(workOrderPrcssVo); //사출
						logger.info("로트추적 성공!");	
					}
					
				}else {
					if(workOrderPrcssVo.getMainGubun().equals("002")) {
						lotTrackList1 = workOrderPrcssService.lotTrackList1(workOrderPrcssVo);
						logger.info("로트추적 성공!");	
					}else {
						lotTrackList1 = workOrderPrcssService.lotTrackList10(workOrderPrcssVo); //사출
						logger.info("로트추적 성공!");	
					}
					
				}
				
			}
			
			jsonData.put("data", lotTrackList1);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재LOT추적 목록조회: " + workOrderPrcssVo);
		try {
			
			//2.자재LOT추적
			List<WorkOrderMatrlVo> lotTrackList2 = new ArrayList<WorkOrderMatrlVo>();
			if(workOrderPrcssVo.getLotTrackGubun()!=null && !workOrderPrcssVo.getLotTrackGubun().equals("")) {
				lotTrackList2 = workOrderPrcssService.lotTrackList2(workOrderPrcssVo);
			}
			
			jsonData.put("data", lotTrackList2);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList3(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("불량LOT추적 목록조회: " + workOrderPrcssVo);
		try {
			
			//3.불량LOT추적
			List<WorkOrderPrcssVo> lotTrackList3 = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getLotTrackGubun()!=null && !workOrderPrcssVo.getLotTrackGubun().equals("")) {
				lotTrackList3 = workOrderPrcssService.lotTrackList3(workOrderPrcssVo);
			}
			
			jsonData.put("data", lotTrackList3);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList4", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList4(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시번호 목록조회: " + workOrderPrcssVo);
		try {
			//3.불량LOT추적
			List<WorkOrderPrcssVo> lotTrackList4 = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getLotTrackGubun()!=null && !workOrderPrcssVo.getLotTrackGubun().equals("")) {
				lotTrackList4 = workOrderPrcssService.lotTrackList4(workOrderPrcssVo);
			}
			
			jsonData.put("data", lotTrackList4);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ===================================== LOT추적 =========================================
	//LOT추적(사출) 메인
	@RequestMapping(value = "/wmsc0210", method = RequestMethod.GET)
	public String wmsc0210Main(Locale locale, Model model) throws Exception {
		logger.info("LOT추적(사출)");
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("itemCusList", itemCusList );
		
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		itemPartAdmVo.setMainGubun("001");
		itemPartAdmVo.setOrderByItemNm("Y");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);
		
		return "wm/wmsc0210";
	}
	
	//LOT추적(봉제) 메인
	@RequestMapping(value = "/wmsc0280", method = RequestMethod.GET)
	public String wmsc0280(Locale locale, Model model) throws Exception {
		logger.info("LOT추적(봉제)");
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("itemCusList", itemCusList );
		
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		itemPartAdmVo.setMainGubun("002");
		itemPartAdmVo.setOrderByItemNm("Y");
		
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);
		
		ItemPartAdmVo itemPartAdmVo2 = new ItemPartAdmVo();
		String[] itemGubunList = {"001","003"};
		itemPartAdmVo2.setItemGubunList(itemGubunList);
		itemPartAdmVo2.setMainGubun("002");
		itemPartAdmVo2.setOrderByItemCd("Y");
		List<ItemPartAdmVo> ItemPartAdmVoList2 = itemPartAdmService.itemPartAdmList(itemPartAdmVo2);
		model.addAttribute("itemList2", ItemPartAdmVoList2);
		
		return "wm/wmsc0280";
	}
	
	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList5", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList5(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시번호 목록조회: " + workOrderPrcssVo);
		try {
			//5.출하 LOT추적
			List<WorkOrderPrcssVo> lotTrackList5 = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getLotTrackGubun()!=null && !workOrderPrcssVo.getLotTrackGubun().equals("")) {
				
				if(workOrderPrcssVo.getLotTrackGubun().equals("2")) {
					lotTrackList5 = workOrderPrcssService.lotTrackList9(workOrderPrcssVo);
					logger.info("로트추적 성공!");	
				}else {
					lotTrackList5 = workOrderPrcssService.lotTrackList5(workOrderPrcssVo);
					logger.info("로트추적 성공!");	
				}
			}
			
			jsonData.put("data", lotTrackList5);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//LOT추적 자재LOT 재고현황
	@RequestMapping(value = "/wm/lotTrackStockPaymentList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackStockPaymentList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("LOT추적 자재LOT 재고현황 목록조회: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			logger.info(workOrderPrcssVo.getTmMon());
			List<WorkOrderMatrlVo> lotTrackList = workOrderPrcssService.lotTrackStockPaymentList2(workOrderPrcssVo);
			jsonData.put("data", lotTrackList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//LOT추적 생산LOT 재고현황
	@RequestMapping(value = "/wm/lotTrackStockPaymentList1", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackStockPaymentList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("LOT추적 생산LOT 재고현황 목록조회: " + workOrderPrcssVo);
		try {
			workOrderPrcssVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
			logger.info(workOrderPrcssVo.getTmMon());
			List<WorkOrderMatrlVo> lotTrackList = workOrderPrcssService.lotTrackStockPaymentList1(workOrderPrcssVo);
			jsonData.put("data", lotTrackList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산LOT조회(봉제)
	@RequestMapping(value = "/wm/lotTrackList6", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackList6(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("생산 LOTNO 목록조회: " + workOrderPrcssVo);
		try {
			//3.불량LOT추적
			List<WorkOrderPrcssVo> lotTrackList6 = workOrderPrcssService.lotTrackList6(workOrderPrcssVo);
			
			jsonData.put("data", lotTrackList6);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재LOTNO 정보 조회(봉제)
	@RequestMapping(value = "/wm/lotTrackList7", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackList7(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재LOTNO정보 목록조회: " + workOrderPrcssVo);
		try {
			
			List<WorkOrderPrcssVo> lotTrackList7 = workOrderPrcssService.lotTrackList7(workOrderPrcssVo);
			
			jsonData.put("data", lotTrackList7);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}