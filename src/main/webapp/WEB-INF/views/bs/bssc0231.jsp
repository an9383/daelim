<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">매입, 매출 집계</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list" style="overflow-y: hidden;">
				<div class="card">
					<div class="row">
						<input class="form-control float-left mr-2 ml-1" style="width:10rem;" type="month" id="searchMonth">
						
						<a href="#" id="reload">
							<button type="button" class="btn btn-primary float-left" id="btnSearch">조회</button>
						</a> 
						<!-- <button type="button" class="btn btn-primary float-left" id="btnSearch">조회</button> -->
						<label style="margin-left: 45rem;" class="input-label-sm">&#60;단위 : 천 원&#62;</label>
					</div>
					<div class="row" style="margin-bottom: -16px;">
						<div style="float:left;margin-top: 1px;min-width: 12%;">
							<table class="table table-bordered mt-1 ml-2" style="min-width:30%;font-size: 13px;">
								<tr class="thead-light">
									<th class="text-center" style="letter-spacing:1rem;">매 출</th>
								</tr>
							</table>
						</div>
						<div style="float:left;">
							<table class="table table-bordered mt-1" style="min-width:80%;border: 2px solid;margin-left: 39%;font-size: 13px;">
								<colgroup>
									<col width="13%">
									<col width="20%">
									<col width="13%">
									<col width="20%">
									<col width="13%">
									<col width="20%">
								</colgroup>
								<tr class="thead-light">
									<th class="text-center" style="min-width:65px;">사출</th>
									<td class="text-right" style="min-width:130px;" id="outputCost001">0</td>
									<th class="text-center" style="min-width:65px;">봉제</th>
									<td class="text-right" style="min-width:130px;" id="outputCost002">0</td>
									<th class="text-center" style="min-width:65px;">합계</th>
									<td class="text-right" style="min-width:130px;" bgcolor=#FFE5CC id="totalOutputCost">0</td>
								</tr>
							</table>
						</div>
					</div>
					<table id="outWhsListTable" class="table table-bordered">
						<thead style="position: sticky; top: 0;" data-sot-top="2">
							<tr>
								<th class="text-center align-middle" style="min-width:120px;" bgcolor="#FFE5CC">업체명</th>
								<th class="text-center align-middle th2" style="min-width:80px;" bgcolor="#FFE5CC">구분</th>
								<th class="text-center align-middle th3" style="min-width:150px;" bgcolor="#FFE5CC">매출품목</th>
								<th class="text-center align-middle th4" style="min-width:50px;" bgcolor="#FFE5CC">합계</th>
								
								<c:forEach var="item" items="${dayList}" varStatus="status">
									<c:if test="${item.weekend eq '1'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px; color:red;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(일)</th>
									</c:if>
									<c:if test="${item.weekend eq '2'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(월)</th>
									</c:if>
									<c:if test="${item.weekend eq '3'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(화)</th>
									</c:if>
									<c:if test="${item.weekend eq '4'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(수)</th>
									</c:if>
									<c:if test="${item.weekend eq '5'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(목)</th>
									</c:if>
									<c:if test="${item.weekend eq '6'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(금)</th>
									</c:if>
									<c:if test="${item.weekend eq '7'}">
										<th class="text-center" id="outDay_${status.index}" style="min-width:50px; color:red;" bgcolor="#FFE5CC">${fn:substring(item.whsDate,6,8)}일(토)</th>
									</c:if>
								</c:forEach> 
							</tr>
							<tr>
								<th colspan="3" class="text-center align-middle" style="min-width:120px; background:#fffaf4;">합계</th>
								<td class="text-right" id="outTotalQty" style="min-width:50px; font-weight:bold; background:#fffaf4;font-size: 13px;color: blue;" ></td>
								<c:forEach var="item" items="${dayList}" varStatus="status">
									<c:if test="${item.weekend eq '1'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;"></td>
									</c:if>
									<c:if test="${item.weekend eq '2'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;" ></td>
									</c:if>
									<c:if test="${item.weekend eq '3'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;" ></td>
									</c:if>
									<c:if test="${item.weekend eq '4'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;" ></td>
									</c:if>
									<c:if test="${item.weekend eq '5'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;" ></td>
									</c:if>
									<c:if test="${item.weekend eq '6'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;" ></td>
									</c:if>
									<c:if test="${item.weekend eq '7'}">
										<td class="text-right" id="dayTotalOutWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#fffaf4;font-size: 13px;color: blue;"></td>
									</c:if>
								</c:forEach> 
							</tr>
						</thead>
					</table>
				</div>
				<div class="row" style="margin-bottom: -16px;">
					<div style="float:left;margin-top: 1px;min-width: 12%;font-size: 13px;">
						<table class="table table-bordered mt-1 ml-2" style="min-width:30%;">
							<tr class="thead-light">
								<th class="text-center" style="letter-spacing:1rem;">매 입</th>
							</tr>
						</table>
					</div>
					<div style="float:left;">
						<table class="table table-bordered mt-1" style="min-width:80%;border: 2px solid;margin-left: 39%;font-size: 13px;">
							<colgroup>
								<col width="13%">
								<col width="20%">
								<col width="13%">
								<col width="20%">
								<col width="13%">
								<col width="20%">
							</colgroup>
							<tr class="thead-light">
								<th class="text-center" style="min-width:65px;">사출</th>
								<td class="text-right" style="min-width:130px;" id="inputCost001">0</td>
								<th class="text-center" style="min-width:65px;">봉제</th>
								<td class="text-right" style="min-width:130px;" id="inputCost002">0</td>
								<th class="text-center" style="min-width:65px;">합계</th>
								<td class="text-right" style="min-width:130px;" bgcolor=#CCE5FF id="totalInputCost">0</td>
							</tr>
						</table>
					</div>
				</div>
				<table id="inWhsListTable" class="table table-bordered">
					<!-- <thead style="position: sticky; top: 0;left:0;" data-sot-top="2" data-sot-left="3"> -->
					<thead>
						<tr>
							<th class="text-center align-middle" style="min-width:120px;" bgcolor="#CCE5FF">업체명</th>
							<th class="text-center align-middle th2" style="min-width:80px;" bgcolor="#CCE5FF">구분</th>
							<th class="text-center align-middle th3" style="min-width:150px;" bgcolor="#CCE5FF">매입품목</th>
							<th class="text-center align-middle th4" style="min-width:50px;" bgcolor="#CCE5FF">합계</th>
							<c:forEach var="item" items="${dayList}" varStatus="status">
								<c:if test="${item.weekend eq '1'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px; color:red;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(일)</th>
								</c:if>
								<c:if test="${item.weekend eq '2'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(월)</th>
								</c:if>
								<c:if test="${item.weekend eq '3'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(화)</th>
								</c:if>
								<c:if test="${item.weekend eq '4'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(수)</th>
								</c:if>
								<c:if test="${item.weekend eq '5'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(목)</th>
								</c:if>
								<c:if test="${item.weekend eq '6'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(금)</th>
								</c:if>
								<c:if test="${item.weekend eq '7'}">
									<th class="text-center" id="inDay_${status.index}" style="min-width:50px; color:red;" bgcolor="#CCE5FF">${fn:substring(item.whsDate,6,8)}일(토)</th>
								</c:if>
							</c:forEach> 
						</tr>
						<tr>
							<th colspan="3" class="text-center align-middle" style="min-width:120px;background:#e9f4ff;" >합계</th>
							<td class="text-right" id="inTotalQty" style="min-width:50px; font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
							<c:forEach var="item" items="${dayList}" varStatus="status">
								<c:if test="${item.weekend eq '1'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;"></td>
								</c:if>
								<c:if test="${item.weekend eq '2'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
								</c:if>
								<c:if test="${item.weekend eq '3'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
								</c:if>
								<c:if test="${item.weekend eq '4'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
								</c:if>
								<c:if test="${item.weekend eq '5'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
								</c:if>
								<c:if test="${item.weekend eq '6'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;font-size: 13px;color: blue;" ></td>
								</c:if>
								<c:if test="${item.weekend eq '7'}">
									<td class="text-right" id="dayTotalInWhsCost_${status.index}" style="min-widtd:50px;font-weight:bold;background:#e9f4ff;"></td>
								</c:if>
							</c:forEach> 
						</tr>
					</thead>
				</table>
			</div>

		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "bssc0231";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","매입, 매출 집계"); 

	$('#searchMonth').val("${serverMon}");

	let dayList = new Array(); // 설비 목록
	<c:forEach items="${dayList}" var="item">
	var json = new Object();
	json.whsDate = "${item.whsDate}";
	json.weekend = "${item.weekend}";
	dayList.push(json);
	</c:forEach>

	console.log('start:'+dayList[0].whsDate);
	
	//월달력 조회
	let inWhsListTable = $('#inWhsListTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '28vh',
		scrollX : true,
		pageLength : -1,
		scrollCollapse: true,
		fixedColumns: {
			leftColumns: 4
	    },
		ajax : {
			url : '<c:url value="io/dayInListPivot"/>',
			type : 'GET',
			data : {
				'searchMonth' : function(){return moment($('#searchMonth').val()).format('YYYYMM');}
			}
		},  
		rowId : '',
		columns : [
			{
				data : 'DEAL_CORP_NM',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			},
			{
				data : 'MAIN_GUBUN',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data=="001"?"사출":"봉제";
					}else{
						return '';
					}
				}
			},
			{
				data : 'ITEM_NM',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			},
			{		
				render : function(data, type, row, meta) {
					return '<span id="dealCorpTotalInWhsCost'+'_'+row['DEAL_CORP_CD']+'_'+row['MAIN_GUBUN']+'" ></span>';
				}, className : 'text-right' 
			},
			<c:forEach items="${dayList}" var="item" varStatus="status">
			{ data : '${item.whsDate}',
				render : function(data, type, row, meta) {
					if(data!=null && data!='0'){
						return rmDecimal(Math.floor(data));
					}else{
						return '';
					}
				}, className : 'text-right',
			},
			</c:forEach>
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
			$('#inWhsListTable tbody').css('font-weight','bold');

			 $.ajax({
				url : '<c:url value="io/dayInTotalCostList" />',
				type : 'GET',
				data : {
					'searchMonth' : function(){return moment($('#searchMonth').val()).format('YYYYMM');}
				},
				success : function(res){
					//사출/봉제 합계
					let mainCostList = res.mainCostlist;	
					let inTotalCost = 0;
					for(var i=0; i<mainCostList.length; i++){
						let inWhsCost = parseFloat(mainCostList[i].inWhsCost);
						inTotalCost += inWhsCost;
						
						$('#inputCost'+mainCostList[i].mainGubun).text(rmDecimal(Math.floor(inWhsCost)));
					}
					
					$('#totalInputCost').text(rmDecimal(Math.floor(inTotalCost)));

					//거래처별 합계
					let dealCorpCostlist = res.dealCorpCostlist;	
					for(var i=0; i<dealCorpCostlist.length; i++){
						let inWhsCost = rmDecimal(Math.floor(parseFloat(dealCorpCostlist[i].inWhsCost)));
						$('#dealCorpTotalInWhsCost_'+dealCorpCostlist[i].dealCorpCd+'_'+dealCorpCostlist[i].mainGubun).text(inWhsCost);
					}

					//일별 합계
					let dayCostlist = res.dayCostlist;	
					for(var i=0; i<dayCostlist.length; i++){
						if(dayCostlist[i].inWhsCost!=0){
							let inWhsCost = rmDecimal(Math.floor(parseFloat(dayCostlist[i].inWhsCost)));
							$('#dayTotalInWhsCost_'+i).text(inWhsCost);
						}
					}

					$('#inTotalQty').text(rmDecimal(Math.floor(parseFloat(res.totalCost))));

					inWhsListTable.fixedColumns().update();

				}
			})  
	    },
	});

	//월달력 조회
	let outWhsListTable = $('#outWhsListTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '28vh',
		scrollX : true,
		pageLength : -1,	
		scrollCollapse: true,
		fixedColumns: {
			leftColumns: 4
	    }, 
		ajax : {
			url : '<c:url value="io/dayOutListPivot"/>',
			type : 'GET',
			data : {
				'searchMonth' : function(){return moment($('#searchMonth').val()).format('YYYYMM');}
			}
		}, 
		rowId : '',
		columns : [
			{
				data : 'DEAL_CORP_NM',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			},
			{
				data : 'MAIN_GUBUN',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data=="001"?"사출":"봉제";
					}else{
						return '';
					}
				}
			},
			{
				data : 'ITEM_NM',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data+" 외";
					}else{
						return '';
					}
				}
			},
			{		
				
				render : function(data, type, row, meta) {
					return '<span id="dealCorpTotalOutWhsCost'+'_'+row['DEAL_CORP_CD']+'_'+row['MAIN_GUBUN']+'" ></span>';
				}, className : 'text-right' 
			},
		<c:forEach items="${dayList}" var="item" varStatus="status">
			{ data : '${item.whsDate}',
				render : function(data, type, row, meta) {
					if(data!=null && data!='0'){
						return rmDecimal(Math.floor(data));
					}else{
						return '';
					}
				}, className : 'text-right' 
			},
		</c:forEach> 
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
			$('#outWhsListTable tbody').css('font-weight','bold');

			let api = this.api();
			let data = api.data();
			console.log(data);

			$.ajax({
				url : '<c:url value="io/dayOutTotalCostList" />',
				type : 'GET',
				data : {
					'searchMonth' : function(){return moment($('#searchMonth').val()).format('YYYYMM');}
				},
				success : function(res){
					
					//사출/봉제 합계
					let mainCostList = res.mainCostlist;	
					let outTotalCost = 0;
					for(var i=0; i<mainCostList.length; i++){
						let outWhsCost = parseFloat(mainCostList[i].outWhsCost);
						outTotalCost += outWhsCost;
						
						$('#outputCost'+mainCostList[i].mainGubun).text(rmDecimal(Math.floor(outWhsCost)));
					}
					
					$('#totalOutputCost').text(rmDecimal(Math.floor(outTotalCost)));

					//거래처별 합계
					let dealCorpCostlist = res.dealCorpCostlist;	
					for(var i=0; i<dealCorpCostlist.length; i++){
						let outWhsCost = rmDecimal(Math.floor(parseFloat(dealCorpCostlist[i].outWhsCost)));
						$('#dealCorpTotalOutWhsCost_'+dealCorpCostlist[i].dealCorpCd+'_'+dealCorpCostlist[i].mainGubun).text(outWhsCost);
					}

					//일별 합계
					let dayCostlist = res.dayCostlist;	
					console.log("dayCostlist.length:"+dayCostlist.length)
					for(var i=0; i<dayCostlist.length; i++){
						console.log('dd:'+dayCostlist[i].outWhsCost)
						if(dayCostlist[i].outWhsCost!=0){
							console.log('dd:'+dayCostlist[i].outWhsCost)
							let outWhsCost = rmDecimal(Math.floor(parseFloat(dayCostlist[i].outWhsCost)));
							console.log("outWhsCost:"+outWhsCost)
							console.log("i:"+i)
							$('#dayTotalOutWhsCost_'+i).text(outWhsCost);
						}
					}

					$('#outTotalQty').text(rmDecimal(Math.floor(parseFloat(res.totalCost))));
					outWhsListTable.fixedColumns().update();
				}
			});
	    },
	})


	//조회버튼 클릭시
	$('#btnSearch').on('click', function() {
		$('#searchMonth').val();
		let date = moment($('#searchMonth').val()).format('YYYYMM');
		let hypenDate = $('#searchMonth').val();
		
		$('#reload').attr("href","bssc0231Reload?hypenDate="+hypenDate+"&&date="+date+"");
    });	 
	 
</script>

</body>
</html>
