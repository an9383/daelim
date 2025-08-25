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
				<li class="breadcrumb-item active">수입검사현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list"
				style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="card-header p-0 mb-2">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs card-header-tabs m-0">
							<li class="nav-item"><a class="nav-link active show"
								id="tab1Nav" data-toggle="tab" href="#tab1">품질경향분석</a></li>
							<li class="nav-item"><a class="nav-link" 
								id="tab2Nav" data-toggle="tab" href="#tab2">원인별 불량누적현황</a></li>
						<!-- 	<li class="nav-item"><a class="nav-link" 
								id="tab3Nav" data-toggle="tab" href="#tab3">업체별 불량현황</a></li> -->
						</ul>
					</div>
					<div class="pb-3" id="yearGubun"></div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<form id="form">
								<div class="chart-container1" style="width:auto; height:320px; border:1px solid #ddd; 
								padding:10px; border-radius:8px; background-color: #00066a; ">
									<canvas id="line-chart"></canvas>
								</div>
								<hr>
								<div class="table-responsive">
									<table id="qualityTrendAnlyTable" class="table table-bordered table-striped" style="font-size: 1rem;">
										<colgroup>
											<col width="8%">
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
											<col width="8%">
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
								<div class="table-responsive">
									<div class="chart-container" style="width:auto; height:300px;  border:1px solid #ddd; 
								padding:10px; border-radius:8px;  background-color: #00066a;">
										<canvas id="line-chart2"></canvas>
									</div>
									<hr>
									<table id="faultyStatusTable" class="table table-bordered table-striped" style="font-size: 1rem;">
										<colgroup>
											<col width="5%">
											<col width="4%">
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
											<col width="7%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th colspan="2">구분</th>
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
										<tbody id="dataList2"></tbody>
									</table>
								</div>
							</form>
						</div>
						<%-- <div class="tab-pane fade" id="tab3">
							<form id="form3">
								<div class="table-responsive">
									<table id="companyFaultyStatusTable" class="table table-bordered table-striped">
										<colgroup>
											<col width="10%">
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="15%">
											<col width="15%">
										</colgroup>
										<thead class="thead-light">
											<tr>
												<th colspan="2">구분</th>
												<th>입고수량</th>
												<th>합격수량</th>
												<th>불량수량</th>
												<th>불량율</th>
												<th>점유율</th>
											</tr>
										</thead>
										<tbody id="dataList"></tbody>
									</table>
								</div>
							</form>
						</div> --%>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0050";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사현황");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var year = serverDateTo.substring(0,4);
	var kg;
	var preInWhsQtyTB;
	var pairCntTB;
	var faultyCntTB;
	var faultyRateTB;
	var targetRateTB;
	var achvRateTB;
	
	var value2Transf;
	var preInWhsQtySum=0;
	var pairCntSum=0;
	var faultyCntSum=0;
	var faultyRateSum=0;
	var targetRateSum=0;
	var faultyTotalVal=0;
	var faultyTypeTotalVal=0;
	var quantityTotalValue=0;
	var shareTotalValue=0;
	var quantityValue=0;
	var shareValue=0;
	
	var faultyRateArr = [];
	var faultyTotalArr = [];
	var chartDataValue=[];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');
	var count = "${faultyTypeCount}";

	var arr = [];
	for(var i=0; i<count; i++){
	  arr[i] = [];
	  for(var j=0; j<12; j++){
	    arr[i][j] = null;
	  }
	}
	
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
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn float-right mr-2 d-none" id="btnObjSave" style="color: white; background: #00066a;">목표저장</button>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn float-right mr-2" style="color: white; background: #00066a;" id="btnObjChange">목표등록</button>';
	$('#yearGubun').html(html1);


	//조회버튼 클릭 시 
	$('#btnRetv').on('click', function() {
		year = $('#YEAR option:selected').val();

		//품질경향분석
		preInWhsQtySum=0;
		pairCntSum=0;
		faultyCntSum=0;
		faultyRateSum=0;
		targetRateSum=0;
		faultyTotalVal=0;

		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		
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
			
			rowData.qcObjGubun = '001';
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
				$('#my-spinner').show();
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

				$('#my-spinner').hide();
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
		
	});




	



	//***********************품질경향분석**************************
	
	//단위(KG)
	kg = '<tr><th style="text-align:center;">단위</th>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td>'
		+'<td class="text-right"><span class="kg" id="">KG</td></tr>'
		
	//입고수량 TB
	preInWhsQtyTB = '<tr><th style="text-align:center;">입고수량</th>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="preInWhsQty_sum_mon"></td></tr>'

	//합격수량 TB
	pairCntTB = '<tr><th style="text-align:center;">합격수량</th>'
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


	//불합격수량 TB
	faultyCntTB = '<tr><th style="text-align:center;">불합격수량</th>'
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
		
	//불량율(%) TB
	faultyRateTB = '<tr><th style="text-align:center;">불량율(%)</th>'
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

	var htmlDiv = '<label class="input-label ml-2">%</label></div></td>';
	//2020년 목표(%) TB
	targetRateTB = '<tr><th style="text-align:center;">목표(%)</th>'
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_01_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_02_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_03_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_04_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_05_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_06_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_07_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_08_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_09_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_10_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_11_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><div class="row"><input type="text" class="form-control per text-right ml-3" id="targetRate_12_mon" style="width:50%;  font-size: 1rem;" disabled/>'+htmlDiv
		+'<td class="text-right"><span class="all_td per" id="targetRate_sum_mon"></td></tr>'

	//달성율 TB
	achvRateTB = '<tr><th style="text-align:center;">달성율(%)</th>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="achvRate_sum_mon"></td></tr>'

	//누적불량율(%) TB
	faultyTotalTB = '<tr><th style="text-align:center;">누적불량율(%)</th>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_01_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_02_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_03_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_04_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_05_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_06_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_07_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_08_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_09_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_10_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_11_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_12_mon"></td>'
		+'<td class="text-right"><span class="all_td per" id="faultyTotal_sum_mon"></td></tr>'


	//품질경향분석 테이블	
	$('#qualityTrendAnlyTable > #dataList').append(kg+preInWhsQtyTB+pairCntTB+faultyCntTB+faultyRateTB+targetRateTB+achvRateTB+faultyTotalTB)
	console.log();
	
	
	//***********************원인별 불량누적현황**************************
	let faultyTypeArr = Array();
	$.each(inspectDesc,function(key,value){
		
		faultyTypeArr.push(value.value);

		$('#faultyStatusTable > #dataList2').append(
				'<tr><th rowspan="2" style="text-align:center;">'+value.value+'</th>'
				+'<td><span>수량</td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_01_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_02_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_03_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_04_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_05_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_06_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_07_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_08_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_09_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_10_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_11_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_12_mon"></td>'
				+'<td class="text-right"><span class="all_td" id="'+value.key+'_quantity_sum_mon"></td></tr>'
				+'<td><span>점유율</td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_01_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_02_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_03_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_04_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_05_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_06_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_07_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_08_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_09_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_10_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_11_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_12_mon"></td>'
				+'<td class="text-right"><span class="all_td per" id="'+value.key+'_share_sum_mon"></td></tr>'
		 	)
	});

	
		

	//TOTAL불량수량 TB
	faultyTypeTotalTB = '<tr><th colspan="2" style="text-align:center;">TOTAL 불량수량</th>'
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
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_sum_mon"></td></tr>'

		
	//원인별 불량누적현황 테이블
	$('#faultyStatusTable > #dataList2').append(faultyTypeTotalTB);
	

	//품질경향분석
	function a(){	
		$.ajax({
			url : "<c:url value='qm/qualityTrendAnlyList'/>",
			type : "GET",
			data : {
				'qcObjYear' : year,
				'mainGubun' : '001'
			},
			success : function(res){
				let data = res.data;

				console.log(data);
				$.each(data,function(key,value){
						$.each(value,function(key2,value2){

							value2Transf = (key2=="preInWhsQty"||key2=="pairCnt"||key2=="faultyCnt")?addCommas(value2):value2;
							$('#'+key2+"_"+value.qcObjMon+"_mon").text(value2Transf);
							$('#'+key2+"_"+value.qcObjMon+"_mon").val(value2Transf);
		
							switch(key2){
							case "preInWhsQty" : 
								preInWhsQtySum+=parseInt(value2);
								break;
							case "pairCnt" : 
								pairCntSum+=parseInt(value2);
								break;
							case "faultyCnt" : 
								faultyCntSum+=parseFloat(value2);
								break;
							case "faultyRate" : 
								faultyRateSum+=parseFloat(value2);
								break;
							case "targetRate" : 
								targetRateSum+=parseFloat(value2);
								break;
							}

							console.log('입고수량누계:'+preInWhsQtySum);

							//누적불량율
							$("#faultyTotal_"+value.qcObjMon+"_mon").text(parseFloat(((faultyCntSum/(preInWhsQtySum==0?1:preInWhsQtySum))*100).toFixed(3))+'%');
							
						});
					});
				
				
				//*********누계**********
				
				//입고수량 누계
				$('#preInWhsQty_sum_mon').text(addCommas(uncomma(preInWhsQtySum)));
	
				//합격수량 누계
				$('#pairCnt_sum_mon').text(addCommas(uncomma(pairCntSum)));
	
				//불합격수량 누계
				$('#faultyCnt_sum_mon').text(addCommas(uncomma(faultyCntSum)));
	
				var faultyCntVal = parseFloat($('#faultyCnt_sum_mon').text());
				var preInWhsQtyVal = parseFloat(uncomma($('#preInWhsQty_sum_mon').text()))==0?1:parseFloat(uncomma($('#preInWhsQty_sum_mon').text()));
	
				//불량율(%) 누계
				$('#faultyRate_sum_mon').text((faultyCntVal/preInWhsQtyVal).toFixed(3)+"%");  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림
	
				//목표(%) 누계
				$('#targetRate_sum_mon').text("0.2%");

				var achvRateVal = parseFloat($('#faultyRate_sum_mon').text())<=0.2?
						"100%":((parseFloat($('#targetRate_sum_mon').text())/parseFloat($('#faultyRate_sum_mon').text()))*100).toFixed(3);

				//달성율(%) 누계
				$('#achvRate_sum_mon').text(achvRateVal);

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

	
	//원인별 불량누적현황 조회
	function b(){	
		$.ajax({
			url : "<c:url value='qm/faultyStatusList' />",
			type : "GET",
			data : {
				'faultyTypeDate' : year
			},
			success : function(res){
				let data = res.data;

//				console.log(data)
				$.each(data,function(key,value){
					$('#'+value.faultyTypeSeq+"_quantity_"+value.faultyTypeDate.substring(4,6)+"_mon").text(addCommas(value.faultyTypeQty));
					$('#'+value.faultyTypeSeq+"_share_"+value.faultyTypeDate.substring(4,6)+"_mon").text(value.faultyTypeRate);

					chartDataValue[key]=value.faultyTypeNm;

					
					
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

				//수량 누계
				for(var j=1; j<=count; j++){
					for(var i=0; i<12; i++){

						quantityValue = i<9?$('#'+j+'_quantity_0'+(i+1)+'_mon').text():$('#'+j+'_quantity_'+(i+1)+'_mon').text();
						
						quantityValue2 = quantityValue==""?"0":uncomma(quantityValue);
						quantityTotalValue += parseInt(quantityValue2);
					}
					$('#'+j+'_quantity_sum_mon').text(addCommas(quantityTotalValue)); 
					quantityTotalValue=0;
				}
				
				//점유율 누계
				for(var j=1; j<=count; j++){
					for(var i=0; i<12; i++){
						shareValue = i<9?$('#'+j+'_share_0'+(i+1)+'_mon').text():$('#'+j+'_share_'+(i+1)+'_mon').text();
						shareTotalValue += parseFloat(shareValue);
					}
					$('#'+j+'_share_sum_mon').text(shareTotalValue.toFixed(2)+'%');
					shareTotalValue=0;
				}
				
				
				//누적불량율 누계 
				for(var i=0; i<12; i++){
					var faultyTypeTotalMonVal = i<9?$('#faultyTypeTotal_0'+(i+1)+'_mon').text():$('#faultyTypeTotal_'+(i+1)+'_mon').text();

					faultyTypeTotalMonVal = faultyTypeTotalMonVal==""?"0":uncomma(faultyTypeTotalMonVal);
					faultyTypeTotalVal += parseFloat(faultyTypeTotalMonVal);
				}

				$('#faultyTypeTotal_sum_mon').text(addCommas(faultyTypeTotalVal));
				
				
				//*********Chart.js**********
				
				for(var i=0; i<count; i++){
					for(var j=0; j<12; j++){
						arr[i][j] = j<9?uncomma($('#'+(i+1)+'_quantity_0'+(j+1)+'_mon').text()):uncomma($('#'+(i+1)+'_quantity_'+(j+1)+'_mon').text());
						
					} 
				}
				
				setChart2(chartDataValue,arr);

			}
		}); 
	
	}; 

	//***********************Chart.js**************************
	function setChart(arr1,arr2){
		
		window.lineChart = new Chart(ctx,{
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:'불량율(%)',
						data  : arr1,
						type : 'line',
						backgroundColor:'#ffcd56',
						borderColor:'#ffcd56',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						label:'누적불량율(%)',
						data  : arr2,
						type : 'line',
						backgroundColor:'#ff456d',
						borderColor:'#ff456d',
						borderWidth:4,
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
							max:30,
							min:0,
							stepSize:5,
							fontColor: '#FFF6F5',
							fontSize: 14,
							callback: function(value, index, ticks) {
		                        return value + '%';
		                    }
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						},
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

	function setChart2(labelData,arr){
		
		window.barChart = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						label:"외관",
						data  : arr[0],
						backgroundColor:'#ffcd56',
						borderColor:'#ffcd56',
						fill :false
					},
					{
						label:"물성",
						data  : arr[1],
						backgroundColor:'#81F7F3',
						borderColor:'#81F7F3',
						fill :false
					},
					{
						label:"포장",
						data  : arr[2],
						backgroundColor:'#5882FA',
						borderColor:'#5882FA',
						fill :false
					},
					{
						label:"혼입",
						data  : arr[3],
						backgroundColor:'#ff456d',
						borderColor:'#ff456d',
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
							max:100,
							min:0,
							stepSize:20,
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
	    return x.replace(/,/g, '');
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
          if(year==y){
              console.log(year)
              console.log(y)

              $("#YEAR").append("<option value='"+ y +"' selected>"+ y + " 년" +"</option>");
          }else{
        	  $("#YEAR").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
          }
      }
  }
</script>

</body>
</html>
