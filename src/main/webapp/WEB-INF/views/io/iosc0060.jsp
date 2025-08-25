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
				<li class="breadcrumb-item active">발주대비미입고현황</li>
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
						<table id="inOutWhsAdmTable" class="table table-bordered tr_highlight_row">
							<%-- <colgroup>
								<col width="6%">
								<col width="10%">
								<col width="13%">
								<col width="7%">
								<col width="3%">
								<col width="7%">
								<col width="4%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="5%">
								<col width="7%">
							</colgroup> --%>
							<thead class="thead-light">
								<tr>
									<th>구분</th>
									<th>품목구분</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th>거래처명</th>
									<th>발주번호</th>
									<th>발주구분</th>
									<th>발주일자</th>
									<th>납기일자</th>
									<th>변경납기일자</th>
									<th class="text-center">발주수량</th>
									<th class="text-center">가입고수량</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">미입고수량</th>
									<th>비고</th>
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

	let currentHref = "iosc0060";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title","발주대비미입고현황"); 
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";
	var serverDate =  "${serverDateTo}";	
	var searchOption = '001';
	var receiptGubun = null;

	let inOutWhsAdmTable = $('#inOutWhsAdmTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/purchaseOrderStatusList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return serverDateFrom.replace(/-/g,'');},
				'endDate' : function(){return serverDateTo.replace(/-/g,'');},
				'searchOption' : function() {return searchOption;},
				'receiptGubun' : function() {return receiptGubun;},
				'poStatusOption' : "001"
			}	
		},	
		rowId : '',
		columns : [ 
				{data : 'mainGubunNm'}, 
				{data : 'itemGubunNm'}, 
				{data : 'itemModel'},	
				{data : 'itemCd'},
				{data : 'itemNm'},		
				{data : 'itemUnitNm'},
				{data : 'dealCorpNm'}, 
				{data : 'poNo'}, 	
				{data : 'receiptGubunNm',
					render : function(data, type, row, meta){
						if(data=="긴급"){
							return '<span style="color:orange"><b>'+data+'</b></span>';
						}else if(data=="초도"){
							return '<span style="color:red"><b>'+data+'</b></span>';
						}else{
							return data;
						}
					}
				}, 
				{data : 'poDate',
					render : function(data, type, row, meta){
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{data : 'dlvDate',
					render : function(data, type, row, meta){
						return moment(data).format('YYYY-MM-DD');
					}
				},
				{
					data : 'dlvChangeDate',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '-';
						}
					}		   
				},
				{
					data : 'ordQty',
					'className' : 'text-right'
				},
				{
					data : 'preInWhsQty',
					render : function(data, type, row, meta){
						if(data!=null){
							return addCommas(data);
						}else{
							return 0;
						}
					},
					'className' : 'text-right'
				},
				{
					data : 'inWhsQty',
					render : function(data, type, row, meta){
						if(data!=null){
							return addCommas(data);
						}else{
							return 0;
						}
					},
					'className' : 'text-right'
				},
				{
					data : 'diffCnt',
					render : function(data, type, row, meta){
						var preInWhsQty = row['preInWhsQty']==null || row['preInWhsQty']==""?"0":row['preInWhsQty'];
						var inWhsQty = row['inWhsQty']==null || row['inWhsQty']==""?"0":row['inWhsQty'];
						var diffCnt = parseFloat(preInWhsQty)-parseFloat(inWhsQty);
						if(data>0){
							return '<span style="color: red">'+addCommas(diffCnt)+'</span>';
						}else{
							return addCommas(diffCnt);
						}
					},
					'className' : 'text-right'
				},
				{data : 'poDesc'}
		],
	    order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});
	
	
	var sysdate = "${serverTime}";
   
    var html1 = '<div class="row">';
	html1 += '&nbsp;<select class="custom-select" id="searchOption"></select>';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateFrom" name="inWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateFrom,inWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="inWhsDateTo" name="inWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(inWhsDateTo,inWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">발주구분</label>'; 
	html1 += '<select class="custom-select" id="poStatus">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">입고대기</option>';
	html1 += '<option value="002">입고진행</option>';
	html1 += '<option value="003">입고완료</option>';
	html1 += '</select>';
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;<button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
    
	$('#inOutWhsAdmTable_length').html(html1);
	$('#inWhsDateFrom').val(serverDateFrom);
	$('#inWhsDateTo').val(serverDateTo);

	
	//조회버튼 선택시
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#inWhsDateFrom').val();
		serverDateTo =  $('#inWhsDateTo').val();
		searchOption = $("#searchOption").val();	//일자구분
		receiptGubun = $("#searchOption2").val();	//발주구분
		$('#inOutWhsAdmTable').DataTable().ajax.reload( function () {});
    });	

	//전체조회 선택시
	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		searchOption = $("#searchOption").val();
		receiptGubun = "";	//발주구분
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function () {});
    });


	$('#searchOption').append($("<option value='001' selected>"+ "발주일" +"</option>"));
	$('#searchOption').append($("<option value='002'>"+ "납기일자" +"</option>"));
</script>

</body>
</html>
