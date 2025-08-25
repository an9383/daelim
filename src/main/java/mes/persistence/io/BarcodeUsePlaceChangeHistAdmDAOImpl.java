package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.BarcodeUsePlaceChangeHistAdmVo;

@Repository
public class BarcodeUsePlaceChangeHistAdmDAOImpl implements BarcodeUsePlaceChangeHistAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.barcodeUsePlaceChangeHistAdmMapper";
	
	//목록조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmList(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		return session.selectList(namespace+".barcodeUsePlaceChangeHistAdmList" ,barcodeUsePlaceChangeHistAdmVo );
	}
	
	//상세조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmRead(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		return session.selectList(namespace+".barcodeUsePlaceChangeHistAdmRead",barcodeUsePlaceChangeHistAdmVo);
	}
	
	//등록
	@Override
	public void barcodeUsePlaceChangeHistAdmIns(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		session.insert(namespace+".barcodeUsePlaceChangeHistAdmIns" , barcodeUsePlaceChangeHistAdmVo);
	}
	
	//수정
	@Override
	public void barcodeUsePlaceChangeHistAdmUpd(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		session.update(namespace+".barcodeUsePlaceChangeHistAdmUpd" , barcodeUsePlaceChangeHistAdmVo);
	}
	
	//삭제
	@Override
	public void barcodeUsePlaceChangeHistAdmDel(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		session.delete(namespace+".barcodeUsePlaceChangeHistAdmDel" , barcodeUsePlaceChangeHistAdmVo);
	}
}
