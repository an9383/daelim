package mes.service.tm;

import java.util.List;

import mes.domain.tm.StockMatrlAdmVo;

public interface StockMatrlAdmService {

	//조회
	public List<StockMatrlAdmVo> stockMatrlAdmList(StockMatrlAdmVo vo) throws Exception;
	
	//다중 등록
	public void stockMatrlAdmMultiCreate(StockMatrlAdmVo vo) throws Exception;
	
	//삭제
	public void stockMatrlAdmDelete(StockMatrlAdmVo vo) throws Exception;
}
