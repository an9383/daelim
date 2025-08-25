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
				<li class="breadcrumb-item active">출하검사현황(월별)</li>
			</ol>
		</nav>
	</header>
	<div class="pb-2" id="yearGubun"></div>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!------------ left top ----------->
			<div class="list-half col-7" id="">
				<div class="card">
				 <h6 class="list-half-tit">불량율 현황(단위 : %)</h6>
				 <div class="card-body">
				    <!-- 컨텐츠 영역 -->
				    <div class="chart-container1" style="width:auto; height:299px; border:1px solid #ddd; 
					padding:10px; border-radius:8px; background-color: #2C2B40;">
						<canvas id="line-chart"></canvas>
					</div>
				 </div>
				</div>
			</div>
			<!------------ right top ----------->
			<div class="list-half col-5" id="">
				<div class="card">
				 <h6 class="list-half-tit">누적 유형별 점유율 (단위 : %)</h6>
				 <div class="card-body">
				    <!-- 컨텐츠 영역 -->
				     <div class="chart-container1" style="width:auto; height:299px; border:1px solid #ddd; 
						padding:10px; border-radius:8px; background-color: #2C2B40; ">
						<canvas id="line-chart2"></canvas>
					</div>
				 </div>
				</div>
			</div>
			<!------------ left bottom ----------->
			<div class="list-half left-sidebar-fix col-7" id="left-list">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="inspectMonitorTable" class="table table-bordered table-striped">
							<colgroup>
								<col width="11%">
								<col width="6%">
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
								<col width="6%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th></th>
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
				</div>
			</div>
			<!--=============== right list half ===============-->
			<div class="list-half col-5 p-0" id="">	
			   <!-- 오른쪽 half중 top -->		
			   <div class="list-half-bot-150" id="">
			  	  <div class="card p-0">
				   <div class="card-body">
				    <!-- 컨텐츠 영역 -->
				    <table id="completeAccumMonitorTable" class="table table-bordered">
						<%-- <colgroup>
                            <col width="10%">
                            <col width="25%">
                            <col width="25%">
                            <col width="25%">
                            <col width="15%">
                        </colgroup> --%>
						<thead class="thead-light">
						<tr>
							<th>불량항목</th>
							<c:forEach var="faultyType" items="${faultyTypeList}" varStatus="status">
								<th class="text-center">${faultyType.faultyTypeNm}</th>
							</c:forEach>
						</tr>
						</thead>
						<tbody class="thead-light" id="dataList"></tbody>
					</table>
				   </div>
				  </div>
			   </div>	
			   <!-- 오른쪽 half중 bottom -->	
			   <div class="list-half-bot-240" id="">
				  <div class="card">
				   <h6 class="list-half-tit">주요 중점 관리 사항</h6>
				   <div class="">
				   <div class="card-body col-sm-12 p-1 mb-2">
					    <button type="button" class="btn btn-primary float-right mr-1 d-none"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnSaveConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-warning float-right mr-1 "
							id="btnDel">삭제</button>
						<button class="btn btn-warning d-none"
							id="btnDelConfirmLoading" type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span>처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnEdit">수정</button>
						<button class="btn btn-primary d-none" id="btnEditConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-primary float-right mr-1"
							id="btnAdd">추가</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<div class="table-responsive">
						<table id="monPriManageAdmTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="90%">
							</colgroup>
							<thead class="thead-light">
								<tr>
								  <th>순번</th>
								  <th>내용</th>
								</tr>
							</thead>
							<tbody class="thead-light" id="">
							</tbody>
						</table>
					</div>
				   </div>
				  </div>
			   </div>
			</div>
			<!--======================== /left-list ========================-->
		</div>
	</div>
</div>


