<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
pageContext.setAttribute("newLineChar", "\n");
%>


<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">부적합관리</a></li>
				<li class="breadcrumb-item active">봉제 부적합관리대장</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="container-fluid" id="main">
				<div class="row" style="height: 100%;">
					<div class="p-0" style="width: 85%; height: 100%;" id="table1">
						<div class="row p-0 mb-2" style="height: 100%;">
							<div class="col-md-12 p-1" style="background-color: #ffffff;">
								<table id="unfitAdmTable" class="table table-bordered tr_highlight_row">
									<colgroup>
										<col width="4%">
										<col width="7%">
										<col width="10%">
										<col width="7%">
										<col width="8%">
										<col width="13%">
										<col width="10%">
										<col width="9%">
										<col width="7%">
										<col width="7%">
										<col width="8%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th class="text-center" style="vertical-align: middle;" rowspan="2">
												<input type="checkbox" id="checkAll" style="width: 1.2rem; height: 1.2rem;">
											</th>
											<th class="text-center" rowspan="2">발생일자</th>
											<th class="text-center" rowspan="2">협력사</th>
											<th class="text-center" rowspan="2">발생공정</th>
											<th class="text-center" rowspan="2">모델명</th>
											<th class="text-center" rowspan="2">부품명</th>
											<th class="text-center" rowspan="2">불량내역</th>
											<th class="text-center" colspan="3">Lot 현황</th>
											<th class="text-center" rowspan="2">총 불량수량</th>
											<th class="text-center" rowspan="2">처리결과</th>
										</tr>
										<tr>
											<th class="text-center" id="lotNoTh">LOT NO</th>
											<th class="text-center">LOT 수</th>
											<th class="text-center" style="border: 1px solid #dee2e6;">불량 수</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="p-0 pl-2" style="width: 15%; height: 100%;">
						<div class="row p-0" style="height: 100%;">
							<div class="col-md-12 p-1" style="background-color: #ffffff;">
								<table id="faultyListTable" class="table table-bordered">
									<colgroup>
										<col width="70%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>불량유형 명</th>
											<th class="text-center">TOTAL</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered mt-4">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr
											style="font-size: 1.3rem; background: #346cb0; color: white;">
											<th class="text-center"><b>TOTAL</b></th>
											<th class="text-right" id="totalFaulty"></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 부적합관리 / 봉제 부적합관리대장 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="unfitProcResPopupModal"
	tabindex="-1" role="dialog" aria-labelledby="unfitProcResPopupModal"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"
			style="width: 1000px; position: absolute; left: 50%; transform: translateX(-50%);">
			<div class="modal-header">
				<h5 class="modal-title" id="unfitProcResPopupLabel">처리 결과</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row p-0 mb-2" style="background-color: #ffffff; height: 100%;">
					<div class="card-body col-sm-12 p-1">
						<button type="button" class="btn btn-primary float-left mr-1" id="btnPrint">반출증 출력</button>
						<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnDtlSave">저장</button>
						<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnDtlEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnDtlAdd">등록</button>
					</div>
					<div class="card-body col-sm-12 p-1">
						<table class="table table-bordered mb-2" id="">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>업체명</th>
									<td>
										<div class="input-sub m-0" style="max-width: 100%">
											<input type="text" class="form-control"style="max-width: 100%" id="printCompNm" disabled>
											<input type="hidden" id="printCompCd" disabled>
											<button type="button" class="btn btn-primary input-sub-search" id="btnPrintComp" onClick="itemCusSelectInCorpCd(2);">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
									<th>작성일</th>
									<td>
										<div class="form-group input-sub m-0" style="max-width: 100%">
											<input type="date" class="form-control" id="printDate"
												value="${serverDateTo}" style="min-width: 100%;" />
										</div>
									</td>
								</tr>
								<tr>
									<th colspan="4">부적합처리</th>
								</tr>
								<tr>
									<th>부적합 등록일</th>
									<td>
										<div class="form-group input-sub m-0" style="max-width: 100%">
											<input type="date" class="form-control" id="faultyDate"
												value="${serverDateTo}" style="min-width: 100%;" />
										</div>
									</td>
									<th>부적합 담당자</th>
									<td>
										<div class="input-sub m-0" style="max-width: 100%">
											<input type="hidden" class="form-control"
												style="max-width: 100%" id="faultyChargr"
												value="${userNumber}" disabled> <input type="text"
												class="form-control" style="max-width: 100%"
												id="faultyChargrNm" value="${userNm}" disabled>
											<button type="button"
												class="btn btn-primary input-sub-search"
												name="btnfaultyChargr" id="btnfaultyChargr"
												onClick="selectInspectChargr2();">
												<span class="oi oi-magnifying-glass"></span>
											</button>
										</div>
									</td>
								</tr>
								<tr>
									<th>부적합 대상수량</th>
									<td><input type="text" class="form-control number-float0"
										id="targetCnt" style="text-align: right; min-width: 100%;"
										disabled></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>양품수량</th>
									<td><input type="text" class="form-control number-float0"
										id="pairCnt" style="text-align: right; min-width: 100%;"
										disabled></td>
									<th>불량수량</th>
									<td><input type="text" class="form-control number-float0"
										id="faultyCnt" style="text-align: right; min-width: 100%;"
										disabled></td>
								</tr>
								<tr class="d-none">
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control"
										id="faultyDesc" name="faultyDesc" style="max-width: 100%"></td>
								</tr>
							</thead>
						</table>
					</div>
					<div class="card-body col-sm-12 p-1">
						<select class="select custom-select float-left mr-1"
							id="uprApplyBox" style="width: 100px;"></select>
						<button type="button" class="btn btn-primary float-left mr-1"
							id="btnUprApply">일괄적용</button>
					</div>
					<div class="col-md-12 p-1">
						<table id="unfitProcResTable" class="table table-bordered">
							<colgroup>
								<col width="5%">
								<col width="19%">
								<col width="16%">
								<col width="10%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="14%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center"><input type="checkbox"
										id="uprCheckAll" style="width: 1.2rem; height: 1.2rem;">
									</th>
									<th class="text-center">부품명</th>
									<th class="text-center">바코드</th>
									<th class="text-center">부적합처리</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">기타수량</th>
									<th class="text-center">사유</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 프린트 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="printPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"
			style="width: 1100px; position: absolute; left: 50%; transform: translateX(-50%);">
			<div class="modal-header">
				<h5 class="modal-title" id="printPopUpLabel">반출증 출력</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive" style="min-height: 297mm !important; height: 297mm !important;" id="printDiv">
					<div id="originalDiv" style="min-height: 50% !important; height: 50% !important;">
						<table class="table table-bordered tabled-sm" style="margin: 0px!important;" id="titleTable">
							<colgroup>
								<col width="10%">
								<col width="40%">
								<col width="20%">
								<col width="30%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center" colspan="2" rowspan="3" style="font-size: 40px;">반 출 증</th>
									<th class="text-center">상 호</th>
									<td class="text-center">㈜ 대림오토</td>
								</tr>
								<tr>
									<th class="text-center">등록번호</th>
									<td class="text-center">140-81-43437</td>
								</tr>
								<tr>
									<th class="text-center">주 소</th>
									<td class="text-center">경기도 시흥시 은계중앙로306번길 40</td>
								</tr>
								<tr>
									<th class="text-center">업체명</th>
									<td class="text-center" id="printCompTd"></td>
									<th class="text-center">TEL</th>
									<td class="text-center">031) 315-8751~2</td>
								</tr>
							</thead>
						</table>

						<div class="">
							<table class="table table-bordered tabled-sm" style="margin: 0px!important;" id="middleTable">
								<colgroup>
									<col width="10%">
									<col width="15%">
									<col width="25%">
									<col width="13%">
									<col width="17%">
									<col width="20%">
								</colgroup>
								<thead>
									<tr>
										<th>NO</th>
										<th>차종</th>
										<th>품명</th>
										<th>단위</th>
										<th>수량</th>
										<th>반출사유</th>
									</tr>
								</thead>
							</table>
						</div>

						<table class="table table-bordered tabled-sm" style="margin-bottom: 0px;" id="endTable">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="25%">
								<col width="13%">
								<col width="17%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center" colspan="3">계</th>
									<th class="text-center">TOTAL 수량</th>
									<td class="text-center" id="qtySum"></td>
									<td></td>
								</tr>
								<tr>
									<th class="text-center">확인자</th>
									<td class="text-center">(인)</td>
									<td></td>
									<th class="text-center">작성일</th>
									<td class="text-center" colspan="2" id="printDateTd"></td>
								</tr>
								<tr>
									<th class="text-center">수령자</th>
									<td class="text-center">(인)</td>
									<td></td>
									<td class="text-center" colspan="3"></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 프린트 모달 종료-->
