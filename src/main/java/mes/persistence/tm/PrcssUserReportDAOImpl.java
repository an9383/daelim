package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.PrcssUserReportVo;

@Repository
public class PrcssUserReportDAOImpl implements PrcssUserReportDAO {

	@Inject
	private static String namespace = "mes.mappers.tm.prcssUserReportMapper";
	
	@Inject
	private SqlSession session;
	
	//list
	public List<PrcssUserReportVo> prcssUserReportList(PrcssUserReportVo prcssUserReportVo) throws Exception{
		return session.selectList(namespace + ".prcssUserReportList", prcssUserReportVo);
	}
	
	//create
	public int prcssUserReportCreate(PrcssUserReportVo prcssUserReportVo) throws Exception{
		return session.insert(namespace + ".prcssUserReportCreate", prcssUserReportVo);
	}
	
}
