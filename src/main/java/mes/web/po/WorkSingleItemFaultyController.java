package mes.web.po;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.ItemPartAdmVo;
import mes.domain.po.WorkSingleItemFaultyVo;
import mes.domain.qm.UnfitAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.po.WorkSingleItemFaultyService;
import mes.service.qm.UnfitAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkSingleItemFaultyController {
	
	private static final Logger logger = LoggerFactory.getLogger(WorkSingleItemFaultyController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	@Inject
	private WorkSingleItemFaultyService workSingleItemFaultyService;
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	@Inject
	private ItemPartAdmService itemPartAdmService;
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	@Inject
	private UnfitAdmService unfitAdmService;
	
	
	// 단품불량 목록조회
	@RequestMapping(value = "po/singleFaultyTypeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> singleFaultyTypeList(WorkSingleItemFaultyVo workSingleItemFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("단품불량 불량 수량 및 누적수량: " + workSingleItemFaultyVo);
		try {
			
			List<WorkSingleItemFaultyVo> list = workSingleItemFaultyService.workSingleItemFaultyList(workSingleItemFaultyVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
		
	// 제품/단품불량 목록조회
	@RequestMapping(value = "po/workFaultyTypeAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workFaultyTypeAllList(WorkSingleItemFaultyVo workSingleItemFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품/단품불량 목록조회: " + workSingleItemFaultyVo);
		try {
			
			List<WorkSingleItemFaultyVo> list = workSingleItemFaultyService.workFaultyTypeAllList(workSingleItemFaultyVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

		
	// 단품불량 불량 누적수량 
	@RequestMapping(value = "po/singleFaultyTypeAccList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> singleFaultyTypeAccList(WorkSingleItemFaultyVo workSingleItemFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("단품불량 불량 수량 및 누적수량: " + workSingleItemFaultyVo);
		try {
			
			List<WorkSingleItemFaultyVo> list = workSingleItemFaultyService.workSingleItemFaultyAccList(workSingleItemFaultyVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	//단품불량 등록
	@RequestMapping(value = "po/workSingleItemFaultyIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workSingleItemFaultyIns(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkSingleItemFaultyVo workSingleItemFaultyVo = new WorkSingleItemFaultyVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		logger.info("단품불량 등록 vo");
		try {
			//1. 단품불량 TB에 등록
			
			//2. 수불테이블에서 해당 공정창고에 -이동출고 비고에 단품불량
			//3. 수불테이블에서 부적합창고로 +이동입고 비고에 단품불량
			
			for(Map<String, Object> m : list) {
				itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
				itemPartAdmVo = itemPartAdmService.itemPartDtlList(itemPartAdmVo);
				
				workSingleItemFaultyVo.setWorkOrdNo(m.get("workOrdNo").toString());
				workSingleItemFaultyVo.setWorkProgNo(m.get("workProgNo").toString());
				workSingleItemFaultyVo.setItemSeq(m.get("itemSeq").toString());
				workSingleItemFaultyVo.setBarcodeNo(m.get("barcodeNo").toString());
				workSingleItemFaultyVo.setFaultyQty(m.get("faultyQty").toString());
				workSingleItemFaultyVo.setFaultyType(m.get("faultyType").toString());
				workSingleItemFaultyVo.setFaultyDate(m.get("faultyDate").toString());
				workSingleItemFaultyVo.setFaultyDesc(m.get("faultyDesc").toString());
				workSingleItemFaultyVo.setRegId(Utils.getUserNumber());
				workSingleItemFaultyService.workSingleItemFaultyIns(workSingleItemFaultyVo);
				
				//이동전표 발생
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				
				//1.출고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(itemPartAdmVo.getItemGubun());
				stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpSubGubun("이동출고");
				stockPaymentAdmVo.setSpDate(workSingleItemFaultyVo.getFaultyDate());
				stockPaymentAdmVo.setSpQty(workSingleItemFaultyVo.getFaultyQty());
				stockPaymentAdmVo.setBarcodeNo(workSingleItemFaultyVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(workSingleItemFaultyVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(m.get("locCd").toString());
				stockPaymentAdmVo.setLocationNo(m.get("locNo").toString());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
				
				//입고
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType(itemPartAdmVo.getItemGubun());
				stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
				stockPaymentAdmVo.setSpGubun("001");
				stockPaymentAdmVo.setSpSubGubun("이동입고");
				stockPaymentAdmVo.setSpDate(workSingleItemFaultyVo.getFaultyDate());
				stockPaymentAdmVo.setSpQty(workSingleItemFaultyVo.getFaultyQty());
				stockPaymentAdmVo.setBarcodeNo(workSingleItemFaultyVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(workSingleItemFaultyVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd("018");
				stockPaymentAdmVo.setLocationNo("20230208-001"); //부적합창고(봉제)
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
	
	
	//단품불량 삭제
	@RequestMapping(value = "po/workSingleItemFaultyDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workSingleItemFaultyDel(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkSingleItemFaultyVo workSingleItemFaultyVo = new WorkSingleItemFaultyVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		logger.info("단품불량 삭제 vo");
		try {
			for(Map<String, Object> m : list) {
				UnfitAdmVo unfitAdmVo = new UnfitAdmVo();
				unfitAdmVo.setUnfitLot(m.get("ordLotNo").toString());
				if(unfitAdmService.unfitAdmCheck(unfitAdmVo)==0) {
					
					workSingleItemFaultyVo.setIdx(m.get("idx").toString());
					workSingleItemFaultyVo = workSingleItemFaultyService.workSingleItemFaultyList(workSingleItemFaultyVo).get(0);
					
					itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
					itemPartAdmVo = itemPartAdmService.itemPartDtlList(itemPartAdmVo);
					
					//이동전표 발생
					String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
					
					//1.출고
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType(itemPartAdmVo.getItemGubun());
					stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
					stockPaymentAdmVo.setSpGubun("002");
					stockPaymentAdmVo.setSpSubGubun("이동출고");
					stockPaymentAdmVo.setSpDate(workSingleItemFaultyVo.getFaultyDate());
					stockPaymentAdmVo.setSpQty(workSingleItemFaultyVo.getFaultyQty());
					stockPaymentAdmVo.setBarcodeNo(workSingleItemFaultyVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo(workSingleItemFaultyVo.getBarcodeNo());
					stockPaymentAdmVo.setLocationCd("018");
					stockPaymentAdmVo.setLocationNo("20230208-001"); //부적합창고(봉제)
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					
					//입고
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType(itemPartAdmVo.getItemGubun());
					stockPaymentAdmVo.setSpCd(itemPartAdmVo.getItemSeq());
					stockPaymentAdmVo.setSpGubun("001");
					stockPaymentAdmVo.setSpSubGubun("이동입고");
					stockPaymentAdmVo.setSpDate(workSingleItemFaultyVo.getFaultyDate());
					stockPaymentAdmVo.setSpQty(workSingleItemFaultyVo.getFaultyQty());
					stockPaymentAdmVo.setBarcodeNo(workSingleItemFaultyVo.getBarcodeNo());
					stockPaymentAdmVo.setSourceNo(workSingleItemFaultyVo.getBarcodeNo());
					stockPaymentAdmVo.setLocationCd(m.get("locCd").toString());
					stockPaymentAdmVo.setLocationNo(m.get("locNo").toString());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					
					workSingleItemFaultyVo.setIdx(m.get("idx").toString());
					workSingleItemFaultyService.workSingleItemFaultyDel(workSingleItemFaultyVo);
					
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
	
	

}