<!-- 품번 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="itemCdPopUpModal"
	tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemCdPopUpLabel">품번 조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<table id="itemCdPopUpTable" class="table table-bordered">
					<colgroup>
						<col width="20%">
						<col width="16%">
						<col width="24%">
						<col width="26%">
						<col width="14%">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th>공급사</th>
							<th>차종</th>
							<th>품번</th>
							<th>품명</th>
							<th>단위</th>
						</tr>
					</thead>
				</table>
				<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 품번 모달 종료-->

<style>
.td_top {
	vertical-align: top !important;
}

.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}

.table thead th {
	vertical-align: middle;
}
</style>

<%@include file="../layout/bottom.jsp"%>
<script>
	const CURRENT_HREF = "qmsc0250"; 
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');
	
	$('#'+CURRENT_PAGE).closest('.has-child','li').addClass('has-open has-active');
	$('#'+CURRENT_PAGE).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "봉제 부적합관리대장");
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	const SERVER_DATE = "${serverDateTo}";
	const SERVER_DATE_FROM = moment().subtract('1', 'M').format('YYYY-MM-DD');
	const SERVER_DATE_TO = moment().format('YYYY-MM-DD');
	const USER_NM = "${userNm}";
	const USER_NUMBER = "${userNumber}";
	
	let serverDateFrom = SERVER_DATE_FROM;
	let serverDateTo = SERVER_DATE_TO;
	let unfitNo = '';
	let unfitGubun = '002';
	let unfitLot = '';
	let unfitIndex = '';
	let faultyCd = '';
	let unfitResNoVal;
	let unfitResLotVal;
	let idxVal = '';
	let itemSeqVal = '';
	let itemCusVal = '';
	let unfitResultNoVal = '미등록';
	let unfitProcVal = '';

	//공통코드 시작
	let unfitGubunArray = new Array();
	<c:forEach items="${unfitGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitGubunArray.push(json);
	</c:forEach>
	
	let unfitProcArray = new Array();
	<c:forEach items="${unfitProc}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitProcArray.push(json);
	</c:forEach>
	
	let unfitBjProcArray = new Array();
	<c:forEach items="${unfitBjProc}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitBjProcArray.push(json);
	</c:forEach>
	
	selectBoxAppend(unfitBjProcArray, "uprApplyBox", "", "");
	////공통코드 끝
    
	//메인 테이블
	let unfitAdmTable = $('#unfitAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '65vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="qm/unfitAdmList"/>',
			type : 'GET',
			async : false,
			data : {
	           	'mainGubun'		: function(){ return '002'; },
				'startDate'		: function(){ return serverDateFrom.replace(/-/g, ''); },
	           	'endDate'		: function(){ return serverDateTo.replace(/-/g, ''); },
	           	'unfitGubun'	: function(){ return unfitGubun; },
	           	'itemSeq'		: function(){ return itemSeqVal; },
	           	'itemCus'		: function(){ return itemCusVal; },
	           	'unfitResultNo'	: function(){ return unfitResultNoVal; },
	           	'unfitProc'		: function(){ return unfitProcVal; },
			},
		},
		columns : [
			{//체크박스
				data: 'unfitResultNo', 'className' : 'text-center', orderable: false,
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="inspectList" style="width: 1.2rem; height: 1.2rem;">';
				}
			},
			{//발생일자
				data : 'inspectDate', className : 'text-center',
				render : function(data, type, row, meta){
					return data != null && data != '' ? moment(data).format("YYYY-MM-DD") : '';
				}
			},
			{ data : 'itemCusNm', className : 'text-center' }, //협력사
			{ data : 'minorPrcssCd', className : 'text-center' }, //발생공정
			{ data : 'itemModelNm', className : 'text-center' }, //모델명
			{ data : 'itemNm', className : 'text-center' }, //부품명
			{ data : 'faultyDtl', className : 'text-center' }, //불량내역
			{ data : 'lotNo', className : 'text-center' }, //LOT NO
			{//LOT 수
				data : 'fairQty', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			}, 
			{//불량수
				data : 'faultyQtySum', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
			{//총 불량수량
				data : 'faultyQtyWhole', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ data : 'unfitProcNm', className : 'text-center', }, //처리결과
		],
		columnDefs : [],
		buttons : [ {
			extend : 'copy',
			title : '부적합관리대장(수입,공정,출하)',
		}, {
			extend : 'excel',
			title : '부적합관리대장(수입,공정,출하)',
		}, {
			extend : 'print',
			title : '부적합관리대장(수입,공정,출하)',
		}, ],
	    order: [],
	});
	
	//테이블 왼쪽 위 html
	let unfitHtml = '<div class="row">';
	
	unfitHtml += '<label class="input-label-sm m-1">발생일자</label><div class="form-group input-sub m-0 row">';
    unfitHtml += '<input class="form-control" type="date" id="startDate" style="width:110px;"/>';
    unfitHtml += '</div>';
    unfitHtml += '&nbsp;~&nbsp;<div class="form-group input-sub mr-2 row">';
    unfitHtml += '<input class="form-control" type="date" id="endDate" style="width:110px;"/>';
    unfitHtml += '</div>';
    
    unfitHtml += '<label class="input-label-sm m-1">구분</label>';
	unfitHtml += '<div class="form-group input-sub mr-2">';
	unfitHtml += '<select id="unfitGubunSelect" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '<option value="001">수입</option>';	
	unfitHtml += '<option value="002" selected>공정</option>';	
	unfitHtml += '<option value="003">출하</option>';	
	unfitHtml += '<option value="004">단품불량</option>';
	unfitHtml += '</select></div>';
	
	unfitHtml += '<label class="input-label-sm m-1">처리유무</label>';
	unfitHtml += '<div class="form-group input-sub mr-2">';
	unfitHtml += '<select id="unfitResultNoBox" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '<option value="">전체</option>';
	unfitHtml += '<option value="등록">처리</option>';
	unfitHtml += '<option value="미등록" selected>미처리</option>';
	unfitHtml += '</select></div>';
	
	unfitHtml += '<label class="input-label-sm m-1">처리결과</label>';
	unfitHtml += '<div class="form-group input-sub mr-2">';
	unfitHtml += '<select id="unfitProcBox" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '</select></div>';
	
	unfitHtml += '<label class="input-label-sm m-1">품번</label>';
	unfitHtml += '<div class="form-group input-sub m-0">';
	unfitHtml += '<input type="hidden" id="itemSeqFind">';
	unfitHtml += '<input type="text" class="form-control" id="itemCdFind" style="width:100px;" disabled>';
	unfitHtml += '<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
	unfitHtml += '<span class="oi oi-magnifying-glass"></span>';
	unfitHtml += '</button>';
	unfitHtml += '</div>';
	unfitHtml += `<button type="button" id="itemCdDelete" class="btn form-control mr-2 p-0" style="width: 30px;" onclick="$('#itemSeqFind').val(''); $('#itemCdFind').val(''); itemSeqVal=''; itemCdNm='';">`;
	unfitHtml += '<i class="mdi mdi-close"></i>';
	unfitHtml += '</button>';
	
	unfitHtml += '<label class="input-label-sm m-1">협력사</label>';
	unfitHtml += '<div class="form-group input-sub m-0">';
	unfitHtml += '<input type="hidden" class="form-control" id="itemRealCus">';
	unfitHtml += '<input type="text" class="form-control" id="itemCus" style="width:100px;" disabled>';
	unfitHtml += '<button type="button" class="btn btn-primary input-sub-search" id="itemCusBtn" onClick="itemCusSelectInCorpCd(1);">';
	unfitHtml += '<span class="oi oi-magnifying-glass"></span>';
	unfitHtml += '</button>';
	unfitHtml += '</div>';
	unfitHtml += `<button type="button" id="itemCusDelete" class="btn form-control mr-2 p-0" style="width: 30px;" onclick="$('#itemCus').val('');$('#itemRealCus').val(''); itemCusVal=''; itemCusNm='';">`;
	unfitHtml += '<i class="mdi mdi-close"></i>';
	unfitHtml += '</button>';
	
	unfitHtml += '<button type="button" class="btn btn-primary mr-2" id="btnRetv" onClick="btnRetvClick()">조회</button>';
	
	unfitHtml += '<button type="button" class="btn btn-info mr-2" id="btnPrcssRes">처리결과</button>';
	
	unfitHtml += '<button type="button" class="btn btn-danger" id="btnPrDelete">처리취소</button>';
	
	unfitHtml += '</div>';
    
	$('#unfitAdmTable_length').html(unfitHtml);
