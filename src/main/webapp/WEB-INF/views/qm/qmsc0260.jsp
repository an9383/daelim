<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">부적합관리</a></li>
				<li class="breadcrumb-item active">부적합관리현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="unfitAdmTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th class="text-center">
										<input type="checkbox" id="unfitCheckAll" style="width: 1.2rem; height: 1.2rem;">
									</th>
									<!-- <th class="text-center">발생일자</th> -->
									<th class="text-center">협력사</th>
									<th class="text-center">발생공정</th>
									<th class="text-center">모델명</th>
									<th class="text-center">부품명</th>
									<th class="text-center">LOT NO</th>
									<th class="text-center">불량사유</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">기타수량</th>
									<th class="text-center">처리유형</th>
									<th class="text-center">처리일자</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr>
									<th colspan='7'>합계</th>
									<th id="totalUnfitPairCnt"></th>
									<th id="totalUnfitFaultyCnt"></th>
									<th id="totalUnfitOtherCnt"></th>
									<th colspan="2"></th>
								</tr>
							</tfoot>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>

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

<!-- 처리결과수정 모달 시작 -->
<div class="modal fade bd-example-modal-lg" id="unfitProcResPopupModal"
	tabindex="-1" role="dialog" aria-labelledby="unfitProcResPopupModal"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content"
			style="width: 1100px; position: absolute; left: 50%; transform: translateX(-50%);">
			<div class="modal-header">
				<h5 class="modal-title" id="unfitProcResPopupLabel">처리 결과 수정</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row p-0 mb-2" style="background-color: #ffffff; height: 100%;">
					<div class="card-body col-sm-12 p-1">
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
									<th colspan="4">부적합처리</th>
								</tr>
								<tr>
									<th>부적합 등록일</th>
									<td>
										<div class="form-group input-sub m-0" style="max-width: 100%">
											<input type="date" class="form-control" id="faultyDate" value="${serverDateTo}" style="min-width: 100%;" />
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
						<select class="select custom-select float-left mr-1" id="uprApplyBox" style="width: 100px;"></select>
						<button type="button" class="btn btn-primary float-left mr-1" id="btnUprApply">일괄적용</button>
					</div>
					<div class="col-md-12 p-1">
						<table id="unfitProcResTable" class="table table-bordered">
							<colgroup>
								<col width="3%">
								<col width="18%">
								<col width="11%">
								<col width="16%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="16%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">
										<input type="checkbox" id="uprCheckAll" style="width: 1.2rem; height: 1.2rem;">
									</th>
									<th class="text-center">부품명</th>
									<th class="text-center">바코드</th>
									<th class="text-center">불량내역</th>
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
<!-- 처리결과수정 모달 끝 -->

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

