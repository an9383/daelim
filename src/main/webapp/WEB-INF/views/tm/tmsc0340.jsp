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
				<li class="breadcrumb-item"><a href="#">외주관리</a></li>
				<li class="breadcrumb-item active">외주재고현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row">
			
			<div class="m-0 mr-2" style="width: 9%;background: white;min-height: 780px;position: relative;text-align: center;">
				<table id="departmentTable" class="table table-bordered m-0">
					<thead class="thead-light">
						<tr>
							<th rowspan="1" colspan="1">
								<label class="input-label-lg m-0 mt-1" style="font-size: 15.3px;">외주사</label>
							</th>
						</tr>
						<tr><th class="p-0"><input class="form-control m-0" type="text" id="dtlTextSearch" placeholder="통합검색"></th></tr>
						<tr id="allDepartMent"><td>전체</td></tr>
					</thead>
				</table>
			</div>
			<div class="m-0 p-2 mr-2" id="" style="width: 55%;background: white;min-height: 780px;position: relative;text-align:right;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					
					<div class="row">
					    <label class="input-label-sm">일자</label>
					    <div class="form-group input-sub mr-1 row">
						    <input class="form-control" style="width:97px;" type="text" id="startDate" name="startDate" disabled/>
						    <button onclick="fnPopUpCalendar(startDate,startDate,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="startDateCalendar" type="button">
						   	 <span class="oi oi-calendar"></span>
						    </button> 
					    </div>
					    &nbsp;~ &nbsp;
					    <div class="form-group input-sub mr-1 row">
						    <input class="form-control" style="width:97px;" type="text" id="endDate" name="endDate" disabled/>
						    <button onclick="fnPopUpCalendar(endDate,endDate,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="endDateCalendar" type="button">
						   	 <span class="oi oi-calendar"></span>
						    </button> 
					    </div> 
					    <button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>
					    <button type="button" class="btn btn-primary mr-1" id="btnAllList">전체조회</button>
					    <button type="button" class="btn btn-success mr-1" id="btnSortN">기본보기</button>
					    <button type="button" class="btn btn-success mr-1" id="btnSortY">그룹보기</button>
						<button type="button" class="btn btn-info" onclick="excelFileExport();">엑셀 다운로드</button>
				    </div>
					
					<div class="table-responsive" id="table1">
						<table id="outInventoryGroupTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="11%">
								<col width="10%">
								<col width="21%">
								<col width="15%">
								<col width="21%">
								<col width="7%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">외주처</th>
									<th class="text-center">차종</th>
									<th class="text-center">반제품</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">출고 수량</th>
									<th class="text-center">입고 수량</th>
									<th class="text-center">재고 수량</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="table-responsive d-none" id="table2">
						<table id="outInventoryTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="11%">
								<col width="10%">
								<col width="21%">
								<col width="15%">
								<col width="21%">
								<col width="7%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">외주처</th>
									<th class="text-center">차종</th>
									<th class="text-center">반제품</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">출고 수량</th>
									<th class="text-center">입고 수량</th>
									<th class="text-center">재고 수량</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			
			<div class="m-0 p-2" id="dtlTb" style="width: 35%;background: white;min-height: 780px;position: relative;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="outInventoryDtlTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="15%">
								<col width="23%">
								<col width="12%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">입고일자</th>
									<th class="text-center">바코드번호</th>
									<th class="text-center">재고 수량</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr>
									<th colspan='4'>합계</th>
									<th class="totalTmQty"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="sheetDiv"></div>
