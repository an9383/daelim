package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.TakeOffAdmVo;

@Repository
public class TakeOffAdmDAOImpl implements TakeOffAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.bs.takeOffAdmMapper";
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffAdmGroupList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return session.selectList(namespace + ".takeOffAdmGroupList", takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffAdmList(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return session.selectList(namespace + ".takeOffAdmList", takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffInjectList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return session.selectList(namespace + ".takeOffInjectList", takeOffAdmVo);
	}

	//List
	@Override
	public List<TakeOffAdmVo> takeOffCustomerList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return session.selectList(namespace + ".takeOffCustomerList", takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffOutsourcingList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return session.selectList(namespace + ".takeOffOutsourcingList", takeOffAdmVo);
	}
	
	//Read
	@Override
	public TakeOffAdmVo takeOffAdmRead(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return session.selectOne(namespace + ".takeOffAdmRead", takeOffAdmVo);
	}

	//Create
	@Override
	public String takeOffAdmCreate(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    session.insert(namespace + ".takeOffAdmCreate", takeOffAdmVo);
	    String idx = takeOffAdmVo.getIdx();
    	return idx;
	}

	//Update
	@Override
	public int takeOffAdmUpdate(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return session.update(namespace + ".takeOffAdmUpdate", takeOffAdmVo);
	}

	//Delete
	@Override
	public void takeOffAdmDelete(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    session.delete(namespace + ".takeOffAdmDelete", takeOffAdmVo);
	}
	
	//Update
	@Override
	public String getTakeOffBarcodeNo(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return session.selectOne(namespace + ".getTakeOffBarcodeNo", takeOffAdmVo);
	}
	
}
