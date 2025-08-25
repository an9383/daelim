package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.qm.UnfitAdmVo;
import mes.persistence.qm.UnfitAdmDAO;

@Service
public class UnfitAdmServiceImpl implements UnfitAdmService {

	@Inject
	private UnfitAdmDAO dao;
	
	//부적합관리대장(수입) 목록조회
	@Override
	public List<UnfitAdmVo> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitInspectAdmList(unfitAdmVo);
	}

	//부적합관리대장(공정) 목록조회
	@Override
	public List<UnfitAdmVo> unfitPrcssAdmInjectList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPrcssAdmInjectList(unfitAdmVo);
	}
	
	//부적합관리대장(공정) - 사출 목록조회
	@Override
	public List<UnfitAdmVo> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPrcssAdmList(unfitAdmVo);
	}
	
	//부적합관리대장(출하) - 봉제 목록조회
	@Override
	public List<UnfitAdmVo> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitCompleteAdmList(unfitAdmVo);
	}
	
	//부적합관리대장(단품불량) 목록조회
	@Override
	public List<UnfitAdmVo> unfitPriceAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPriceAdmList(unfitAdmVo);
	}
	
	//부적합관리현황(수입) 목록조회
	@Override
	public List<UnfitAdmVo> unfitInspectAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitInspectAdmSituList(unfitAdmVo);
	}
	
	//부적합관리현황(공정) 목록조회
	@Override
	public List<UnfitAdmVo> unfitPrcssAdmInjectSituList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPrcssAdmInjectSituList(unfitAdmVo);
	}
	
	//부적합관리현황(공정) - 사출 목록조회
	@Override
	public List<UnfitAdmVo> unfitPrcssAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPrcssAdmSituList(unfitAdmVo);
	}
	
	//부적합관리현황(출하) - 봉제 목록조회
	@Override
	public List<UnfitAdmVo> unfitCompleteAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitCompleteAdmSituList(unfitAdmVo);
	}
	
	//부적합관리현황(단품불량) 목록조회
	@Override
	public List<UnfitAdmVo> unfitPriceAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitPriceAdmSituList(unfitAdmVo);
	}
	
	//부적합관리대장(수입,공정,출하) 등록
	@Override
	public void unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitAdmCreate(unfitAdmVo);
	}

	//부적합관리대장(수입,공정,출하) 수정
	@Override
	public void unfitAdmUpdate(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitAdmUpdate(unfitAdmVo);
	}
	
	//부적합관리대장(수입,공정,출하) 중복확인
	@Override
	public Integer unfitAdmCheck(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitAdmCheck(unfitAdmVo);
	}
	
	//부적합번호 생성
	@Override
	public String getUnfitNo(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.getUnfitNo(unfitAdmVo);
	}
	
	//불량유형 합계(공정) - 사출
	@Override
	public List<UnfitAdmVo> faultyTypeTotalInjectList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeTotalInjectList(unfitAdmVo);
	}
	
	//불량유형 합계(공정) - 봉제
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeTotalList(unfitAdmVo);
	}
	
	//불량유형 합계(수입)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeTotalList2(unfitAdmVo);
	}
	
	//불량유형 합계(출하)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeTotalList3(unfitAdmVo);
	}
	
	//불량유형 합계(단가)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList4(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeTotalList4(unfitAdmVo);
	}
	
	//불량cavity
	@Override
	public List<UnfitAdmVo> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.faultyTypeCavityList(unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 결과 등록
	@Override
	public void unfitResultCreate(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitResultCreate(unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 결과 리스트 등록
	@Override
	public int unfitResultListCreate(List<UnfitAdmVo> list) throws Exception{
		return dao.unfitResultListCreate(list);
	}
	
	//부적합관리대장(봉제) 결과 수정
	@Override
	public void unfitResultUpdate(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitResultUpdate(unfitAdmVo);
	}
	
	//부적합관리현황(봉제) 결과 수정
	public void unfitResultUpdate2(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitResultUpdate2(unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 결과 삭제
	@Override
	public void unfitResultDelete(UnfitAdmVo unfitAdmVo) throws Exception{
		dao.unfitResultDelete(unfitAdmVo);
	}
	
	//부적합관리대장 조회
	@Override
	public List<UnfitAdmVo> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitResultList(unfitAdmVo);
	}
	
	//부적합관리현황 조회
	public List<UnfitAdmVo> unfitResultStatusList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitResultStatusList(unfitAdmVo);
	}
	
	//부적합관리대장 상세조회
	@Override
	public UnfitAdmVo unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception {
		return dao.unfitResultRead(unfitAdmVo);	
	}
	
	//부적합관리대장(사출) 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight001List(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitFaultyRight001List(unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight002List(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitFaultyRight002List(unfitAdmVo);
	}
	
	//부적합관리대장(봉제) - 단품불량 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight004List(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.unfitFaultyRight004List(unfitAdmVo);
	}
	
	//부적합창고현황 메인 조회
	public List<UnfitAdmVo> stockPaymentUnfitList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.stockPaymentUnfitList(unfitAdmVo);
	}
	
	//부적합창고현황 창고별 조회
	public List<UnfitAdmVo> stockPaymentUnfitLocList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.stockPaymentUnfitLocList(unfitAdmVo);
	}
	
	//부적합창고현황 바코드별 조회
	public List<UnfitAdmVo> stockPaymentUnfitBarcodeList(UnfitAdmVo unfitAdmVo) throws Exception{
		return dao.stockPaymentUnfitBarcodeList(unfitAdmVo);
	}
	
}
