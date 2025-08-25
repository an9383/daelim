<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 품번 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemCdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemCdPopUpLabel">품번 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
	    	</div>
	  	</div>
	</div>
	<!-- 품번 모달 종료-->
		<!-- 설비정보 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="equipPopUpLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipPopUpLabel2">설비코드조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="equipPopUpTable2" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 10%">설비코드</th>
									<th style="width : 10%">설비명</th>
									<th style="width : 10%">공정명</th>
									<th style="width : 10%">규격</th>
									<th style="width : 10%">제작일자</th>
									<th style="width : 10%">제조사</th>
		                   		</tr>
	                   		</thead>
						</table>
					<hr class="text-secondary"> 
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 설비정보 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">기간별 작업조건현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row table-striped" style="width: 4000px;">
							<thead class="thead-light">
								<tr>
									<th rowspan='2' class="text-center align-middle">작업지시번호</th>
									<th rowspan='2' class="text-center align-middle">생산지시일</th>
									<th rowspan='2' class="text-center align-middle">설비명</th>
									<th rowspan='2' class="text-center align-middle">차종</th>
									<th rowspan='2' class="text-center align-middle">품번</th>
									<th rowspan='2' class="text-center align-middle">품명</th>
									<th colspan='2' class="text-center align-middle">금형정보</th>
									<th rowspan='2' class="text-center align-middle">차수</th>
									<th colspan='2' class="text-center align-middle">NZ온도</th>
									<th colspan='2' class="text-center align-middle">H1온도</th>
									<th colspan='2' class="text-center align-middle">H2온도</th>
									<th colspan='2' class="text-center align-middle">H3온도</th>
									<th colspan='2' class="text-center align-middle">H4온도</th>
									<th colspan='2' class="text-center align-middle">계량거리 1차</th>
									<th colspan='2' class="text-center align-middle">계량거리 2차</th>
									<th colspan='2' class="text-center align-middle">계량거리 3차</th>
									<th colspan='2' class="text-center align-middle">계량거리 4차</th>
									<th colspan='2' class="text-center align-middle">석백</th>
									<th colspan='2' class="text-center align-middle">사출압력 1차</th>
									<th colspan='2' class="text-center align-middle">사출압력 2차</th>
									<th colspan='2' class="text-center align-middle">사출압력 3차</th>
									<th colspan='2' class="text-center align-middle">사출속도 1차</th>
									<th colspan='2' class="text-center align-middle">사출속도 2차</th>
									<th colspan='2' class="text-center align-middle">사출속도 3차</th>
									<th colspan='2' class="text-center align-middle">사출거리 1차</th>
									<th colspan='2' class="text-center align-middle">사출거리 2차</th>
									<th colspan='2' class="text-center align-middle">사출거리 3차</th>
									<th colspan='2' class="text-center align-middle">배압 1차</th>
									<th colspan='2' class="text-center align-middle">배압 2차</th>
									<th colspan='2' class="text-center align-middle">배압 3차</th>
									<th colspan='2' class="text-center align-middle">배압 4차</th>
									<th colspan='2' class="text-center align-middle">보압 1차</th>
									<th colspan='2' class="text-center align-middle">보압 2차</th>
									<th colspan='2' class="text-center align-middle">보압 3차</th>
									<th colspan='2' class="text-center align-middle">보압속도 1차</th>
									<th colspan='2' class="text-center align-middle">보압속도 2차</th>
									<th colspan='2' class="text-center align-middle">보압속도 3차</th>
									<th colspan='2' class="text-center align-middle">온도조절기</th>
									<th colspan='2' class="text-center align-middle">작동유</th>
									<th colspan='2' class="text-center align-middle">냉각수 IN</th>
									<th colspan='2' class="text-center align-middle">냉각수 OUT</th>
									<th colspan='2' class="text-center align-middle">고정측 온도</th>
									<th colspan='2' class="text-center align-middle">이동측 온도</th>
									<th colspan='3' class="text-center align-middle">내측 고정측 온도</th>
									<th colspan='3' class="text-center align-middle">내축 이동측 온도</th>
								</tr>
								<tr>
									<th class="text-center align-middle">금형코드</th>
									<th class="text-center align-middle">Cavity</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">표준</th>
									<th class="text-center align-middle">조건</th>
									<th class="text-center align-middle">1</th>
									<th class="text-center align-middle">2</th>
									<th class="text-center align-middle">3</th>
									<th class="text-center align-middle">1</th>
									<th class="text-center align-middle">2</th>
									<th class="text-center align-middle">3</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<script>
	let currentHref = "wmsc0250";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 작업조건현황");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemListVal = '';
	let equipListVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	// 기간별 생산 현황 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: '65vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/workConditionList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return startDateVal;},
				'endDate'	:	function(){ return endDateVal;},
				'itemSeq'	:	function(){ return itemListVal;},
				'equipCd'	:	function(){ return equipListVal;}
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'workOrdDate', className : 'text-center align-top', name: 'rowspan',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemModelNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemCd', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'equipNo', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'cavity', className : 'text-center align-top', name: 'rowspan' },
			{ data : 'histSeqNm', className : 'text-center' },
			{ data : 'stNzTemperature', className : 'text-center' },
			{ data : 'cdNzTemperature', className : 'text-center' },
			{ data : 'stH1Temperature', className : 'text-center' },
			{ data : 'cdH1Temperature', className : 'text-center' },
			{ data : 'stH2Temperature', className : 'text-center' },
			{ data : 'cdH2Temperature', className : 'text-center' },
			{ data : 'stH3Temperature', className : 'text-center' },
			{ data : 'cdH3Temperature', className : 'text-center' },
			{ data : 'stH4Temperature', className : 'text-center' },
			{ data : 'cdH4Temperature', className : 'text-center' },
			{ data : 'stChgPosition1', className : 'text-center' },
			{ data : 'cdChgPosition1', className : 'text-center' },
			{ data : 'stChgPosition2', className : 'text-center' },
			{ data : 'cdChgPosition2', className : 'text-center' },
			{ data : 'stChgPosition3', className : 'text-center' },
			{ data : 'cdChgPosition3', className : 'text-center' },
			{ data : 'stChgPosition4', className : 'text-center' },
			{ data : 'cdChgPosition4', className : 'text-center' },
			{ data : 'stSuckBack', className : 'text-center' },
			{ data : 'cdSuckBack', className : 'text-center' },
			{ data : 'stInjPressure1', className : 'text-center' },
			{ data : 'cdInjPressure1', className : 'text-center' },
			{ data : 'stInjPressure2', className : 'text-center' },
			{ data : 'cdInjPressure2', className : 'text-center' },
			{ data : 'stInjPressure3', className : 'text-center' },
			{ data : 'cdInjPressure3', className : 'text-center' },
			{ data : 'stInjVelocity1', className : 'text-center' },
			{ data : 'cdInjVelocity1', className : 'text-center' },
			{ data : 'stInjVelocity2', className : 'text-center' },
			{ data : 'cdInjVelocity2', className : 'text-center' },
			{ data : 'stInjVelocity3', className : 'text-center' },
			{ data : 'cdInjVelocity3', className : 'text-center' },
			{ data : 'stInjPosition1', className : 'text-center' },
			{ data : 'cdInjPosition1', className : 'text-center' },
			{ data : 'stInjPosition2', className : 'text-center' },
			{ data : 'cdInjPosition2', className : 'text-center' },
			{ data : 'stInjPosition3', className : 'text-center' },
			{ data : 'cdInjPosition3', className : 'text-center' },
			{ data : 'stBackPressure1', className : 'text-center' },
			{ data : 'cdBackPressure1', className : 'text-center' },
			{ data : 'stBackPressure2', className : 'text-center' },
			{ data : 'cdBackPressure2', className : 'text-center' },
			{ data : 'stBackPressure3', className : 'text-center' },
			{ data : 'cdBackPressure3', className : 'text-center' },
			{ data : 'stBackPressure4', className : 'text-center' },
			{ data : 'cdBackPressure4', className : 'text-center' },
			{ data : 'stHldPressure1', className : 'text-center' },
			{ data : 'cdHldPressure1', className : 'text-center' },
			{ data : 'stHldPressure2', className : 'text-center' },
			{ data : 'cdHldPressure2', className : 'text-center' },
			{ data : 'stHldPressure3', className : 'text-center' },
			{ data : 'cdHldPressure3', className : 'text-center' },
			{ data : 'stHldVel1', className : 'text-center' },
			{ data : 'cdHldVel1', className : 'text-center' },
			{ data : 'stHldVel2', className : 'text-center' },
			{ data : 'cdHldVel2', className : 'text-center' },
			{ data : 'stHldVel3', className : 'text-center' },
			{ data : 'cdHldVel3', className : 'text-center' },
			{ data : 'stThermostat', className : 'text-center' },
			{ data : 'cdThermostat', className : 'text-center' },
			{ data : 'stHydraulicOil', className : 'text-center' },
			{ data : 'cdHydraulicOil', className : 'text-center' },
			{ data : 'stCoolwaterIn', className : 'text-center' },
			{ data : 'cdCoolwaterIn', className : 'text-center' },
			{ data : 'stCoolwaterOut', className : 'text-center' },
			{ data : 'cdCoolwaterOut', className : 'text-center' },
			{ data : 'stMoldFixed', className : 'text-center' },
			{ data : 'cdMoldFixed', className : 'text-center' },
			{ data : 'stMoldMoving', className : 'text-center' },
			{ data : 'cdMoldMoving', className : 'text-center' },
			{ data : 'inFixTemp1', className : 'text-center' },
			{ data : 'inFixTemp2', className : 'text-center' },
			{ data : 'inFixTemp3', className : 'text-center' },
			{ data : 'inMoveTemp1', className : 'text-center' },
			{ data : 'inMoveTemp2', className : 'text-center' },
			{ data : 'inMoveTemp3', className : 'text-center' },
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		orderFixed : [[1, 'asc'],[2, 'desc']],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">생산지시일자</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
	    html1 += '	<label class="input-label-sm mr-2">제품</label>';
	    html1 += '	<div class="form-group input-sub m-0">';
	    html1 += '	<input type="hidden" id="itemSeqFind">';
	    html1 += '	<input type="text" class="form-control" id="itemCdFind" style="width:130px;" disabled>';
	    html1 += '	<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
	    html1 += '	<span class="oi oi-magnifying-glass"></span>';
	   	html1 += '	</button>';
	   	html1 += '	</div>';
	   	html1 += '<button type="button" id="itemCdDelete" class="btn form-control" style="width: 40px;" onclick="$(\'#itemCdFind\').val(\'\'); $(\'#itemSeqFind\').val(\'\');">';
	   	html1 += '<i class="mdi mdi-close"></i>';
	   	html1 += '</button>';

	   	
	    html1 += '<label class="input-label-sm mr-2">설비</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<input type="hidden" id="batchEquipCd" name="batchEquipCd">';
		html1 += '<input type="text" class="form-control float-left" id="batchEquipNm" name="batchEquipNm" value="" style="max-width: 150px;" disabled>';
		html1 += '<button type="button" class="btn btn-primary input-sub-search float-left" onclick="selectBatchEquip();">';
		html1 += '<span class="oi oi-magnifying-glass"></span>';
		html1 += '</button>';
		html1 += '</div>';
		html1 += '<button type="button" id="equipCdDelete" class="btn form-control" style="width: 40px;" onclick="$(\'#batchEquipCd\').val(\'\'); $(\'#batchEquipNm\').val(\'\');">';
	   	html1 += '<i class="mdi mdi-close"></i>';
	   	html1 += '</button>';
	    html1 += '	<button type="button"  class="btn btn-primary mr-2" id="btnSearch">조회</button>';
	    html1 += '</div>';
	    
	$('#workStatusTable_length').html(html1);
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	// 시작일 변경
	$('#startDate').on('change',function() {
		startDateVal = $(this).val();
		//endDateVal = moment($(this).val()).add('1','M').format('YYYY-MM-DD')
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change',function() {
		endDateVal = $(this).val();
		//startDateVal = moment($(this).val()).subtract('1','M').format('YYYY-MM-DD')
		$('#startDate').val(startDateVal);
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		itemListVal = $('#itemSeqFind').val();
		equipListVal = $('#batchEquipCd').val();
		workStatusTable.ajax.reload(function() {});
	})
	
	//품번 팝업 시작
	let itemCdPopUpTable;
	function itemCdModalShow() {
		if (itemCdPopUpTable != null && itemCdPopUpTable != 'undefined') {
			itemCdPopUpTable.destroy();
		}
		itemCdPopUpTable = $('#itemCdPopUpTable').DataTable({
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
			pageLength : 15,
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return "001"},
					'itemGubunList' : function(){return ['001','003']}
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
			$('#itemCdFind').val(data.itemCd);
			$('#itemSeqFind').val(data.itemSeq);
			$('#itemCdPopUpModal').modal('hide');
		});
		
		$('#itemCdPopUpModal').modal('show');
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}


	//작업지시 등록 모달 - 설비명 조회
	let equipPopUpTable2;
	function selectBatchEquip() {
		if ( equipPopUpTable2 == null || equipPopUpTable2 == 'undefined' ) {
			equipPopUpTable2 = $('#equipPopUpTable2').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : true,
				info : false,
				ordering : false,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' 	: function(){ return "001"; }, //설비(001)
						'prcNm' 		: function(){ return "002"; }, //사출(002)
					},
				},
				columns : [
					{//설비코드
						data : 'equipNo'
					},
					{//설비명
						data : 'equipNm'
					},
					{//공정명
						data : 'prcRealNm'
					},
					{//규격
						data : 'equipType'
					},
					{//제작일자
						data : 'mfcDate',
						render : function(data, type, row) {
							if ( data != null && data != '' ) {
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
						}
					},
					{//제조사
						data : 'mfcCorpCd'
					}
				],
				columnDefs: [
					{ "targets": "_all" , "className" : "text-center" },
		        ],
				order : [ [ 0, 'asc' ], ],
				buttons : [ {
					extend : 'copy',
					title : '설비정보관리',
				}, {
					extend : 'excel',
					title : '설비정보관리',
				}, {
					extend : 'print',
					title : '설비정보관리',
				}, ],
			});
		} else {
			$('#equipPopUpTable2').DataTable().ajax.reload();
		}
		
		$('#equipPopUpModal2').modal('show');

		$(document).on('click', '#equipPopUpTable2 tbody tr', function() {
			let data = equipPopUpTable2.row(this).data();

			$('#batchEquipCd').val(data.equipCd);
			$('#batchEquipNm').val(data.equipNm);
			$('#equipPopUpModal2').modal('hide');
		});
		
	}
	
	
</script>
</body>
</html>