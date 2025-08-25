package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;
import mes.persistence.wm.ProdPlanAdmDAO;

@Service
public class ProdPlanAdmServiceImpl implements ProdPlanAdmService {

	@Inject
	private ProdPlanAdmDAO dao;
	
	//월 생산계획 목록조회
	public List<MonProdPlanAdmVo> monProdPlanAdmList(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		return dao.monProdPlanAdmList(monProdPlanAdmVo);
	}
	
	//월 생산계획 상세조회
	public int monProdPlanAdmRead(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		return dao.monProdPlanAdmRead(monProdPlanAdmVo);
	}
	
	//월 생산계획 등록
	public void monProdPlanAdmCreate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		dao.monProdPlanAdmCreate(monProdPlanAdmVo);
	}
	
	//월 생산계획 다중등록
	public void monProdPlanAdmListCreate(List<MonProdPlanAdmVo> list)throws Exception{
		dao.monProdPlanAdmListCreate(list);
	}
	
	//월 생산계획 수정
	public void monProdPlanAdmUpdate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		dao.monProdPlanAdmUpdate(monProdPlanAdmVo);
	}
	
	//월 생산계획 다중수정
	public void monProdPlanAdmMultiUpdate(List<MonProdPlanAdmVo> list)throws Exception{
		dao.monProdPlanAdmMultiUpdate(list);
	}
	
	//월 생산계획 다중삭제
	public void monProdPlanAdmListDelete(List<MonProdPlanAdmVo> list)throws Exception{
		dao.monProdPlanAdmListDelete(list);
	}
	
	//일 생산계획 목록조회
	public List<DayProdPlanAdmVo> dayProdPlanAdmList(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return dao.dayProdPlanAdmList(dayProdPlanAdmVo);
	}
	
	//일 생산계획 상세조회
	public int dayProdPlanAdmRead(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return dao.dayProdPlanAdmRead(dayProdPlanAdmVo);
	}
	
	//일 생산계획 상세조회2
	public List<DayProdPlanAdmVo> dayProdPlanAdmRead2(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return dao.dayProdPlanAdmRead2(dayProdPlanAdmVo);
	}
	
	//일 생산계획 등록
	public void dayProdPlanAdmCreate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		dao.dayProdPlanAdmCreate(dayProdPlanAdmVo);
	}
	
	//일 생산계획 수정
	public void dayProdPlanAdmUpdate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		dao.dayProdPlanAdmUpdate(dayProdPlanAdmVo);
	}
	
	//월 생산계획 삭제
	public void dayProdPlanAdmDelete(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		dao.dayProdPlanAdmDelete(dayProdPlanAdmVo);
	}
		
	//일 생산계획 리스트 등록
	public void dayProdPlanAdmListCreate(List<DayProdPlanAdmVo> dayProdPlanAdmVoList) throws Exception{
		dao.dayProdPlanAdmListCreate(dayProdPlanAdmVoList);
	}
	
	//일 생산계획 리스트 수정
	public void dayProdPlanAdmListUpdate(List<DayProdPlanAdmVo> dayProdPlanAdmVoList) throws Exception{
		dao.dayProdPlanAdmListUpdate(dayProdPlanAdmVoList);
	}
}
