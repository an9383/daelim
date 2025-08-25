package mes.domain.bs;

import lombok.Data;

@Data
public class DeliveryOrderAdmVo {

	//출고의뢰등록 
	private String doNo;
	private String ordGubun;
	private String ordGubunNm;
	private String doCorpCd;
	private String doCorpNm;
	private String doDate;
	private String doDesc;

	//출고의뢰상세
	private Integer doSeq;
	private String poCorpCd;
	private String poCorpNm;
	private String lotNo;
	private String itemCd;
	private String itemRev;
	private String itemSeq;
	private String itemNm;
	private String inspectDate;
	private String outputDate;
	private String targetQty;
	private String outputQty;
	private String remainQty;
	private String dlvDate;
	private String doStatus;
	private String doStatusNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String startDate;
	private String endDate;
	
	//추가사항
	private String itemModel;
	private String itemModelNm;
	private String lhrhCd;
	private String lhrhCdNm;
	private String itemColor;
	private String boxCount;
	private String itemUnit;
	private String itemUnitNm;
	private String doSeqCheck;
	private String doDtlDate;
	private String itemGubunNm;
	private String lhrhNm;
	private String dealCorpCd;
	private String dealCorpNm;
	private String doNoSev;
	private String itemCus;
	private String itemCusNm;
	private String outDate;
	private String outQty;
	private String doStatus003;
	private String mainGubun;
	private String groupType;
	private String groupTypeByD;
	private String groupTypeByM;
	private String groupTypeByT;
	private String dataGubun;
	
	private String outUnitCost;	//출고단가
	private String outAmt;		//출고금액
	private String barcodeNo;
	private String corpOutYn;
	private String checkNullCorpOutYn;
	
}
