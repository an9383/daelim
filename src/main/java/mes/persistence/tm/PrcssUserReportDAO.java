package mes.persistence.tm;

import java.util.List;

import mes.domain.tm.PrcssUserReportVo;

public interface PrcssUserReportDAO {
	
	//list
	public List<PrcssUserReportVo> prcssUserReportList(PrcssUserReportVo prcssUserReportVo) throws Exception;
	
	//create
	public int prcssUserReportCreate(PrcssUserReportVo prcssUserReportVo) throws Exception;
	
}
