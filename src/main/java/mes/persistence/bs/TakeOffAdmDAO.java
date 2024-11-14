package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.TakeOffAdmVo;

public interface TakeOffAdmDAO {
	
	//List
	public List<TakeOffAdmVo> takeOffAdmGroupList(TakeOffAdmVo takeOffAdmVo) throws Exception;
	
	//List
	public List<TakeOffAdmVo> takeOffAdmList(TakeOffAdmVo takeOffAdmVo) throws Exception;
	
	//List
	public List<TakeOffAdmVo> takeOffInjectList(TakeOffAdmVo takeOffAdmVo) throws Exception;

	//List
	public List<TakeOffAdmVo> takeOffCustomerList(TakeOffAdmVo takeOffAdmVo) throws Exception;
	
	//List
	public List<TakeOffAdmVo> takeOffOutsourcingList(TakeOffAdmVo takeOffAdmVo) throws Exception;
	
	//Read
	public TakeOffAdmVo takeOffAdmRead(TakeOffAdmVo takeOffAdmVo) throws Exception;

	//Create
	public String takeOffAdmCreate(TakeOffAdmVo takeOffAdmVo) throws Exception;

	//Update
	public int takeOffAdmUpdate(TakeOffAdmVo takeOffAdmVo) throws Exception;

	//Delete
	public void takeOffAdmDelete(TakeOffAdmVo takeOffAdmVo) throws Exception;
                                                                                                                                                                                                                                                                                                                                                                                                                                      
	//Create
	public String getTakeOffBarcodeNo(TakeOffAdmVo takeOffAdmVo) throws Exception;
	
}
