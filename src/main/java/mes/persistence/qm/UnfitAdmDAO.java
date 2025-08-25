package mes.persistence.qm;

import java.util.List;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.qm.UnfitAdmVo;

public interface UnfitAdmDAO {
	
	//부적합관리대장(수입) 목록조회
	public List<UnfitAdmVo> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(공정) - 사출 목록조회
	public List<UnfitAdmVo> unfitPrcssAdmInjectList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(공정) - 봉제 목록조회
	public List<UnfitAdmVo> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(출하) 목록조회
	public List<UnfitAdmVo> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(단품불량) 목록조회
	public List<UnfitAdmVo> unfitPriceAdmList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(수입) 목록조회
	public List<UnfitAdmVo> unfitInspectAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(공정) - 사출 목록조회
	public List<UnfitAdmVo> unfitPrcssAdmInjectSituList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(공정) - 봉제 목록조회
	public List<UnfitAdmVo> unfitPrcssAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(출하) 목록조회
	public List<UnfitAdmVo> unfitCompleteAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(단품불량) 목록조회
	public List<UnfitAdmVo> unfitPriceAdmSituList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(수입,공정,출하) 등록
	public void unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(수입,공정,출하) 수정
	public void unfitAdmUpdate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(수입,공정,출하) 중복확인
	public Integer unfitAdmCheck(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합번호 생성
	public String getUnfitNo(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(공정) - 사출
	public List<UnfitAdmVo> faultyTypeTotalInjectList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(공정) - 봉제
	public List<UnfitAdmVo> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception;

	//불량유형 합계(수입)
	public List<UnfitAdmVo> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(출하)
	public List<UnfitAdmVo> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(단가)
	public List<UnfitAdmVo> faultyTypeTotalList4(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량cavity
	public List<UnfitAdmVo> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) 결과 등록
	public void unfitResultCreate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) 결과 리스트 등록
	public int unfitResultListCreate(List<UnfitAdmVo> list) throws Exception;
	
	//부적합관리대장(봉제) 결과 수정
	public void unfitResultUpdate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황(봉제) 결과 수정
	public void unfitResultUpdate2(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) 결과 삭제
	public void unfitResultDelete(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장 조회
	public List<UnfitAdmVo> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리현황 조회
	public List<UnfitAdmVo> unfitResultStatusList(UnfitAdmVo unfitAdmVo) throws Exception;
		
	//부적합관리대장 상세조회
	public UnfitAdmVo unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(사출) 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight001List(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight002List(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) - 단품불량 우측 불량유형별 품명 조회 
	public List<UnfitAdmVo> unfitFaultyRight004List(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합창고현황 메인 조회
	public List<UnfitAdmVo> stockPaymentUnfitList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합창고현황 창고별 조회
	public List<UnfitAdmVo> stockPaymentUnfitLocList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합창고현황 바코드별 조회
	public List<UnfitAdmVo> stockPaymentUnfitBarcodeList(UnfitAdmVo unfitAdmVo) throws Exception;
	
}
