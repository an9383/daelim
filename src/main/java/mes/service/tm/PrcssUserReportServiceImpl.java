package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.PrcssUserReportVo;
import mes.persistence.tm.PrcssUserReportDAO;

@Service
public class PrcssUserReportServiceImpl implements PrcssUserReportService {
	
	@Inject
	private PrcssUserReportDAO dao;
	
	//list
	public List<PrcssUserReportVo> prcssUserReportList(PrcssUserReportVo prcssUserReportVo) throws Exception{
		return dao.prcssUserReportList(prcssUserReportVo);
	}
	
	//create
	public int prcssUserReportCreate(PrcssUserReportVo prcssUserReportVo) throws Exception{
		return dao.prcssUserReportCreate(prcssUserReportVo);
	}
	
}
