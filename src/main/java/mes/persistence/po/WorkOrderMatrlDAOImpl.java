package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderMatrlVo;

@Repository
public class WorkOrderMatrlDAOImpl implements WorkOrderMatrlDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderMatrlMapper";
	
	//작업지시별 자재투입 목록조회
	@Override
	public List<WorkOrderMatrlVo> listAll(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".listAll",workOrderMatrlVo);
	}
	
	//작업지시별 자재투입 상세조회	
	public List<WorkOrderMatrlVo> workOrdMatrlRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlRead",workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlListAdm" ,workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	public List<WorkOrderMatrlVo> workOrdMatrlListAdmByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlListAdmByBongjea" ,workOrderMatrlVo );
	}
	
	//자재투입내역(ADM)
	public List<WorkOrderMatrlVo> workOrdMatrlBarcodeList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlBarcodeList" ,workOrderMatrlVo );
	}
	
	//자재투입 누적 내역(ADM)
	public WorkOrderMatrlVo workOrdMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlAccList" , workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlProgressList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace + ".workOrdMatrlProgressList", workOrderMatrlVo);
	}
	
	//자재투입내역(DTL)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlListDtl" ,workOrderMatrlVo);
	}
	
	//자재투입내역 자재별 투입현황 조회
	@Override
	public WorkOrderMatrlVo workOrdMatrlPartRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlPartRead" ,workOrderMatrlVo);
	}
	
	//자재투입처리 등록
	public void workOrdMatrlAdd(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		session.insert(namespace+".workOrdMatrlAdd" ,workOrderMatrlVo);
	}
	
	//자재투입처리 수정
	public void workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		session.update(namespace+".workOrdMatrlEdit" ,workOrderMatrlVo);
	}
	
	//자재투입처리 수정 - 리스트
	public void workOrdMatrlListEdit(List<WorkOrderMatrlVo> list) throws Exception{
		session.update(namespace + ".workOrdMatrlListEdit", list);
	}
	
	//자재투입처리 목록조회
	public int workOrdMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlList" ,workOrderMatrlVo);
	}
	
	//자재투입처리 목록조회
	public int workOrdMatrlListByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlListByBongjea" , workOrderMatrlVo);
	}
	
	//자재투입처리 투입삭제
	public int workOrdMatrlDel(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.delete(namespace+".workOrdMatrlDel" ,workOrderMatrlVo );
	}
	
	//선입선출 자재투입 조회(사출)
	public WorkOrderMatrlVo workOrdMatrlFifoList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlFifoList" , workOrderMatrlVo);
	}
	

	//선입선출 자재투입 조회(봉제)
	public WorkOrderMatrlVo workOrdMatrlFifoListByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".workOrdMatrlFifoListByBongjae" , workOrderMatrlVo);
	}
	
	//해당 바코드가 투입된 작업지시 상태(사출)
	public String getMatrlWorkStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".getMatrlWorkStatus" ,workOrderMatrlVo );
	}
	
	//해당 바코드가 투입된 작업지시 상태(봉제)
	public String getMatrlWorkStatusByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".getMatrlWorkStatusByBongjae" , workOrderMatrlVo);
	}
	
	//자재투입 BOM 기준으로 모든 자재투입여부
	public String getMatrlBomInputStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectOne(namespace+".getMatrlBomInputStatus" , workOrderMatrlVo);
	}
	
	//자재투입 BOM 기준으로 모든 자재 소요량계산
	public List<WorkOrderMatrlVo> getMatrlBomInputConsumpt(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".getMatrlBomInputConsumpt" ,workOrderMatrlVo );
	}
	
	//자재투입 품목별 누계
	public List<WorkOrderMatrlVo> workOrderMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrderMatrlAccList" , workOrderMatrlVo);
	}
	
	//자재투입내역(ADM) -버전2
	public List<WorkOrderMatrlVo> workOrdMatrlListAdmByBongjea2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrdMatrlListAdmByBongjea2" ,workOrderMatrlVo );
	}
	
	//자재투입 품목별 누계 -버전2
	public List<WorkOrderMatrlVo> workOrderMatrlAccList2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return session.selectList(namespace+".workOrderMatrlAccList2", workOrderMatrlVo);
	}
}
