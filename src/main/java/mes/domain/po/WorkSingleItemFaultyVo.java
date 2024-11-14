package mes.domain.po;

import lombok.Data;

@Data
public class WorkSingleItemFaultyVo {

	private String idx;
	private String workOrdNo;
	private String workProgNo;
	private String itemSeq;
	private String upperItemSeq;
	private String itemCd;
	private String itemNm;
	private String itemModel;
	private String itemModelNm;
	private String itemGubun;
	private String itemGubunNm;
	private String type;
	private String barcodeNo;
	
	private String realQty;
	private String faultyQty;
	private String faultyType;
	private String faultyTypeNm;
	private String faultyDate;
	private String faultyDesc;
	
	private String baseInfoSeq;
	private String baseInfoType;
	private String baseInfoGubun;
	private String baseInfoGubunNm;
	private String baseInfoCd;
	private String baseInfoNm;
	private String totalFaultyQty;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String minorPrcssCd;

}
