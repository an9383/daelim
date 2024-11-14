package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.DeliveryOrderAdmVo;

@Repository
public class DeliveryOrderAdmDAOImple implements DeliveryOrderAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.deliveryOrderAdmMapper";
	
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception {
		
		return session.selectList(namespace +".deliveryOrderAdmList" ,deliveryOrderAdmVo );
	}
	
	//출고의뢰등록 목록조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListNew(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception {
		
		return session.selectList(namespace +".deliveryOrderAdmListNew" ,deliveryOrderAdmVo );
	}
	
	//출고의뢰등록 상세목록조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListDtl(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectList(namespace +".deliveryOrderAdmListDtl" ,deliveryOrderAdmVo );
	}

	//출고의뢰등록 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectList(namespace+".deliveryOrderAdmRead" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 ADM 등록
	public void deliveryOrderAdmCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.insert(namespace +".deliveryOrderAdmCreate" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 ADM 수정
	public void deliveryOrderAdmUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.update(namespace +".deliveryOrderAdmUpdate" , deliveryOrderAdmVo);
	}


	//출고의뢰등록 ADM 삭제
	public void deliveryOrderAdmDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.delete(namespace +".deliveryOrderAdmDelete" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DTL 등록
	public void deliveryOrderDtlCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.insert(namespace +".deliveryOrderDtlCreate" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DTL 수정
	public void deliveryOrderDtlUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.update(namespace+".deliveryOrderDtlUpdate" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DTL 삭제
	public void deliveryOrderDtlDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.delete(namespace+".deliveryOrderDtlDelete", deliveryOrderAdmVo);
		
	}
	
	//출고의뢰등록 출고의뢰번호 생성
	public String getDoNo(String date)throws Exception{
		return session.selectOne(namespace +".getDoNo", date);
	}
	
	//출고의뢰등록 출고의뢰시퀀스 생성
	public Integer getDoSeq(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectOne(namespace + ".getDoSeq" , deliveryOrderAdmVo);
	}
	
	//출고마감 마감처리
	public void doStatusUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.update(namespace +".doStatusUpdate" , deliveryOrderAdmVo);
	}

	
	//LOT 등록 여부
	@Override
	public int deliveryOrderDtlExist(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception {
		return session.selectOne(namespace + ".deliveryOrderDtlExist" , deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DO_NO_SEV 생성
	@Override
	public String getDoNoSev(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception {
		return session.selectOne(namespace + ".getDoNoSev" , deliveryOrderAdmVo);
	}
	
	//출고현황 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmTotalList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectList(namespace+".deliveryOrderAdmTotalList" , deliveryOrderAdmVo);
	}
	
	//출고현황 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmDetailList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectList(namespace+".deliveryOrderAdmDetailList" , deliveryOrderAdmVo);
	}
	
	public int getTargetQty(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectOne(namespace+".getTargetQty",deliveryOrderAdmVo);
	}
}
