package mes.service.io;

import java.util.List;
import java.util.Map;

import mes.domain.io.InOutWhsAdmVo;

public interface InOutWhsAdmService {
	
	//가입고등록
	
	//가입고등록,개별입고등록 상세조회
	public List<InOutWhsAdmVo> preInOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//발주수량대비 가입고수량 조회
	public List<InOutWhsAdmVo> unPreInOutQtyList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//가입고등록 등록
	public void preInOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//가입고등록 수정
	public void preInOutWhsAdmUpdate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;

	//가입고등록 삭제
	public void preInOutWhsAdmDelete(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//가입고 시퀀스 생성
	public String getInSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;

	//발주현황 삭제 확인
	public String inOutWhsDataCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고전표번호 생성
	public String getInSlipNo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고전표시퀀스 생성
	public String getInSlipSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고전표번호 생성(창고이동)
	public String getInSlipNo2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//바코드 시퀀스 가져오기
	public String getBarcodeSeq(String date) throws Exception;
	
	//자재상태 확인
	public String statusCdCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	
	//입고등록
	
	//입고등록 목록조회
	public List<InOutWhsAdmVo> inOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//기간별입고현황(봉제) 목록 조회 - lot별
	public List<InOutWhsAdmVo> inOutWhsBarcList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//기간별입고현황(봉제) 목록 조회 - 일별
	public List<InOutWhsAdmVo> inOutWhsDateList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//기간별입고현황(봉제) 목록 조회 - 월별
	public List<InOutWhsAdmVo> inOutWhsItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고등록 상세조회
	public InOutWhsAdmVo inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고등록 바코드 상세조회
	public InOutWhsAdmVo inOutWhsAdmBarcodeRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//입고등록 등록(가입고테이블 수정)
	public int inOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//창고바코드 스캔(창고,구역,위치 값  가져오기)
	public InOutWhsAdmVo getLocInfo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//창고목록 가져오기
	public List<InOutWhsAdmVo> getLocationCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//구역목록 가져오기
	public List<InOutWhsAdmVo> getAreaCd(InOutWhsAdmVo inOutWhsAdmVos) throws Exception;
	
	//위치목록 가져오기
	public List<InOutWhsAdmVo> getFloorCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//승인여부 가져오기
	public String getApprovalCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//부품별 자재단가 가져오기
	public Integer getPartUnitCost(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	

	
	//입고현황
	
	//입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	
	
	//발주대비 미입고현황
	
	//발주대비 미입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//재고현황
	public List<InOutWhsAdmVo> partInventoryDtlList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;


	//수주상세별 입고 모니터링 목록조회
	public List<InOutWhsAdmVo> inMonitoringList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	
	//개별입고
	
	//개별입고 목록조회
	public List<InOutWhsAdmVo> individualAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//개별입고 가상발주번호 생성
	public String getPoNo(String today) throws Exception;
	
	//라벨출력처리
	public void preInOutWhsAdmLabelPrint(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//PDA 품목검색
	public List<InOutWhsAdmVo> pdaItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매입 매출 화면-----------------------------------------------------------------------------------------
	
	//월별 날짜 리스트 조회
	public List<InOutWhsAdmVo> dayList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;

	//월별 매입 거래처, 품목구분 리스트 조회
	public List<InOutWhsAdmVo> monthPurchaseDealCorpMainList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//월별 매입 리스트 조회
	public List<InOutWhsAdmVo> monthPurchaseList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//월별 매출 거래처, 품목구분 리스트 조회
	public List<InOutWhsAdmVo> monthSalesDealCorpMainList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//월별 매출 리스트 조회
	public List<InOutWhsAdmVo> monthSalesList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	// 수입검사 상세 조회(사출제품)
	public List<InOutWhsAdmVo> barcodeUsePlaceInspectList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매입 집계 목록조회
	public List<Map<String,Object>> totalInWhsCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매입 사출/봉제 합계 목록조회 
	public List<InOutWhsAdmVo> totalInWhsMainCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매입 거래처별 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsDealCorpCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 집계 목록조회
	public List<Map<String,Object>> totalOutWhsCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 사출/봉제 합계 목록조회 
	public List<InOutWhsAdmVo> totalOutWhsMainCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 거래처별 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsDealCorpCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 일별 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsDayCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 일별 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsDayCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 총수량 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsTotalCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//매출 총수량 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsTotalCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//경영정보관리_거래처별 월 자재 입고현황
	public List<InOutWhsAdmVo> dealCorpMatrlInList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
	
	//경영정보관리_거래처별 월 매출현황
	public List<InOutWhsAdmVo> dealCorpMonthSalesList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception;
}
