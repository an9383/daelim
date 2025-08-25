package mes.domain.qm;

import lombok.Data;

@Data
public class UnfitAdmVo {

	private String unfitNo;
	private String unfitGubun;
	private String unfitLot;
	private String unfitProc;
	private String unfitDate;
	private String unfitManager;
	private String cmApproDate;
	private String cmComplDate;
	private String unfitDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String inspectDate;
	private String attribPlace;
	private String generateProc;
	private String modelNm;
	private String itemCd;
	private String itemNm;
	private String faultyCd;
	private String faultyDtl;
	private String lotNo;
	private String lotCount;
	private String faultyCnt;
	private String initFaultyCnt;
	private String etFaultyCnt;
	private String itemModel;
	private String itemModelNm;
	private String itemCus;
	private String inSlipNo;
	private String inSlipSeq;
	private String itemSeq;
	private String startDate;
	private String endDate;
	private String unfitProcNm;
	private String unfitToday;
	
	private String faultyCavity;
	private String faultyQty;
	private String ordLotNo;
	private String mainGubun;
	private String itemCusNm;
	private String fairQty;
	private String minorPrcssCd;
	private String faultyQtySum;
	
	private String unfitFaultyDate;
	private String unfitFaultyChargr;
	private String unfitPairCnt;
	private String unfitFaultyCnt;
	private String unfitOtherCnt;
	private String unfitResultLot;
	private String idx;
	private String unfitResultNo;
	private String unfitFaultyChargrNm;
	private String faultyQtyWhole;
	private String itemUnitNm;
	
	private String mainGubunNm;
	private String spCd;
	private String spNm;
	private String spType;
	private String spTypeNm;
	private String itemColor;
	private String itemMaker;
	private String locationNo;
	private String locationCd;
	private String locationNm;
	private String areaCd;
	private String areaNm;
	private String floorNm;
	private String spUnit;
	private String tmQty;
	private String inQty;
	private String outQty;
	private String realQty;
	private String itemCost;
	private String realQtyCost;
	private String realQtyOption;
	private String tmMon;
	private String unfitFaultyDateM;
	private String[] unfitResultNoArray;
	private String barcodeNo;
	private String[] unfitNoAndLotArray;
	private String unfitResultIdx;

}
