package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.DeliveryOrderAdmVo;

public interface DeliveryOrderAdmDAO {

	//출고의뢰등록 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListNew(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 상세목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmListDtl(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 ADM 등록
	public void deliveryOrderAdmCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 ADM 수정
	public void deliveryOrderAdmUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;

	//출고의뢰등록 ADM 삭제
	public void deliveryOrderAdmDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 DTL 등록
	public void deliveryOrderDtlCreate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 DTL 수정
	public void deliveryOrderDtlUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 DTL 삭제
	public void deliveryOrderDtlDelete(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 출고의뢰번호 생성
	public String getDoNo(String date)throws Exception;
	
	//출고의뢰등록 출고의뢰시퀀스 생성
	public Integer getDoSeq(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고마감 마감처리
	public void doStatusUpdate(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;

	//LOT 등록 여부
	public int deliveryOrderDtlExist(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고의뢰등록 DO_NO_SEV 생성
	public String getDoNoSev(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고현황 목록조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmTotalList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고현황 상세조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmDetailList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	public int getTargetQty(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
}
