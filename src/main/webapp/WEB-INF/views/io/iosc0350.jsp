<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>
<html>
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">창고이동현황</li>
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
						 <table id="barcodeChangeTable" class="table table-bordered tr_highlight_row">
		                    <thead class="thead-light">
			                    <tr>
			                    	<th class="text-center">No.</th>
			                        <th class="text-center">구분</th>
			                        <th class="text-center">차종</th>
			                        <th class="text-center">사출품번</th>
			                        <th class="text-center">사출품명</th>
			                        <th class="text-center">BarcodeNo</th>
			                        <th class="text-center">일자</th>
			                        <th class="text-center">수량</th>
			                    </tr>
		                    </thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- / #main  -->
	</div>
</div>
<!-- /.page-wrapper -->
<%@include file="../layout/bottom.jsp" %>

<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>

<script>
	const currentHref = "iosc0350";
	const currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title", "창고이동현황");

	$("#left-width-btn").click(function() {
		$("#left-list").animate({
			width : "52%"
		}, 200);
		$("#arrow-left").animate({
			display : "none"
		}, 200);
		setTimeout(function() {
			$('#barcodeChangeTable').DataTable().ajax.reload();
		}, 400);
		state = !state;
	});

	$("#left-expand").click(function() {
		setTimeout(function() {
			$('#barcodeChangeTable').DataTable().ajax.reload();
		}, 400);
	});
	
	const serverDate = '${serverDate}';
	const serverDateFrom = "${serverDateFrom}";
	const serverDateTo = "${serverDateTo}";
	
	let btnView;
	let changeDateFromVal = serverDateFrom;
	let changeDateToVal = serverDateTo;
	let tableIdx = null;
	let workOrdNoVal = null;
	let popUpCheck = '';
	let itemGubunVal = '004';
	let locCdVal = '017';
	let locCdCheck = '';
	
	//공통코드 처리 시작
	let outGubunArray = new Array();
	<c:forEach items="${outGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	outGubunArray.push(json);
	</c:forEach>
	
	let itemGubunArray = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunArray.push(json);
	</c:forEach>
	
	selectBoxAppend(outGubunArray, "outGubun", "", "");
	//공통코드 처리 끝
	
	//창고이동현황 목록조회
 	let barcodeChangeTable = $('#barcodeChangeTable').DataTable({
 		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="tm/barcodeUsePlaceChangeHistAdmList2"/>',
			type : 'GET',
			data : {
				'startDate'	: function(){ return changeDateFromVal.replace(/-/g,''); },
				'endDate'	: function(){ return changeDateToVal.replace(/-/g,''); },
			},
		},
		columns : [
			{//No.
				render : function ( data, type, row, meta ) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{//구분
				data : 'itemGubunNm',
				'className' : 'text-center'
			},
			{//차종
				data : 'itemModelNm',
				'className' : 'text-center'
			},
			{//품번
				data : 'itemCd',
				'className' : 'text-center'
			},
			{//품명
				data : 'itemNm',
				'className' : 'text-center'
			},
			{//BarcodeNo
				data : 'barcodeNo',
				'className' : 'text-center'
			},
			{//일자
				data : 'changeDate',
				render : function ( data, type, row, meta ) {
					return moment(data).format('YYYY-MM-DD');
				},
				'className' : 'text-center'
			},
			{//수량
				data : 'changeQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				},
				'className' : 'text-right'
			},
 		],
		order : [
		],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs: [
        	
        ],
        drawCallback: function() {
		    
		}
	});
	
	//메인 테이블 설정
 	let html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label>'; 
    html1 += '<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="changeDateFrom" value="'+serverDateFrom+'"/>';
    html1 += '</div>';
    html1 += '&nbsp; ~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="changeDateTo" value="'+serverDateTo+'"/>';
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnAllList">전체조회</button>'
   /*  html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>' */
    html1 += '</div>';
     
 	$('#barcodeChangeTable_length').html(html1);
 	selectBoxAppend(itemGubunArray, "itemGubunBox", "004", "");
 	
 	// 조회버튼 클릭시
 	$('#btnRetv').on('click', function() {
 		changeDateFromVal = $('#changeDateFrom').val();
     	changeDateToVal = $('#changeDateTo').val();
     	itemGubunVal = $('#itemGubunBox').val();
 		$('#barcodeChangeTable').DataTable().ajax.reload(function(){});
     });	

 	// 전체조회 클릭시
 	$('#btnAllList').on('click', function() {
 		changeDateFromVal = "";
 		changeDateToVal = "";
 		itemGubunVal = "";
 		$('#barcodeChangeTable').DataTable().ajax.reload(function(){});
    });

	
</script>

</body>
</html>
