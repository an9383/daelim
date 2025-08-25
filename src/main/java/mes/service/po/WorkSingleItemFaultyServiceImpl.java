package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkSingleItemFaultyVo;
import mes.persistence.po.WorkSingleItemFaultyDAO;

@Service
public class WorkSingleItemFaultyServiceImpl implements WorkSingleItemFaultyService {

	@Inject
	private WorkSingleItemFaultyDAO dao;
	
	//단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyList(WorkSingleItemFaultyVo vo) throws Exception{
		return dao.workSingleItemFaultyList(vo);
	}
	
	//제품/단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workFaultyTypeAllList(WorkSingleItemFaultyVo vo) throws Exception{
		return dao.workFaultyTypeAllList(vo);
	}
	
	//금일 품목/불량유형별 누적수량
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyAccList(WorkSingleItemFaultyVo vo) throws Exception{
		return dao.workSingleItemFaultyAccList(vo);
	}
	
	//단품불량 등록
	public void workSingleItemFaultyIns(WorkSingleItemFaultyVo vo) throws Exception{
		dao.workSingleItemFaultyIns(vo);
	}
	
	//단품불량 삭제
	public void workSingleItemFaultyDel(WorkSingleItemFaultyVo vo) throws Exception{
		dao.workSingleItemFaultyDel(vo);
	}
}
