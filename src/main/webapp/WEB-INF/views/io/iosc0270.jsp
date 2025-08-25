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
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 품번 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">입고현황(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="row">
					<div class="row" id="inWhsDateDiv">
						<label class="input-label-sm mr-1">입고일자</label>
						<input class="form-control" style="width:97px;" type="date" id="inWhsDateFrom" name="inWhsDateFrom" value="${serverDateFrom}"/>
						&nbsp; ~ &nbsp;
						<input class="form-control" style="width:97px;" type="date" id="inWhsDateTo" name="inWhsDateTo" value="${serverDateTo}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row d-none" id="inWhsMonthDiv">
						<label class="input-label-sm mr-1">입고일자</label>
						<input class="form-control" style="width:97px;" type="month" id="inWhsMonthFrom" name="inWhsMonthFrom" value="${serverMonth}"/>
						&nbsp; ~ &nbsp;
						<input class="form-control" style="width:97px;" type="month" id="inWhsMonthTo" name="inWhsMonthTo" value="${serverMonth}"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<div class="row d-none" id="approvalYnDiv">
						<label class="input-label-sm mr-1">승인여부</label> 
						<select class="custom-select" id="approvalYnOption" style="width:65px;">
							<option value="" selected>전체</option>
							<option value="001">승인</option>
							<option value="002">미승인</option>
						</select>&nbsp;&nbsp;&nbsp;&nbsp;
					</div>
					<label class="input-label-sm mr-1">품번</label>
					<div class="form-group input-sub m-0">
						<input type="text" class="form-control" id="itemCdFind" style="width:130px;" disabled>
						<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">
							<span class="oi oi-magnifying-glass"></span>
						</button>
					</div>
					<button type="button" id="itemCdDelete" class="btn form-control ml-1 mr-1" style="width: 40px;" onclick="$('#itemCdFind').val(''); itemCdVal='';">
						<i class="mdi mdi-close"></i>
					</button>
					
					<label class="input-label-sm mr-1">공급사</label>
					<div class="form-group input-sub m-0">
						<input type="text" class="form-control" id="dealCorpCdFind" style="width:150px;" disabled>
						<button type="button" class="btn btn-primary input-sub-search" id="dealCorpCdBtn" onClick="dealCorpCdModalShow();">
							<span class="oi oi-magnifying-glass"></span>
						</button>
					</div>
					<button type="button" id="dealCorpCdDelete" class="btn form-control ml-1 mr-1" style="width: 40px;" onclick="$('#dealCorpCdFind').val(''); dealCorpCdList=''; ">
						<i class="mdi mdi-close"></i>
					</button>
					
					
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="groupingOption1">
						<label class="form-check-label" for="groupingOption1">소계</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="groupingOption2">
						<label class="form-check-label" for="groupingOption2">합계</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="checkbox" id="groupingOption3">
						<label class="form-check-label" for="groupingOption3">반품</label>
					</div>
					<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;
					<button type="button" class="btn btn-primary d-none" id="btnAllList">전체조회</button>
				</div>
				<div class="card-header card-tab mt-2 mb-2">
					<!-- .nav-tabs tablist -->
					<ul class="nav nav-tabs card-header-tabs">
						<li class="nav-item">
							<a class="nav-link active show" id="tabDateNav" data-toggle="tab" href="#tabDate">일별</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="tabItemNav" data-toggle="tab" href="#tabItem">월별</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" id="tabBarcNav" data-toggle="tab" href="#tabBarc">lot별</a>
						</li>
					</ul>
					<!-- /.nav-tabs -->
				</div>
				<div class="card">
					<div id="myTabContent" class="tab-content">
					
						<div class="tab-pane fade active show" id="tabDate">
							<div class="table-responsive">
								<table id="inOutWhsDateTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>공급사</th>
											<th>입고일자</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">입고수량</th>
											<th class="d-none">단가</th>
											<th class="d-none">공급가액</th>
											<th class="d-none">부가세</th>
											<th class="d-none">합계</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabItem">
							<div class="table-responsive">
								<table id="inOutWhsItemTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>공급사</th>
											<th>입고일자</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th class="text-center">입고수량</th>
											<th class="d-none">단가</th>
											<th class="d-none">공급가액</th>
											<th class="d-none">부가세</th>
											<th class="d-none">합계</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
						<div class="tab-pane fade" id="tabBarc">
							<div class="table-responsive">
								<table id="inOutWhsBarcTable" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>공급사</th>
											<th>입고일자</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>단위</th>
											<th>LOT NO</th>
											<th class="text-center">입고수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->
