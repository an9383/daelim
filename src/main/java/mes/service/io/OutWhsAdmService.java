package mes.service.io;

import java.util.List;

import mes.domain.io.OutWhsAdmVo;

public interface OutWhsAdmService {

	//자재출고 목록조회
	public List<OutWhsAdmVo> outWhsAdmList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고(봉제) 부모테이블 목록조회
	public List<OutWhsAdmVo> outWhsAdmParentList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고 상세조회
	public List<OutWhsAdmVo> preOutWhsAdmRead(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고현황(봉제) 목록조회 - lot별
	public List<OutWhsAdmVo> preOutWhsBarcList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고현황(봉제) 목록조회 - 일별
	public List<OutWhsAdmVo> preOutWhsDateList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고현황(봉제) 목록조회 - 월별
	public List<OutWhsAdmVo> preOutWhsItemList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//출고량과 총소요량 비교조회
	public List<OutWhsAdmVo> compareConsumptPreOutQty(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고 등록
	public int preOutWhsAdmCreate(OutWhsAdmVo outWhsAdmVo) throws Exception;	
	
	//자재출고 사용수량 수정 (외주입고 시)
	public int updateUseqtyPlus(OutWhsAdmVo outWhsAdmVo) throws Exception;	
	
	//자재출고 사용수량 수정 (반출등록 시)
	public int updateToffUseqtyPlus(OutWhsAdmVo outWhsAdmVo) throws Exception;	
	
	//자재출고 사용수량 수정 (외주입고 취소)
	public int updateUseqtyMinus(OutWhsAdmVo outWhsAdmVo) throws Exception;	
	
	//자재출고 사용수량 수정 (반출등록 취소)
	public int updateToffUseqtyMinus(OutWhsAdmVo outWhsAdmVo) throws Exception;	
	
	//자재출고 출고량 수정
	public void updatePreOutQty(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고 확정여부 수정
	public void updateConfirmYn(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고 출고전표 생성
	public String getOutSlipNo(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고 출고전표시퀀스 생성
	public String getOutSlipSeq(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//입출고관리 남은수량 값 수정
	public void updateRemainQty(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//작지번호에 해당하는 바코드인지 여부확인
	public Integer checkBarcodeNo(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고현황 목록조회
	public List<OutWhsAdmVo> workOrdNoList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//작지에 해당하는 품번 소모량 값 가져오기
	public Float getConsumpt(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//작업지시 자재투입 ---------------------------------------------------------------
	
	//barcode No 존재 확인
	public int barcodeExsitCheck(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//barcode No 출고경로 상태 확인
	public String barcodeStatusCheck(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//작지번호에 투입되는 자재가 맞는지 확인
	public int barcodeWorkordNoCheck(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//해당 공정에 투입되는 자재가 맞는지 확인
	public int barcodePrcssCdCheck(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//barcode No 투입유무 확인
	public String barcodeOutStatusCheck(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재투입 barcode Scan
	public List<OutWhsAdmVo> barcodeNoScan(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재투입 자재 출고처리
	public void outWhsOutQtyEdit(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//수주상세별 출고 모니터링 조회
	public List<OutWhsAdmVo> outMonitoringList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//수불 부품 바코드 상세조회
	public OutWhsAdmVo itemPartRead(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	
	//재공창고현항
	//재공창고 기본조회
	public List<OutWhsAdmVo> wareHouseList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//재공창고 상세조회
	public List<OutWhsAdmVo> wareHouseRead(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	
	//자재출고 선입선출
	public List<OutWhsAdmVo> fifoList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재투입 선입선출
	public List<OutWhsAdmVo> fifoList2(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//출하요청 선입선출
	public List<OutWhsAdmVo> itemReqFifoList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주입고(봉제) 목록조회
	public List<OutWhsAdmVo> outsourcingWhsList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주입고(봉제) 외주사 조회
	public List<OutWhsAdmVo> outscDealList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주입고(봉제) 자재불출 확인
	public List<OutWhsAdmVo> outBomInputConsumpt(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주입고(봉제) 자재출고 확인
	public List<OutWhsAdmVo> outBomInputList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주입고(봉제) 선입선출 조회
	public OutWhsAdmVo outscFifoRead(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주재고현황 목록조회
	public List<OutWhsAdmVo> outInventoryList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//외주재고현황 상세조회
	public List<OutWhsAdmVo> outInventoryDtlList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	//자재출고(봉제) 삭제
	public void tbOutWhsAdmDel(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	
	
	//sheet*********************************************************************
	public List<OutWhsAdmVo> sheetCorpList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	public List<OutWhsAdmVo> sheetItemList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	public List<OutWhsAdmVo> sheetPartList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
	public List<OutWhsAdmVo> sheetOutQtyList(OutWhsAdmVo outWhsAdmVo) throws Exception;
	
}
