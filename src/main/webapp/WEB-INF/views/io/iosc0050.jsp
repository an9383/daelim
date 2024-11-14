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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">입고현황(사출)</li>
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
						<table id="inOutWhsAdmTable" class="table table-bordered tr_highlight_row" >
							<%-- <colgroup>
								<col width="3%">
								<col width="5%">
								<col width="8%">
								<col width="8%">
								<col width="4%">
								<col width="5%">
								<col width="4%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="6%">
								<col width="6%">
								<col width="5%">
								<col width="6%">
								<col width="6%">
								<col width="9%">
								<col width="4%">
								<col width="6%">
							</colgroup> --%>
							<thead class="thead-light">
								<tr>
									<th class="text-center">공급사</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">단위</th>
									<th class="text-center">입고일</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">수입검사일</th>
									<th class="text-center">합격수량</th>
									<th class="text-center">불량수량</th>
									<th class="text-center">합불판정</th>
									<th class="text-center">바코드</th>
									<th class="text-center">저장위치</th>
								</tr>
							</thead>
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
<!-- /.page-wrapper -->
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

	let currentHref = "iosc0050";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","입고현황(사출)");
	
	const serverDateFrom = "${serverDateFrom}";
	const serverDateTo = "${serverDateTo}";
	
	let dateFromVal = serverDateFrom;
	let dateToVal = serverDateTo;
	let searchOptionVal = '001';
	let approvalYnVal = "";
	let inWhsYnVal = "";

	//메인 테이블
	let inOutWhsAdmTable = $('#inOutWhsAdmTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
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
		scrollY : "70vh",
		ajax : {
			url : '<c:url value="io/inOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'startDate' 	: function(){ return dateFromVal; },
				'endDate' 		: function(){ return dateToVal; },
				'mainGubun' 	: function(){ return "001"; }, //사출
				'searchOption'  : function(){ return searchOptionVal; },
				'approvalYn'  	: function(){ return approvalYnVal; },
				'inWhsYn'  		: function(){ return inWhsYnVal; },
			}
		},
		columns : [
			{//공급사
				data : 'itemCusNm'
			},
			{//차종
				data : 'itemModel'
			},				
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단위
				data : 'itemUnit'
			},
			{//입고일
				data : 'inWhsDate', 
				render : function(data, type, row, meta){
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//입고수량
				data : 'inWhsQty',
				render : function(data, type, row, meta){
					if (data!=null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				className : 'text-right'
			},
			{//수입검사일
				data : 'inspectDate', 
				render : function(data, type, row, meta){
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			}, 
			{//합격수량
				data : 'pairCnt',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{//불량수량
				data : 'faultyCnt',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{//합불판정
				data : 'qaEval',
				render : function(data, type, row, meta){
					if(row['approvalYn']=="001"){
						if(data=="001"){
							return "합격";
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}
					}else{
						return '<span>판정중</span>';
					}
				}
			}, 
			{//바코드
				data : 'barcodeNo'
			},
			{//저장위치
				data : 'areaNm',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return data + " / " + row['floorCd'];
					} else {
						return '-';
					}
				}
			}
		],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [ 
		    
		],
	});
   
    let html1 = '<div class="row">';
	html1 += '<select class="custom-select" id="searchOption">';
	html1 += '<option value="003">입고일</option>';
	html1 += '<option value="002">수입검사일</option>';
	html1 += '</select>';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateFrom" name="inWhsDateFrom" value="'+serverDateFrom+'" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateFrom,inWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateTo" name="inWhsDateTo" value="'+serverDateTo+'" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateTo,inWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
	html1 += '<select class="custom-select" id="approvalYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">입고여부</label>'; 
	html1 += '<select class="custom-select" id="inWhsYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">입고</option>';
	html1 += '<option value="002">미입고</option>';
	html1 += '</select>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
	
	$('#inOutWhsAdmTable_length').html(html1);
	
	//조회 버튼 클릭시
	$('#btnRetv').on('click', function() {
		dateFromVal = $('#inWhsDateFrom').val().replace(/-/g,'');
		dateToVal = $('#inWhsDateTo').val().replace(/-/g,'');
		searchOptionVal = $("#searchOption").val();
		approvalYnVal = $('#approvalYnOption').val();
		inWhsYnVal = $('#inWhsYnOption').val();
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){});
    });

	//전체조회 버튼 클릭시
	$('#btnAllList').on('click', function() {
		dateFromVal = "";
		dateToVal = "";
		searchOptionVal = '';
		approvalYnVal = '';
		inWhsYnVal = '';
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){});
    });
	
</script>

</body>
</html>