<!-- 거래처 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="iosc0270Modal" tabindex="-1" role="dialog" aria-labelledby="iosc0270ModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="iosc0270Label">거래처조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="iosc0270Table" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
	                   			<th style="width : 20%">No.</th>
								<th style="width : 20%">거래처</th>
								<th style="width : 15%">거래처코드</th>
								<th style="width : 25%">대표자</th>
								<th style="width : 15%">대표품목</th>
								<th style="width : 25%">사업자번호</th>
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
<!-- 거래처 모달 종료-->
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
	const CURRENT_HREF = "iosc0270";
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');
	
	$('#'+CURRENT_PAGE).closest('.has-child','li').addClass('has-open has-active');
	$('#'+CURRENT_PAGE).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","입고현황(봉제)");
	
	const SERVER_DATE_FROM = "${serverDateFrom}";
	const SERVER_DATE_TO = "${serverDateTo}";
	const SERVER_MONTH_FROM = "${serverMonth}";
	const SERVER_MONTH_TO = "${serverMonth}";
	
	let serverDateFrom = SERVER_DATE_FROM;
	let serverDateTo = SERVER_DATE_TO;
	let serverMonthFrom = SERVER_MONTH_FROM;
	let serverMonthTo = SERVER_MONTH_TO;
	let approvalYnOption = "";
	let tabGubun = "일별";
	let searchVal = '';
	let itemCdVal = '';
	let dealCorpCdVal =	'';
	let dealCorpCdList = [];
	let groupTypeByD = "N";	//소계
	let groupTypeByM = "N";	//합계
	let groupTypeByT = 'N';	//반품
	let dealGubunList='002';

	const dealGubunCode = new Array();
	<c:forEach items="${dealGubunList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	dealGubunCode.push(json);
	</c:forEach>

	let inOutWhsBarcTableTfoot;
	
	//lot별 탭 메인 테이블
	let inOutWhsBarcTable = $('#inOutWhsBarcTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
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
		scrollCollapse: true,
		scrollY : "62vh",
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'inOutWhsGubun'  	: function(){ return 'barc'; },
				'mainGubun'  		: function(){ return '002'; },
				'startDate' 		: function(){ return serverDateFrom.replace(/-/g,''); },
				'endDate' 			: function(){ return serverDateTo.replace(/-/g,''); },
				'approvalYn'  		: function(){ return approvalYnOption; },
				'searchVal'  		: function(){ return searchVal; },
				'itemCd'  			: function(){ return itemCdVal; },
				'dealCorpCd'  		: function(){ return dealCorpCdVal; },
				'dealCorpCdList'  	: function(){ return dealCorpCdList; },
				'groupTypeByD'		: function(){ return groupTypeByD; },
	         	'groupTypeByM'		: function(){ return groupTypeByM; },
	         	'groupTypeByT'		: function(){ return groupTypeByT; },
			}
		},
		columns : [
			{//공급사
				data : 'dealCorpNm',
				render : function(data, type, row, meta){
					if ( data != null && data != "" ) {
						return data == "NONE" && row['groupType'] == "기본" ? '대림오토' : data;
					} else {
						return '';
					}
				}
			},
			{//입고일자
				data : 'inWhsDate',
				render : function(data, type, row, meta){
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'itemModel', }, //차종
			{ data : 'itemCd', }, //품번
			{ data : 'itemNm', }, //품명
			{ data : 'itemUnit', }, //단위
			{ data : 'barcodeNo' }, //바코드No
			{//입고수량
				data : 'inWhsQty', className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null && data != ""){
						if(data>0){
							return '<span>'+rmDecimal(data)+'</span>';
						}else{
							return '<span style="color:red; font-weight: bold;">'+rmDecimal(data)+'</span>';
						}
					}else{
						return '<span></span>';
					}
				}
			},
		],
	    columnDefs : [],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			for(var i = 0; i < data.length; i++) {

				//합계 행
				if(inOutWhsBarcTable.row(i).data().groupType=="합계"){
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsBarcTable tbody tr').eq(i).css('background','#a9c9f0').css('font-weight','bold').css('text-align','left');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(0).text('전체 합계')
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
				
				//소계 행
				if(inOutWhsBarcTable.row(i).data().groupType=="소계"){
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsBarcTable tbody tr').eq(i).css('background','#d9ffe4').css('font-weight','bold');
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(0).text(''+inOutWhsBarcTable.row(i-1).data().itemNm+'  합계')
					$('#inOutWhsBarcTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
			}
			
		},
		buttons: [
	    	'copy', {
                extend: 'excelHtml5',
                title: '입고현황(봉제) - LOT별',
                className : 'btn-secondary',
             	init : function ( api, node, config ) {
 					$(node).addClass('btn-secondary');
 					$(node).text('Excel');
 				},
                 customize : function (xlsx) {
 			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
 			 		let col = $('col', sheet);
		 		
 			 		col.each(function () {
 			 	          $(this).attr('width', 20);
 			 	    });

 			 		let table = $('#inOutWhsBarcTable').DataTable();
 			 		let data = table.rows().data();
 			 		let row, message, bgColor = '';
		 		
 			 	    for(var i=0; i<data.count(); i++){
 			 	    	//소계
 						if(table.row(i).data().groupType=="소계"){
 							row=i+3;
 							message = table.row(i-1).data() != null && table.row(i-1).data() != '' ? table.row(i-1).data().itemNm + ' 합계' : '' + ' 합계';
 							bgColor = '15';
						
 							var mergeCells = $('mergeCells', sheet);
							mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
		                      	attr: {
		                       		ref: ['A'+row+':G'+row]
		                       	}
		                    })); 
 		                //합계    
 						}else if(table.row(i).data().groupType=="합계"){
 							row=i+3;
 							message = '전체 합계';
 							bgColor = '20';
						
 							var mergeCells1 = $('mergeCells', sheet);
							mergeCells1[0].appendChild( _createNode( sheet, 'mergeCell', {
		                      	attr: {
		                       		ref: ['A'+row+':G'+row]
		                       	}
		                    })); 
 						}

 						$('c[r=A'+row+'] t', sheet).text(message);
 		                $('row:eq('+(row-1)+') c', sheet).attr('s',''+bgColor+'');
 					}   

 				}
            }, 'print'   
         ],                        
	});

	let inOutWhsDateTableTfoot;

	let sumSupplyQty=0;
	let sumSurtaxQty=0;
	let sumTotalQty=0;
	let totalSupplyQty=0;
	let totalSurtaxQty=0;
	let totalTotalQty=0;

	
	//일별 탭 메인 테이블
	let inOutWhsDateTable = $('#inOutWhsDateTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>B>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollCollapse: true,
		scrollY : "62vh",
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'inOutWhsGubun'		: function(){ return 'date'; },
				'mainGubun'  		: function(){ return '002'; },
				'startDate' 		: function(){ return serverDateFrom.replace(/-/g,''); },
				'endDate' 			: function(){ return serverDateTo.replace(/-/g,''); },
				'searchVal' 		: function(){ return searchVal; },
				'itemCd'  			: function(){ return itemCdVal; },
				'dealCorpCd'  		: function(){ return dealCorpCdVal; },
				'dealCorpCdList'  	: function(){ return dealCorpCdList; },
				'groupTypeByD'		: function(){ return groupTypeByD; },
	         	'groupTypeByM'		: function(){ return groupTypeByM; },
	         	'groupTypeByT'		: function(){ return groupTypeByT; },
			}
		},
		rowId : '',
		columns : [ 
			{//공급사
				data : 'dealCorpNm',
				render : function(data, type, row, meta){
					if ( data != null && data != "" ) {
						return data=="NONE" && row['groupType']=="기본" ? '대림오토' : data;
					} else {
						return '';
					}
				}
			},
			{//입고일자
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					return data != null && data!="" ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'itemModel' }, //차종
			{ data : 'itemCd' }, //품번
			{ data : 'itemNm' }, //품명
			{ data : 'itemUnit' }, //단위
			{//입고수량
				data : 'inWhsQty', className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null && data != ""){
						if(data>0){
							return '<span>'+rmDecimal(data)+'</span>';
						}else{
							return '<span style="color:red; font-weight: bold;">'+rmDecimal(data)+'</span>';
						}
					}else{
						return '<span></span>';
					}
				}
			},
			{//단가
				data : 'exportCost', className : 'd-none',
				render : function(data, type, row, meta){
					return row['groupType'] == "기본" ? rmDecimal(data!=null?data:"0") : '-';
				}
			},
			{//공급가액
				data : 'supplyQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumSupplyQty += parseFloat(data!=null?data:"0");
						totalSupplyQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumSupplyQty));
						sumSupplyQty=0;
					} else {
						qty = rmDecimal(Math.round(totalSupplyQty));
						totalSupplyQty=0;
					}
					return qty;
				}
			},
			{//부가세
				data : 'surtaxQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumSurtaxQty += parseFloat(data!=null?data:"0");
						totalSurtaxQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumSurtaxQty));
						sumSurtaxQty=0;
					} else {
						qty = rmDecimal(Math.round(totalSurtaxQty));
						totalSurtaxQty=0;
					}
					return qty;
				}
			},
			{//합계
				data : 'totalQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumTotalQty += parseFloat(data!=null?data:"0");
						totalTotalQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumTotalQty));
						sumTotalQty=0;
					} else {
						qty = rmDecimal(Math.round(totalTotalQty));
						totalTotalQty=0;
					}
					return qty;
				}
			},
		],
	    columnDefs : [],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			for(var i = 0; i < data.length; i++) {

				//합계 행
				if(inOutWhsDateTable.row(i).data().groupType=="합계"){
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsDateTable tbody tr').eq(i).css('background','#a9c9f0').css('font-weight','bold').css('text-align','left');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(0).text('전체 합계')
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
				
				//소계 행
				if(inOutWhsDateTable.row(i).data().groupType=="소계"){
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsDateTable tbody tr').eq(i).css('background','#d9ffe4').css('font-weight','bold');
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(0).text(''+inOutWhsDateTable.row(i-1).data().itemNm+'  합계')
					$('#inOutWhsDateTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
			}
			
		},
		buttons: [
	    	'copy', {
                extend: 'excelHtml5',
                title: '입고현황(봉제) - 일별',
                className : 'btn-secondary',
             	init : function ( api, node, config ) {
 					$(node).addClass('btn-secondary');
 					$(node).text('Excel');
 				},
                 customize : function (xlsx) {
 			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
 			 		let col = $('col', sheet);
		 		
 			 		col.each(function () {
 			 	          $(this).attr('width', 20);
 			 	    });

 			 		let table = $('#inOutWhsDateTable').DataTable();
 			 		let data = table.rows().data();
 			 		let row, message, bgColor = '';
		 		
 			 	    for(var i=0; i<data.count(); i++){
 			 	    	//소계
 						if(table.row(i).data().groupType=="소계"){
 							row=i+3;
 							message = table.row(i-1).data() != null && table.row(i-1).data() != '' ? table.row(i-1).data().itemNm + ' 합계' : '' + ' 합계';
 							bgColor = '15';
						
 							var mergeCells = $('mergeCells', sheet);
							mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
		                      	attr: {
		                       		ref: ['A'+row+':F'+row]
		                       	}
		                    })); 
 		                //합계    
 						}else if(table.row(i).data().groupType=="합계"){
 							row=i+3;
 							message = '전체 합계';
 							bgColor = '20';
						
 							var mergeCells1 = $('mergeCells', sheet);
							mergeCells1[0].appendChild( _createNode( sheet, 'mergeCell', {
		                      	attr: {
		                       		ref: ['A'+row+':F'+row]
		                       	}
		                    })); 
 						}

 						$('c[r=A'+row+'] t', sheet).text(message);
 		                $('row:eq('+(row-1)+') c', sheet).attr('s',''+bgColor+'');
 					}   

 				}
            }, 'print'                                
	    ],
	});
	
	let htmlDate = '';
	htmlDate += '<label>검색 : ';
	htmlDate += '<input class="form-control form-control-sm" type="text" id="dateSearch"/>';
	htmlDate += '</lable>';

	
	//일별 검색
	$('#dateSearch').keyup(function() {
		searchVal = encodeURI($('#dateSearch').val());

		if (tabGubun == '일별') {
			$('#inOutWhsDateTable').DataTable().ajax.reload(function(){});
		} else if (tabGubun == '월별') {
			$('#inOutWhsItemTable').DataTable().ajax.reload(function(){});
		} else {
			$('#inOutWhsBarcTable').DataTable().ajax.reload(function(){});
		}
    });

	let inOutWhsItemTableTfoot;
	//월별 탭 메인 테이블
	let inOutWhsItemTable = $('#inOutWhsItemTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>" +
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
		scrollCollapse: true,
		scrollY : "62vh",
		ajax : {
			url : '<c:url value="io/inOutWhsSewingList"/>',
			type : 'GET',
			data : {
				'inOutWhsGubun'  	: function(){ return 'item'; },
				'mainGubun'  		: function(){ return '002'; },
				'startDate' 		: function(){ return serverMonthFrom.replace(/-/g,''); },
				'endDate' 			: function(){ return serverMonthTo.replace(/-/g,''); },
				'searchVal'  		: function(){ return searchVal; },
				'itemCd'  			: function(){ return itemCdVal; },
				'dealCorpCd'  		: function(){ return dealCorpCdVal; },
				'dealCorpCdList'  	: function(){ return dealCorpCdList; },
				'groupTypeByD'		: function(){ return groupTypeByD; },
	         	'groupTypeByM'		: function(){ return groupTypeByM; },
	         	'groupTypeByT'		: function(){ return groupTypeByT; },
			}
		},	
		columns : [ 
			{//공급사
				data : 'dealCorpNm',
				render : function(data, type, row, meta){
					if ( data != null && data != "" ) {
						return data=="NONE" && row['groupType']=="기본" ? '대림오토' : data;
					} else {
						return '';
					}
				}
			},
			{//입고일자
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					return data != null && data != '' ? data.substr(0, 4) + '-' + data.substr(4, 2) : '';
				}
			},
			{ data : 'itemModel' }, //차종
			{ data : 'itemCd' }, //품번
			{ data : 'itemNm' }, //품명
			{ data : 'itemUnit' }, //단위
			{//입고수량
				data : 'inWhsQty', className : 'text-right',
				render : function(data, type, row, meta){
					if(data != null && data != ""){
						if(data>=0){
							return '<span>'+rmDecimal(data)+'</span>';
						}else{
							return '<span style="color:red; font-weight: bold;">'+rmDecimal(data)+'</span>';
						}
					}else{
						return '<span></span>';
					}
				}
			},
			{//단가
				data : 'exportCost', className : 'd-none',
				render : function ( data, type, row, meta ) {
					return row['groupType']=="기본" ? rmDecimal(data!=null?data:"0") : '-';
				}
			},
			{//공급가액
				data : 'supplyQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumSupplyQty += parseFloat(data!=null?data:"0");
						totalSupplyQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumSupplyQty));
						sumSupplyQty=0;
					} else {
						qty = rmDecimal(Math.round(totalSupplyQty));
						totalSupplyQty=0;
					}
					return qty;
				}
			},
			{//부가세
				data : 'surtaxQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumSurtaxQty += parseFloat(data!=null?data:"0");
						totalSurtaxQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumSurtaxQty));
						sumSurtaxQty=0;
					} else {
						qty = rmDecimal(Math.round(totalSurtaxQty));
						totalSurtaxQty=0;
					}
					return qty;
				}
			},
			{//합계
				data : 'totalQty', className : 'd-none',
				render : function ( data, type, row, meta ) {
					let qty=0;
					if ( row['groupType'] == "기본" ) {
						qty = rmDecimal(Math.round(data!=null?data:"0"));
						sumTotalQty += parseFloat(data!=null?data:"0");
						totalTotalQty += parseFloat(data!=null?data:"0");
					} else if ( row['groupType'] == "소계" ) {
						qty = rmDecimal(Math.round(sumTotalQty));
						sumTotalQty=0;
					} else {
						qty = rmDecimal(Math.round(totalTotalQty));
						totalTotalQty=0;
					}
					return qty;
				}
			},
		],
	    columnDefs : [],
		order : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			for(var i = 0; i < data.length; i++) {

				//합계 행
				if(inOutWhsItemTable.row(i).data().groupType=="합계"){
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsItemTable tbody tr').eq(i).css('background','#a9c9f0').css('font-weight','bold').css('text-align','left');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(0).text('전체 합계')
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
				
				//소계 행
				if(inOutWhsItemTable.row(i).data().groupType=="소계"){
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(1).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(2).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(3).addClass('d-none');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(4).addClass('d-none');
					
					$('#inOutWhsItemTable tbody tr').eq(i).css('background','#d9ffe4').css('font-weight','bold');
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(0).text(''+inOutWhsItemTable.row(i-1).data().itemNm+'  합계')
					$('#inOutWhsItemTable tbody tr').eq(i).find('td').eq(0).attr('colspan','5')
				}
			}
			
		},
		buttons: [
	    	'copy', {
               extend: 'excelHtml5',
               title: '입고현황(봉제) - 월별',
               className : 'btn-secondary',
            	init : function ( api, node, config ) {
					$(node).addClass('btn-secondary');
					$(node).text('Excel');
				},
                customize : function (xlsx) {
			 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
			 		let col = $('col', sheet);
	 		
			 		col.each(function () {
			 	          $(this).attr('width', 20);
			 	    });

			 		let table = $('#inOutWhsItemTable').DataTable();
			 		let data = table.rows().data();
			 		let row, message, bgColor = '';
	 		
			 	    for(var i=0; i<data.count(); i++){
			 	    	//소계
						if(table.row(i).data().groupType=="소계"){
							row=i+3;
							message = table.row(i-1).data() != null && table.row(i-1).data() != '' ? table.row(i-1).data().itemNm + ' 합계' : '' + ' 합계';
							bgColor = '15';
					
							var mergeCells = $('mergeCells', sheet);
						mergeCells[0].appendChild( _createNode( sheet, 'mergeCell', {
	                      	attr: {
	                       		ref: ['A'+row+':F'+row]
	                       	}
	                    })); 
		                //합계    
						}else if(table.row(i).data().groupType=="합계"){
							row=i+3;
							message = '전체 합계';
							bgColor = '20';
					
							var mergeCells1 = $('mergeCells', sheet);
						mergeCells1[0].appendChild( _createNode( sheet, 'mergeCell', {
	                      	attr: {
	                       		ref: ['A'+row+':F'+row]
	                       	}
	                    })); 
						}

						$('c[r=A'+row+'] t', sheet).text(message);
		                $('row:eq('+(row-1)+') c', sheet).attr('s',''+bgColor+'');
					}   

				}
           }, 'print'    
        ],       
	});

	//조회 버튼 클릭
	$('#btnRetv').on('click', function() {
		if (tabGubun != '월별') {
			if ($('#inWhsDateFrom').val() == '') {
				toastr.warning("입고일자를 입력해주세요.");
				$('#inWhsDateFrom').focus();
				return false;
			} else if ($('#inWhsDateTo').val() == '') {
				toastr.warning("입고일자를 입력해주세요.");
				$('#inWhsDateTo').focus();
				return false;
			}
		}
		
		approvalYnOption = $('#approvalYnOption').val();
		itemCdVal = $('#itemCdFind').val();

		//소계/합계 옵션
		if($('#groupingOption1').is(':checked')){
			groupTypeByD="Y"
        }else{
        	groupTypeByD="N"
        }

		if($('#groupingOption2').is(':checked')){
			groupTypeByM="Y"
        }else{
        	groupTypeByM="N"
        }

		if($('#groupingOption3').is(':checked')){
			groupTypeByT="Y"
        }else{
        	groupTypeByT="N"
        }
		
		if (tabGubun == 'lot별') {
			serverDateFrom =  $('#inWhsDateFrom').val();
			serverDateTo =  $('#inWhsDateTo').val();

			//합계보기 구분
			if(groupingOption2 == '001'){
				$( inOutWhsBarcTableTfoot ).removeClass('d-none');
			} else {
				$( inOutWhsBarcTableTfoot ).addClass('d-none');
			}

			$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '일별') {
			serverDateFrom =  $('#inWhsDateFrom').val();
			serverDateTo =  $('#inWhsDateTo').val();

			//합계보기 구분
			if(groupingOption2 == '001'){
				$( inOutWhsDateTableTfoot ).removeClass('d-none');
			} else {
				$( inOutWhsDateTableTfoot ).addClass('d-none');
			}

			inOutWhsDateTable .order( [] ).draw();
			
			$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '월별') {
			serverMonthFrom =  $('#inWhsMonthFrom').val();
			serverMonthTo =  $('#inWhsMonthTo').val();

			//합계보기 구분
			if(groupingOption2 == '001'){
				$( inOutWhsItemTableTfoot ).removeClass('d-none');
			} else {
				$( inOutWhsItemTableTfoot ).addClass('d-none');
			}
			
			$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
    });

	//전체조회 버튼 클릭
	$('#btnAllList').on('click', function() {
		serverDateFrom = '';
		serverDateTo =  '';
		serverMonthFrom = '';
		serverMonthTo =  '';
		approvalYnOption = '';
		itemCdVal = '';
		
		if (tabGubun == 'lot별') {
			$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '일별') {
			$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		} else if (tabGubun == '월별') {
			$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		} else {
			console.log('예상치 못한 결과가 발생했습니다.');
		}
		
    });

	//일별 탭 클릭
	$('#tabDateNav').on('click', function() {
		tabGubun = '일별';
		$('#inWhsMonthDiv').addClass('d-none');
		$('#inWhsDateDiv').removeClass('d-none');
		$('#approvalYnDiv').addClass('d-none');
		
		$('#inOutWhsDateTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsDateTable.draw();
			inOutWhsDateTable.draw();
		}, 300);
    });
	
	//월별 탭 클릭
	$('#tabItemNav').on('click', function() {
		tabGubun = '월별';
		$('#inWhsMonthDiv').removeClass('d-none');
		$('#inWhsDateDiv').addClass('d-none');
		$('#approvalYnDiv').addClass('d-none');
		
		$('#inOutWhsItemTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsItemTable.draw();
			inOutWhsItemTable.draw();
		}, 300);
    });
	
	//lot별 탭 클릭
	$('#tabBarcNav').on('click', function() {
		tabGubun = 'lot별';
		$('#inWhsMonthDiv').addClass('d-none');
		$('#inWhsDateDiv').removeClass('d-none');
		$('#approvalYnDiv').removeClass('d-none');
		
		$('#inOutWhsBarcTable').DataTable().ajax.reload(function () {});
		
		setTimeout(function(){
			inOutWhsBarcTable.draw();
			inOutWhsBarcTable.draw();
		}, 300);
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
	let iosc0270Table;
	function dealCorpCdModalShow() {
		if (iosc0270Table != null && iosc0270Table != 'undefined') {
			iosc0270Table.destroy();
		}
		dealGubunList = '002';
		iosc0270Table = $('#iosc0270Table').DataTable({
			dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
			async : false,
			pageLength : -1,
			scrollY : '50vh',
			select: {
	            style: 'multi'
	        },
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealGubun' :  function(){return dealGubunList;},
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ 
				{ render : function(data, type, row, meta) { return meta.row+1; }, className : "text-center" },
				{ data : 'dealCorpNm', className : "text-center" },
				{ data : 'dealCorpCd', className : "text-center" },
				{ data : 'presidentNm', className : "text-center" },
				{ data : 'repreItem', className : "text-center" },
				{ data : 'corpNo', className : "text-center" },
			],
			columnDefs : [],
			order : [],
			buttons : [],
		});

		let html2 = '<div class="row">';
		html2 += '<label class="input-label-sm">거래구분</label>';
		html2 += '<div class="form-group input-sub m-0">';
		html2 += '<select class="custom-select" id="dealGubunOption">';
		html2 += '<option value="002">공급사</option>';
		html2 += '<option value="003">외주사</option>';
		
		html2 += '</select></div>&nbsp;&nbsp;&nbsp;';
		html2 += '<button type="button" class="btn btn-primary ml-3" id="btnDealCorpSelect">선택</button>'
		html2 += '</div>';

		$('#iosc0270Table_length').html(html2);
		
		$('#iosc0270Modal').modal('show');

		//선택 버튼 클릭시
		$('#btnDealCorpSelect').on('click', function() {
			if ( iosc0270Table.rows('.selected').data().length > 0 ) {
				let selectedRows = iosc0270Table.rows('.selected');
				let dealCorpNmVal = selectedRows.data().pluck('dealCorpNm').toArray()[0];
				dealCorpNmVal += selectedRows.data().length > 1 ? ' 외 ' + ( selectedRows.data().length - 1 ) + '개' : '';
				$('#dealCorpCdFind').val(dealCorpNmVal);
				
				dealCorpCdList = selectedRows.data().pluck('dealCorpCd').toArray();
				
				$('#iosc0270Modal').modal('hide');
			} else {
				toastr.warning('항목을 선택해주세요.');
			}
		});
		
		//공급사 팝업 거래구분 조회조건 변경 시
		$('#dealGubunOption').on('change', function() {
			dealGubunList = $("#dealGubunOption option:selected").val();
			$('#iosc0270Table').DataTable().ajax.reload(function(){});
		});

		setTimeout(function(){
			iosc0270Table.draw();
			iosc0270Table.draw();
		}, 300);
		
	}
	
</script>

</body>
</html>
