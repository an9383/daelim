package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.PurchaseOrderReturnVo;
import mes.persistence.io.PurchaseOrderReturnDAO;

@Service
public class PurchaseOrderReturnServiceImpl implements PurchaseOrderReturnService {
	
	@Inject
	private PurchaseOrderReturnDAO dao;
	
	//반품등록 마스터 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnMasterList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.purchaseOrderReturnMasterList(purchaseOrderReturnVo);
	}

	//반품등록 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnDetailList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.purchaseOrderReturnDetailList(purchaseOrderReturnVo);
	}
	
	//반품등록 목록조회 
	@Override
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.purchaseOrderReturnList(purchaseOrderReturnVo);
	}
	//반품등록 상세조회 
	@Override
	public PurchaseOrderReturnVo purchaseOrderReturnRead(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.purchaseOrderReturnRead(purchaseOrderReturnVo);
	}
	
	//반품 등록 
	@Override
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnCreate(purchaseOrderReturnVo);
	}
	
	//반품 수정
	@Override
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnUpdate(purchaseOrderReturnVo);
	}
	
	//반품 삭제
	@Override
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnDelete(purchaseOrderReturnVo);
	}

	//반품등록 발주번호 팝업화면 
	public List<PurchaseOrderReturnVo> itemFaultyAdmPopupList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.itemFaultyAdmPopupList(purchaseOrderReturnVo);
	}
	
	//반품 승인여부 수정
	public void updateApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.updateApprovalCd(purchaseOrderReturnVo);
	}
	
	//입출고 테이블 실사량, 반품수량 수정
	public void updateReturnQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.updateReturnQty(purchaseOrderReturnVo);
	}
	
	//불량수량 가져오기
	public Integer getFaultyQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.getFaultyQty(purchaseOrderReturnVo);
	}
	
	//반품 발주번호 중복확인
	public Integer overlapPoNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.overlapPoNo(purchaseOrderReturnVo);
	}
	
	//반품번호 가져오기
	public String getRetnNo(String date) throws Exception{
		return dao.getRetnNo(date);
	}
	
	//반품번호 가져오기
	public Integer getRetnSeq(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.getRetnSeq(purchaseOrderReturnVo);
	}
	
	//승인여부 확인
	public String getApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.getApprovalCd(purchaseOrderReturnVo);
	}
}
