package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.PrcssFaultyOrdAdmVo;

@Repository
public class PrcssFaultyOrdAdmDAOImpl implements PrcssFaultyOrdAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.prcssFaultyOrdAdmMapper";
	
	//목록조회
	@Override
	public List<PrcssFaultyOrdAdmVo> listAll(PrcssFaultyOrdAdmVo vo) throws Exception{
		return session.selectList(namespace+".listAll",vo);
	}
	
	//조회
	@Override
	public List<PrcssFaultyOrdAdmVo> list(PrcssFaultyOrdAdmVo vo) throws Exception{
		return session.selectList(namespace+".list",vo);
	}
	
	//등록
	@Override
	public void create(List<PrcssFaultyOrdAdmVo> list) throws Exception{
		session.insert(namespace+".create",list);
	}
	
	//삭제
	@Override
	public void delete(PrcssFaultyOrdAdmVo vo) throws Exception{
		session.delete(namespace+".delete",vo);
	}
	
	//불량유형 목록조회
	@Override
	public List<PrcssFaultyOrdAdmVo> baseInfoAdmFTList(PrcssFaultyOrdAdmVo vo) throws Exception{
		return session.selectList(namespace+".baseInfoAdmFTList" , vo);
	}
	
}
