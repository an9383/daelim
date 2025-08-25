package mes.domain.io;

import lombok.Data;

@Data
public class BarcodeUsePlaceChangeHistAdmVo {

	private String idx;
	private String barcodeNo;
	private String sachulSeq;
	private String bongjeSeq;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String itemModel;
	private String itemModelNm;
	private String itemGubun;
	private String itemGubunNm;
	
	private String changeQty;
	private String changeDate;
	private String sachulLocCd;
	private String sachulLocNm;
	private String sachulLocNo;
	
	private String bongjeLocCd;
	private String bongjeLocNm;
	private String bongjeLocNo;
	private String bongjeGubun;
	private String bongjeGubunNm;
	private String bongjeImportYn;
	
	private String changeDesc;
	
	private String startDate;
	private String endDate;
	
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
