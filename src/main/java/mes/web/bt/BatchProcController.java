package mes.web.bt;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bt.BatchProcVo;
import mes.domain.sm.SystemAccessLogVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bt.BatchProcService;
import mes.service.sm.SystemAccessLogService;
import mes.web.cm.Constants;
import mes.web.ut.DateUtil;

@Controller
public class BatchProcController {

	@Inject
	private BatchProcService batchProcService;	
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private SystemAccessLogService systemAccessLogService;
	
	private static final Logger logger = LoggerFactory.getLogger(BatchProcController.class);

	//영업관리 메인
	//@RequestMapping(value = "/bssc0010", method = RequestMethod.GET)
	//@Scheduled(cron="0 */1 * * * ?")
	public String batchTmData() throws Exception {
		
		logger.info("batchScheduler batchTmData ==================> " + DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
		Date date = new Date();

		BatchProcVo batchProcVo = new BatchProcVo();
		batchProcVo.setBatchId(Constants.BATCH_ID_01);
		batchProcVo.setBatchNm(Constants.BATCH_ID_01_NM);
		batchProcVo.setBatchGubun(Constants.BATCH_ID_01_NM);
		batchProcVo.setBatchStartTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
		batchProcVo.setSuccessYn(Constants.BATCH_FAIL);
		batchProcVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
		
		logger.info("batchScheduler batchTmMon ==============> " + batchProcVo.getTmMon());
		
		try {
			batchProcService.batchTmData(batchProcVo);
			batchProcVo.setSuccessYn(Constants.BATCH_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			batchProcVo.setBatchEndTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
			batchProcService.batchProcLog(batchProcVo);
		}

		return "bs/bssc0010";
	}
	
	//스마트1공장 로그배치
	@Scheduled(cron = "0 0 23 * * *") // 초/분/시/일/월/요일/년도(생략가능)
	public void sendLogdataJSON() { // API LOG 전송
		try {
			CommonCodeAdmVo systemCommonCodeVo  = new CommonCodeAdmVo();
			systemCommonCodeVo.setBaseGroupCd("007"); 
			systemCommonCodeVo.setBaseCd("001");
			CommonCodeAdmVo vo = commonCodeAdmService.CommonCodeRead(systemCommonCodeVo);
			if(vo.getBaseAbbr().equals("Y")) {
				int count = 0;
				SystemAccessLogVo systemAccessLogVo = new SystemAccessLogVo();
				systemAccessLogVo.setStartDate(DateUtil.getCurrentYyyymmdd());
				systemAccessLogVo.setLastDate(DateUtil.getCurrentYyyymmdd());
				List<SystemAccessLogVo> systemLogAdmList = systemAccessLogService.smlistAll(systemAccessLogVo);
				
				count = systemLogAdmList.size();
				for(int i=0;i<systemLogAdmList.size();i++) {
					// 전송할 데이터 생성
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("crtfcKey", "$5$API$/V.NXKzTzJ2WfOhWuu3VRv5uPj3iGsMEMnzXv/IL.r6"); // api 인증키
					jsonObj.put("logDt", systemLogAdmList.get(i).getRegDate()); // 로그일시
					jsonObj.put("useSe", "접속"); // 접속구분
					jsonObj.put("sysUser", systemLogAdmList.get(i).getUserId()); // 사용자
					jsonObj.put("conectIp", systemLogAdmList.get(i).getIpAddr()); // IP정보
					jsonObj.put("dataUsgqty", 0); // 데이터사용량(숫자)
					
					// 데이터 전송
					StringBuilder urlBuilder = new StringBuilder("https://log.smart-factory.kr/apisvc/sendLogDataJSON.do"); /*URL*/
			        urlBuilder.append("?" + URLEncoder.encode("logData","UTF-8") + "=" + URLEncoder.encode(jsonObj.toJSONString(), "UTF-8"));
			        URL url = new URL(urlBuilder.toString());
			        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			        conn.setRequestMethod("POST");
			        conn.setRequestProperty("Content-type", "application/json");
			        System.out.println("Response code: " + conn.getResponseCode());
			        BufferedReader rd;
			        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			        } else {
			            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			        }
			        StringBuilder sb = new StringBuilder();
			        String line;
			        while ((line = rd.readLine()) != null) {
			            sb.append(line);
			        }
			        rd.close();
			        conn.disconnect();
			        System.out.println(sb.toString());
				}
				
				
				// 전송할 데이터 생성
				JSONObject jsonObj2 = new JSONObject();
				jsonObj2.put("dealCorpIdx",7); // 고객사 식별자
				jsonObj2.put("sendDate", DateUtil.getCurrentYyyymmdd()); // 전송일자
				jsonObj2.put("sendQty", count); // 총 접속건수
				jsonObj2.put("regIdx", '1'); // 사용자
				
				System.out.println("jsonObj2 --> " + jsonObj2);
				
				// 데이터 전송
				StringBuilder urlBuilder = new StringBuilder("http://crm.hygino.co.kr/mt/sfApiLogIns"); /*URL*/
				urlBuilder.append("?");
				urlBuilder.append("dealCorpIdx="+jsonObj2.get("dealCorpIdx").toString()+"&");
				urlBuilder.append("sendDate="+jsonObj2.get("sendDate").toString()+"&");
				urlBuilder.append("sendQty="+jsonObj2.get("sendQty").toString()+"&");
				urlBuilder.append("regIdx="+jsonObj2.get("regIdx").toString());
		        
		        System.out.println(urlBuilder.toString());
		        URL url = new URL(urlBuilder.toString());
		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		        conn.setRequestMethod("POST");
		        conn.setRequestProperty("Content-type", "application/json");
		        conn.setDoOutput(true);
		        
		        BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		        bw.write(jsonObj2.toString());
		        bw.flush();
		        bw.close();
		        
		        System.out.println("Response code: " + conn.getResponseCode());
		        BufferedReader rd;
		        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		        } else {
		            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		        }
		        StringBuilder sb = new StringBuilder();
		        String line;
		        while ((line = rd.readLine()) != null) {
		            sb.append(line);
		        }
		        rd.close();
		        conn.disconnect();
		        System.out.println(sb.toString());
		        
		    	BatchProcVo batchProcVo = new BatchProcVo();
				batchProcVo.setBatchId(Constants.BATCH_ID_02);
				batchProcVo.setBatchNm(Constants.BATCH_ID_02_NM);
				batchProcVo.setBatchGubun(Constants.BATCH_ID_02_NM);
				batchProcVo.setBatchStartTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
				batchProcVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
				batchProcVo.setSuccessYn(Constants.BATCH_SUCCESS);
				batchProcVo.setBatchEndTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
				batchProcService.batchProcLog(batchProcVo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
