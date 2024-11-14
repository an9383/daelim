package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.PrcssFaultyOrdAdmVo;
import mes.persistence.bm.PrcssFaultyOrdAdmDAO;

@Service
public class PrcssFaultyOrdAdmServiceImpl implements PrcssFaultyOrdAdmService {

	@Inject
	private PrcssFaultyOrdAdmDAO dao;
	
	//목록조회
	@Override
	public List<PrcssFaultyOrdAdmVo> listAll(PrcssFaultyOrdAdmVo vo) throws Exception{
		return dao.listAll(vo);
	}
	
	//조회
	@Override
	public List<PrcssFaultyOrdAdmVo> list(PrcssFaultyOrdAdmVo vo) throws Exception{
		return dao.list(vo);
	}
	
	//등록
	@Override
	public void create(List<PrcssFaultyOrdAdmVo> list) throws Exception{
		dao.create(list);
	}
	
	//삭제
	@Override
	public void delete(PrcssFaultyOrdAdmVo vo) throws Exception{
		dao.delete(vo);
	}
	
	//불량유형 목록조회
	@Override
	public List<PrcssFaultyOrdAdmVo> baseInfoAdmFTList(PrcssFaultyOrdAdmVo vo) throws Exception{
		return dao.baseInfoAdmFTList(vo);
	}
}
