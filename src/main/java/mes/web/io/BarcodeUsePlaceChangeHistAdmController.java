package mes.web.io;

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

import mes.domain.io.BarcodeUsePlaceChangeHistAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.BarcodeUsePlaceChangeHistAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class BarcodeUsePlaceChangeHistAdmController {

	private static final Logger logger = LoggerFactory.getLogger(BarcodeUsePlaceChangeHistAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private BarcodeUsePlaceChangeHistAdmService changeHistAdmService;
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	//PDA(창고이동) 메인
	@RequestMapping(value = "/tmsc0360", method = RequestMethod.GET)
	public String tmsc0360(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0360";
	}
	
	//창고이동현황 메인
	@RequestMapping(value = "/iosc0350", method = RequestMethod.GET)
	public String iosc0350(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0350";
	}
	
	//목록조회
	@RequestMapping(value = "tm/barcodeUsePlaceChangeHistAdmList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeUsePlaceChangeHistAdmList(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고이동현황 : "+barcodeUsePlaceChangeHistAdmVo);
		try {
			List<BarcodeUsePlaceChangeHistAdmVo> readList = changeHistAdmService.barcodeUsePlaceChangeHistAdmList(barcodeUsePlaceChangeHistAdmVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", readList);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//상세조회
	@RequestMapping(value = "tm/barcodeUsePlaceChangeHistAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> list(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고이동현황 : "+barcodeUsePlaceChangeHistAdmVo);
		try {
			List<BarcodeUsePlaceChangeHistAdmVo> readList = changeHistAdmService.barcodeUsePlaceChangeHistAdmRead(barcodeUsePlaceChangeHistAdmVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", readList);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//상세조회
	@RequestMapping(value = "tm/barcodeUsePlaceChangeHistAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> read(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고이동 스캔vo : "+barcodeUsePlaceChangeHistAdmVo);
		try {
			List<BarcodeUsePlaceChangeHistAdmVo> readList = new ArrayList<BarcodeUsePlaceChangeHistAdmVo>();
			
			if(barcodeUsePlaceChangeHistAdmVo.getBarcodeNo()!=null && !barcodeUsePlaceChangeHistAdmVo.getBarcodeNo().toString().equals("")) {
				readList = changeHistAdmService.barcodeUsePlaceChangeHistAdmRead(barcodeUsePlaceChangeHistAdmVo);
				
				if(readList.size()>0) {
					jsonData.put("data", readList.get(0));
					jsonData.put("result", "ok");
					jsonData.put("message", "추가되었습니다.");
				}else {
					jsonData.put("result", "fail");
					jsonData.put("message", "해당 바코드는 사출 제품창고에 없는 바코드이거나 봉제에 매칭되지 않은 품번입니다.");
					jsonData.put("data", readList);
				}
				
			}else {
				jsonData.put("result", "fail");
				jsonData.put("message", "해당 바코드는 사출 제품창고에 없는 바코드이거나 봉제에 매칭되지 않은 품번입니다.");
				jsonData.put("data", readList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//등록
	@RequestMapping(value = "tm/barcodeUsePlaceChangeHistAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insert(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("창고이동 스캔vo : "+list);
		try {
				
			InOutWhsAdmVo inOutVo = new InOutWhsAdmVo();
			inOutVo.setInSlipNo(list.get(0).get("changeDate").toString()+"-"+list.get(0).get("bongjeSeq").toString());
			String numberSeq = inOutWhsAdmService.getInSlipNo2(inOutVo);
			logger.info("inSlipNo:"+numberSeq);
			
			String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
			
			for(Map<String, Object> m : list) {
				//제품창고에 남아있는지 확인 후 진행
				
				//1. 바코드 사용장소 변경 이력관리
				BarcodeUsePlaceChangeHistAdmVo insVo = new BarcodeUsePlaceChangeHistAdmVo();
				insVo.setBarcodeNo(m.get("barcodeNo").toString());
				insVo.setSachulSeq(m.get("sachulSeq").toString());
				insVo.setBongjeSeq(m.get("bongjeSeq").toString());
				insVo.setChangeQty(m.get("changeQty").toString());
				insVo.setChangeDate(m.get("changeDate").toString());
				insVo.setSachulLocCd(m.get("sachulLocCd").toString());
				insVo.setSachulLocNo(m.get("sachulLocNo").toString());
				insVo.setBongjeLocCd(m.get("bongjeLocCd").toString());
				insVo.setBongjeLocNo(m.get("bongjeLocNo").toString());
				insVo.setRegId(Utils.getUserId());
				changeHistAdmService.barcodeUsePlaceChangeHistAdmIns(insVo);
				
				//2. 제품입출고관리(사출) 테이블 수정
				ItemWhsAdmVo itemWhsAdmVo = new ItemWhsAdmVo();
				itemWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				itemWhsAdmVo.setOutDate(m.get("changeDate").toString());
				itemWhsAdmVo.setOutQty(Math.round(Float.parseFloat(m.get("changeQty").toString())));
				itemWhsAdmVo.setUpdId(Utils.getUserNumber());
				itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);
				
				//3. 자재입출고관리(봉제) 테이블 등록
				InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
				inOutWhsAdmVo.setInSlipNo(m.get("changeDate").toString()+"-"+m.get("bongjeSeq").toString()+"-"+numberSeq);
				inOutWhsAdmVo.setInSlipSeq(inOutWhsAdmService.getInSlipSeq(inOutWhsAdmVo));
				inOutWhsAdmVo.setInSeq(inOutWhsAdmService.getInSeq(inOutWhsAdmVo));
				inOutWhsAdmVo.setPoNo("0");
				inOutWhsAdmVo.setPoSeq("0");
				inOutWhsAdmVo.setLotNo("");
				inOutWhsAdmVo.setItemSeq(m.get("bongjeSeq").toString());
				inOutWhsAdmVo.setOrdQty(m.get("changeQty").toString());
				inOutWhsAdmVo.setAddQty("0");
				inOutWhsAdmVo.setPreInWhsQty(m.get("changeQty").toString());
				inOutWhsAdmVo.setPreInWhsDate(m.get("changeDate").toString());
				inOutWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				inOutWhsAdmVo.setLocationCd(m.get("bongjeLocCd").toString());
				inOutWhsAdmVo.setLocationNo(m.get("bongjeLocNo").toString());
				inOutWhsAdmVo.setRegId(Utils.getUserId());
				inOutWhsAdmService.preInOutWhsAdmCreate(inOutWhsAdmVo);
				
				//봉제 수입검사 하지 않음
				if(m.get("bongjeImportYn")==null || m.get("bongjeImportYn").equals("002")) {
					InOutWhsAdmVo inOutWhsAdmUpdVo = new InOutWhsAdmVo();
					inOutWhsAdmUpdVo.setInSlipNo(inOutWhsAdmVo.getInSlipNo());
					inOutWhsAdmUpdVo.setInSlipSeq(inOutWhsAdmVo.getInSlipSeq());
					inOutWhsAdmUpdVo.setInWhsQty(m.get("changeQty").toString());
					inOutWhsAdmUpdVo.setInWhsDate(m.get("changeDate").toString());
					inOutWhsAdmUpdVo.setStatusCd("L");
					inOutWhsAdmService.preInOutWhsAdmUpdate(inOutWhsAdmUpdVo);
				}
				
				//3. 수불관리테이블 등록(사출 바코드 출고)
				StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
				stockPaymentAdmVo.setSpCd(m.get("sachulSeq").toString());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("이동출고");
				stockPaymentAdmVo.setSpDate(m.get("changeDate").toString());
				stockPaymentAdmVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("changeQty").toString()))));
				stockPaymentAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setSourceNo(m.get("barcodeNo").toString());
				stockPaymentAdmVo.setLocationNo(m.get("sachulLocNo").toString());
				stockPaymentAdmVo.setLocationCd(m.get("sachulLocCd").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				//봉제 수입검사 하지 않음
				if(m.get("bongjeImportYn")==null || m.get("bongjeImportYn").equals("002")) {
					// 수불관리 입고 insert
					StockPaymentAdmVo stockPaymentAdmInVo = new StockPaymentAdmVo();
					stockPaymentAdmInVo.setSpNo(spNo);
					stockPaymentAdmInVo.setSpType(m.get("bongjeGubun").toString());
					stockPaymentAdmInVo.setSpCd(m.get("bongjeSeq").toString());
					stockPaymentAdmInVo.setSpGubun("001");
					stockPaymentAdmInVo.setSpSubGubun("자재입고");
					stockPaymentAdmInVo.setSpDate(m.get("changeDate").toString());
					stockPaymentAdmInVo.setSpQty(Float.toString(Math.abs(Float.parseFloat(m.get("changeQty").toString()))));
					stockPaymentAdmInVo.setBarcodeNo(m.get("barcodeNo").toString());
					stockPaymentAdmInVo.setSourceNo(m.get("barcodeNo").toString());
					stockPaymentAdmInVo.setLocationCd(m.get("bongjeLocCd").toString());
					stockPaymentAdmInVo.setLocationNo(m.get("bongjeLocNo").toString());
					stockPaymentAdmInVo.setRegId(Utils.getUserId());
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmInVo);
				}
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
		
	
}