<style>
.tr_highlight_row tr:hover {
	background-color: #0275d8 !important;
	color : white !important;
}
.excel-text-format {
    mso-number-format:"\@";
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "tmsc0340";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","외주재고현황"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";

	var startDateVal = "";
	var endDateVal = "";
	
	var dealCorpCdVal = '';
	var locationCdVal = '';
	var locationNoVal = '';
	var itemSeqVal = '';
	let sideView = '';


    //외주재고현황 테이블
	let outInventoryGroupTable = $('#outInventoryGroupTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5 text-left'i><'col-sm-12 col-md-7'B>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '75.3vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="io/outInventoryList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){ return startDateVal.replace(/-/g,''); },
				'endDate' 	: function(){ return endDateVal.replace(/-/g,''); },
				'dealCorpCd' 	: function(){ return dealCorpCdVal; },
				'sideView'  : function(){ return sideView}
			},
		},
		columns : [
			{//외주처
				data: 'dealCorpNm',
				"className" : "text-center",name : 'rowspan'
			},
			{//차종
				data: 'upperItemModel',
				"className" : "text-center",name : 'rowspan'
			},
			{//품번
				data: 'upperItemNm',
				"className" : "text-center",name : 'rowspan'
			},
			{//품번
				data: 'itemCd',
				"className" : "text-center",name : 'rowspan'
			},
			{//품명
				data: 'itemNm',
				"className" : "text-center",name : 'rowspan'
			},
			{//출고수량
				data: 'outQty',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						if(Math.round(data)==0){
							return '<span style="text-align:center;">-</span>';
						}else{
							return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
						}
					} else {
						return '';
					}
				},name : 'rowspan'
			},
			{//입고수량
				data: 'inQty',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						if(Math.round(data)==0){
							return '<span style="text-align:center;">-</span>';
						}else{
							return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
						}
					} else {
						return '';
					}
				},
			},
			{//재고수량
				data: 'tmQty',
				render: function(data, type, row, meta) {
					if(Math.round(data)==0){
						return '<span style="text-align:center;">-</span>';
					}else{
						return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
					}
				},name : 'rowspan'
			},
		],
		rowsGroup : [ 'rowspan:name', [0,1,2,3,4,5,7] ],
		columnDefs : [],
		buttons : [
			'copy', 'excel', 'print'
		],
	});

	//외주재고현황 테이블
	let outInventoryTable = $('#outInventoryTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5 text-left'i><'col-sm-12 col-md-7'B>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="io/outInventoryList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){ return startDateVal.replace(/-/g,''); },
				'endDate' 	: function(){ return endDateVal.replace(/-/g,''); },
				'dealCorpCd' 	: function(){ return dealCorpCdVal; },
				'sideView'  : function(){ return sideView}
			},
		},
		columns : [
			{//외주처
				data: 'dealCorpNm',
				"className" : "text-center"
			},
			{//차종
				data: 'upperItemModel',
				"className" : "text-center"
			},
			{//품번
				data: 'upperItemNm',
				"className" : "text-center"
			},
			{//품번
				data: 'itemCd',
				"className" : "text-center"
			},
			{//품명
				data: 'itemNm',
				"className" : "text-center"
			},
			{//출고수량
				data: 'outQty',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						if(Math.round(data)==0){
							return '<span style="text-align:center;">-</span>';
						}else{
							return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
						}
					} else {
						return '';
					}
				}
			},
			{//입고수량
				data: 'inQty',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						if(Math.round(data)==0){
							return '<span style="text-align:center;">-</span>';
						}else{
							return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
						}
					} else {
						return '';
					}
				},
			},
			{//재고수량
				data: 'tmQty',
				render: function(data, type, row, meta) {
					if(Math.round(data)==0){
						return '<span style="text-align:center;">-</span>';
					}else{
						return '<span style="text-align:right;">'+rmDecimal(data)+'</span>';
					}
				}
			},
		],
		columnDefs : [],
		buttons : [
			'copy', 'excel', 'print'
		],
	    order: [
	       
	    ],
	});
    
	// 테이블 행 선택
	$('#outInventoryTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#outInventoryTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		startDateVal =  $('#startDate').val();
		endDateVal =  $('#endDate').val();
		locationCdVal = outInventoryTable.row(this).data().locCd;
		locationNoVal = outInventoryTable.row(this).data().locNo;
		itemSeqVal = outInventoryTable.row(this).data().itemSeq;
		$('#outInventoryDtlTable').DataTable().ajax.reload( function () {});  
	});

	// 테이블 행 선택
	$('#outInventoryGroupTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#outInventoryGroupTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		startDateVal =  $('#startDate').val();
		endDateVal =  $('#endDate').val();
		locationCdVal = outInventoryGroupTable.row(this).data().locCd;
		locationNoVal = outInventoryGroupTable.row(this).data().locNo;
		itemSeqVal = outInventoryGroupTable.row(this).data().itemSeq;
		$('#outInventoryDtlTable').DataTable().ajax.reload( function () {});  
	});
    
	$('#startDate').val(serverDateFrom);
	$('#endDate').val(serverDateTo);

	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		startDateVal =  $('#startDate').val();
		endDateVal =  $('#endDate').val();
		$('#outInventoryTable').DataTable().ajax.reload( function () {});
		$('#outInventoryGroupTable').DataTable().ajax.reload( function () {});
		$('#departmentTable').DataTable().ajax.reload(function(){});
		outInventoryDtlTable.clear().draw();
    });
	
	//전체조회 버튼 클릭시
	$('#btnAllList').on('click',function(){
		startDateVal = "";
		endDateVal = "";
		$('#outInventoryTable').DataTable().ajax.reload( function () {});  
		$('#outInventoryGroupTable').DataTable().ajax.reload( function () {});
		$('#departmentTable').DataTable().ajax.reload(function(){});
		outInventoryDtlTable.clear().draw();
	});

	//기본보기
	$('#btnSortN').on('click',function(){
		console.log('GroupView Selected Start')
		if($('#table2').is('.d-none')){
			$('#table1').addClass('d-none');
			setTimeout(function(){
				$('#table2').removeClass('d-none');
				outInventoryTable.draw();
			},150)
		}
		
		console.log('GroupView Selected End')
	})
	
	//그룹보기
	$('#btnSortY').on('click',function(){
		console.log('GroupView Selected Start')
		if($('#table1').is('.d-none')){
			$('#table2').addClass('d-none');
			setTimeout(function(){
				$('#table1').removeClass('d-none');
				outInventoryGroupTable.draw();
			},150)
		}
		console.log('GroupView Selected End')
	})


	//외주재고현황 테이블
	let outInventoryDtlTable = $('#outInventoryDtlTable').DataTable({
		dom : "<'row card'<'float-right'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '75vh',
		pageLength : -1,
		//ordering: false,
		ajax : {
			url : '<c:url value="io/outInventoryDtlList"/>',
			type : 'GET',
			data : {
				'endDate' 	: function(){ return endDateVal.replace(/-/g,''); },
				'locationCd' 	: function(){ return locationCdVal },
				'locationNo' 	: function(){ return locationNoVal },
				'itemSeq' 		: function(){ return itemSeqVal; },
			},
		},
		columns : [
			{//품번
				data: 'itemCd',
				"className" : "text-center"
			},
			{//품명
				data: 'itemNm',
				"className" : "text-center"
			},
			{//입고일자
				data: 'inDate',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
					}
				},
				"className": "text-center"
			},
			{//입고수량
				data: 'barcodeNo',
				"className": "text-center"
			},
			{//재고수량
				data: 'tmQty',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				"className": "text-right"
			},
		],
		columnDefs : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			$('#outInventoryDtlTable').find('tfoot').remove();
			
			let totalTmQty = $('#outInventoryDtlTable').DataTable().column(4,{ page: 'current'} ).data().sum(); //주문수량
	
			$('.totalTmQty').text(addCommas(totalTmQty));
			
		},
		buttons : [
			'copy', 'excel', 'print'
		],
	    order: [
	    ],
	});
	
	 //외주사 조회
    let departmentTable = $('#departmentTable').DataTable({
    	dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
			+ "<'row tb_height'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12'l>>"
			+ "<'row'<'col-sm-12 text-center'i>>"
			+ "<'row d-none'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		scrollCollapse : true,
        pageLength : 20,
        scrollY: '63vh',
        ajax : {
			url : '<c:url value="/io/outscDealList"/>',
			type : 'GET',
			data : {
				'startDate'	: function(){ return startDateVal.replace(/-/g,''); },
	            'endDate'	: function(){ return endDateVal.replace(/-/g,''); },
			},
		},
        columns: [
           	{//외주사
           		data: 'dealCorpNm'
           	},
        ],        
        drawCallback: function() {
		    $('#departmentTable_filter').addClass('d-none');
		    $('.tb_height').css('height', '75vh');
		},
        order: [
         	[ 0, 'asc' ]
        ],       
        buttons: [],
    });

    let arrowHtml = '<div style="text-align: center;">';
    arrowHtml += '<button type="button" class="page-link float-left p-1" id="btnPrev" onclick="$(\'#departmentTable_previous\').trigger(\'click\');" style="font-size: 16px;color: darkgray;">';
    arrowHtml += '이전';
    arrowHtml += '</button>';
    arrowHtml += '<button type="button" class="page-link float-right p-1" id="btnNext" onclick="$(\'#departmentTable_next\').trigger(\'click\');" style="font-size: 16px;color: darkgray;">';
    arrowHtml += '다음';
    arrowHtml += '</button>';
    arrowHtml += '</div>';
	
	$('#departmentTable_length').html(arrowHtml);
    
    //외주사 테이블 행 클릭시
    $('#departmentTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
 			sideView = 'N';
		} else {
			$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			sideView = 'Y';
		}
		
		startDateVal =  $('#startDate').val();
		endDateVal =  $('#endDate').val();
		dealCorpCdVal = departmentTable.row(this).data().dealCorpCd;
		$('#outInventoryTable').DataTable().ajax.reload( function () {});  
		$('#outInventoryGroupTable').DataTable().ajax.reload( function () {});
		outInventoryDtlTable.clear().draw();
	});

    //전체 선택시
	$('#allDepartMent').on('click', function(){
		$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
		startDateVal =  $('#startDate').val();
		endDateVal =  $('#endDate').val();
		dealCorpCdVal = '';
		$('#outInventoryTable').DataTable().ajax.reload( function () {});  
		$('#outInventoryGroupTable').DataTable().ajax.reload( function () {});
		outInventoryDtlTable.clear().draw();
	})
	
	//통합검색
	$('#dtlTextSearch').on('keyup',function() {
		$('#departmentTable_filter').find('input').val($(this).val());
		$('#departmentTable_filter').find('input').trigger('keyup');
	});


	function excelFileExport() {
		alert('기능 구현중입니다.');
	}
    
	
	//sheet 추가 **********************************************************************************************
	
