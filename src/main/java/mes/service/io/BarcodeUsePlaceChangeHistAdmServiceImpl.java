package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.BarcodeUsePlaceChangeHistAdmVo;
import mes.persistence.io.BarcodeUsePlaceChangeHistAdmDAO;

@Service
public class BarcodeUsePlaceChangeHistAdmServiceImpl implements BarcodeUsePlaceChangeHistAdmService {

	@Inject
	private BarcodeUsePlaceChangeHistAdmDAO dao;
	
	//목록조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmList(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		return dao.barcodeUsePlaceChangeHistAdmList(barcodeUsePlaceChangeHistAdmVo);
	}
	
	//상세조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmRead(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		return dao.barcodeUsePlaceChangeHistAdmRead(barcodeUsePlaceChangeHistAdmVo);
	}
	
	//등록
	public void barcodeUsePlaceChangeHistAdmIns(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		dao.barcodeUsePlaceChangeHistAdmIns(barcodeUsePlaceChangeHistAdmVo);
	}
	
	//수정
	public void barcodeUsePlaceChangeHistAdmUpd(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		dao.barcodeUsePlaceChangeHistAdmUpd(barcodeUsePlaceChangeHistAdmVo);
	}
	
	//삭제
	public void barcodeUsePlaceChangeHistAdmDel(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception{
		dao.barcodeUsePlaceChangeHistAdmDel(barcodeUsePlaceChangeHistAdmVo);
	}
}
