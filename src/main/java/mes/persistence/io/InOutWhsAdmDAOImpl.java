package mes.persistence.io;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.InOutWhsAdmVo;
import mes.domain.qm.ItemInspectAdmVo;

@Repository
public class InOutWhsAdmDAOImpl implements InOutWhsAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.inOutWhsAdmMapper";
	
	//가입고등록
	
	//가입고등록,개별입고등록 상세조회
	public List<InOutWhsAdmVo> preInOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".preInOutWhsAdmList" , inOutWhsAdmVo); 
	}
	
	
	//발주수량대비 가입고수량 조회
	public List<InOutWhsAdmVo> unPreInOutQtyList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".unPreInOutQtyList" , inOutWhsAdmVo);
	}
	
	//가입고등록 등록
	public void preInOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.insert(namespace +".preInOutWhsAdmCreate" , inOutWhsAdmVo);
	}
	
	//가입고등록 수정
	public void preInOutWhsAdmUpdate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.update(namespace +".preInOutWhsAdmUpdate", inOutWhsAdmVo);
	}


	//가입고등록 삭제
	public void preInOutWhsAdmDelete(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.delete(namespace+".preInOutWhsAdmDelete" ,inOutWhsAdmVo );
	}
	
	//가입고 시퀀스 생성
	public String getInSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getInSeq" , inOutWhsAdmVo);
	}
	
	//발주현황 삭제 확인
	public String inOutWhsDataCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace + ".inOutWhsDataCheck", inOutWhsAdmVo);
	}
	
	
	//입고전표번호 생성
	public String getInSlipNo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getInSlipNo" ,inOutWhsAdmVo );
	}
	
	//입고전표시퀀스 생성
	public String getInSlipSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getInSlipSeq" ,inOutWhsAdmVo );
	}
	
	//입고전표번호 생성(창고이동)
	public String getInSlipNo2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getInSlipNo2" , inOutWhsAdmVo);
	}
	
	//바코드 시퀀스 가져오기
	public String getBarcodeSeq(String date) throws Exception{
		return session.selectOne(namespace+".getBarcodeSeq" , date);
	}
	
	//자재상태 확인
	public String statusCdCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".statusCdCheck" , inOutWhsAdmVo);
	}
	
	
	//입고등록
	
	//입고등록 목록조회
	public List<InOutWhsAdmVo> inOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsAdmList" , inOutWhsAdmVo); 
	}
	
	//기간별입고현황(봉제) 목록 조회 - lot별
	public List<InOutWhsAdmVo> inOutWhsBarcList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsBarcList" , inOutWhsAdmVo); 
	}
	
	//기간별입고현황(봉제) 목록 조회 - 일별
	public List<InOutWhsAdmVo> inOutWhsDateList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsDateList" , inOutWhsAdmVo); 
	}
	
	//기간별입고현황(봉제) 목록 조회 - 월별
	public List<InOutWhsAdmVo> inOutWhsItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsItemList" , inOutWhsAdmVo); 
	}
	
	//입고등록 상세조회
	public InOutWhsAdmVo inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".inOutWhsAdmRead" , inOutWhsAdmVo);
	}
	
	//입고등록 바코드 상세조회
	public InOutWhsAdmVo inOutWhsAdmBarcodeRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".inOutWhsAdmBarcodeRead" , inOutWhsAdmVo);
	}
	
	
	//입고등록 등록(가입고테이블 수정)
	public int inOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.update(namespace +".inOutWhsAdmCreate" , inOutWhsAdmVo);
	}
	
	//창고바코드 스캔(창고,구역,위치 값  가져오기)
	public InOutWhsAdmVo getLocInfo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getLocInfo" ,inOutWhsAdmVo );
	}

	//창고목록 가져오기
	public List<InOutWhsAdmVo> getLocationCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getLocationCd", inOutWhsAdmVo);
	}
	
	//구역목록 가져오기
	public List<InOutWhsAdmVo> getAreaCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getAreaCd", inOutWhsAdmVo);
	}
	
	//위치목록 가져오기
	public List<InOutWhsAdmVo> getFloorCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getFloorCd" , inOutWhsAdmVo);
	}
	
	//승인여부 가져오기
	public String getApprovalCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getApprovalCd" , inOutWhsAdmVo);
	}
	
	//부품별 자재단가 가져오기
	public Integer getPartUnitCost(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getPartUnitCost" ,inOutWhsAdmVo );
	}
	

	
	//입고현황
	
	//입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsStatusList" , inOutWhsAdmVo);
	}
	
	
	
	//발주대비 미입고현황
	
	//발주대비 미입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsStatusList2", inOutWhsAdmVo);
	}

	
	//재고현황
	public List<InOutWhsAdmVo> partInventoryDtlList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".partInventoryDtlList" , inOutWhsAdmVo);
	}

	
	//수주상세별 입고 모니터링 목록조회
	public List<InOutWhsAdmVo> inMonitoringList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".inMonitoringList" ,inOutWhsAdmVo );
	}
	
	//개별입고
	
	//개별입고 목록조회
	public List<InOutWhsAdmVo> individualAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".individualAdmList" , inOutWhsAdmVo);
	}

	//개별입고 가상발주번호 생성
	public String getPoNo(String today) throws Exception{
		return session.selectOne(namespace+".getPoNo" ,today );
	}

	//라벨출력처리
	public void preInOutWhsAdmLabelPrint(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.update(namespace +".preInOutWhsAdmLabelPrint", inOutWhsAdmVo);
	}
	
	//PDA 품목검색
	public List<InOutWhsAdmVo> pdaItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".pdaItemList", inOutWhsAdmVo);
	}

	
	//매입 매출 화면-----------------------------------------------------------------------------------------
	
	//월별 날짜 리스트 조회
	@Override
	public List<InOutWhsAdmVo> dayList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".dayList", inOutWhsAdmVo);
	}
	
	//월별 매입 거래처, 품목구분 리스트 조회
	@Override
	public List<InOutWhsAdmVo> monthPurchaseDealCorpMainList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".monthPurchaseDealCorpMainList", inOutWhsAdmVo);
	}
	
	//월별 매입 리스트 조회
	@Override
	public List<InOutWhsAdmVo> monthPurchaseList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".monthPurchaseList", inOutWhsAdmVo);
	}
	
	//월별 매출 거래처, 품목구분 리스트 조회
	@Override
	public List<InOutWhsAdmVo> monthSalesDealCorpMainList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".monthSalesDealCorpMainList", inOutWhsAdmVo);
	}
	
	//월별 매출 리스트 조회
	@Override
	public List<InOutWhsAdmVo> monthSalesList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".monthSalesList", inOutWhsAdmVo);
	}
	
	// 수입검사 상세 조회(사출제품)
	public List<InOutWhsAdmVo> barcodeUsePlaceInspectList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		return session.selectList(namespace+".barcodeUsePlaceInspectList" ,inOutWhsAdmVo );
	}
	
	//매입 집계 목록조회
	public List<Map<String,Object>> totalInWhsCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalInWhsCostList" , inOutWhsAdmVo);
	}
	
	//매입 사출/봉제 합계 목록조회 
	public List<InOutWhsAdmVo> totalInWhsMainCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalInWhsMainCostList" , inOutWhsAdmVo);
	}
	
	//매입 거래처별 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsDealCorpCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalInWhsDealCorpCostList" , inOutWhsAdmVo);
	}

	//매출 집계 목록조회
	public List<Map<String,Object>> totalOutWhsCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalOutWhsCostList" , inOutWhsAdmVo);
	}
	
	//매출 사출/봉제 합계 목록조회 
	public List<InOutWhsAdmVo> totalOutWhsMainCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalOutWhsMainCostList" , inOutWhsAdmVo);
	}
	
	//매출 거래처별 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsDealCorpCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalOutWhsDealCorpCostList" , inOutWhsAdmVo);
	}
	
	//매출 일별 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsDayCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalOutWhsDayCostList" , inOutWhsAdmVo);
	}
	
	//매출 일별 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsDayCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalInWhsDayCostList" , inOutWhsAdmVo);
	}
	
	//매출 총수량 합계 목록조회
	public List<InOutWhsAdmVo> totalOutWhsTotalCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalOutWhsTotalCostList" , inOutWhsAdmVo);
	}
	
	//매출 총수량 합계 목록조회
	public List<InOutWhsAdmVo> totalInWhsTotalCostList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".totalInWhsTotalCostList" , inOutWhsAdmVo);
	}
	
	//경영정보관리_거래처별 월 자재 입고현황
	public List<InOutWhsAdmVo> dealCorpMatrlInList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".dealCorpMatrlInList" , inOutWhsAdmVo);
	}
	
	//경영정보관리_거래처별 월 매출현황
	public List<InOutWhsAdmVo> dealCorpMonthSalesList (InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".dealCorpMonthSalesList", inOutWhsAdmVo);
	}
}
