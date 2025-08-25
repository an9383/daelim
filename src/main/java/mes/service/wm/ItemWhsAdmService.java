package mes.service.wm;

import java.util.List;

import mes.domain.wm.ItemWhsAdmVo;

public interface ItemWhsAdmService {
	
	//제품입출고관리 목록조회
	public List<ItemWhsAdmVo> itemWhsAdmMainList(ItemWhsAdmVo itemWhsAdmVo) throws Exception;

	//제품입고 목록조회
	public List<ItemWhsAdmVo> itemWhsAdmList(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 상세조회
	public ItemWhsAdmVo itemWhsAdmRead(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 등록
	public void itemWhsAdmCreate(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 등록 - 리스트
	public void itemWhsAdmListCreate(List<ItemWhsAdmVo> list) throws Exception;
	
	//제품입고 수정 - 리스트
	public void itemWhsAdmListUpdate(List<ItemWhsAdmVo> list) throws Exception;
	
	//제품입고 수정
	public void itemWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품출고 수정
	public void itemOutWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 삭제
	public void itemOutWhsDelete(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품출고 초기화
	public void itemOutWhsResetUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 창고목록 가져오기
	public List<ItemWhsAdmVo> getInLoc(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInArea(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInFloor(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품바코드 유무확인
	public int itemBarcodeNoCheck(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 유무확인
	public int existItemWhsAdm(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//수주상세등록 잔여수량, 완료수량 수정
	public void bizOrdDtlUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//제품입고 창고정보
	public ItemWhsAdmVo getLocInfo(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	
	
	//출하현황 목록조회
	public List<ItemWhsAdmVo> itemWhsOutList(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//출하현황 상세조회
	public List<ItemWhsAdmVo> itemWhsOutDtlList(ItemWhsAdmVo itemWhsAdmVo) throws Exception;
	
	//출하 LOT NO 조회
	public List<ItemWhsAdmVo> lotNoList(ItemWhsAdmVo itemWhsAdmVo) throws Exception;


}
