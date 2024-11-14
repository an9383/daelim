package mes.web.io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bs.CustCmplnAdmVo;
import mes.domain.cm.BbsVo;
import mes.domain.io.PurchaseOrderReturnVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.PurchaseOrderReturnService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PurchaseOrderReturnController {
	
	private static final Logger logger = LoggerFactory.getLogger(PurchaseOrderReturnController.class);

	@Value("${file.returnPath}")
	private String file_purchase_Path;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private PurchaseOrderReturnService purchaseOrderReturnService;
	

	

	// 구매자재관리(반품등록) 메인
	@RequestMapping(value = "/iosc0100", method = RequestMethod.GET)
	public String iosc0100(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0100";
	}
	
	
	// 구매자재관리(반품현황) 메인
	@RequestMapping(value = "/iosc0110", method = RequestMethod.GET)
	public String iosc0110(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0110";
	}
	
	
	//반품등록 목록조회
	@RequestMapping(value="io/purchaseOrderReturnMasterList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnMasterList(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 목록조회 : "+purchaseOrderReturnVo);
		try {
			
			List<PurchaseOrderReturnVo> list = purchaseOrderReturnService.purchaseOrderReturnMasterList(purchaseOrderReturnVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<PurchaseOrderReturnVo>();
			}
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//반품등록 상세
	@RequestMapping(value="io/purchaseOrderReturnDetailList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnDetailList(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 상세조회 : "+purchaseOrderReturnVo);
		try {
			
			List<PurchaseOrderReturnVo> list = purchaseOrderReturnService.purchaseOrderReturnDetailList(purchaseOrderReturnVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<PurchaseOrderReturnVo>();
			}
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//반품등록 상세
	@RequestMapping(value="io/purchaseOrderReturnList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 상세조회 : "+purchaseOrderReturnVo);
		try {
			
			List<PurchaseOrderReturnVo> list = purchaseOrderReturnService.purchaseOrderReturnList(purchaseOrderReturnVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<PurchaseOrderReturnVo>();
			}
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//반품등록 상세
	@RequestMapping(value="io/purchaseOrderReturnRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnRead(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 상세조회 : "+purchaseOrderReturnVo);
		try {
			
			PurchaseOrderReturnVo vo = purchaseOrderReturnService.purchaseOrderReturnRead(purchaseOrderReturnVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", vo);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	//반품등록 등록
	@RequestMapping(value="io/purchaseOrderReturnCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderReturnCreate(@RequestBody List<Map<String, Object>> returnList) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		PurchaseOrderReturnVo purchaseOrderReturnVo = new PurchaseOrderReturnVo();
		try {
			purchaseOrderReturnVo.setRetnNo(returnList.get(0).get("retnNo").toString());
			purchaseOrderReturnVo.setReturnDate(returnList.get(0).get("returnDate").toString());
			purchaseOrderReturnVo.setReturnChargr(returnList.get(0).get("returnChargr").toString());
			purchaseOrderReturnVo.setReturnDesc(returnList.get(0).get("returnDesc").toString());
			
			logger.info("반품등록 등록 : "+purchaseOrderReturnVo);
			
			for(Map<String, Object> m :returnList) {
				int retnSeq = purchaseOrderReturnService.getRetnSeq(purchaseOrderReturnVo);
				String fileName = m.get("fpValue").toString();
				purchaseOrderReturnVo.setRetnSeq(retnSeq);
				
				purchaseOrderReturnVo.setPoNo(m.get("poNo").toString());
				purchaseOrderReturnVo.setPoSeq(Integer.parseInt(m.get("poSeq").toString()));
				purchaseOrderReturnVo.setInSeq(Integer.parseInt(m.get("inSeq").toString()));
				purchaseOrderReturnVo.setPartCd(m.get("partCd").toString());
				purchaseOrderReturnVo.setPartRev(m.get("partRev").toString());
				purchaseOrderReturnVo.setReturnQty(Integer.parseInt(m.get("returnQty").toString()));
				purchaseOrderReturnVo.setRegId(Utils.getUserId());
				purchaseOrderReturnVo.setApprovalCd("002");
				if (!fileName.equals("파일을 선택해주세요")) {
					purchaseOrderReturnVo.setFileName(fileName.substring(0, fileName.lastIndexOf(".")));
					purchaseOrderReturnVo.setFileType(fileName.substring(fileName.lastIndexOf(".") + 1));
				} else {
					purchaseOrderReturnVo.setFileName(null);
					purchaseOrderReturnVo.setFileType(null);
				}
				
				purchaseOrderReturnService.purchaseOrderReturnCreate(purchaseOrderReturnVo);
				
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//반품등록 수정
	@RequestMapping(value="io/purchaseOrderReturnUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> purchaseOrderReturnUpdate(@RequestBody List<Map<String, Object>> returnList) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		PurchaseOrderReturnVo purchaseOrderReturnVo = new PurchaseOrderReturnVo();
		logger.info("반품등록 수정 : "+purchaseOrderReturnVo);
		try {
			
			purchaseOrderReturnVo.setRetnNo(returnList.get(0).get("retnNo").toString());
			purchaseOrderReturnVo.setReturnDate(returnList.get(0).get("returnDate").toString());
			purchaseOrderReturnVo.setReturnChargr(returnList.get(0).get("returnChargr").toString());
			purchaseOrderReturnVo.setReturnDesc(returnList.get(0).get("returnDesc").toString());
			
			String approvalCdVal = purchaseOrderReturnService.getApprovalCd(purchaseOrderReturnVo);
			
			//승인여부 가져오기
			if(approvalCdVal.equals("001")) {
				jsonData.put("result", "already");
			}else {
				
				purchaseOrderReturnService.purchaseOrderReturnDelete(purchaseOrderReturnVo);
				
				for(Map<String, Object> m :returnList) {
					int retnSeq = purchaseOrderReturnService.getRetnSeq(purchaseOrderReturnVo);
					String fileName = m.get("fpValue").toString();
					purchaseOrderReturnVo.setRetnSeq(retnSeq);
					
					purchaseOrderReturnVo.setPoNo(m.get("poNo").toString());
					purchaseOrderReturnVo.setPoSeq(Integer.parseInt(m.get("poSeq").toString()));
					purchaseOrderReturnVo.setInSeq(Integer.parseInt(m.get("inSeq").toString()));
					purchaseOrderReturnVo.setPartCd(m.get("partCd").toString());
					purchaseOrderReturnVo.setPartRev(m.get("partRev").toString());
					purchaseOrderReturnVo.setReturnQty(Integer.parseInt(m.get("returnQty").toString()));
					purchaseOrderReturnVo.setApprovalCd("002");
					purchaseOrderReturnVo.setUpdId(Utils.getUserId());
					purchaseOrderReturnVo.setRegId(m.get("regId").toString());
					if (!fileName.equals("파일을 선택해주세요")) {
						purchaseOrderReturnVo.setFileName(fileName.substring(0, fileName.lastIndexOf(".")));
						purchaseOrderReturnVo.setFileType(fileName.substring(fileName.lastIndexOf(".") + 1));
					} else {
						purchaseOrderReturnVo.setFileName(null);
						purchaseOrderReturnVo.setFileType(null);
					}
					logger.info("purchaseOrderReturnVo ==> " + purchaseOrderReturnVo);
					purchaseOrderReturnService.purchaseOrderReturnCreate(purchaseOrderReturnVo);
					jsonData.put("result", "ok");
				
				}
			}
			
			
		} catch (Exception e) {
			logger.info("E -> " + e);
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//반품등록 삭제
	@RequestMapping(value="io/purchaseOrderReturnDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 삭제 : "+purchaseOrderReturnVo);
		try {
			
			purchaseOrderReturnService.purchaseOrderReturnDelete(purchaseOrderReturnVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//반품등록 승인여부 수정
	@RequestMapping(value="io/updateApprovalCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateApprovalCd(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 승인여부  수정: "+purchaseOrderReturnVo);
		try {
			
			String approvalCdVal = purchaseOrderReturnService.getApprovalCd(purchaseOrderReturnVo);
			
			if(purchaseOrderReturnVo.getValue().equals("1")) { //승인버튼 클릭시 
				if(approvalCdVal.equals("001")){
					jsonData.put("result", "aready");
				}else { 
					purchaseOrderReturnVo.setApprovalCd("001");
					purchaseOrderReturnService.updateApprovalCd(purchaseOrderReturnVo);
					
					List<PurchaseOrderReturnVo> list =  purchaseOrderReturnService.purchaseOrderReturnDetailList(purchaseOrderReturnVo);
					for(int i=0; i<list.size(); i++) {
						
						purchaseOrderReturnVo.setPoNo(list.get(i).getPoNo());
						purchaseOrderReturnVo.setPoSeq(list.get(i).getPoSeq());
						purchaseOrderReturnVo.setInSeq(list.get(i).getInSeq());
						purchaseOrderReturnVo.setReturnQty(list.get(i).getReturnQty());
						
						purchaseOrderReturnService.updateReturnQty(purchaseOrderReturnVo);
					}
					
					jsonData.put("result", "ok");
				}
			}else if(purchaseOrderReturnVo.getValue().equals("2")) {  //승인취소버튼 클릭시 
				if(approvalCdVal.equals("002")){
					jsonData.put("result", "aready");
				}else {
					purchaseOrderReturnVo.setApprovalCd("002");
					purchaseOrderReturnService.updateApprovalCd(purchaseOrderReturnVo);
					
					List<PurchaseOrderReturnVo> list =  purchaseOrderReturnService.purchaseOrderReturnDetailList(purchaseOrderReturnVo);
					for(int i=0; i<list.size(); i++) {
						
						purchaseOrderReturnVo.setPoNo(list.get(i).getPoNo());
						purchaseOrderReturnVo.setPoSeq(list.get(i).getPoSeq());
						purchaseOrderReturnVo.setInSeq(list.get(i).getInSeq());
						purchaseOrderReturnVo.setReturnQty(list.get(i).getReturnQty());
						
						purchaseOrderReturnService.updateReturnQty(purchaseOrderReturnVo);
					}
					
					jsonData.put("result", "ok");
				}
			}
			
			
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//반품등록 발주번호 팝업화면
	@RequestMapping(value="io/itemFaultyAdmPopupList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyAdmPopupList(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 발주번호 팝업조회 : "+purchaseOrderReturnVo);
		try {
			
			List<PurchaseOrderReturnVo> itemFaultyAdmPopupList = purchaseOrderReturnService.itemFaultyAdmPopupList(purchaseOrderReturnVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", itemFaultyAdmPopupList);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//반품번호 가져오기
	@RequestMapping(value="io/getRetnNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getRetnNo(PurchaseOrderReturnVo purchaseOrderReturnVo ) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("반품등록 목록조회 : "+purchaseOrderReturnVo);
		try {
			
			String date = DateUtil.getToday("yyyyMMdd");
			String retnNoSeq = purchaseOrderReturnService.getRetnNo(date);   //001
			String retnNo = date+"-"+retnNoSeq;
			
			jsonData.put("data", retnNo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//수입검사성적서 파일 업로드
	@RequestMapping(value="io/purchaseOrderReturnFileUpload", method = RequestMethod.POST)
	public void uploadFile(MultipartHttpServletRequest multi, PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception {
		try {
			String newFileName = "";
			String retnNo = purchaseOrderReturnVo.getRetnNo();
			String path = file_purchase_Path;

			File dir = new File(path);

			if (!dir.exists()) {
				dir.mkdirs();
			}

			MultipartFile mFile = multi.getFile("fileNm");

			String fileName = mFile.getOriginalFilename();

			if (!(fileName == null || fileName == "")) {
				newFileName = retnNo + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				purchaseOrderReturnVo.setFileName(fileName);

				try {
					mFile.transferTo(new File(path + "/" + newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (Exception e) {
		}
	}
	
	//수입검사성적서 다운로드
	@RequestMapping(value = "io/purchaseOrderReturnFileDownload", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "retnNo") String retnNo,
		    @RequestParam(value = "fileName") String fileName,
		    @RequestParam(value = "fileType") String fileType) throws Exception {
		try {
			String dFile = fileName.toString() + "." + fileType;			
					
			String newFileName = retnNo + "." + fileType;

			String path = file_purchase_Path + newFileName;
			
			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (!ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=\"" + dFile + "\";");

			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}
			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
