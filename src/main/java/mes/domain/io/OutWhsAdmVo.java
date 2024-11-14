package mes.domain.io;

import lombok.Data;

@Data
public class OutWhsAdmVo {

	private String sideView;
	private String tmMon;
	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	private Integer outSeq;
	private String lotNo;
	private String barcodeNo;
	private String itemSeq;
	private String upperItemSeq;
	private String upperItemCd;
	private String upperItemNm;
	private String upperItemModel;
	
	private String itemCd;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private String mainGubun;
	private String mainGubunNm;
	private String itemFifoGubun;
	private String itemFifoGubunNm;
	private String itemModel;
	private String itemModelNm;
	private String itemUnit;
	private String itemUnitNm;
	private String importCost;
	private String outSlipNo;
	private String outSlipSeq;
	private String outGubun;
	private String outWorker;

	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	
	private String outCase;
	private String statusCd;
	private String workOrdNo;
	private String mainWorkChargr;
	private String ordLotNo;	//작업지시 lotNo
	private Float workOrdQty;	//지시수량
	private String inDate;
	private String preOutWhsDate;
	private Float preOutQty;
	private String preWorkCharger;
	private String preWorkChargerNm;
	private String outWhsDate;
	private String outQty;
	private String inQty;
	private String outWorkCharger;
	private String partReqNo;
	private String inWhsDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String startDate;
	private String endDate;
	
	private String locationCd;		//창고코드
	private String locationNm;		//창고명
	private String areaCd;			//구역코드
	private String areaNm;			//구역명
	private String floorCd;			//위치코드
	private String floorNm;			//위치명
	private String locationNo;		//Location No
	
	private String value;
	
	private Float itemConsumpt;
	private Float totalConsumpt;
	private Integer remainQty;	//남은수량
	private Float tmQty;
	private String confirmYn;
	private String diffQty;
	private String realQtyOption;
	private String realQty;
	
	//이전데이터
	private String partCd;
	private String partNm;
	private String partRev;
	private String partGubun;
	private String partType;
	private String partSpec;
	private String partUnit;
	private String partUnitNm;
	private String itemRev;
	private Float partConsumpt;

	private String preOutWhsGubun;
	private String searchVal;
	private int totalCount;
	private String ordDir;
	private String ordColumn;
	
	//추가사항
	private String outWorkerNm;
	private String today;
	private String dealCorpCd;
	private String dealCorpNm;
	private String boxCount;
	private String inWhsCheck;
	private String preInWhsDate;
	private String preInWhsQty;
	private String serverDate;
	private String needQty;
	private String spQty;
	private String lackQty;
	private String sourceNo;
	private String inputQty;
	private String outputQty;
	private String outLocationNo;
	private String outLocationCd;
	private String outLocationNm;
	private String outAreaNm;
	private String outGubunNm;
	private String bongjaeCheck;
	private String locNo;
	private String locCd;
	private String locNm;
	private String areaCdNm;
	
	private String outCorpLocNo;
	private String outCorpLocCd;
	private String outCorpAreaCd;
	private String outCorpAreaNm;
	
	private String dealCorpCdArr[];

	private String groupType;
	private String groupTypeByD;
	private String groupTypeByM;
	
	private String itemCount;
	private String inAdjustQty;
	private String spSubGubun;
	private String workProgNo;
	private String workProgDate;
	private String useQty;
	private String owaIdx;
	private String owaIdxList;
	private String chkOutWhsAdmDelete;
	private String checkRemainQty;
	private String owaVoItemSeq;
	private String owaVoLocationNo;
	private String owaVoInQty;
}