/* 	let sheetHtml = '';
	sheetHtml += '<div class="main-content">';
	//TABLE
	<c:forEach var="corp" items="${corpList}" varStatus="status">
		sheetHtml += '<table id="sheetTb_${status.index}" class="table table-sorting table-hover table-bordered table-dark-header datatable">';
		sheetHtml += '<thead></thead>';
		sheetHtml += '<tbody class="text-center">';
		sheetHtml += '<tr style="background-color:#b2beb5;">';
		sheetHtml += '<th rowspan="2" class="text-center"><br>구분<br></th>';
		sheetHtml += '<th colspan="${corp.itemCount}" class="text-center" style="text-align:center;">대림오토 ->${corp.dealCorpNm} 자재입고</th>';
		sheetHtml += '<th colspan="2" class="text-center">출고 현황</th>';
		sheetHtml += '<th colspan="${corp.itemCount}" class="text-center">${corp.dealCorpNm} 재고 현황</th>';
		sheetHtml += '</tr>';
		//ITEM LIST START
		sheetHtml += '<tr style="background-color:#b2beb5;">';
		<c:forEach var="item1" items="${itemList}" varStatus="status">
			<c:if test="${item1.dealCorpCd eq corp.dealCorpCd}">
				sheetHtml += '<th colspan="${item1.itemCount}" class="text-center">${item1.itemNm}</th>';
			</c:if>
		</c:forEach>
		sheetHtml += '<th colspan="2" class="text-center">${corp.dealCorpNm} -> 대림오토</th>';
		<c:forEach var="item2" items="${itemList}" varStatus="status">
			<c:if test="${item2.dealCorpCd eq corp.dealCorpCd}">
				sheetHtml += '<th colspan="${item2.itemCount}" class="text-center">${item2.itemNm}</th>';
			</c:if>
		</c:forEach>
		sheetHtml += '</tr>';
		//ITEM LIST END
		//PART LIST START
		sheetHtml += '<tr style="background-color:#b2beb5;">';
		sheetHtml += '<td></td>';

		<c:forEach var="part" items="${partList}" varStatus="status">
			<c:if test="${part.dealCorpCd eq corp.dealCorpCd}">
				sheetHtml += '<td class="text-center">${part.itemNm}</td>';
			</c:if>
		</c:forEach>
		sheetHtml += '<td colspan="2" class="text-center"></td>';
		<c:forEach var="part" items="${partList}" varStatus="status">
			<c:if test="${part.dealCorpCd eq corp.dealCorpCd}">
				sheetHtml += '<td class="text-center">${part.itemNm}</td>';
			</c:if>
		</c:forEach>
		sheetHtml += '</tr>';
		//PART LIST END
		//일별 수량 START
		//for문
		//let dateLength = moment($('#endDate').val().replace(/-/g,'')).diff($('#startDate').val().replace(/-/g,''), 'day')+1;
		//console.log("dateLength:"+dateLength)
		
		<c:forEach items="${dayList}" var="item">
			var weekend = "${item.weekend}";
			switch(weekend) {
				case '0'	:	weekDay = '(일)';	color = '#ff0000'; break;
				case '1'	:	weekDay = '(월)';	color = '#000000'; break;
				case '2'	:	weekDay = '(화)';	color = '#000000'; break;
				case '3'	:	weekDay = '(수)';	color = '#000000'; break;
				case '4'	:	weekDay = '(목)';	color = '#000000'; break;
				case '5'	:	weekDay = '(금)';	color = '#000000'; break;
				case '6'	:	weekDay = '(토)';	color = '#0000ff'; break;
				default		:	weekDay = '?';		color = '#000000'; break;
			}
			sheetHtml += '<tr>';
			console.log(moment("${item.whsDate}").format('MM/DD'));
			var whsDate = moment("${item.whsDate}").format('MM/DD')
			sheetHtml += '<td class="excel-text-format" style="color : '+color+';">'+whsDate+'</td>';
			sheetHtml += '</tr>';
		</c:forEach>
			
		
		//일별 수량 END
		sheetHtml += '<tr></tr>';
		sheetHtml += '</tbody>';
		
		sheetHtml += '</table>';
	</c:forEach>
	<!-- END TABLE -->
	sheetHtml += '<div class="row">';
	sheetHtml += '</div>';
	sheetHtml += '</div>';

	$('#sheetDiv').html(sheetHtml);
	
	
	function excelFileExport() {
	    // step 1. workbook 생성
	    let workbook = XLSX.utils.book_new();

	    // 셀 서식
	    const sheetOptions = {cellStyles:true};
	
	    // step 2. 시트 만들기
	    //let newWorksheet = excelHandler.getWorksheet;
	    
		 // step 3. workbook에 새로만든 워크시트에 이름을 주고 붙인다.
		 <c:forEach var="corp" items="${corpList}" varStatus="status">
		 	var htmlTable = document.getElementById('sheetTb_${status.index}');
		 	var sheet = XLSX.utils.table_to_sheet(htmlTable,sheetOptions);

		 	XLSX.utils.book_append_sheet(workbook, sheet, '${corp.dealCorpNm}');
		 </c:forEach>

	
	    // step 4. 엑셀 파일 만들기
	    let workbookout = XLSX.write(workbook, {bookType:'xlsx',  type: 'binary'});
	
	    // step 5. 엑셀 파일 내보내기
	    saveAs(new Blob([s2ab(workbookout)],{type:"application/octet-stream"}), excelHandler.getExcelFileName());
	
	}

	const excelHandler = {
	    getExcelFileName : function(){
	        return '외주재고현황_'+moment().format('YYYY-MM-DD')+'.xlsx';
	    },
	    
	    getSheetName : function(){
	        return 'test-1';
	    },
	    getExcelData : function(){
	        return document.getElementById('testTbl');
	    },
	 
	    getWorksheet : function(){
	        return XLSX.utils.table_to_sheet(this.getExcelData());
	    }
	}

	function s2ab(s) {
	    let buf = new ArrayBuffer(s.length); //convert s to arrayBuffer
	    let view = new Uint8Array(buf);  //create uint8array as viewer
	    for (let i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF; //convert to octet
	    return buf;
	} */

	
</script>

</body>
</html>
