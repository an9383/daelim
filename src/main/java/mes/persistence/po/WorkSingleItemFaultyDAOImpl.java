package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkSingleItemFaultyVo;

@Repository
public class WorkSingleItemFaultyDAOImpl implements WorkSingleItemFaultyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.po.workSingleItemFaultyMapper";
	
	//단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyList(WorkSingleItemFaultyVo vo) throws Exception{
		return session.selectList(namespace+".workSingleItemFaultyList" , vo);
	}
	
	//제품/단품불량 목록조회
	public List<WorkSingleItemFaultyVo> workFaultyTypeAllList(WorkSingleItemFaultyVo vo) throws Exception{
		return session.selectList(namespace+".workFaultyTypeAllList" ,vo);
	}
	
	//금일 품목/불량유형별 누적수량
	public List<WorkSingleItemFaultyVo> workSingleItemFaultyAccList(WorkSingleItemFaultyVo vo) throws Exception{
		return session.selectList(namespace+".workSingleItemFaultyAccList" , vo);
	}
	
	//단품불량 등록
	public void workSingleItemFaultyIns(WorkSingleItemFaultyVo vo) throws Exception{
		session.insert(namespace+".workSingleItemFaultyIns" , vo);
	}
	
	//단품불량 삭제
	public void workSingleItemFaultyDel(WorkSingleItemFaultyVo vo) throws Exception{
		session.delete(namespace+".workSingleItemFaultyDel" ,vo);
	}
}
