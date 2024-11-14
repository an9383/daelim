package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.DeliveryOrderAdmVo;
import mes.persistence.bs.DeliveryOrderAdmDAO;

@Service
public class DeliveryOrderAdmServiceImpl implements DeliveryOrderAdmService {

	@Inject
	private DeliveryOrderAdmDAO dao;
	
	//출고의뢰등록 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmList(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 목록조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListNew(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception {
		
		return dao.deliveryOrderAdmListNew(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 상세목록조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListDtl(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmListDtl(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmRead(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 ADM 등록
	public void deliveryOrderAdmCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmCreate(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 ADM 수정
	public void deliveryOrderAdmUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmUpdate(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 ADM 삭제
	public void deliveryOrderAdmDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmDelete(deliveryOrderAdmVo);
	}

	//출고의뢰등록 DTL 등록
	public void deliveryOrderDtlCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderDtlCreate(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DTL 수정
	public void deliveryOrderDtlUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderDtlUpdate(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DTL 삭제
	public void deliveryOrderDtlDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderDtlDelete(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 출고의뢰번호 생성
	public String getDoNo(String date)throws Exception{
		return dao.getDoNo(date);
	}
	
	//출고의뢰등록 출고의뢰시퀀스 생성
	public Integer getDoSeq(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.getDoSeq(deliveryOrderAdmVo);
	}
	
	//출고마감 마감처리
	public void doStatusUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.doStatusUpdate(deliveryOrderAdmVo);
	}
	
	//LOT 등록 여부
	@Override
	public int deliveryOrderDtlExist(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception {
		return dao.deliveryOrderDtlExist(deliveryOrderAdmVo);
	}
	
	//출고의뢰등록 DO_NO_SEV 생성
	@Override
	public String getDoNoSev(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception {
		return dao.getDoNoSev(deliveryOrderAdmVo);
	}
	
	//출고현황 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmTotalList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmTotalList(deliveryOrderAdmVo);
	}
	
	//출고현황 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmDetailList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmDetailList(deliveryOrderAdmVo);
	}
	
	public int getTargetQty(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.getTargetQty(deliveryOrderAdmVo);
	}
}
