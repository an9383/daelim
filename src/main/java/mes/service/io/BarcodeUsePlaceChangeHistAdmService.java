package mes.service.io;

import java.util.List;

import mes.domain.io.BarcodeUsePlaceChangeHistAdmVo;

public interface BarcodeUsePlaceChangeHistAdmService {

	//목록조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmList(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception;
	
	//상세조회
	public List<BarcodeUsePlaceChangeHistAdmVo> barcodeUsePlaceChangeHistAdmRead(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception;
	
	//등록
	public void barcodeUsePlaceChangeHistAdmIns(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception;
	
	//수정
	public void barcodeUsePlaceChangeHistAdmUpd(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception;
	
	//삭제
	public void barcodeUsePlaceChangeHistAdmDel(BarcodeUsePlaceChangeHistAdmVo barcodeUsePlaceChangeHistAdmVo) throws Exception;
}
