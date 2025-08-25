package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.PurchaseOrderReturnVo;

@Repository
public class PurchaseOrderReturnDAOImpl implements PurchaseOrderReturnDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.purchaseOrderReturnMapper";
	
	//반품등록 마스터 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnMasterList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectList(namespace+".purchaseOrderReturnMasterList" ,purchaseOrderReturnVo );
	}
		
	//반품등록 목록조회 
	public List<PurchaseOrderReturnVo> purchaseOrderReturnDetailList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectList(namespace+".purchaseOrderReturnDetailList" ,purchaseOrderReturnVo );
	}
	
	//반품등록 목록조회 
	@Override
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectList(namespace+".purchaseOrderReturnList" ,purchaseOrderReturnVo );
	}
	
	
	//반품등록 상세조회 
	@Override
	public PurchaseOrderReturnVo purchaseOrderReturnRead(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".purchaseOrderReturnRead" , purchaseOrderReturnVo);
	}
	
	//반품 등록 
	@Override
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.insert(namespace+".purchaseOrderReturnCreate" ,purchaseOrderReturnVo );
	}
	
	//반품 수정
	@Override
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.update(namespace+".purchaseOrderReturnUpdate" ,purchaseOrderReturnVo );
	}
	
	//반품 삭제
	@Override
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.delete(namespace+".purchaseOrderReturnDelete" ,purchaseOrderReturnVo );
	}
	
	//반품등록 발주번호 팝업화면 
	public List<PurchaseOrderReturnVo> itemFaultyAdmPopupList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectList(namespace +".itemFaultyAdmPopupList",purchaseOrderReturnVo);
	}
	
	//반품 승인여부 수정
	public void updateApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.update(namespace+".updateApprovalCd" , purchaseOrderReturnVo);
	}
	
	//입출고 테이블 실사량, 반품수량 수정
	public void updateReturnQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.update(namespace+".updateReturnQty" , purchaseOrderReturnVo);
	}
	
	//불량수량 가져오기
	public Integer getFaultyQty(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".getFaultyQty" ,purchaseOrderReturnVo );
	}
	
	//반품 발주번호 중복확인
	public Integer overlapPoNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".overlapPoNo" ,purchaseOrderReturnVo );
	}
	
	//반품번호 가져오기
	public String getRetnNo(String date) throws Exception{
		return session.selectOne(namespace+".getRetnNo" ,date );
	}
	
	//반품번호 가져오기
	public Integer getRetnSeq(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".getRetnSeq" ,purchaseOrderReturnVo );
	}
	
	//승인여부 확인
	public String getApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".getApprovalCd" ,purchaseOrderReturnVo );
	}
}
