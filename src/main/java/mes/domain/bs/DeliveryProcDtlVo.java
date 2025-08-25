package mes.domain.bs;

import lombok.Data;

@Data
public class DeliveryProcDtlVo {

	//출고처
	private String doNo;
	private Integer doSeq;
	private Integer doDtlSeq;
	private String barcodeNo;
	private String itemCd;
	private String itemRev;
	private String itemSeq;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private Integer outputDtlQty;
	private Integer remainDtlQty;
	private String doDtlDate;
	private String doDtlDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	//출고의뢰
	private String doDate;
	private String dlvDate;
	private String doStatus;
	private String doStatusNm;
	private String ordGubun;
	private String ordGubunNm;
	private String doCorpCd;
	private String doCorpNm;
	private String poCorpCd;
	private String poCorpNm;
	private Integer targetQty;
	private Integer outputQty;
	private Integer remainQty;
	

	private String startDate;
	private String endDate;
	
	
	
}
