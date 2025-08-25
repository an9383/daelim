package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.TakeOffAdmVo;
import mes.persistence.bs.TakeOffAdmDAO;

@Service
public class TakeOffAdmServiceImpl implements TakeOffAdmService {
	
	@Inject
	private TakeOffAdmDAO dao;
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffAdmGroupList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return dao.takeOffAdmGroupList(takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffAdmList(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return dao.takeOffAdmList(takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffInjectList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return dao.takeOffInjectList(takeOffAdmVo);
	}

	//List
	@Override
	public List<TakeOffAdmVo> takeOffCustomerList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return dao.takeOffCustomerList(takeOffAdmVo);
	}
	
	//List
	@Override
	public List<TakeOffAdmVo> takeOffOutsourcingList(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return dao.takeOffOutsourcingList(takeOffAdmVo);
	}
	
	//Read
	@Override
	public TakeOffAdmVo takeOffAdmRead(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return dao.takeOffAdmRead(takeOffAdmVo);
	}

	//Create
	@Override
	public String takeOffAdmCreate(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return dao.takeOffAdmCreate(takeOffAdmVo);
	}

	//Update
	@Override
	public int takeOffAdmUpdate(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    return dao.takeOffAdmUpdate(takeOffAdmVo);
	}

	//Delete
	@Override
	public void takeOffAdmDelete(TakeOffAdmVo takeOffAdmVo) throws Exception {
	    dao.takeOffAdmDelete(takeOffAdmVo);
	}
	
	//Create
	@Override
	public String getTakeOffBarcodeNo(TakeOffAdmVo takeOffAdmVo) throws Exception {
		return dao.getTakeOffBarcodeNo(takeOffAdmVo);
	}

}
