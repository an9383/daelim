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
				<li class="breadcrumb-item"><a href="#">모니터링</a></li>
				<li class="breadcrumb-item active">출하검사현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="card-header card-tab p-0 mb-2">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item"><a class="nav-link active show"
								id="tab1Nav" data-toggle="tab" href="#tab1">품질경향분석</a></li>
							<li class="nav-item"><a class="nav-link" 
								id="tab2Nav" data-toggle="tab" href="#tab2">원인별 불량누적현황</a></li>
						</ul>
					</div>
					<div class="pb-3" id="yearGubun"></div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<div class="chart-container1" style="width:auto; height:360px; border:1px solid #ddd; 
								padding:10px; border-radius:8px; background-color: #2C2B40;">
									<canvas id="line-chart"></canvas>
								</div>
								<hr>
								<div class="table-responsive">
									<table id="qualityTrendAnlyTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="6%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="10%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>구분</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
												<th>누계</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab2">
							<form id="form2">
								<div class="chart-container2" style="width:auto; height:360px; border:1px solid #ddd; 
									padding:10px; border-radius:8px;  background-color: #2C2B40; ">
									<canvas id="line-chart2"></canvas>
								</div>
								<hr>
								<div class="table-responsive">
									<table id="faultyStatusTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="8%">
											<col width="7%">
											<col width="7%">
											<col width="6%">
											<col width="6%">
											<col width="6%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="7%">
											<col width="6%">
											<col width="6%">
											<col width="6%">
											<col width="6%">
											<col width="4%">
											<col width="4%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th>구분</th>
												<th>1월</th>
												<th>2월</th>
												<th>3월</th>
												<th>4월</th>
												<th>5월</th>
												<th>6월</th>
												<th>7월</th>
												<th>8월</th>
												<th>9월</th>
												<th>10월</th>
												<th>11월</th>
												<th>12월</th>
												<th>합계</th>
												<th>불량율</th>
											</tr>
										</thead>
										<tbody id="dataList2"></tbody>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0070";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","출하검사현황");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var year = serverDateTo.substring(0,4);
	var inspectCntTB;
	var faultyCntTB;
	var faultyRateTB;
	var targetRateTB;
	var achvRateTB;
	var value2Transf;
	var inspectCntSum=0;
	var pairCntSum=0;
	var outputCntSum=0;
	var faultyCntSum=0;
	var faultyRateSum=0;
	var targetRateSum=0;
	var achvRateSum=0;
	var faultyTotalVal=0;  //누적불량율
	var faultyTypeTotalVal=0; //total 누계
	var faultyRateTotalVal=0;
	var faultyCntTotalValue=0; //수량 값
	var faultyCntValue=0;	//수량 누계
	var faultyCntValue2=0;	//수량 누계
	
	var faultyRateValue=0; //불량율 값
	var faultyRateValue2=0; //불량율 값
	var faultyRateTotalValue  =0; //불량율 누계


	
	var faultyRateArr = [];
	var faultyTotalArr = [];
	var chartDataValue=[];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');
	var count = "${faultyTypeCount}";

	var inspectDesc = new Array(); //불량유형
	<c:forEach items="${inspectDesc}" var="info">
	var json = new Object();
	json.key = "${info.etc2}";
	json.value = "${info.baseInfoNm}";
	inspectDesc.push(json);
	</c:forEach>



	var html1 = '<div class="row float-left ml-2" style="width:80%; float-right">';
	html1 += '&nbsp;<label class="input-label-sm">년도</label><div class="form-group input-sub m-0 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary float-right mr-2 d-none" id="btnObjSave">목표등록</button>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning float-right mr-2" id="btnObjChange">목표수정</button>';

	$('#yearGubun').html(html1);

	$('#btnRetv').on('click', function() {
		year = $('#YEAR option:selected').val();

		//품질경향분석
		inspectCntSum=0;
		outputCntSum=0;
		pairCntSum=0;
		faultyCntSum=0;
		faultyTotalVal=0;		
		
		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		faultyRateTotalVal=0;
		
		$('.all_td').text('0');
		$('.per').text('0%');
		$('.per').val('0');
		a();
		b();

		lineChart.destroy();
		barChart.destroy();
	});
	
	//품질경향분석 조회
	$(document).ready(function (){
		$('.all_td').text('0');
		$('.per').text('0%');
		$('.per').val('0');
		a();
		b();
	});


	//tab1Nav 클릭 시
	$('#tab1Nav').on('click',function(){
		$('#btnObjChange').removeClass('d-none');
		
	});

	//tab2Nav 클릭 시
	$('#tab2Nav').on('click',function(){
		$('#btnObjChange').addClass('d-none');
		
	});

	//목표수정 버튼 클릭시
	$('#btnObjChange').on('click',function(){

		$('#btnObjSave').removeClass('d-none');
		
		for(var i=0; i<12; i++){
			i<9?$('#targetRate_0'+(i+1)+'_mon').attr('disabled',false):$('#targetRate_'+(i+1)+'_mon').attr('disabled',false);
		}
	});

	//목표등록 버튼 클릭시
	$('#btnObjSave').on('click',function(){

		var check=true;
		var dataArray = new Array();
		

		for(var i=0; i<12; i++){
			var rowData = new Object();
			
			rowData.qcObjGubun = '002';
			rowData.qcObjYear = $('#YEAR :selected').val()==""?year:$('#YEAR :selected').val();
			rowData.qcObjMon = i<9?('0'+(i+1)):(i+1);
			rowData.qcObjValue = i<9?$('#targetRate_0'+(i+1)+'_mon').val():$('#targetRate_'+(i+1)+'_mon').val();

			dataArray.push(rowData);
			console.log(rowData);
				
		}
		

		$.ajax({
			url : '<c:url value="qm/qcObjAdmCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {

			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('등록되었습니다.');

					a();
					$('#btnObjSave').addClass('d-none');
					
					for(var i=0; i<12; i++){
						i<9?$('#targetRate_0'+(i+1)+'_mon').attr('disabled',true):$('#targetRate_'+(i+1)+'_mon').attr('disabled',true);
					}

				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
		
	});
	

	
	//***********************품질경향분석**************************
	//검사 수량 TB
	inspectCntTB = '<tr><th style="text-align:center;">검사수량</th>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="inspectCnt_sum_mon"></td></tr>'

	//양품 수량 TB
	pairCntTB = '<tr><th style="text-align:center;">양품수량</th>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="pairCnt_sum_mon"></td></tr>'

	//불량 수량 TB
	faultyCntTB = '<tr><th style="text-align:center;">불량수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCnt_sum_mon"></td></tr>'

	//출하 수량 TB
	outputCntTB = '<tr><th style="text-align:center;">출하수량</th>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="outputCnt_sum_mon"></td></tr>'

	//불량률 TB
	faultyRateTB = '<tr style="display:none;"><th style="text-align:center;">불량율(%)</th>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyRate_sum_mon"></td></tr>'
		
	var htmlDiv = '&nbsp;&nbsp;<label class="input-label-sm">%</label></div></td>';
	//2020년 목표(%) TB
	targetRateTB = '<tr><th style="text-align:center;">목표(%)</th>'
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_01_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_02_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_03_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_04_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_05_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_06_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_07_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_08_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_09_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_10_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_11_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right" id="targetRate_12_mon" style="width:70%" disabled/>'+htmlDiv
		+'<td class="text-right"><span class="all_td per" id="targetRate_sum_mon"></td></tr>'

	//달성율 TB
	achvRateTB = '<tr><th style="text-align:center;">달성율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="achvRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="achvRate_sum_mon"></td></tr>'

	//누적불량율(%) TB
	faultyTotalTB = '<tr><th style="text-align:center;">누적불량율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTotal_sum_mon"></td></tr>'


	//품질경향분석 테이블	
	$('#qualityTrendAnlyTable > #dataList').append(inspectCntTB+pairCntTB+faultyCntTB+outputCntTB+faultyRateTB+targetRateTB+achvRateTB+faultyTotalTB)	
	
	
	//***********************원인별 불량누적현황**************************
	$.each(inspectDesc,function(key,value){


		chartDataValue[value.key]=value.value;
		
	$('#faultyStatusTable > #dataList2').append(
			'<tr><th style="text-align:center;">'+value.value+'</th>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_01_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_01_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_02_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_02_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_03_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_03_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_04_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_04_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_05_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_05_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_06_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_06_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_07_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_07_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_08_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_08_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_09_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_09_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_10_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_10_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_11_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_11_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_12_mon"></span><span class="all_td d-none" id="'+value.key+'_rate_12_mon"></span></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_sum_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_rate_sum_mon"></td></tr>'
		
	 	)
	});

	//TOTAL불량수량 TB
	faultyTypeTotalTB = '<tr><th  style="text-align:center;">TOTAL 불량수량</th>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyCntTotal_sum_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRateTotal_sum_mon"></td></tr>'
		
	//원인별 불량누적현황 테이블
	$('#faultyStatusTable > #dataList2').append(faultyTypeTotalTB);

	
	//품질경향분석 조회
	function a(){	
		$.ajax({
			url : "<c:url value='qm/qualityTrendAnlyList11' />",
			type : "GET",
			data : {
				'outputDate' : year
				},
			success : function(res){
				let data = res.data;

				$.each(data,function(key,value){
					console.log(data);
					
					$.each(value,function(key2,value2){
						value2Transf = (key2=="inspectCnt"||key2=="pairCnt"||key2=="faultyCnt"||key2=="outputCnt")?addCommas(uncomma(value2)):value2;
						$('#'+key2+"_"+value.qcObjMon+"_mon").text(value2Transf);
						$('#'+key2+"_"+value.qcObjMon+"_mon").val(value2Transf);

						switch(key2){
						case "inspectCnt" : 
							inspectCntSum+=parseInt(value2);
							break;
						case "pairCnt" : 
							pairCntSum+=parseInt(value2);
							break;
						case "faultyCnt" : 
							faultyCntSum+=parseInt(value2);
							break;
						case "outputCnt" : 
							outputCntSum+=parseInt(value2);
							break;
						case "faultyRate" : 
							faultyRateSum+=parseFloat(value2);
							break;
						case "targetRate" : 
							targetRateSum+=parseFloat(value2);
							break;
						case "achvRate" : 
							achvRateSum+=parseFloat(value2);
							break;
						}

						//누적불량율
						$("#faultyTotal_"+value.qcObjMon+"_mon").text(parseFloat(((faultyCntSum/(pairCntSum==0?1:(pairCntSum + faultyCntSum)))*100).toFixed(3))+'%');

					});
				});
				
				//검사수량 누계
				$('#inspectCnt_sum_mon').text(addCommas(uncomma(inspectCntSum)));

				//양품수량 누계
				$('#pairCnt_sum_mon').text(addCommas(uncomma(pairCntSum)));

				//검사수량 누계
				$('#faultyCnt_sum_mon').text(addCommas(uncomma(faultyCntSum)));

				//출하수량 누계
				$('#outputCnt_sum_mon').text(addCommas(uncomma(outputCntSum)));


				var faultyCntVal = parseFloat($('#faultyCnt_sum_mon').text());
				var inspectCntVal = parseFloat(uncomma($('#inspectCnt_sum_mon').text()))==0?1:parseFloat(uncomma($('#inspectCnt_sum_mon').text()));
				
				//불량율(%) 누계
				faultyRateSum = (faultyCntVal/(faultyCntVal+inspectCntVal)*100).toFixed(3)+"%";  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림

				//목표(%) 누계
				$('#targetRate_sum_mon').text("0.2%");
				
				var achvRateVal = parseFloat(faultyRateSum)<=0.2?
						"100%":((parseFloat($('#targetRate_sum_mon').text())/parseFloat(faultyRateSum))*100).toFixed(3);

				//달성율(%) 누계
				$('#achvRate_sum_mon').text(parseFloat(achvRateVal) + "%");

				
				//누적불량율 누계
				for(var i=0; i<12; i++){
					var faultyTotalMonVal = i<9?$('#faultyTotal_0'+(i+1)+'_mon').text():$('#faultyTotal_'+(i+1)+'_mon').text();
					
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}
				
				$('#faultyTotal_sum_mon').text(faultyTotalVal.toFixed(3)+'%');

				
				//*********Chart.js**********
				//불량율 배열
				for(var i=0; i<12; i++){

					var faultyRateArrVal = i<9?$('#faultyRate_0'+(i+1)+'_mon').text():$('#faultyRate_'+(i+1)+'_mon').text();
					
					faultyRateArr[i] = faultyRateArrVal==""?parseFloat("0"):parseFloat(faultyRateArrVal);
				} 

				//누적불량율 배열
				for(var i=0; i<12; i++){
					var faultyTotalArrVal = i<9?$('#faultyTotal_0'+(i+1)+'_mon').text():$('#faultyTotal_'+(i+1)+'_mon').text();

					
					faultyTotalArr[i] = faultyTotalArrVal==""?parseFloat("0"):parseFloat(faultyTotalArrVal);
				} 
				
				setChart(faultyRateArr,faultyTotalArr);
				

			}
		}); 
		
	};



	
	//원인불량 조회
	function b(){	
		$.ajax({
			url : "<c:url value='qm/faultyStatusList2' />",
			type : "GET",
			data : {
				'faultyTypeDate' : year
				},
			success : function(res){
				let data = res.data;
				
				$.each(data,function(key,value){
					$('#'+value.faultyTypeSeq+"_faulty_"+value.faultyTypeDate.substring(4,6)+"_mon").text(addCommas(uncomma(value.faultyTypeQty)));
					$('#'+value.faultyTypeSeq+"_rate_"+value.faultyTypeDate.substring(4,6)+"_mon").text(value.faultyTypeRate);

					//TOTAL 불량수량
					$('#faultyTypeTotal_'+value.faultyTypeDate.substring(4,6)+'_mon').text(addCommas(uncomma(value.faultyTypeTotal)));

				});

				for(var i=0; i<9; i++) {
					if($('#faultyTypeTotal_0'+(i+1)+'_mon').text() == "") {
						$('#faultyTypeTotal_0'+(i+1)+'_mon').text("0");
					}
				} 

				for(var i=9; i<12; i++) {
					if($('#faultyTypeTotal_'+(i+1)+'_mon').text() == "") {
						$('#faultyTypeTotal_'+(i+1)+'_mon').text("0");
					}
				}

				//누계
				for(var j=1; j<=count; j++){
					for(var i=0; i<12; i++){
						//수량 누계
						qunatityValue2 = i<9?$('#'+j+'_faulty_0'+(i+1)+'_mon').text():$('#'+j+'_faulty_'+(i+1)+'_mon').text();
						
						faultyCntValue = qunatityValue2==""?"0":qunatityValue2;
						faultyCntTotalValue += parseInt(faultyCntValue);

						//불량율 누계
						faultyRateValue2 = i<9?$('#'+j+'_rate_0'+(i+1)+'_mon').text():$('#'+j+'_rate_'+(i+1)+'_mon').text();
						
						faultyRateValue = faultyRateValue2==""?"0":faultyRateValue2;
						faultyRateTotalValue += parseFloat(faultyRateValue);
					}
					
					$('#'+j+'_faulty_sum_mon').text(faultyCntTotalValue);
//					$('#'+j+'_rate_sum_mon').text(faultyRateTotalValue+'%');
					
					faultyCntTotalValue=0;
					faultyRateTotalValue=0;
				}

				
				
				//TOTAL 수량  누계
				for(var i=0; i<count; i++){ 
					var faultyTypeTotalMonVal = $('#'+(i+1)+'_faulty_sum_mon').text();
					faultyTypeTotalVal += parseFloat(faultyTypeTotalMonVal);
				}
				$('#faultyCntTotal_sum_mon').text(faultyTypeTotalVal);

				//불량율
				for(var i=0; i<12; i++) {
					var faultyMonRate = parseFloat($('#'+(i+1)+'_faulty_sum_mon').text()) / parseFloat($('#faultyCntTotal_sum_mon').text()) * 100;

					if($('#'+(i+1)+'_faulty_sum_mon').text() != "0"){
						$('#'+(i+1)+'_rate_sum_mon').text(faultyMonRate.toFixed(2)+'%');
					}else $('#'+(i+1)+'_rate_sum_mon').text("0%");
				}

				//Total 불량율 누계
				for(var i=0; i<count; i++){
					var faultyRateTotalMonVal = $('#'+(i+1)+'_rate_sum_mon').text();
					faultyRateTotalVal += parseFloat(faultyRateTotalMonVal);
				}
				
				$('#faultyRateTotal_sum_mon').text(faultyRateTotalVal.toFixed(2)+'%');

				

				
				//*********Chart.js**********
				var sumQtyArr=[];
				var sumRateArr=[];
				
				for(var i=0; i<count; i++){
					sumQtyArr[i] = $('#'+(i+1)+'_faulty_sum_mon').text();
					sumRateArr[i] = parseFloat($('#'+(i+1)+'_rate_sum_mon').text());
				}

				setChart2(chartDataValue,sumQtyArr,sumRateArr);

			}
		}); 
	
	};
	
	//***********************Chart.js**************************
	function setChart(result1,result2){
		
		window.lineChart = new Chart(ctx,{
			type : 'line',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:'불량율(%)',
						data  : result1,
						backgroundColor:'#FD9644',
						borderColor:'#FD9644',
						borderWidth:5,
						lineTension:0,
						fill :false
					},
					{
						label:'누적불량율(%)',
						data  : result2,
						backgroundColor:'#4B7BEC',
						borderColor:'#4B7BEC',
						borderWidth:5,
						lineTension:0,
						fill :false
					}
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
						ticks:{
							fontColor: '#E6E6E6',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						ticks:{
							max:5,
							min:0,
							stepSize:0.5,
							fontColor: '#FFF6F5',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}]
				},
				legend:{
					labels :{
						fontColor:'#FFF6F5',
						fontSize:14
					},
					display:true
				}
			}
		});

		
	}

	function setChart2(labelData,arr1,arr2){
		
		window.barChart = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:[labelData[1],labelData[2],labelData[3],labelData[4],labelData[5],labelData[6],labelData[7],labelData[8],labelData[9],labelData[10]],
				datasets: [
					{
						type : 'bar',
						label:'합계',
						data  : arr1,
						backgroundColor:'#0DD186',
						borderColor:'#0DD186',
					},
					{
						type : 'line',
						label:'불량율(%)',
						data  : arr2,
						backgroundColor:'#EB4933',
						borderColor:'#EB4933',
						//borderWidth:3,
						lineTension:0,
						fill :false
					},
					
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
						//stacked:true,
						ticks:{
							fontColor: '#E6E6E6',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						//stacked:true,
						ticks:{
							stepSize:10,
							fontColor: '#FFF6F5',
							fontSize: 14
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					y : {
						suggestedMax : 100,
						suggestedMin : 0
					}
				},
				legend:{
					labels :{
						fontColor:'#FFF6F5',
						fontSize:13
					},
					display:true,
					//position :''
				}
			}
		});
		
	}

	
	//***********************Chart.js**************************
	
	
    //콤마(,) 생성
    function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	} 


	

</script>
<script>
    $(document).ready(function(){
        setDateBox();
    }); 
  // select box 연도 , 월 표시
  function setDateBox(){
      var dt = new Date();
      var com_year = dt.getFullYear();
      
      // 발행 뿌려주기
      $("#YEAR").append("<option value=''>년도</option>");
      // 올해 기준으로 -1년부터 +5년을 보여준다.
      for(var y = (com_year-1); y <= (com_year+5); y++){
          $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
      }
     
  }
</script>

</body>
</html>
