package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderMatrlVo;
import mes.persistence.po.WorkOrderMatrlDAO;

@Service
public class WorkOrderMatrlServiceImpl implements WorkOrderMatrlService {

	@Inject
	private WorkOrderMatrlDAO dao;
	 
	//작업지시별 자재투입 목록조회
	@Override
	public List<WorkOrderMatrlVo> listAll(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.listAll(workOrderMatrlVo);
	}
	
	//작업지시별 자재투입 상세조회	
	public List<WorkOrderMatrlVo> workOrdMatrlRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlRead(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListAdm(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	public List<WorkOrderMatrlVo> workOrdMatrlListAdmByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListAdmByBongjea(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	public List<WorkOrderMatrlVo> workOrdMatrlBarcodeList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlBarcodeList(workOrderMatrlVo);
	}
	
	//자재투입 누적 내역(ADM)
	public WorkOrderMatrlVo workOrdMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlAccList(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlProgressList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlProgressList(workOrderMatrlVo);
	}
	
	//자재투입내역(DTL)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListDtl(workOrderMatrlVo);
	}
	
	//자재투입내역 자재별 투입현황 조회
	@Override
	public WorkOrderMatrlVo workOrdMatrlPartRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlPartRead(workOrderMatrlVo);
	}
	
	//자재투입처리 등록
	@Override
	public void workOrdMatrlAdd(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		dao.workOrdMatrlAdd(workOrderMatrlVo);
	}
	
	//자재투입처리 수정
	public void workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		dao.workOrdMatrlEdit(workOrderMatrlVo);
	}
	
	//자재투입처리 수정 - 리스트
	public void workOrdMatrlListEdit(List<WorkOrderMatrlVo> list) throws Exception{
		dao.workOrdMatrlListEdit(list);
	}
	
	//자재투입처리 목록조회
	public int workOrdMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlList(workOrderMatrlVo);
	}
	
	//자재투입처리 목록조회
	public int workOrdMatrlListByBongjea(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListByBongjea(workOrderMatrlVo);
	}
	
	//자재투입처리 투입삭제
	public int workOrdMatrlDel(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlDel(workOrderMatrlVo);
	}
	
	//선입선출 자재투입 조회(사출)
	public WorkOrderMatrlVo workOrdMatrlFifoList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlFifoList(workOrderMatrlVo);
	}
	
	//선입선출 자재투입 조회(봉제)
	public WorkOrderMatrlVo workOrdMatrlFifoListByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlFifoListByBongjae(workOrderMatrlVo);
	}
	
	//해당 바코드가 투입된 작업지시 상태
	public String getMatrlWorkStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlWorkStatus(workOrderMatrlVo);
	}
	
	//해당 바코드가 투입된 작업지시 상태(봉제)
	public String getMatrlWorkStatusByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlWorkStatusByBongjae(workOrderMatrlVo);
	}
	
	//자재투입 BOM 기준으로 모든 자재투입여부
	public String getMatrlBomInputStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlBomInputStatus(workOrderMatrlVo);
	}
	
	//자재투입 BOM 기준으로 모든 자재 소요량계산
	public List<WorkOrderMatrlVo> getMatrlBomInputConsumpt(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlBomInputConsumpt(workOrderMatrlVo);
	}
	
	//자재투입 품목별 누계
	public List<WorkOrderMatrlVo> workOrderMatrlAccList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrderMatrlAccList(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM) -버전2
	public List<WorkOrderMatrlVo> workOrdMatrlListAdmByBongjea2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListAdmByBongjea2(workOrderMatrlVo);
	}
	
	//자재투입 품목별 누계 -버전2
	public List<WorkOrderMatrlVo> workOrderMatrlAccList2(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrderMatrlAccList2(workOrderMatrlVo);
	}
}

	