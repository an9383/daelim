package mes.domain.io;

import lombok.Data;

@Data
public class PurchaseOrderReturnVo {

	private String retnNo;
	private Integer retnSeq;
	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	private String partCd;
	private String partNm;
	private String partRev;
	private String partGubun;
	private String partGubunNm;
	private String returnType;
	private String returnTypeNm;
	private String returnDate;
	private Integer returnQty;
	private Integer faultyCnt;
	private String returnChargr;
	private String returnChargrNm;
	private String fileName;
	private String fileType;
	
	private String returnDesc;
	private String approvalCd;
	private String approvalNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String receiptGubun;
	private String dealCorpCd;
	private String dealCorpNm;
	private String inspectChargrNm;
	private String faultyRegDate;
	private String telNo;
	private String addrBase;
	private String addrDtl;
	
	private String startDate;
	private String endDate;
	
	private String value;

	private String faultyTypeQty;
	private String faultyTypeDate;
	
	private String faultyChargr;
	private String faultyChargrNm;
	
}
