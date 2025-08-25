package mes.domain.bm;

import lombok.Data;

@Data
public class PrcssFaultyOrdAdmVo {
	private String idx;
	private String prcssCd;
	private String prcssNm;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String faultyOrd;
	private String faultyCd;
	private String faultyNm;
	private String useYn;
	private String useYnNm;
	private String etc1;
	private String etc2;
	private String etc3;
	
	private String regYn;
	private String regId;
	private String regDate;
	private String updId;
	
	private String[] itemSeqArr;

}
