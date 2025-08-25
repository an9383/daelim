package mes.service.tm;

import java.util.List;

import mes.domain.tm.PrcssUserReportVo;

public interface PrcssUserReportService {
	//list
	public List<PrcssUserReportVo> prcssUserReportList(PrcssUserReportVo prcssUserReportVo) throws Exception;
	
	//create
	public int prcssUserReportCreate(PrcssUserReportVo prcssUserReportVo) throws Exception;
	
}
