package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.DeliveryProcDtlVo;

@Repository
public class DeliveryProcDtlDAOImpl implements DeliveryProcDtlDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.deliveryProcDtlMapper";
	
	//출고처리 목록조회
	public List<DeliveryProcDtlVo> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectList(namespace +".deliveryProcDtlList" , deliveryProcDtlVo);
	}
	
	//출고처리 상세조회
	public List<DeliveryProcDtlVo> deliveryProcDtlRead(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectList(namespace +".deliveryProcDtlRead" , deliveryProcDtlVo);
	}
	
	//출고처리 등록
	public void deliveryProcDtlCreate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.insert(namespace +".deliveryProcDtlCreate" , deliveryProcDtlVo);
	}
	
	//출고처리 수정
	public void deliveryProcDtlUpdate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.update(namespace +".deliveryProcDtlUpdate" , deliveryProcDtlVo);
	}
	
	//출고처리 삭제
	public void deliveryProcDtlDelete(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.delete(namespace +".deliveryProcDtlDelete" , deliveryProcDtlVo);
	}
	
	//출고처리 상세시퀀스
	public Integer getDoDtlSeq(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectOne(namespace +".getDoDtlSeq" , deliveryProcDtlVo);
	}
	
	//출고의뢰상세 수정
	public void deliveryOrderDtlUpdate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.update(namespace+".deliveryOrderDtlUpdate" , deliveryProcDtlVo);
	}
	
	//출고의뢰상세 남은수량 가져오기
	public Integer getRemainQty(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectOne(namespace +".getRemainQty" , deliveryProcDtlVo);
	}
	
	//바코드별 제품출고 모니터링 조회
	public List<DeliveryProcDtlVo> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectList(namespace+".itemWhsAdmMonitoringList" ,deliveryProcDtlVo );
	}
}
