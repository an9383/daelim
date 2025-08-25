package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.ItemWhsAdmVo;

@Repository
public class ItemWhsAdmDAOImpl implements ItemWhsAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.itemWhsAdmMapper";
	
	//제품입출고관리 목록조회
	public List<ItemWhsAdmVo> itemWhsAdmMainList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace + ".itemWhsAdmMainList", itemWhsAdmVo );
	}
	
	//제품입고 목록조회
	public List<ItemWhsAdmVo> itemWhsAdmList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".itemWhsAdmList" ,itemWhsAdmVo );
	}
	
	//제품입고 상세조회
	public ItemWhsAdmVo itemWhsAdmRead(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".itemWhsAdmRead" ,itemWhsAdmVo );
	}
	
	//제품입고 등록
	public void itemWhsAdmCreate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.insert(namespace+".itemWhsAdmCreate",itemWhsAdmVo );
	}
	
	//제품입고 등록 - 리스트
	public void itemWhsAdmListCreate(List<ItemWhsAdmVo> list) throws Exception{
		session.insert(namespace + ".itemWhsAdmListCreate", list);
	}
	
	//제품입고 수정 - 리스트
	public void itemWhsAdmListUpdate(List<ItemWhsAdmVo> list) throws Exception{
		session.insert(namespace + ".itemWhsAdmListUpdate", list);
	}
	
	//제품입고 수정
	public void itemWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.update(namespace+".itemWhsAdmUpdate",itemWhsAdmVo );
	}
	
	//제품입고 삭제
	public void itemOutWhsDelete(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.delete(namespace+".itemOutWhsDelete",itemWhsAdmVo);
	}
	
	//제품출고 수정
	public void itemOutWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.update(namespace+".itemOutWhsAdmUpdate",itemWhsAdmVo );
	}
	
	//제품출고 초기화
	public void itemOutWhsResetUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.update(namespace+".itemOutWhsResetUpdate",itemWhsAdmVo );
	}
	
	//제품입고 창고목록 가져오기
	public List<ItemWhsAdmVo> getInLoc(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".getInLoc" ,itemWhsAdmVo );
	}
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInArea(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".getInArea" ,itemWhsAdmVo );
	}
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInFloor(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".getInFloor" ,itemWhsAdmVo );
	}
	
	//제품바코드 유무확인
	public int itemBarcodeNoCheck(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".itemBarcodeNoCheck" ,itemWhsAdmVo );
	}
	
	//제품입고 유무확인
	public int existItemWhsAdm(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".existItemWhsAdm",itemWhsAdmVo);
	}
	
	//수주상세등록 잔여수량, 완료수량 수정
	public void bizOrdDtlUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		session.update(namespace+".bizOrdDtlUpdate",itemWhsAdmVo);
	}
	
	//제품입고 창고정보
	public ItemWhsAdmVo getLocInfo(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getLocInfo" , itemWhsAdmVo);
	}
	
	
	//출하현황 목록조회
	public List<ItemWhsAdmVo> itemWhsOutList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".itemWhsOutList" , itemWhsAdmVo);
	}
	
	//출하현황 상세조회
	public List<ItemWhsAdmVo> itemWhsOutDtlList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".itemWhsOutDtlList" , itemWhsAdmVo);
	}
	
	//출하 LOT NO 조회
	public List<ItemWhsAdmVo> lotNoList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return session.selectList(namespace+".lotNoList" , itemWhsAdmVo);
	}
}
