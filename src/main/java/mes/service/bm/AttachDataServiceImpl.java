package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.persistence.bm.AttachDataDAO;

@Service
public class AttachDataServiceImpl implements AttachDataService {
	@Inject
	private AttachDataDAO dao;
	
	//관련 정보 전체조회
	@Override
	public List<AttachDataVo>attachDataAllList(AttachDataVo attachDataVo) throws Exception {
		return dao.attachDataAllList(attachDataVo);
	}
	
	//관련 정보 조회
	@Override
	public List<AttachDataVo>attachDataList(AttachDataVo attachDataVo) throws Exception {
		return dao.attachDataList(attachDataVo);
	}
	
	//타수점검 목록 조회
	@Override
	public List<AttachDataVo> attachKeyChkList(AttachDataVo attachDataVo) throws Exception{
		return dao.attachKeyChkList(attachDataVo);
	}

	//관련 정보 Create
	@Override
	public void attachDataCreate(AttachDataVo attachDataVo) throws Exception {
		dao.attachDataCreate(attachDataVo);
	}
	
	//타수점검 Create
	@Override
	public void attachChkCreate(AttachDataVo attachDataVo) throws Exception{
		dao.attachChkCreate(attachDataVo);
	}
			
	//관련 정보  Read
	@Override
	public AttachDataVo attachDataRead(AttachDataVo attachDataVo) throws Exception {
		return dao.attachDataRead(attachDataVo);
	}
		
	//관련 정보 Update
	@Override
	public void attachDataUpdate(AttachDataVo attachDataVo) throws Exception {
		dao.attachDataUpdate(attachDataVo);
	}
	
	//개발관리 승인 Update
	@Override
	public void attachApproveUpdate(AttachDataVo attachDataVo) throws Exception {
		dao.attachApproveUpdate(attachDataVo);
	}
	
	//관련 정보 Delete
	@Override
	public void attachDataDelete(AttachDataVo attachDataVo) throws Exception {
		dao.attachDataDelete(attachDataVo);
	}
	
	//타수점검 Delete
	@Override
	public void attachChkDelete(AttachDataVo attachDataVo) throws Exception {
		dao.attachChkDelete(attachDataVo);
	}
	
	//관련자료 시퀀스
	@Override
	public int attachDataSeq(AttachDataVo attachDataVo) throws Exception {
		return dao.attachDataSeq(attachDataVo);
	}
	
	//타수점검 시퀀스
	@Override
	public int attachChkSeq(AttachDataVo attachDataVo) throws Exception {
		return dao.attachChkSeq(attachDataVo);
	}
	
	//관련자료 cd
	@Override
	public String attachDataCd(AttachDataVo attachDataVo) throws Exception {
		return dao.attachDataCd(attachDataVo);
	}
	
	//관련 자료 파일경로 출력
	@Override
	public String eqFilePath(AttachDataVo attachDataVo) throws Exception {
		return dao.eqFilePath(attachDataVo);
	}
	
	//관련 자료 파일경로 자세히 출력
	@Override
	public String dtrFilePath(AttachDataVo attachDataVo) throws Exception {
		return dao.dtrFilePath(attachDataVo);
	}
	
	//타수점검 파일경로 자세히 출력
	@Override
	public String chkFilePath(AttachDataVo attachDataVo) throws Exception {
		return dao.chkFilePath(attachDataVo);
	}
	
	//참고자료 파일삭제
	@Override
	public void attachFileDelete(AttachDataVo attachDataVo) throws Exception{
		dao.attachFileDelete(attachDataVo);
	}
	
	//타수점검 참고자료 파일삭제
	@Override
	public void attachChkFileDelete(AttachDataVo attachDataVo) throws Exception{
		dao.attachChkFileDelete(attachDataVo);
	}
	
	//관련자료 파일 이름 가져오기
	@Override
	public String getAttachFileNm(AttachDataVo attachDataVo) throws Exception {
		return dao.getAttachFileNm(attachDataVo);
	}
	
	//타수점검 파일 이름 가져오기
	@Override
	public String getAttachChkFileNm(AttachDataVo attachDataVo) throws Exception {
		return dao.getAttachChkFileNm(attachDataVo);
	}
	
}