<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	const CURRENT_HREF = "qmsc0260";
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');
	$('#'+CURRENT_PAGE).closest('.has-child','li').addClass('has-open has-active');
	$('#'+CURRENT_PAGE).closest('.menu-item').addClass('has-active');  
	$(document).attr("title", "부적합관리현황");
	
	
	const SERVER_DATE_FROM = "${serverDateFrom}";
	const SERVER_DATE_TO = "${serverDateTo}";
	
	let startDateVal = SERVER_DATE_FROM.replace(/-/g,'');
	let endDateVal = SERVER_DATE_TO.replace(/-/g,'');
	let mainGubunVal = "002"; //기본값: 봉제
	let unfitGubunVal = "002"; //기본값: 공정
	let unfitProcVal = "";
	let itemSeqVal = "";
	let itemCusVal = "";
	let unfitResultNoArray = "";
	
	//공통코드 시작
	let mainGubunArray = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
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
	//공통코드 끝

	//메인 테이블
	let unfitAdmTable = $('#unfitAdmTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "65vh",
		ajax : {
			url : '<c:url value="qm/unfitAdmSituList"/>',
			type : 'GET',
			data : {
				'mainGubun' 	: function(){ return mainGubunVal; }, //공정
				'startDate' 	: function(){ return startDateVal; }, //처리일자
				'endDate' 		: function(){ return endDateVal; }, //처리일자
				'unfitGubun'	: function(){ return unfitGubunVal; }, //구분
				'unfitProc'		: function(){ return unfitProcVal; }, //처리결과
				'itemSeq'		: function(){ return itemSeqVal; }, //품번
	           	'itemCus'		: function(){ return itemCusVal; }, //협력사
			}
		},
		columns : [
			{//체크박스
				render: function(data, type, row, meta) {
					return '<input type="checkbox" name="unfitCheck" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			/* {//발생일자
				data : 'inspectDate', className : 'text-center',
				render : function(data, type, row, meta){
					return data != null && data != '' ? moment(data).format("YYYY-MM-DD") : '';
				}
			}, */
			{ data : 'itemCusNm', className : 'text-center' }, //협력사
			{ data : 'minorPrcssCd', className : 'text-center' }, //발생공정
			{ data : 'itemModelNm', className : 'text-center' }, //모델명
			{ data : 'itemNm', className : 'text-center' }, //부품명
			{ data : 'lotNo', className : 'text-center' }, //LOT NO
			{ data : 'unfitDesc', className : 'text-center' }, //불량사유
			{ //양품수량
				data : 'unfitPairCnt', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
				, footerSum: true //footer에 합계를 보여주는 컬럼인지 확인하는 속성
				, footer: '#totalUnfitPairCnt' //footer 셀의 id의 값을 알려주는 속성
			},
			{ //불량수량
				data : 'unfitFaultyCnt', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
				, footerSum: true
	            , footer: '#totalUnfitFaultyCnt'
			},
			{ //기타수량
				data : 'unfitOtherCnt', className : 'text-right',
				render : function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
				, footerSum: true
				, footer: '#totalUnfitOtherCnt'
			},
			{ data : 'unfitProcNm', className : 'text-center' }, //처리유형
			{ //처리일자
				data : 'unfitFaultyDate', className : 'text-center',
				render : function(data, type, row, meta){
					return data != null && data != '' ? moment(data).format("YYYY-MM-DD") : '';
				}
			},
		],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [],
	    drawCallback: function () {
	        let api = this.api();
	        let data = api.data();
	        let columns = api.columns().settings().init().columns;

	        $('#unfitAdmTable').find('tfoot').remove(); // 테이블의 푸터 부분을 초기화해야 오류 발생 X

	    	// 각 컬럼에 대해서 합계 계산 수행
	    	// 예) $('#workOrderTable').DataTable().column(5,{ page: 'current'} ).data().sum()
	    	// 위 코드의 문제는 나중에 어느 컬럼이 추가되거나 삭제되면 이 코드를 따로 수정을 해야 하므로 유지보수가 힘듦.
	    	// 그래서 columns 옵션에서 합계를 보여줄 컬럼에 footerSum, footer 속성을 추가해서 이를 이용해 합계를 출력하도록 구현
	        columns.forEach(function (column, index) {
	            if (column.footerSum) {
	                let sum = api.column(index, { page: 'current' }).data().sum();
	                let columnData = column.render(sum);

	                $(column.footer).text(columnData); // footer 셀에 합계 값 적용
	            }
	        });
	    },
	});
	
	//전체선택 체크
	$('#unfitCheckAll').change(function() {
		$('input:checkbox[name=unfitCheck]').prop("checked", $(this).prop("checked"));
	})
   
    let html1 = '<div class="row">';
    
	html1 += '<label class="input-label-sm m-1">처리일자</label><div class="form-group input-sub m-0 row">';
    html1 += `<input class="form-control" type="date" id="startDateBox" value="\${SERVER_DATE_FROM}"/>`;
    html1 += '</div>';
    html1 += '&nbsp;~&nbsp;<div class="form-group input-sub mr-2 row">';
    html1 += `<input class="form-control" type="date" id="endDateBox" value="\${SERVER_DATE_TO}"/>`;
    html1 += '</div>';
    
    html1 += '<label class="input-label-sm m-1">공정</label>';
	html1 += '<div class="form-group input-sub mr-2">';
	html1 += '<select id="mainGubunBox" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>';
    
    html1 += '<label class="input-label-sm m-1">구분</label>';
	html1 += '<div class="form-group input-sub mr-2">';
	html1 += '<select id="unfitGubunBox" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>';
	
	html1 += '<label class="input-label-sm m-1">처리결과</label>';
	html1 += '<div class="form-group input-sub mr-2">';
	html1 += '<select id="unfitProcBox" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>';
	
	html1 += '<label class="input-label-sm m-1">품번</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="hidden" id="itemSeqFind">';
	html1 += '<input type="text" class="form-control" id="itemCdFind" style="width:130px;" disabled>';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += `<button type="button" id="itemCdDelete" class="btn form-control mr-2 p-0" style="width: 30px;" onclick="$('#itemSeqFind').val(''); $('#itemCdFind').val('');">`;
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
	
	html1 += '<label class="input-label-sm m-1">협력사</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="hidden" class="form-control" id="itemRealCus">';
	html1 += '<input type="text" class="form-control" id="itemCus" style="width:130px;" disabled>';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" id="itemCusBtn" onClick="itemCusSelectInCorpCd(1);">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += `<button type="button" id="itemCusDelete" class="btn form-control mr-2 p-0" style="width: 30px;" onclick="$('#itemCus').val('');$('#itemRealCus').val('');">`;
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
	
	html1 += '<button type="button" class="btn btn-primary mr-2" id="btnRetv">조회</button>';
	
	html1 += '<button type="button" class="btn btn-info mr-2" id="btnPrcssRes">처리결과수정</button>';
	
	html1 += '<button type="button" class="btn btn-info mr-2" id="btnPrint">반출증 출력</button>';
	
	html1 += '<button type="button" class="btn btn-danger" id="btnPrDelete">처리취소</button>';
	
    html1 += '</div>';
	
	$('#unfitAdmTable_length').html(html1);
	selectBoxAppend(mainGubunArray, "mainGubunBox", "002", ""); //공정
	selectBoxAppend(unfitGubunArray, "unfitGubunBox", "002", ""); //구분
	selectBoxAppend(unfitProcArray, "unfitProcBox", "", "1"); //처리결과
	
	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		startDateVal = $('#startDateBox').val().replace(/-/g,'');
		endDateVal = $('#endDateBox').val().replace(/-/g,'');
		mainGubunVal = $("#mainGubunBox").val();
		unfitGubunVal = $("#unfitGubunBox").val();
		unfitProcVal = $("#unfitProcBox").val();
		itemSeqVal = $("#itemSeqFind").val();
		itemCusVal = $("#itemRealCus").val();
		$('#unfitAdmTable').DataTable().ajax.reload(function(){});
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
					'mainGubun' : function(){return mainGubunVal;},
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
			
			$('#itemCdPopUpModal').modal('hide');
		});
		
		$('#itemCdPopUpModal').modal('show');
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}
	
	//공급사 팝업 시작
	let dealCorpPopUpTable4;
	function itemCusSelectInCorpCd() {
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
		let data = dealCorpPopUpTable4.row(this).data();
		$('#itemRealCus').val(data.dealCorpCd);
		$('#itemCus').val(data.dealCorpNm);
		
		$('#dealCorpPopUpModal4').modal('hide');
	});
	//공급사 팝업 종료
	
	//처리결과수정 버튼 클릭시
	$(document).on('click', "#btnPrcssRes", function() {
		if ( $('input[name=unfitCheck]:checked').length > 0 ) {
			let unfitResultNo = '';
			
			// 체크된 행을 반복하면서 묶음 처리
			$('#unfitAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=unfitCheck]').is(":checked") ) {
					let trData = unfitAdmTable.row(this).data();
					
					if ( Boolean(unfitResultNo) ) { unfitResultNo += ',' }
					unfitResultNo += trData.unfitResultNo;
					
				}
			});
			
			const numbers = unfitResultNo.split(','); // 문자열을 쉼표로 구분하여 배열로 변환
			const uniqueNumbers = [...new Set(numbers)]; // 중복을 제거한 배열 생성
			const resultVal = uniqueNumbers.join(','); // 배열을 다시 문자열로 변환하여 쉼표로 구분
			const numberArray = resultVal.split(','); // 쉼표로 구분한 값을 배열로 변환
			unfitResultNoArray = numberArray; // 결과값
			
			$('#unfitProcResTable').DataTable().ajax.reload(function(){totalCntCalc();});
			
			$('#btnDtlSave').removeClass('d-none');
			$('#unfitProcResPopupModal').modal('show');
			
			setTimeout(function(){
				unfitProcResTable.draw();
				unfitProcResTable.draw();
			}, 300);
		} else {
			toastr.warning("처리결과할 항목을 선택해주세요.");
		}
	});
	
	//처리결과수정 테이블
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
			url : '<c:url value="qm/unfitResultStatusList"/>',
			type : 'GET',
			async : false,
			data : {
				'unfitResultNoArray' : function(){ return unfitResultNoArray; },
				'mainGubun' 	: function(){ return mainGubunVal; }, //공정
				'startDate' 	: function(){ return startDateVal; }, //처리일자
				'endDate' 		: function(){ return endDateVal; }, //처리일자
				'unfitGubun'	: function(){ return unfitGubunVal; }, //구분
				'unfitProc'		: function(){ return unfitProcVal; }, //처리결과
				'itemSeq'		: function(){ return itemSeqVal; }, //품번
	           	'itemCus'		: function(){ return itemCusVal; }, //협력사
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
			{ data : 'unfitLot', className : 'text-center' }, //바코드
			{ data : 'faultyDtl', className : 'text-center' }, //불량내역
			{ //부적합처리
				data : 'unfitProc', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return selectBoxHtml(unfitBjProcArray, "unfitProc", data, row, meta, "1");;
				}
			},
			{ //양품수량
				data : 'unfitPairCnt', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<input type="text" name="unfitPairCnt" value="\${data}" class="form-control text-right" style="max-width: 100%;" onkeyup="numberFormat(this, 'int')">`;
				}
			},
			{ //불량수량
				data : 'unfitFaultyCnt', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<input type="text" name="unfitFaultyCnt" value="\${data}" placeholder="\${Number(row['unfitPairCnt']) + Number(row['unfitFaultyCnt']) + Number(row['unfitOtherCnt'])}" class="form-control text-right" style="max-width: 100%;" disabled>`;
				}
			},
			{ //기타수량
				data : 'unfitOtherCnt', className : 'text-center',
				render: function( data, type, row, meta ) {
					return `<input type="text" name="unfitOtherCnt" value="\${data}" class="form-control text-right" style="max-width: 100%;" onkeyup="numberFormat(this, 'int')">`;
				}
			},
			{ //사유
				data : 'unfitDesc', className : 'text-center',
				render: function( data, type, row, meta ) {
					return `<input type="text" name="unfitDesc" value="\${data}" class="form-control" style="max-width: 100%;">`;
				}
			},
		],
		columnDefs : [],
		buttons : [],
	    order: [],
	});
	
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
	
	//전체선택 체크
	$('#uprCheckAll').change(function() {
		$('input:checkbox[name=uprCheck]').prop("checked", $(this).prop("checked"));
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
	
  	//반출증 출력 버튼 click
  	$('#btnPrint').on('click', function() {
	    if ( $('input[name=unfitCheck]:checked').length > 0 ) {
	        let groupedRows = {}; // 묶여진 행을 저장할 객체 생성
	        let qtySum = 0; // 합계를 저장할 변수 초기화
	        let printCompTdVal = ''; //업체명 설정 변수
	        
	        let count = 0; // 통과한 횟수를 카운트하는 변수; 15번 초과로 하면 출력 페이지가 2장 이상 되어서 제한을 둠.
	        
	        // 체크된 행을 반복하면서 묶음 처리
	        $('#unfitAdmTable tbody tr').each(function(index, item) {
	            if ( $(this).find('td input[name=unfitCheck]').is(":checked") ) {
	            	if (count >= 15) {
	                    return false; // 루프 종료
	                }
	            	
	                let trData = unfitAdmTable.row(this).data();
	                let itemSeq = trData.itemSeq;
	                const unfitOtherCnt = Number(trData.unfitOtherCnt);
	                qtySum += Number(trData.unfitFaultyCnt); // 값을 합산
	                if (count == 0) { printCompTdVal = trData.itemCusNm; }
	                
	                if (groupedRows.hasOwnProperty(itemSeq)) {
				    	// 이미 같은 itemSeq로 묶인 행이 있는 경우
				    	groupedRows[itemSeq].faultyCnt = Number(groupedRows[itemSeq].faultyCnt) + Number( trData.unfitFaultyCnt );
				    	groupedRows[itemSeq].prcssCnt = Number(groupedRows[itemSeq].prcssCnt) + unfitOtherCnt;
				    } else {
				    	// 새로운 itemSeq로 묶인 행을 추가하는 경우
				    	groupedRows[itemSeq] = {
				    		faultyCnt		: trData.unfitFaultyCnt
		                    , prcssCnt		: unfitOtherCnt
		                    , unfitDesc		: trData.unfitDesc
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
	        $('#printCompTd').text(printCompTdVal); //업체명 설정
	        $('#printDateTd').text(SERVER_DATE_TO); //작성일 설정
	        
	        
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
	        toastr.warning("출력할 항목을 선택해주세요.");
	    }
	});
  	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width:100%" class="custom-select" name="'+ id +'">';
		
// 		var option = "<option value=''>선택</option>";
		var option = "";
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
	
    //저장
    $('#btnDtlSave').on('click', function() {
    	let check = true;
    	let dataArray = new Array();
    	
    	//입력값 검사
    	if ( unfitProcResTable.data().length <= 0 ) {
			toastr.warning('처리결과수정 버튼을 클릭해주세요.');
			$('#btnPrcssRes').focus();
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

			let rowData = new Object();
			rowData.unfitResultNoArray = trData.unfitResultNo;
			rowData.unfitLot = trData.unfitLot;
			rowData.unfitProc = $(this).find('td select[name=unfitProc]').val();
			rowData.unfitFaultyDate = $('#faultyDate').val().replace(/-/g, '');
			rowData.unfitFaultyChargr = $('#faultyChargr').val();
			rowData.unfitPairCnt = $(this).find('td input[name=unfitPairCnt]').val().replace(/,/g,'');
			rowData.unfitFaultyCnt = $(this).find('td input[name=unfitFaultyCnt]').val().replace(/,/g,'');
			rowData.unfitOtherCnt = $(this).find('td input[name=unfitOtherCnt]').val().replace(/,/g,'');
			rowData.unfitDesc = $(this).find('td input[name=unfitDesc]').val();
			
			dataArray.push(rowData);
			console.log(rowData)
		});
    	
    	if (check) {
			$.ajax({
				url : '<c:url value="/qm/unfitResultLotUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						$('#unfitAdmTable').DataTable().ajax.reload(function(){});
						$('#unfitProcResPopupModal').modal('hide');
						toastr.success('수정되었습니다.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
    	}
     });
    
	// unfitPairCnt, unfitOtherCnt의 값이 변경될 때의 keyup 이벤트 처리
	$(document).on('keyup', "input[name=unfitPairCnt], input[name=unfitOtherCnt]", function() {
		totalCntCalc();
	});
	
	//부적합 대상수량, 양품수량, 불량수량 계산
	function totalCntCalc() {
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
		
		// 모든 양품수량, 불량수량의 합을 부적합 대상수량에 할당
		let totalTargetCnt = totalUnfitPairCnt + totalUnfitFaultyCnt + totalUnfitOtherCnt;
		$('#targetCnt').val( rmDecimal(totalTargetCnt) );
		
		// 모든 unfitPairCnt의 합을 양품수량에 할당
		$('#pairCnt').val( rmDecimal(totalUnfitPairCnt) );
		
		// 모든 unfitFaultyCnt와 unfitOtherCnt의 합을 불량수량에 할당
		let totalFaultyCnt = totalUnfitFaultyCnt + totalUnfitOtherCnt;
		$('#faultyCnt').val( rmDecimal(totalFaultyCnt) );
	}
	
	//처리취소 버튼 클릭시
    $(document).on('click', "#btnPrDelete", function() {
		// 1. 선택된 행이 있는지 확인
		if ( $('input[name=unfitCheck]:checked').length > 0 ) {
			let unfitResultNoArray = [];
			let unfitResultNo = '';
			
			// 체크된 행을 반복하면서 묶음 처리
			$('#unfitAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=unfitCheck]').is(":checked") ) {
					let trData = unfitAdmTable.row(this).data();
					
					if ( Boolean(unfitResultNo) ) { unfitResultNo += ',' }
					unfitResultNo += trData.unfitResultNo;
					
				}
			});
			
			const numbers = unfitResultNo.split(','); // 문자열을 쉼표로 구분하여 배열로 변환
			const uniqueNumbers = [...new Set(numbers)]; // 중복을 제거한 배열 생성
			const resultVal = uniqueNumbers.join(','); // 배열을 다시 문자열로 변환하여 쉼표로 구분
			const numberArray = resultVal.split(','); // 쉼표로 구분한 값을 배열로 변환
			unfitResultNoArray = numberArray; // 결과값
			
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
							$('#unfitCheckAll').prop('checked', false);
						});
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
	
</script>

</body>
</html>
