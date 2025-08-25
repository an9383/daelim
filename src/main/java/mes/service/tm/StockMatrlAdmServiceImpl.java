package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.StockMatrlAdmVo;
import mes.persistence.tm.StockMatrlAdmDAO;

@Service
public class StockMatrlAdmServiceImpl implements StockMatrlAdmService {

	@Inject
	private StockMatrlAdmDAO dao;
	
	//조회
	public List<StockMatrlAdmVo> stockMatrlAdmList(StockMatrlAdmVo vo) throws Exception{
		return dao.stockMatrlAdmList(vo);
	}
	
	@Override
	//다중등록
	public void stockMatrlAdmMultiCreate(StockMatrlAdmVo vo) throws Exception{
		dao.stockMatrlAdmMultiCreate(vo);
	}
	
	//삭제
	@Override
	public void stockMatrlAdmDelete(StockMatrlAdmVo vo) throws Exception{
		dao.stockMatrlAdmDelete(vo);
	}
}