// 	$('#unfitAdmTable2_length').html(unfitHtml);
// 	selectBoxAppend(unfitGubunArray, "unfitGubunSelect", "002", "");
	$('#startDate').val(serverDateFrom);
	$('#endDate').val(serverDateTo);
	selectBoxAppend(unfitBjProcArray, "unfitProcBox", "", "1"); //처리결과

	let itemCdNm = '';
	let itemCusNm = '';
	//조회 버튼 클릭시
	function btnRetvClick() {
		serverDateFrom = $('#startDate').val();
		serverDateTo = $('#endDate').val();
		unfitGubun = $('#unfitGubunSelect').val();
		unfitResultNoVal = $('#unfitResultNoBox').val();
		unfitProcVal = $('#unfitProcBox').val();
		
		$('#unfitAdmTable').DataTable().ajax.reload(function(){
			$('#checkAll').prop('checked', false);
		});
		//조회조건 다시 설정해야 함.
		$('#unfitAdmTable_length').html(unfitHtml);
		$('#unfitGubunSelect').val(unfitGubun);
		$('#startDate').val(serverDateFrom);
		$('#endDate').val(serverDateTo);
		$('#unfitResultNoBox').val(unfitResultNoVal);
		selectBoxAppend(unfitBjProcArray, "unfitProcBox", unfitProcVal, "1");
		$('#itemCdFind').val(itemCdNm);
		$('#itemCus').val(itemCusNm);
		
		$('#faultyListTable').DataTable().ajax.reload(function(){});
    };

 	// 보기
	$('#unfitAdmTable tbody').on('click','tr',function() {
		unfitNo = unfitAdmTable.row(this).data().unfitNo;
		unfitLot = unfitAdmTable.row(this).data().lotNo;
		faultyCd = unfitAdmTable.row(this).data().faultyCd;
		unfitIndex = $('#unfitAdmTable').DataTable().row(this).index();
	});
    
	//불량유형별 소계 테이블
	let faultyListTable = $('#faultyListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-3'><'col-sm-12 col-md-9'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>",
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : -1,
		//ordering: false,
		ajax : {
			url : '<c:url value="qm/faultyTypeTotalList"/>',
			type : 'GET',
			async : false,
			data : {
	           	'mainGubun'		: function(){ return '002'; },
				'startDate'		: function(){ return serverDateFrom.replace(/-/g, ''); },
	           	'endDate'		: function(){ return serverDateTo.replace(/-/g, ''); },
	           	'unfitGubun'	: function(){ return unfitGubun; },
	           	'itemSeq'		: function(){ return itemSeqVal; },
	           	'itemCus'		: function(){ return itemCusVal; },
	           	'unfitResultNo'	: function(){ return unfitResultNoVal; },
	           	'unfitProc'		: function(){ return unfitProcVal; },
			},
		},
		columns : [
			{ //불량유형 명
				data : 'faultyDtl', className : 'text-center',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return '<span style="cursor: pointer;">'+data+'</span>';
					} else {
						return '-';
					}
				}
			},
			{ //TOTAL
				data : 'faultyCnt', 'className' : 'text-right',
				render : function(data, type, row, meta) {
					if ( data != null ) {
						return '<span style="cursor: pointer;">'+rmDecimal(data)+'</span>';
					} else {
						return '-';
					}
				}
			}, 
		],
		columnDefs : [],
		drawCallback: function(settings) {
			var api = this.api();
			
			let sum = 0;
			for(var i=0; i<api.data().count(); i++){
				sum += parseInt(api.row(i).data().faultyCnt.replace(/,/g,''));
			}
			$('#totalFaulty').text(addCommas(sum)); 
        },
	});

	// 보기
	$('#faultyListTable tbody').on('click', 'tr', function() {
		//불량cavity테이블
		if ( unfitGubun == "002" || unfitGubun == "004" ) { //공정, 단품불량 기능 구현
			faultyCd = faultyListTable.row(this).data().faultyCd;

			var tr = $(this).closest('tr');
	        var row = faultyListTable.row( tr );
	        var idx = $.inArray( tr.attr('id'), detailRows );

	        if ( row.child.isShown() ) {
	            tr.removeClass( 'details' );
	            row.child.hide();
	 
	            // Remove from the 'open' array
	            detailRows.splice( idx, 1 );
	        } else {
	            tr.addClass( 'details' );
	            row.child( format( row.data() ) ).show();
	 
	            // Add to the 'open' array
	            if ( idx === -1 ) {
	                detailRows.push( tr.attr('id') );
	            }
	        }
		}
	});

	//개발관리 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var cavityHtml = '';

		$.ajax({
			url : '<c:url value="qm/unfitFaultyRightList"/>',
			type : 'GET',
			async : false,
			data : {
	           	'faultyCd' 		: function(){ return faultyCd; }, //불량유형
	        	'mainGubun'		: function(){ return "002"; },
				'startDate'		: function(){ return serverDateFrom.replace(/-/g, ''); },
	           	'endDate'		: function(){ return serverDateTo.replace(/-/g, ''); },
	           	'unfitGubun'	: function(){ return unfitGubun; }, //공정 or 단품불량 구분
	           	'itemSeq'		: function(){ return itemSeqVal; },
	           	'itemCus'		: function(){ return itemCusVal; },
	           	'unfitResultNo'	: function(){ return unfitResultNoVal; },
	           	'unfitProc'		: function(){ return unfitProcVal; },
			},
            async: false,
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                    if(data.length>0){
                    	cavityHtml	 = '<table class="table table-bordered" style="background:#0275d81c;">';
                    	cavityHtml	+= '	<colgroup>';
                    	cavityHtml	+= '		<col width="70%">';
                    	cavityHtml	+= '		<col width="30%">';
                    	cavityHtml	+= '	</colgroup>';
                    	cavityHtml	+= '	<thead class="thead-light">';
                    	cavityHtml	+= '		<tr>';
                    	cavityHtml	+= '			<th style="background:#0275d86e;">품명</th>';
            			cavityHtml	+= '			<th style="background:#0275d86e;">수량</th>';
            			cavityHtml	+= '		</tr>';
               			cavityHtml	+= '	</thead>';
               			cavityHtml	+= '	<tbody>';
                        for(var i=0;i<data.length;i++) {
                        	cavityHtml	+= '		<tr>';
                        	cavityHtml	+= '			<td class="text-center-td">'+data[i].itemNm+'</td>';
                        	cavityHtml	+= '			<td class="text-right-td">'+rmDecimal(data[i].faultyQty)+'</td>';
                        	cavityHtml	+= '		</tr>';
                        }
                        cavityHtml	+= '	</tbody>';
                        cavityHtml	+= '</table>';
                    }
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return cavityHtml;
	}
	//개발관리 상세내역 끝

	//담당자 모달 
    let userPopUpTable3;
	function userPopUpTableModal2() {
		userPopUpTable3 = $('#userPopUpTable3').DataTable({
			language : lang_kor,
			lengthChange : false,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			destroy: true,
			pageLength : 15,
			ajax : {
				url : '/sm/matrlUserDataList',
				type : 'GET',
				data : {
				}
			},
			rowId : 'userNumber',
			columns : [
				{ data : 'userNm' },
				{ data : 'departmentNm' },
				{ data : 'postNm' },
				{ data : 'chargeDutyNm' },
				{ data : 'userDesc' },
			],
			columnDefs : [ {
				"targets" : [ 0, 1, 2, 3, 4 ],
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
		});

		$('#userPopUpTable3 tbody').on('click', 'tr', function() {
			var data = userPopUpTable3.row(this).data();		
		
			$('#faultyChargr').val(data.userNumber);
			$('#faultyChargrNm').val(data.userNm);
			
			$('#userPopUpModal3').modal('hide');
		});
		$('#userPopUpModal3').modal('show');
	}

    //부적합 담당자 모달 클릭시 
    function selectInspectChargr2(){
    	userPopUpTableModal2();
	}
   
	//처리결과 등록 버튼 클릭시
	$('#btnDtlAdd').on('click', function(){
    	if ( unfitProcResTable.data().length > 0 ) {
    		if ( !Boolean($('#faultyDate').val()) ) {
    			$('#faultyDate').val(SERVER_DATE);
    		}
    		if ( !Boolean($('#faultyChargr').val()) ) {
    			$('#faultyChargr').val(USER_NUMBER);
    			$('#faultyChargrNm').val(USER_NM);
    		}
    	} else {
    		toastr.warning("");
    	}
	})
     
    //저장
    $('#btnDtlSave').on('click', function() {
    	let check = true;
    	let dataArray = new Array();
    	
    	//입력값 검사
    	if ( unfitProcResTable.data().length <= 0 ) {
			toastr.warning('처리결과 버튼을 클릭해주세요.');
			$('#btnPrcssRes').focus();
			check = false;
			return false;
		}
    	if (!$.trim($('#printCompNm').val())) {
			toastr.warning('업체명을 선택해주세요.');
			$('#btnPrintComp').focus();
			check = false;
			return false;
		}
    	if (!$.trim($('#faultyDate').val())) {
			toastr.warning('부적합 등록일을 입력해주세요.');
			$('#faultyDate').focus();
			check = false;
			return false;
		}
    	if (!$.trim($('#faultyChargrNm').val())) {
			toastr.warning('부적합 담당자를 입력해주세요.');
			$('#btnfaultyChargr').focus();
			check = false;
			return false;
		}
    	
    	let unfitNoAndLotArray = []; //등록 전 이미 등록되었는지 확인하는 데이터를 담는 배열
    	
    	$('#unfitProcResTable tbody tr').each(function(index, item){
    		const trData = unfitProcResTable.row(this).data();
			
    		const ufcPlaceHolder = $(this).find('td input[name=unfitFaultyCnt]').attr('placeholder');
    		if ( !Boolean($(this).find('td select[name=unfitProc]').val()) ) {
    			toastr.warning("부적합처리를 선택해주세요.");
    			$(this).find('td select[name=unfitProc]').focus();
    			check = false;
    			return false;
    		}
    		if ( +$(this).find('td input[name=unfitFaultyCnt]').attr('placeholder').replace(/,/g,'') <
    				+$(this).find('td input[name=unfitPairCnt]').val().replace(/,/g,'') + +$(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g,'') + +$(this).find('td input[name=unfitOtherCnt]').val().replace(/,/g,'') ) {
    			toastr.warning(`\${trData.lotNo} 항목의 수량의 합을 \${ufcPlaceHolder} 이하로 입력해주세요.`);
    			check = false;
    			return false;
    		}

    		const faultyCdArr = $.trim(trData.faultyCd).split(',');
			
			for (let fcArr of faultyCdArr) {
				let rowData = new Object();
				rowData.unfitNo = fcArr;
				rowData.unfitLot = trData.lotNo;
				rowData.unfitGubun = $('#unfitGubunSelect option:selected').val();
				rowData.itemSeq = trData.itemSeq;
				rowData.itemCus = $('#printCompCd').val();
				rowData.unfitProc = $(this).find('td select[name=unfitProc]').val();
				rowData.unfitFaultyDate = $('#faultyDate').val().replace(/-/g, '');
				rowData.unfitFaultyChargr = $('#faultyChargr').val();
				rowData.unfitPairCnt = $(this).find('td input[name=unfitPairCnt]').val().replace(/,/g,'');
				rowData.unfitFaultyCnt = $(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g,'');
				rowData.unfitOtherCnt = $(this).find('td input[name=unfitOtherCnt]').val().replace(/,/g,'');
				rowData.unfitDesc = $(this).find('td input[name=unfitDesc]').val();
				
				unfitNoAndLotArray.push(fcArr + '|' + trData.lotNo); //등록 전 이미 등록되었는지 확인하는 데이터를 담는 배열
				
				dataArray.push(rowData);
			}
			
		});
    	
    	//등록 전 이미 등록되었는지 확인하는 데이터를 담는 배열
    	if ( unfitNoAndLotArray.length > 0 ) { dataArray[0].unfitNoAndLotArray = unfitNoAndLotArray; }
    	
    	if (check) {
	    	$('#my-spinner').show(function(){
	    		$.ajax({
					url : '<c:url value="/qm/unfitResultCreate"/>',
					type : 'POST',
					async : false,
					datatype: 'json',
					data: JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							$('#btnDtlSave').addClass('d-none');
							$('#unfitAdmTable').DataTable().ajax.reload(function(){
								$('#checkAll').prop('checked', false);
							});
							$('#faultyListTable').DataTable().ajax.reload(function() {});
							toastr.success('등록되었습니다.');
						} else if (res.result == 'alreadyFail') {
							$('#unfitProcResPopupModal').modal('hide');
							$('#unfitAdmTable').DataTable().ajax.reload(function(){
								$('#checkAll').prop('checked', false);
							});
							$('#faultyListTable').DataTable().ajax.reload(function() {});
							toastr.warning('이미 등록된 데이터가 있습니다.<br>데이터를 새로고침 합니다.');
						} else {
							toastr.error(res.message);
						}
					}
				});
	    		$('#my-spinner').hide();
	    	});
		}
	});

	//전체선택 체크
	$('#checkAll').change(function() {
		$('input:checkbox[name=inspectList]').not(':disabled').prop("checked", $(this).prop("checked"));
	})

	 $(document).on('keyup',"#faultyCnt, #pairCnt",function(e){
		var data = $(this).val();
		
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(addCommas($(this).val().replace(",", "")));
    });
	
	//메인 테이블
	let unfitProcResTable = $('#unfitProcResTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '40vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="tm/itemAllTempTableReset"/>',
			type : 'GET',
			async : false,
			data : {
				
			},
		},
		columns : [
			{//체크박스
				className : 'text-center', orderable: false,
				render: function(data, type, row, meta) {
					return '<input type="checkbox" name="uprCheck" style="width: 1.2rem; height: 1.2rem;">';
				}
			},
			{ data : 'itemNm', className : 'text-center' }, //부품명
			{ data : 'lotNo', className : 'text-center' }, //바코드
			{ //부적합처리
				className : 'text-center',
				render: function ( data, type, row, meta ) {
					return selectBoxHtml(unfitBjProcArray, "unfitProc", "", row, meta, "1");;
				}
			},
			{ //양품수량
				data : 'faultyCd', className : 'text-center',
				render: function ( data, type, row, meta ) {
					let html = `<input type="text" name="unfitPairCnt" value="0" class="form-control text-right" style="max-width: 100%;" onkeyup="numberFormat(this, 'int')">`;
					html += `<input type="hidden" value="\${data}">`; //불량내역
					return html;
				}
			},
			{ //불량수량
				data : 'faultyQtySum', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<input type="text" name="unfitFaultyCnt" value="\${data}" placeholder="\${data}" class="form-control text-right" style="max-width: 100%;" disabled>`;
				}
			},
			{ //기타수량
				className : 'text-center',
				render: function ( data, type, row, meta ){
					return `<input type="text" name="unfitOtherCnt" value="0" class="form-control text-right" style="max-width: 100%;" onkeyup="numberFormat(this, 'int')">`;
				}
			},
			{ //사유 (불량내역이 사유란에 표기되도록 구현)
				data : 'unfitDesc', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<input type="text" name="unfitDesc" value="\${data}" class="form-control" style="max-width: 100%;">`;
				}
			},
		],
		columnDefs : [],
		buttons : [],
	    order: [],
	});
	
	//처리결과 버튼 클릭시
	$(document).on('click', "#btnPrcssRes", function() {
		// 1. 선택된 행이 있는지 확인
		if ( $('input[name=inspectList]:checked').not(':disabled').length > 0 ) {
			// 2. 이미 처리된 데이터인지 확인 (TB_UNFIT_RESULT_ADM 데이터가 있는지 확인)
			let check = true;
			$('#unfitAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=inspectList]').not(':disabled').is(":checked") ) {
					let trData = unfitAdmTable.row(this).data();
					
					if ( trData.unfitResultNo === "등록" ) {
						toastr.warning("이미 처리된 항목이 선택되었습니다.");
						check = false;
						return false;
					}
				}
			});
			
			if (check) {
				let groupedRows = {}; // 묶여진 행을 저장할 객체 생성
				let totalFaultyQtySum = 0; // faultyQtySum의 총합을 저장할 변수 추가
				
				let isFirstIteration = true; //처리결과 모달의 업체명 가져오기
				
				// 체크된 행을 반복하면서 묶음 처리
				$('#unfitAdmTable tbody tr').each(function(index, item){
					if ( $(this).find('td input[name=inspectList]').not(':disabled').is(":checked") ) {
						let trData = unfitAdmTable.row(this).data();
						
						if (isFirstIteration) {
					      $('#printCompCd').val(trData.itemCus); //업체명
					      $('#printCompNm').val(trData.itemCusNm); //업체명 코드
					      isFirstIteration = false; //맨 위의 행의 협력사를 가져옴.
					    }
						
						let lotNo = trData.lotNo;
						if (groupedRows.hasOwnProperty(lotNo)) {
					      // 이미 같은 lotNo로 묶인 행이 있는 경우
					      groupedRows[lotNo].faultyCd += ',' + trData.faultyCd;
					      groupedRows[lotNo].unfitDesc += ',' + trData.faultyDtl; //불량내역이 사유란에 표기되도록 구현
					      groupedRows[lotNo].faultyQtySum = rmDecimal( Number(groupedRows[lotNo].faultyQtySum) + Number(trData.faultyQtySum) );
					    } else {
					        // 새로운 lotNo로 묶인 행을 추가하는 경우
					        groupedRows[lotNo] = {
					        	lotNo: lotNo
					        	, faultyCd: trData.faultyCd
					        	, faultyQtySum: rmDecimal(trData.faultyQtySum)
					        	, itemCusNm: trData.itemCusNm
					        	, itemModelNm: trData.itemModelNm
					        	, itemNm: trData.itemNm
					        	, itemSeq: trData.itemSeq
					        	, itemUnitNm: trData.itemUnitNm
					        	, unfitDesc: trData.faultyDtl //불량내역이 사유란에 표기되도록 구현
					        };
				      	}
						
						totalFaultyQtySum += Number(trData.faultyQtySum); // faultyQtySum의 값을 합산하여 totalFaultyQtySum에 더함
					}
				});
				
				// 묶인 행을 #unfitProcResTable에 추가
				unfitProcResTable.clear().draw();
		
				Object.values(groupedRows).forEach(function(row) {
				  unfitProcResTable.row.add(row).draw(false);
				});
				
				// 모든 faultyQtySum의 합을 할당
				$('#targetCnt').val(totalFaultyQtySum);
				$('#pairCnt').val('0');
				$('#faultyCnt').val(totalFaultyQtySum);
				
				$('#btnDtlSave').removeClass('d-none');
				$('#uprCheckAll').prop('checked', false);
				$('#unfitProcResPopupModal').modal('show');
				
				setTimeout(function(){
					unfitProcResTable.draw();
					unfitProcResTable.draw();
				}, 300);
			}
		} else {
			toastr.warning("처리결과할 항목을 선택해주세요.");
		}
	});
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width:100%" class="custom-select" name="'+ id +'">';
		
		var option = "<option value=''>선택</option>";
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}
	
	// unfitPairCnt, unfitOtherCnt의 값이 변경될 때의 keyup 이벤트 처리
	$(document).on('keyup', "input[name=unfitPairCnt], input[name=unfitOtherCnt]", function() {
		let totalUnfitPairCnt = 0; // unfitPairCnt의 총합을 저장할 변수 추가
		let totalUnfitFaultyCnt = 0; // unfitFaultyCnt의 총합을 저장할 변수 추가
		let totalUnfitOtherCnt = 0; // unfitOtherCnt의 총합을 저장할 변수 추가
		
		// 모든 행을 반복하면서 unfitPairCnt, unfitFaultyCnt, unfitOtherCnt의 값을 합산
		$('#unfitProcResTable tbody tr').each(function(index, item) {
			let unfitPairCnt = Number( $(this).find("input[name=unfitPairCnt]").val().replace(/,/g, '') );
			let unfitFaultyCnt = Number( $(this).find("input[name=unfitFaultyCnt]").val().replace(/,/g, '') );
			let unfitOtherCnt = Number( $(this).find("input[name=unfitOtherCnt]").val().replace(/,/g, '') );
			
			totalUnfitPairCnt += unfitPairCnt;
			totalUnfitFaultyCnt += unfitFaultyCnt;
			totalUnfitOtherCnt += unfitOtherCnt;
			
			let calculatedFaultyCnt = Number( $(this).find("input[name=unfitFaultyCnt]").attr('placeholder').replace(/,/g, '') ) - unfitPairCnt - unfitOtherCnt;
	        let correctedFaultyCnt = calculatedFaultyCnt >= 0 ? calculatedFaultyCnt : 0;
	        $(this).find("input[name=unfitFaultyCnt]").val( rmDecimal(correctedFaultyCnt) ); //불량수량 자동계산 ( 전체수량 - 양품수량 - 기타수량 = 불량수량 )
		});
		
		// 모든 unfitPairCnt의 합을 양품수량에 할당
		$('#pairCnt').val( rmDecimal(totalUnfitPairCnt) );
		
		// 모든 unfitFaultyCnt와 unfitOtherCnt의 합을 불량수량에 할당
		let totalFaultyCnt = totalUnfitFaultyCnt + totalUnfitOtherCnt;
		$('#faultyCnt').val( rmDecimal(totalFaultyCnt) );
	});
	
  	//반출증 출력 버튼 click
  	$('#btnPrint').on('click', function() {
	    if ( $('select[name=unfitProc] option:selected[value="004"]').length > 0 ) {
	        let groupedRows = {}; // 묶여진 행을 저장할 객체 생성
	        let qtySum = 0; // 합계를 저장할 변수 초기화
	        
	        let count = 0; // 통과한 횟수를 카운트하는 변수; 15번 초과로 하면 출력 페이지가 2장 이상 되어서 제한을 둠.
	        
	        // 체크된 행을 반복하면서 묶음 처리
	        $('#unfitProcResTable tbody tr').each(function(index, item) {
	            if ( $(this).find('td select[name=unfitProc]').val() === "004" ) {
	            	if (count >= 15) {
	                    return false; // 루프 종료
	                }
	            	
	                let trData = unfitProcResTable.row(this).data();
	                let itemSeq = trData.itemSeq;
	                const unfitOtherCnt = +$(this).find('td input[name=unfitOtherCnt]').val().replace(/,/g, '');
	                qtySum += +$(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g, ''); // 값을 합산
	                
	                if (groupedRows.hasOwnProperty(itemSeq)) {
				    	// 이미 같은 itemSeq로 묶인 행이 있는 경우
				    	groupedRows[itemSeq].faultyCnt = Number(groupedRows[itemSeq].faultyCnt) + Number( $(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g, '') );
				    	groupedRows[itemSeq].prcssCnt = Number(groupedRows[itemSeq].prcssCnt) + unfitOtherCnt;
				    } else {
				    	// 새로운 itemSeq로 묶인 행을 추가하는 경우
				    	groupedRows[itemSeq] = {
				    		faultyCnt		: $(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g, '')
		                    , prcssCnt		: unfitOtherCnt
		                    , unfitDesc		: $(this).find('td input[name=unfitDesc]').val()
		                    , itemCusNm		: trData.itemCusNm
		                    , itemModelNm	: trData.itemModelNm
		                    , itemNm		: trData.itemNm
		                    , itemUnitNm	: trData.itemUnitNm
		                };
				    	
				    	count++; // 통과한 횟수 증가
				    }
	                
	            }
	        });
	
	        // 묶인 행을 middleTable에 추가
	        middleTable.clear().draw();
	        Object.values(groupedRows).forEach(function(row) {
	            middleTable.row.add(row).draw(false);
	        });
	
	        $('#qtySum').text(qtySum); // 합계를 설정
	        $('#printCompTd').text($('#printCompNm').val()); //업체명 설정
	        $('#printDateTd').text($('#printDate').val()); //업체명 설정
	        
	        
	     	// cloneDiv를 삭제
	        $('#cloneDiv').remove();
	        
	    	// originalDiv 요소를 복제
	        const originalDiv = document.getElementById('originalDiv');
	        const cloneDiv = originalDiv.cloneNode(true);
	        cloneDiv.id = "cloneDiv";

	        // printDiv 요소
	        const printDiv = document.getElementById('printDiv');

	        // 복제된 요소를 printDiv에 추가
	        printDiv.appendChild(cloneDiv);
	        
	     	// 인쇄 전에 printDiv의 크기를 지정. 이 코드가 있어야 print 시 50%, 50%씩 잘 나눠짐
	        printDiv.style.height = "100%";
	        
// 	        $('#printPopUpModal').modal('show'); 굳이 모달을 보여줘야 하나?
	        $('#printDiv').print();
	        
	    } else {
	        toastr.warning("반품인 항목이 없습니다.");
	    }
	});
  	
	//메인 테이블
	let middleTable = $('#middleTable').DataTable({
		dom : "<'row'<'col-sm-12 p-0'>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 p-0'>>",
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : 15,
		ajax : {
			url : '<c:url value="tm/itemAllTempTableReset"/>',
			type : 'GET',
			async : false,
			data : {
				
			},
		},
		columns : [
			{ //NO
				className : 'text-center',
				render: function ( data, type, row, meta ) {
					return meta.row + 1;
				}
			},
			{ //차종
				data : 'itemModelNm', className : 'text-center',
				render: function(data, type, row, meta){
					return data != null ? data : '';
				}
			},
			{ //품명
				data : 'itemNm', className : 'text-center',
				render: function(data, type, row, meta){
					return data != null ? data : '';
				}
			},
			{ //단위
				data : 'itemUnitNm', className : 'text-center',
				render: function(data, type, row, meta){
					return data != null ? data : '';
				}
			},
			{ //수량
				data : 'faultyCnt', className : 'text-center',
				render: function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //반출사유
				data : 'unfitDesc', className : 'text-center',
				render: function(data, type, row, meta){
					return data != null ? data : '';
				}
			},
		],
		columnDefs : [],
		buttons : [],
	    order: [],
	});
	
	//품번 팝업 시작
	let itemCdPopUpTable;
	function itemCdModalShow() {
		if (itemCdPopUpTable != null && itemCdPopUpTable != 'undefined') {
			itemCdPopUpTable.destroy();
		}
		itemCdPopUpTable = $('#itemCdPopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
			language : lang_kor,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			pageLength : -1,
			scrollY : '50vh',
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [ 
				{ data : 'itemCusNm', 'className' : 'text-center' }, //공급사
				{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
				{ data : 'itemCd', 'className' : 'text-center' }, //품번
				{ data : 'itemNm', 'className' : 'text-center' }, //품명
				{ data : 'itemUnitNm', 'className' : 'text-center' }, //단위
			],
			columnDefs : [],
			order : [],
			buttons : [],
		});
		
		$('#itemCdPopUpTable tbody').on('click', 'tr', function() {
			let data = itemCdPopUpTable.row(this).data();
			$('#itemSeqFind').val(data.itemSeq);
			$('#itemCdFind').val(data.itemCd);
			itemSeqVal = data.itemSeq;
			itemCdNm = data.itemCd;
			
			$('#itemCdPopUpModal').modal('hide');
		});
		
		$('#itemCdPopUpModal').modal('show');
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}
	
	//공급사 팝업 시작
	var popUpCheck = null;
	var dealCorpPopUpTable4;
	let popUpSource;
	function itemCusSelectInCorpCd(source) {
		popUpSource = source;
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
// 		var dealArr = ['002','003'];
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				async : false,
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/dealCorpDataList"/>',
					type : 'GET',
					data : {
// 						'dealArr' :  function(){return dealArr;},
					},
				},
				columns : [
					{ data : 'dealCorpNm' }, 
					{ data : 'dealCorpCd' }, 
					{ data : 'presidentNm' }, 
					{ data : 'repreItem' }, 
					{ data : 'corpNo' },
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		});
		
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	$(document).on('click', '#dealCorpPopUpTable4 tbody tr', function() {
		var data = dealCorpPopUpTable4.row(this).data();
		if ( popUpSource == 1 ) {
			$('#itemRealCus').val(data.dealCorpCd);
			$('#itemCus').val(data.dealCorpNm);
			
			itemCusVal = data.dealCorpCd;
			itemCusNm = data.dealCorpNm;
		} else if ( popUpSource == 2 ) {
			$('#printCompNm').val(data.dealCorpNm);
			$('#printCompCd').val(data.dealCorpCd);
		}
		
		$('#dealCorpPopUpModal4').modal('hide');
	});
	
	//전체선택 체크
	$('#uprCheckAll').change(function() {
		$('input:checkbox[name=uprCheck]').prop("checked", $(this).prop("checked"));
	})
	
	//일괄적용 버튼 클릭시
	$("#btnUprApply").click(function() {
		let isChecked = false;
		
		$("#unfitProcResTable tbody tr").each(function() {
	    	const checkbox = $(this).find("input[name='uprCheck']");
	    	const select = $(this).find("select[name='unfitProc']");
	    
	    	if (checkbox.is(":checked")) {
	    		isChecked = true;
	      		select.val($('#uprApplyBox').val());
	    	}
	  	});
		
		if (!isChecked) {
		    toastr.warning("일괄적용할 항목을 선택해주세요.");
		} else {
			toastr.success("일괄적용되었습니다.");
		}
	});
	
    //처리취소 버튼 클릭시
    $(document).on('click', "#btnPrDelete", function() {
		// 1. 선택된 행이 있는지 확인
		if ( $('input[name=inspectList]:checked').not(':disabled').length > 0 ) {
			let unfitResultNoArray = [];
			
			$('#unfitAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=inspectList]').not(':disabled').is(":checked") ) {
					let trData = unfitAdmTable.row(this).data();
					
					if ( Boolean(trData.unfitResultIdx) ) { unfitResultNoArray.push( trData.unfitResultIdx ); }
				}
			});
			
			$.ajax({
				url : '<c:url value="qm/unfitResultDelete"/>',
				type : 'POST',
				data : {
		           	'unfitResultNoArray'	: function(){ return unfitResultNoArray; },
				},
				beforeSend: function () {
					$('#my-spinner').show();
	            },
	            success: function (res) {
	                if (res.result == 'ok') {
	                	$('#unfitAdmTable').DataTable().ajax.reload(function(){
							$('#checkAll').prop('checked', false);
						});
	                	$('#faultyListTable').DataTable().ajax.reload(function() {});
	                	toastr.success("처리취소가 완료되었습니다.");
	                } else {
	                	toastr.error(res.message);
	                }
	            },
	            complete: function () {
					$('#my-spinner').hide();
	            },
			});
		} else {
			toastr.warning("처리취소할 항목을 선택해주세요.");
		}
    });

    
</script>
</body>
</html>
