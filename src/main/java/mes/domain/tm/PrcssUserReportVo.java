package mes.domain.tm;

import lombok.Data;

@Data
public class PrcssUserReportVo {

	private String idx;
	private String puaIdx;
	private String workDate;
	private String workDtl;
	private String itemModel;
	private String workMin;
	private String outputQty;
	private String pairQty;
	private String faultyQty;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	//추가사항
	private String itemModelNm;
	private String workDtlNm;
	private String puaIdxNm;
	private String userNm;
	private String startDate;
	private String endDate;
	private String prcssIdx;
	private String setOrderWmsc0290;
}
