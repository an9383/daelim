package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkSingleItemFaultyVo;

public interface WorkSingleItemFaultyDAO {

	//단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyList(WorkSingleItemFaultyVo vo) throws Exception;
	
	//제품/단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workFaultyTypeAllList(WorkSingleItemFaultyVo vo) throws Exception;
	
	//금일 품목/불량유형별 누적수량
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyAccList(WorkSingleItemFaultyVo vo) throws Exception;
	
	//단품불량 등록
	public void workSingleItemFaultyIns(WorkSingleItemFaultyVo vo) throws Exception;
	
	//단품불량 삭제
	public void workSingleItemFaultyDel(WorkSingleItemFaultyVo vo) throws Exception;
}