<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "mmsc0080";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","출하검사현황(월별)");
	
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
	var faultyTotalVal=0;  //누적불량율
	var faultyTypeTotalVal=0; //total 누계
	var faultyRateTotalVal=0;
	var faultyCntTotalValue=0; //수량 값
	var faultyCntValue=0;	//수량 누계
	var faultyCntValue2=0;
	
	var faultyRateValue =0; //불량율 값
	var faultyRateTotalValue  =0; //불량율 누계
	var faultyTotalMonVal2=0;
	var	faultyRateSum = 0;
	var	targetRateSum = 0;
	
	var faultyRateArr = [];
	var targetTotalArr =[];
	var faultyTypeRateArr=[];
	var faultyTypeQtyArr=[];
	
	var ctx = $('#line-chart');
	var ctx2 = $('#line-chart2');
	var count = "${faultyTypeCount}";
	var sideView = '';

	var inspectDesc = new Array(); //불량유형
	<c:forEach items="${inspectDesc}" var="info">
	var json = new Object();
	json.key = "${info.etc2}";
	json.value = "${info.baseInfoNm}";
	inspectDesc.push(json);
	</c:forEach>

	var faultyTypeArr = new Array(); //불량유형
	<c:forEach items="${faultyTypeList}" var="info">
	faultyTypeArr["${info.faultyTypeSeq}"] = "${info.faultyTypeNm}";
	</c:forEach>


	var html1 = '<div class="row ml-4 mt-1 mb-0">';
	html1 += '<div class="form-group input-sub m-0 mr-1 row">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>';
	html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	html1 += '</div>';

	$('#yearGubun').html(html1);

	$('#btnRetv').on('click', function() {
		year = $('#YEAR option:selected').val();

		//품질경향분석
		inspectCntSum=0;
		pairCntSum=0;
		outputCntSum=0;
		faultyCntSum=0;
		faultyTotalVal=0;		
		
		
		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		faultyRateTotalVal=0;

		$('#completeAccumMonitorTable > #dataList > tr').remove();
		
		$('.all_td').text('0');
		a();
		b();
		c();
	});

	
	//품질경향분석 조회
	$(document).ready(function (){
		$('.all_td').text('0');
		a();
		b();
		c();
	});
	

	//월 주요 중점 관리사항 목록조회
	let monPriManageAdmTable = $('#monPriManageAdmTable').DataTable({
		dom :'',
		language : lang_kor,
		lengthChange : false,	
		destroy : true,	
		paging : false,
		searching : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="qm/monPriManageAdmList"/>',
			type : 'GET',
			data : {
					'monPriType' : '002'
				},
		},
		columns : [ 
			{
				render: function(data, type, row, meta) {	
					return meta.row+1;
	    		}
				
			},
			{data 	: 'monPriCont',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control" style="border:none; max-width:100%;" name="monPriCont" value="'+data+'" disabled>';		
					} else{
						return '<input type="text" class="form-control" style="max-width:100%;" name="monPriCont" value="">';
					}	
				}
			}, 
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	    columnDefs : [ {"targets" :"_all","className" : "text-center"
		}],
	});

	$('#monPriManageAdmTable tbody').on('click','tr',function(e){
		sideView = "edit";
    	
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#monPriManageAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#monPriManageAdmTable').DataTable().row(this).index();
	});
	


	//추가버튼 클릭시 
	$('#btnAdd').on('click',function(){
		$('#monPriManageAdmTable').DataTable().row.add({}).draw(false);
		$('#btnSave').removeClass('d-none');
	});

	//수정버튼 클릭시 
	$('#btnEdit').on('click',function(){

		if(sideView!="edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		$('input[name=monPriCont]').eq(tableIdx).attr('disabled',false);
	});

	//삭제버튼 클릭시 
	$('#btnDel').on('click',function(){
		if(sideView!="edit"){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		//삭제 하고 저장하는 식으로 처리
		$('#monPriManageAdmTable').DataTable().rows(tableIdx).remove().draw();
	});

	// 저장 처리
	$('#btnSave').on('click', function() {

		var check=true;
		var dataArray = new Array();
		
		if ($("input[name=monPriCont]").val() == "") {
			toastr.warning('내용을 입력해주세요.');
			$("input[name=monPriCont]").focus();
			return false;
		}

		$('#monPriManageAdmTable tbody tr').each(function(index,item){
			
			var rowData = new Object();
			
			rowData.monPriType = '002';
			rowData.monPriCont = $(this).find('td input[name=monPriCont]').val();

			dataArray.push(rowData);
	        console.log(rowData);
			
		});

		$.ajax({
			url : '<c:url value="qm/monPriManageAdmCreate"/>',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function() {

			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					$('#monPriManageAdmTable').DataTable().ajax.reload(function() {});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					$('#btnEdit').attr('disabled', false);

					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else if (sideView == "add") {
						toastr.success('등록되었습니다.');
					}

					sideView = 'edit';
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

	//불량 수량 TBA
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

	
	//불량율(%) TB
	faultyRateTB = '<tr><th style="text-align:center;">불량율(%)</th>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="faultyRate_sum_mon"></td></tr>'

		
	//2020년 목표(%) TB
	targetRateTB = '<tr><th style="text-align:center;">목표(%)</th>'
		+'<td class="text-right"><span class="all_td" id="targetRate_01_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_02_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_03_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_04_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_05_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_06_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_07_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_08_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_09_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_10_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_11_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_12_mon"></td>'
		+'<td class="text-right"><span class="all_td" id="targetRate_sum_mon"></td></tr>'

	//수입검사현황(월별) 테이블	
	$('#inspectMonitorTable > #dataList').append(inspectCntTB+faultyCntTB+faultyRateTB+targetRateTB)	
	
	
	$.each(inspectDesc,function(key,value){
		
	$('#inspectMonitorTable > #dataList').append(
			'<tr><th style="text-align:center;">'+value.value+'</th>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_01_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_02_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_03_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_04_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_05_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_06_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_07_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_08_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_09_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_10_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_11_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_12_mon"></td>'
			+'<td class="text-right"><span class="all_td" id="'+value.key+'_faulty_sum_mon"></td></tr>'
	 	)
	});

	//TOTAL불량수량 TB
	faultyTypeTotalTB = '<tr><th  style="text-align:center;">불량누계</th>'
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
		+'<td class="text-right"><span class="all_td" id="faultyTypeTotal_sum_mon"></td>'
			
		
	$('#inspectMonitorTable > #dataList').append(faultyTypeTotalTB)
	
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
					$.each(value,function(key2,value2){
						value2Transf = (key2=="inspectCnt"||key2=="pairCnt"||key2=="faultyCnt"||key2=="outputCnt")?addCommas(uncomma(value2)):value2;
						$('#'+key2+"_"+value.qcObjMon+"_mon").text(value2Transf);

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
						}

						//누적불량율
						$("#faultyTotal_"+value.qcObjMon+"_mon").text(((faultyCntSum/inspectCntSum)*100).toFixed(3)+'%');

					});
				});
				
				//검사수량 누계
				$('#inspectCnt_sum_mon').text(addCommas(uncomma(inspectCntSum)));

				//불량수량 누계
				$('#faultyCnt_sum_mon').text(addCommas(uncomma(faultyCntSum)));

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


				var faultyCntVal = parseFloat($('#faultyCnt_sum_mon').text());
				var inspectCntVal = parseFloat(uncomma($('#inspectCnt_sum_mon').text()));

				//불량율(%) 누계
				$('#faultyRate_sum_mon').text((faultyCntVal/(faultyCntVal+inspectCntVal)*100).toFixed(3)+"%");  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림

				//목표(%) 누계
				$('#targetRate_sum_mon').text("0.2%");
				
				var achvRateVal = parseFloat($('#faultyRate_sum_mon').text())<=0.2?
						"100%":((parseFloat($('#targetRate_sum_mon').text())/parseFloat($('#faultyRate_sum_mon').text()))*100).toFixed(3);

				//달성율(%) 누계
				$('#achvRate_sum_mon').text(achvRateVal+'%');

				
				//누적불량율 누계
				for(var i=0; i<12; i++){
					var faultyTotalMonVal = $('#faultyTotal_'+(i+1)+'_mon').text()==""?"0":parseFloat($('#faultyTotal_'+(i+1)+'_mon').text());
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}
				
				$('#faultyTotal_sum_mon').text(faultyTotalVal+'%');

				
				//*********Chart.js**********
				//불량율 배열
				for(var i=0; i<12; i++){
					var faultyRateArrVal = i<9?$('#faultyRate_0'+(i+1)+'_mon').text():$('#faultyRate_'+(i+1)+'_mon').text();
					
					faultyRateArr[i] = faultyRateArrVal==""?parseFloat("0"):parseFloat(faultyRateArrVal);
				} 

				//목표 배열
				for(var i=0; i<12; i++){
					var targetTotalArrVal = i<9?$('#targetRate_0'+(i+1)+'_mon').text():$('#targetRate_'+(i+1)+'_mon').text();
					
					targetTotalArr[i] = targetTotalArrVal==""?parseFloat("0"):parseFloat(targetTotalArrVal);
				} 
				
				setChart(faultyRateArr,targetTotalArr);
			}
		}); 
		
	};


	//품질경향분석 조회
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

					//TOTAL 불량수량
					$('#faultyTypeTotal_'+value.faultyTypeDate.substring(4,6)+'_mon').text(addCommas(uncomma(value.faultyTypeTotal)));
				});

				//수량 누계
				for(var j=0; j<count; j++){
					for(var i=0; i<12; i++){
						faultyCntValue2 = i<9? $('#'+j+'_faulty_0'+(i+1)+'_mon').text():$('#'+j+'_faulty_'+(i+1)+'_mon').text();
						faultyCntValue = faultyCntValue2==""?"0":faultyCntValue2;
						faultyCntTotalValue += parseInt(faultyCntValue);
					}
					$('#'+j+'_faulty_sum_mon').text(faultyCntTotalValue);
					faultyCntTotalValue=0;
				}

				//불량수량 누계
				for(var i=0; i<12; i++){  
					faultyTotalMonVal2 = i<9?$('#faultyTypeTotal_0'+i+'_mon').text():$('#faultyTypeTotal_'+i+'_mon').text();
					var faultyTotalMonVal = faultyTotalMonVal2==""?"0":faultyTotalMonVal2;
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}

				$('#faultyTypeTotal_sum_mon').text(faultyTotalVal);
			}
		}); 
	};

	//누적 유형별 점유율
	function c(){
		$.ajax({
			url  : "<c:url value='mm/faultyTypeList2'/>",
			type : "GET",
			data : {
				'faultyTypeDate' : year
			},
			success  : function(res){
				let data = res.data;
				var html="";
				var html2="";
				
				faultyTypeQtyCode = [];
				faultyTypeRateCode = [];

				if(res.result=="ok"){
					for(var i=0; i<res.listSize; i++){
						var json = new Object();
						
						json.key = data[i].faultyTypeSeq;
						json.value = data[i].faultyTypeQty;
						faultyTypeQtyCode.push(json);
					}

					for(var i=0; i<res.listSize; i++){
						var json2 = new Object();
						
						json2.key = data[i].faultyTypeSeq;
						json2.value = data[i].faultyTypeRate;
						faultyTypeRateCode.push(json2);
					}

					
					//누적 유형별 점유율 불량수량
					$.each(faultyTypeQtyCode,function(key,value){
						html += '<td class="text-right"><span id="'+value.key+'_qty">'+value.value+'</td>';
					});

					//누적 유형별 점유율 불량점유율
					$.each(faultyTypeRateCode,function(key,value){
						html2 += '<td class="text-right"><span  id="'+value.key+'_rate">'+value.value+'%'+'</td>';
					});
				}else{
					var colspanCount = $('#completeAccumMonitorTable thead th').length-1;
					
					html += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
					html2 += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
				}
				

				$('#completeAccumMonitorTable > #dataList').append(
						'<tr><th style="text-align:center;">발생수량</th>'
						+ html
						+'</tr>'
						+'<tr><th style="text-align:center;">점유율</th>'
						+ html2
						+'</tr>');


				
				//*********Chart.js**********
				//발생수량 배열
				for(var i=0; i<count; i++){
					faultyTypeQtyArr[i] = $('#'+i+'_qty').text()==""?parseFloat("0"):parseFloat($('#'+i+'_qty').text());
				} 
				
				//점유율 배열
				for(var i=0; i<count; i++){
					faultyTypeRateArr[i] = $('#'+i+'_rate').text()==""?parseFloat("0"):parseFloat($('#'+i+'_rate').text());
				} 

				setChart2(faultyTypeQtyArr,faultyTypeRateArr);

				
			}
		})
	}

	
	
	//***********************Chart.js**************************
	function setChart(arr1,arr2){
		
		var lineChart = new Chart(ctx,{
			type : 'bar',
			data : {
				labels:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
				datasets: [
					{
						type : 'bar',
						label:'불량율(%)',
						data  : arr1,
						backgroundColor:'#FD9644',
						borderColor:'#FD9644',
						borderWidth:4,
						//lineTension:0,
						fill :false
					},
					{
						type : 'line',
						label:'목표(%)',
						data  : arr2,
						backgroundColor:'#4B7BEC',
						borderColor:'#4B7BEC',
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
							max:10,
							min:0,
							stepSize:5,
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
	

	function setChart2(arr1,arr2){
		
		var lineChart2 = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:[faultyTypeArr[0],faultyTypeArr[1],faultyTypeArr[2],faultyTypeArr[3],faultyTypeArr[4],faultyTypeArr[5],faultyTypeArr[6],faultyTypeArr[7]],
				datasets: [
					{
						type : 'bar',
						label:'발생수량',
						data  : arr1,
						backgroundColor:'#0DD186',
						borderColor:'#0DD186',
						borderWidth:4,
						lineTension:0,
						fill :false
					},
					{
						type : 'bar',
						label:'점유율',
						data  : arr2,
						backgroundColor:'#EB4933',
						borderColor:'#EB4933',
						borderWidth:4,
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
							fontSize: 11
						},
						gridLines:{
							color: '#A4A4A4',
							lineWidth: 1
						}
					}],
					yAxes : [{
						//stacked:true,
						ticks:{
							max:10,
							min:0,
							stepSize:2,
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
						fontColor:'#FFFFFF',
						fontSize : 14
					},
					display:true
				}
			}
		});
		
	}
	//***********************Chart.js**************************
	
	
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
