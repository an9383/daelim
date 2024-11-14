package mes.web.bm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.ItemPrcssAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPrcssAdmService;
import mes.web.ut.Utils;

@Controller
public class ItemPrcssAdmController {

	private static final Logger logger = LoggerFactory.getLogger(ItemPrcssAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	@Inject
	private ItemPrcssAdmService itemPrcssAdmService;

	//공정목록 조회
	@RequestMapping(value = "bm/itemPrcssAdmnopList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssAdmnopList(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정목록 조회 : "+itemPrcssAdmVo);
		try {
			List<ItemPrcssAdmVo> list = new ArrayList<ItemPrcssAdmVo>();
			if((itemPrcssAdmVo.getItemSeq()!=null && !itemPrcssAdmVo.getItemSeq().equals(""))) {
				list = itemPrcssAdmService.itemPrcssAdmnopList(itemPrcssAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//공정목록 조회
	@RequestMapping(value = "bm/itemPrcssAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPrcssAdmList(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정목록 조회 : "+itemPrcssAdmVo);
		try {
			List<ItemPrcssAdmVo> list = new ArrayList<ItemPrcssAdmVo>();
			if((itemPrcssAdmVo.getItemSeq()!=null && !itemPrcssAdmVo.getItemSeq().equals(""))) {
				list = itemPrcssAdmService.itemPrcssAdmList(itemPrcssAdmVo);
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//공정목록 등록
	@RequestMapping(value = "bm/itemPrcssAdmIns", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPrcssAdmIns(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemPrcssAdmVo itemPrcssAdmVo = new ItemPrcssAdmVo();
		logger.info("공정목록 등록 : "+list);
		try {
			itemPrcssAdmVo.setItemSeq(list.get(0).get("itemSeq").toString());
			itemPrcssAdmVo.setOutGubun(list.get(0).get("outGubun").toString());
			for(Map<String, Object> d : list) {
				if(d.get("itemPrcssSeq") != null && !d.get("itemPrcssSeq").equals("")) {
					itemPrcssAdmVo.setItemPrcssSeq(d.get("itemPrcssSeq").toString());
					itemPrcssAdmService.itemPrcssAdmDel(itemPrcssAdmVo);
				}
			}
			for(Map<String, Object> m : list) {
				if(!m.get("itemPrcssOrd").equals("")) {
					int itemOrd = Integer.parseInt(itemPrcssAdmService.itemPrcssSeqSel(itemPrcssAdmVo));
					itemPrcssAdmVo.setItemPrcssSeq(Integer.toString(itemOrd));
					itemPrcssAdmVo.setItemPrcssOrd(Integer.toString(itemOrd+1));
					itemPrcssAdmVo.setItemPrcssCd(m.get("itemPrcssCd").toString());
					itemPrcssAdmVo.setDealCorpCd(m.get("dealCorpCd").toString());
					itemPrcssAdmVo.setDealCost(m.get("dealCost").toString());
					itemPrcssAdmVo.setDealDate(m.get("dealDate").toString());
					itemPrcssAdmVo.setItemPrcssDesc(m.get("itemPrcssDesc").toString());
					itemPrcssAdmVo.setRegId(Utils.getUserNumber());
					itemPrcssAdmService.itemPrcssAdmIns(itemPrcssAdmVo);
				}
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//공정목록 등록
	@RequestMapping(value = "bm/itemPrcssAdmUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPrcssAdmUpd(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemPrcssAdmVo itemPrcssAdmVo = new ItemPrcssAdmVo();
		logger.info("공정목록 등록 : "+list);
		try {
			itemPrcssAdmVo.setItemSeq(list.get(0).get("itemSeq").toString());
			itemPrcssAdmVo.setOutGubun(list.get(0).get("outGubun").toString());
			for(Map<String, Object> l : list) {
				if(l.get("itemPrcssSeq") != null && !l.get("itemPrcssSeq").equals("") && !l.get("saveNEdit").equals("")) {
					itemPrcssAdmVo.setItemPrcssSeq(l.get("itemPrcssSeq").toString());
					itemPrcssAdmVo.setSaveNEdit(l.get("saveNEdit").toString());
					itemPrcssAdmVo.setItemPrcssCd(l.get("itemPrcssCd").toString());
					itemPrcssAdmVo.setDealCorpCd(l.get("dealCorpCd").toString());
					itemPrcssAdmVo.setDealCost(l.get("dealCost").toString());
					itemPrcssAdmVo.setDealDate(l.get("dealDate").toString());
					itemPrcssAdmVo.setItemPrcssDesc(l.get("itemPrcssDesc").toString());
					itemPrcssAdmService.itemPrcssAdmEditDel(itemPrcssAdmVo);
				}
			}
			for(Map<String, Object> m : list) {
				if(!m.get("itemPrcssOrd").equals("")) {
					int itemOrd = Integer.parseInt(itemPrcssAdmService.itemPrcssSeqSel(itemPrcssAdmVo));
					itemPrcssAdmVo.setItemPrcssSeq(Integer.toString(itemOrd));
					itemPrcssAdmVo.setItemPrcssOrd(Integer.toString(itemOrd+1));
					itemPrcssAdmVo.setItemPrcssCd(m.get("itemPrcssCd").toString());
					itemPrcssAdmVo.setDealCorpCd(m.get("dealCorpCd").toString());
					itemPrcssAdmVo.setDealCost(m.get("dealCost").toString());
					itemPrcssAdmVo.setDealDate(m.get("dealDate").toString());
					itemPrcssAdmVo.setItemPrcssDesc(m.get("itemPrcssDesc").toString());
					itemPrcssAdmVo.setRegId(Utils.getUserNumber());
					itemPrcssAdmService.itemPrcssAdmIns(itemPrcssAdmVo);
				}
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
}
