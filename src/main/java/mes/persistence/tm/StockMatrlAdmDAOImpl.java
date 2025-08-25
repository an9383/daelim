package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.StockMatrlAdmVo;

@Repository
public class StockMatrlAdmDAOImpl implements StockMatrlAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.tm.stockMatrlAdmMapper";
	
	//조회
	@Override
	public List<StockMatrlAdmVo> stockMatrlAdmList(StockMatrlAdmVo vo) throws Exception{
		return session.selectList(namespace+".stockMatrlAdmList" , vo);
	}
	
	//다중등록
	@Override
	public void stockMatrlAdmMultiCreate(StockMatrlAdmVo vo) throws Exception{
		session.insert(namespace+".stockMatrlAdmMultiCreate",vo);
	}
	
	//삭제
	@Override
	public void stockMatrlAdmDelete(StockMatrlAdmVo vo) throws Exception{
		session.delete(namespace+".stockMatrlAdmDelete",vo);
	}
}
