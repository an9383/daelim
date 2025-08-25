package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;

@Repository
public class WorkOrderPrcssDAOImpl implements WorkOrderPrcssDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderPrcssMapper";
	
	//작업지시 조회(사출)
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrderPrcssList",workOrderPrcssVo);
	}
	
	//작업지시 조회(봉제)
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssListByBongjea(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrderPrcssListByBongjea" ,workOrderPrcssVo );
	}
	
	//작업지시 초/중/종물 공정검사 유무
	public WorkOrderPrcssVo workOrdInspectYnList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".workOrdInspectYnList" ,workOrderPrcssVo );
	}
	
	//작업지시 생산실적 초/중/종물 실적등록 조회
	public int workOrdInspectDone(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".workOrdInspectDone" , workOrderPrcssVo);
	}
	
	//작업지시 등록
	@Override
	public void create(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		session.insert(namespace+".create", workOrderPrcssVo);
	}
	
	//작업지시 다중 등록
	@Override
	public void createList(List<WorkOrderPrcssVo> list) throws Exception {
		session.insert(namespace+".createList", list);
	}
	
	//자재 수불 리스트 등록
	@Override
	public int matrlStockPaymentCreate(List<WorkOrderPrcssVo> list) throws Exception {
		return session.insert(namespace+".matrlStockPaymentCreate", list);
	}
	
	//자재 수불 리스트 등록(총 생산수량 대비 등록)
	public int matrlStockPaymentCreate2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.insert(namespace+".matrlStockPaymentCreate2",workOrderPrcssVo);
	}
	
	//자재 수불 리스트 등록(생산 LOT 대비 등록)
	public int matrlStockMatrlCreate(List<WorkOrderPrcssVo> list) throws Exception{
		return session.insert(namespace+".matrlStockMatrlCreate",list);
	}
	
	//작업지시 수정
	@Override
	public void update(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".update", workOrderPrcssVo);
	}
	
	//작업지시 삭제
	public void workOrderPrcssDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.delete(namespace+".workOrderPrcssDelete" ,workOrderPrcssVo );
	}
	//작지 시퀀스 가져오기
	@Override
	public int getWorkOrdSeq(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getWorkOrdSeq", workOrderPrcssVo);
	}
	
	//작지 시퀀스 가져오기
	@Override
	public String getOrdlotNo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getOrdlotNo", workOrderPrcssVo);
	}
	
	//작지 시퀀스 가져오기
	@Override
	public String getOrdlotNoByBongjae(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getOrdlotNoByBongjae", workOrderPrcssVo);
	}
	
	//작업지시 공정별 작지목록 조회
	@Override
	public List<WorkOrderPrcssVo> workOrdPrcssListDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrdPrcssListDtl",workOrderPrcssVo);
	}
	
	//작업지시 공정별 작지목록 상세조회
	@Override
	public WorkOrderPrcssVo workOrdPrcssReadDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".workOrdPrcssReadDtl", workOrderPrcssVo);
	}
	
	//작업지시 공정 순서 및 앞뒤 공정 정보 읽기
	@Override
	public WorkOrderPrcssVo getPrcssInfo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getPrcssInfo", workOrderPrcssVo);
	}

	//작업지시 이전공정 출고수량 읽기
	@Override
	public int getOutQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getOutQty", workOrderPrcssVo);
	}
	
	//작업지시 불량수량 수정
	@Override
	public void updateQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".updateQty", workOrderPrcssVo);
	}
	
	//작업지시 불량수량 삭제
	public void workOrdPrcssFaultyQtyDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".workOrdPrcssFaultyQtyDelete" ,workOrderPrcssVo );
	}
	
	//작업지시 (이전공정 출고수량) - (현재공정 투입수량의 합)
	@Override
	public int getOutToTargetSum(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getOutToTargetSum", workOrderPrcssVo);
	}
	
	//작업지시 다음공정 투입수량 업데이트
	@Override
	public void updateNextTargetQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".updateNextTargetQty", workOrderPrcssVo);
	}
	
	//작업지시 (이전공정 출고수량) - (현재공정 대기중이 아닌 작지의 투입수량의 합)
	@Override
	public int getOutToTargetSumNotPD(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getOutToTargetSumNotPD", workOrderPrcssVo);
	}
	
	//작업지시에 존재하는 번호인지 확인
	@Override
	public int checkWorkOrdNoExsit(WorkOrderVo workOrderVo)throws Exception{
		return session.selectOne(namespace+".checkWorkOrdNoExsit" ,workOrderVo);
	}
	
	//모니터링 - 공정별실적현황
	@Override
	public List<WorkOrderPrcssVo> workOrdStatusList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrdStatusList" ,workOrderPrcssVo);
	}
	
	//모니터링 - 공정별실적현황(소공정)
	@Override
	public List<WorkOrderPrcssVo> workOrdStatusDtlList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrdStatusDtlList" ,workOrderPrcssVo);
	}
	
	//생산실적수집 -------------------------------------------------------------------------------------------------
	
	//생산수량 변경
	@Override
	public void workOrderPrcssQtyUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		session.update(namespace+".workOrderPrcssQtyUpdate", workOrderPrcssVo);
	}
	
	//생산세팅값 수정
	@Override
	public void equipDeviceMultiUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".equipDeviceMultiUpdate", workOrderPrcssVo);
	}
	
	//설비관리 -------------------------------------------------------------------------------------------------
	
	//설비관리 - 설비별 작지현황(일자조건)
	@Override
	public List<WorkOrderPrcssVo> equipToWorkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".equipToWorkOrdList" ,workOrderPrcssVo);
	}
	
	//생산 일보 -------------------------------------------------------------------------------------------------
	
	//작업지시공정 전체 조회
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssAllList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return session.selectList(namespace+".workOrderPrcssAllList" ,workOrderPrcssVo);
	}

	
	//작지별 소공정 모니터링 조회
	@Override
	public List<WorkOrderPrcssVo> workOrdPrcssMonitoringList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrdPrcssMonitoringList" , workOrderPrcssVo);
	}
	
	
	//생산시간 계산
	@Override
	public String getWorkTime(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".getWorkTime" ,workOrderPrcssVo );
	}
	
	//일자별 생산수량
	public int workOrdPrcssDayQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".workOrdPrcssDayQty" , workOrderPrcssVo);
	}
	
	//LOT현황 -------------------------------------------------------------------------------------------------
	
	//1.생산LOT추적
	public List<WorkOrderPrcssVo> lotTrackList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList1" ,workOrderPrcssVo );
	}
	
	//2.자재LOT추적
	public List<WorkOrderMatrlVo> lotTrackList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList2" ,workOrderPrcssVo );
	}
	
	//3.불량LOT추적
	public List<WorkOrderPrcssVo> lotTrackList3(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList3" ,workOrderPrcssVo );
	}
		
	//4.작업지시번호
	public List<WorkOrderPrcssVo> lotTrackList4(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList4" ,workOrderPrcssVo );
	}
	
	//5.출하정보
	public List<WorkOrderPrcssVo> lotTrackList5(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList5" ,workOrderPrcssVo );
	}
	
	// 자재LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return session.selectList(namespace+".lotTrackStockPaymentList2" ,workOrderPrcssVo );
	}
	
	// 생산LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return session.selectList(namespace+".lotTrackStockPaymentList1" ,workOrderPrcssVo );
	}
	
	// 생산LOT 조회(봉제)
	public List<WorkOrderPrcssVo> lotTrackList6(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList6" ,workOrderPrcssVo );
	}
	
	// 자재LOTNO 정보 조회(봉제)
	public List<WorkOrderPrcssVo> lotTrackList7(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList7" ,workOrderPrcssVo );
	}
	
	// 생산LOTNO 정보 조회(봉제)
	public List<WorkOrderPrcssVo> lotTrackList8(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList8" ,workOrderPrcssVo);
	}
	
	// 출하LOTNO 정보 조회(봉제)
	public List<WorkOrderPrcssVo> lotTrackList9(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList9" ,workOrderPrcssVo );
	}
	
	// 생산LOTNO 정보 조회(사출)
	public List<WorkOrderPrcssVo> lotTrackList10(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".lotTrackList10" ,workOrderPrcssVo );
	}
	
	
	//LOT 확인 -------------------------------------------------------------------------------------------------
	
	//LOT 존재 확인
	@Override
	public int workOrderPrcssExist(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return session.selectOne(namespace+".workOrderPrcssExist" ,workOrderPrcssVo);
	}
	
	//LOT 데이터 조회
	@Override
	public WorkOrderPrcssVo workOrderPrcssRead(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return session.selectOne(namespace+".workOrderPrcssRead" ,workOrderPrcssVo);
	}
	
	//제조리드타임 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".leadTimeList" , workOrderPrcssVo);
	}
	
	public WorkOrderPrcssVo leadTimeSubTotalList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectOne(namespace+".leadTimeSubTotalList" , workOrderPrcssVo);
	}
	
	//생산 공정 불량율 현황 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> workPrcssFaultyRateList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workPrcssFaultyRateList" , workOrderPrcssVo);
	}
	
	//생산실적(봉제)*********************************************************
	//소공정 조회
	public List<WorkOrderPrcssVo> workOrderPrcssCdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace+".workOrderPrcssCdList",workOrderPrcssVo);
	}
	
	//작업지시 불량수량 수정(봉제)
	public void updateQtybong(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		session.update(namespace+".updateQtybong" ,workOrderPrcssVo );
	}
	
	//제조리드타임(봉제) -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeSewingList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace + ".leadTimeSewingList", workOrderPrcssVo);
	}
	
}
