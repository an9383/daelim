package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.DeliveryProcDtlVo;
import mes.persistence.bs.DeliveryProcDtlDAO;

@Service
public class DeliveryProcDtlServiceImpl implements DeliveryProcDtlService {

	@Inject
	private DeliveryProcDtlDAO dao;
	
	//출고처리 목록조회
	public List<DeliveryProcDtlVo> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.deliveryProcDtlList(deliveryProcDtlVo);
	}
	
	//출고처리 상세조회
	public List<DeliveryProcDtlVo> deliveryProcDtlRead(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.deliveryProcDtlRead(deliveryProcDtlVo);
	}
	
	//출고처리 등록
	public void deliveryProcDtlCreate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlCreate(deliveryProcDtlVo);
	}
	
	//출고처리 수정
	public void deliveryProcDtlUpdate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlUpdate(deliveryProcDtlVo);
	}
	
	//출고처리 삭제
	public void deliveryProcDtlDelete(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlDelete(deliveryProcDtlVo);
	}
	
	//출고처리 상세시퀀스
	public Integer getDoDtlSeq(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.getDoDtlSeq(deliveryProcDtlVo);
	}
	
	//출고의뢰상세 수정
	public void deliveryOrderDtlUpdate(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryOrderDtlUpdate(deliveryProcDtlVo);
	}
	
	//출고의뢰상세 남은수량 가져오기
	public Integer getRemainQty(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.getRemainQty(deliveryProcDtlVo);
	}
	
	//바코드별 제품출고 모니터링 조회
	public List<DeliveryProcDtlVo> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.itemWhsAdmMonitoringList(deliveryProcDtlVo);
	}
}
