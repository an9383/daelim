package mes.service.bm;

import java.util.List;

import mes.domain.bm.PrcssFaultyOrdAdmVo;

public interface PrcssFaultyOrdAdmService {
	
	//목록조회
	public List<PrcssFaultyOrdAdmVo> listAll(PrcssFaultyOrdAdmVo vo) throws Exception;
	
	//조회
	public List<PrcssFaultyOrdAdmVo> list(PrcssFaultyOrdAdmVo vo) throws Exception;
	
	//등록
	public void create(List<PrcssFaultyOrdAdmVo> list) throws Exception;
	
	//삭제
	public void delete(PrcssFaultyOrdAdmVo vo) throws Exception;

	//불량유형 목록조회
	public List<PrcssFaultyOrdAdmVo> baseInfoAdmFTList(PrcssFaultyOrdAdmVo vo) throws Exception;
}
