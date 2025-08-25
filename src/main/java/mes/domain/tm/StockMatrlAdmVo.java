package mes.domain.tm;

import lombok.Data;

@Data
public class StockMatrlAdmVo {

	private String smNo;
	private String smSeq;
	private String smType;
	private String smTypeNm;
	private String smCd;
	private String smNm;
	private String smModel;
	private String smUnit;
	private String smGubun;
	private String smGubunNm;
	private String smSubGubun;
	private String smDate;
	private String smQty;
	private String smBomQty;
	private String barcodeNo;
	private String sourceNo;
	
	
	private String locationCd;
	private String locationNm;
	
	private String locationNo;
	private String areaCd;
	private String floorCd;
	private String smDesc;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String middlePrcssCd;
	
	
}
