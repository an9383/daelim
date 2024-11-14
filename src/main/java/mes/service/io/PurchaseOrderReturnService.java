package mes.service.io;

import java.util.List;

import mes.domain.io.PurchaseOrderReturnVo;

public interface PurchaseOrderReturnService {
	
	//반품등록 마스터 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnMasterList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품등록 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnDetailList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품등록 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품등록 상세조회 
	public PurchaseOrderReturnVo purchaseOrderReturnRead(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 등록 
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 수정
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 삭제
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품등록 발주번호 팝업화면 
	public List<PurchaseOrderReturnVo> itemFaultyAdmPopupList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 승인여부 수정
	public void updateApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//입출고 테이블 실사량, 반품수량 수정
	public void updateReturnQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//불량수량 가져오기
	public Integer getFaultyQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 발주번호 중복확인
	public Integer overlapPoNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품번호 가져오기
	public String getRetnNo(String date) throws Exception;
	
	//반품번호 가져오기
	public Integer getRetnSeq(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//승인여부 확인
	public String getApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
}
