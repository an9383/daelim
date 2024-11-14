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
				<li class="breadcrumb-item active">수입검사현황(월별)</li>
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
				   <div class="chart-container1" style="width:auto; height:299px; border:1px solid #ddd; 
						padding:10px; border-radius:8px; background-color: #2C2B40; ">
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
				    <table id="inspectAccumMonitorTable" class="table table-bordered">
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
	let currentHref = "mmsc0060";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","수입검사현황(월별)");
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var year = serverDateTo.substring(0,4);
	var preInWhsQtyTB;
	var faultyCntTB;
	var faultyRateTB;
	var targetRateTB;
	
	var value2Transf;
	var preInWhsQtySum=0;
	var faultyCntSum=0;
	var faultyRateSum=0;
	var targetRateSum=0;
	var faultyTotalVal=0;
	var quantityTotalValue=0;
	var quantityValue=0;
	var quantityValue2=0;
	var faultyTotalMonVal2 = 0;
	
	var faultyRateArr = [];
	var targetTotalArr =[];
	var faultyTypeRateArr=[];
	
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

	var faultyTypeQtyCode = new Array(); //불량수량
	var faultyTypeRateCode = new Array(); //불량점유율

	
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
		preInWhsQtySum=0;
		pairCntSum=0;
		faultyCntSum=0;
		faultyRateSum=0;
		targetRateSum=0;
		faultyTotalVal=0;
		
		//원인별 불량누적현황
		faultyTypeTotalVal=0;
		faultyRateTotalVal=0;
		//faultyTypeRateArr=[];
		
		$('#inspectAccumMonitorTable > #dataList > tr').remove();
		
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
					'monPriType' : '001'
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
			
			rowData.monPriType = '001';
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
	
	//불량율 현황
	
	//단위(KG)
	kg = '<tr><th style="text-align:center;">단위(KG)</th>'
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
		+'<td class="text-right"><span class="kg" id=""></td></tr>'
		
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

	//불량수량 TB
	faultyQtyTB = '<tr><th style="text-align:center;">불량수량</th>'
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

	//목표(%) TB
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

	//불량누계 TB
	faultyTotalTB = '<tr><th style="text-align:center;">불량누계</th>'
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


	//수입검사현황(월별) 테이블	
	$('#inspectMonitorTable > #dataList').append(kg+preInWhsQtyTB+faultyQtyTB+faultyRateTB+targetRateTB)	
	
	
	$.each(inspectDesc,function(key,value){
		
	$('#inspectMonitorTable > #dataList').append(
			'<tr><th style="text-align:center;">'+value.value+'</th>'
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
	 	)
	});

		
	$('#inspectMonitorTable > #dataList').append(faultyTotalTB);


	//품질경향분석 조회
	function a(){
		$.ajax({
			url : "<c:url value='qm/qualityTrendAnlyList' />",
			type : "GET",
			data : {
				'qcObjYear' : year
				},
			success : function(res){
				let data = res.data;
	
				$.each(data,function(key,value){
					$.each(value,function(key2,value2){
						
						value2Transf = (key2=="preInWhsQty"||key2=="faultyCnt")?addCommas(value2):value2;
						$('#'+key2+"_"+value.qcObjMon+"_mon").text(value2Transf);
	
						switch(key2){
						case "preInWhsQty" : 
							preInWhsQtySum+=parseInt(value2);
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
						

					});
				});

				//*********누계**********
				
				//입고수량 누계
				$('#preInWhsQty_sum_mon').text(addCommas(uncomma(preInWhsQtySum)));
	
				//불합격수량 누계
				$('#faultyCnt_sum_mon').text(addCommas(uncomma(faultyCntSum)));
	
				var faultyCntVal = parseFloat($('#faultyCnt_sum_mon').text());
				var preInWhsQtyVal = parseFloat(uncomma($('#preInWhsQty_sum_mon').text()))==0?1:parseFloat(uncomma($('#preInWhsQty_sum_mon').text()));
	
				//불량율(%) 누계
				$('#faultyRate_sum_mon').text((faultyCntVal/preInWhsQtyVal).toFixed(3)+"%");  //불합격수량/입고수량 * 100(백분율계산), 소수점4번째에서 반올림
	
				//목표(%) 누계
				$('#targetRate_sum_mon').text("0.2%");


				//*********Chart.js**********
				//불량율 배열
				for(var i=0; i<12; i++){
					faultyRateArr[i] = $('#faultyRate_'+(i+1)+'_mon').text()==""?parseFloat("0"):parseFloat($('#faultyRate_'+(i+1)+'_mon').text());
				} 

				//목표 배열
				for(var i=0; i<12; i++){
					targetTotalArr[i] = $('#targetRate_'+(i+1)+'_mon').text()==""?parseFloat("0"):parseFloat($('#targetRate_'+(i+1)+'_mon').text());
				} 
				
				setChart(faultyRateArr,targetTotalArr);
				
			}
		}); 
	};

	//원인별 불량누적현황 조회
	function c(){	
		$.ajax({
			url : "<c:url value='qm/faultyStatusList' />",
			type : "GET",
			data : {
				'faultyTypeDate' : year
				},
			success : function(res){
				let data = res.data;

				$.each(data,function(key,value){
					$('#'+value.faultyTypeSeq+"_quantity_"+value.faultyTypeDate.substring(4,6)+"_mon").text(addCommas(value.faultyTypeQty));

					//TOTAL 불량수량
					$('#faultyTotal_'+value.faultyTypeDate.substring(4,6)+'_mon').text(addCommas(uncomma(value.faultyTypeTotal)));
				});

				//수량 누계
				for(var j=0; j<count; j++){
					for(var i=0; i<12; i++){
						quantityValue2 = i<9?$('#'+j+'_quantity_0'+(i+1)+'_mon').text():$('#'+j+'_quantity_'+(i+1)+'_mon').text();
						quantityValue = quantityValue2==""?"0":uncomma(quantityValue2);
						quantityTotalValue += parseInt(quantityValue);
					}
					$('#'+j+'_quantity_sum_mon').text(addCommas(quantityTotalValue));
					quantityTotalValue=0;
					
				}
				
				//불량수량 누계
				for(var i=0; i<12; i++){  
					faultyTotalMonVal2 = i<9?$('#faultyTotal_0'+i+'_mon').text():$('#faultyTotal_'+i+'_mon').text();
					var faultyTotalMonVal = faultyTotalMonVal2==""?"0":uncomma(faultyTotalMonVal2);
					faultyTotalVal += parseFloat(faultyTotalMonVal);
				}

				$('#faultyTotal_sum_mon').text(addCommas(faultyTotalVal));


			}
		}); 
	};

	

	//누적 유형별 점유율
	function b(){
		$.ajax({
			url  : "<c:url value='mm/faultyTypeList'/>",
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
						html += '<td class="text-right"><span id="'+value.key+'_qty">'+addCommas(value.value)+'</td>';
					});

					//누적 유형별 점유율 불량점유율
					$.each(faultyTypeRateCode,function(key,value){
						html2 += '<td class="text-right"><span  id="'+value.key+'_rate">'+value.value+'%'+'</td>';
					});
				}else{
					var colspanCount = $('#inspectAccumMonitorTable thead th').length-1;
					
					html += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
					html2 += '<td colspan="'+colspanCount+'"class="text-center"><span>데이터가 없습니다.</td>';
				}
				

				$('#inspectAccumMonitorTable > #dataList').append(
						'<tr><th style="text-align:center;">불량수량</th>'
						+ html
						+'</tr>'
						+'<tr><th style="text-align:center;">불량점유율</th>'
						+ html2
						+'</tr>');


				
				//*********Chart.js**********
				//점유율 배열
				for(var i=0; i<count; i++){
					faultyTypeRateArr[i] = $('#'+i+'_rate').text()==""?parseFloat("0"):parseFloat($('#'+i+'_rate').text());
				} 

				setChart2(faultyTypeRateArr);
				
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

	function setChart2(arr){
		
		var lineChart2 = new Chart(ctx2,{
			type : 'bar',
			data : {
				labels:[faultyTypeArr[0],faultyTypeArr[1],faultyTypeArr[2],faultyTypeArr[3],faultyTypeArr[4],faultyTypeArr[5],faultyTypeArr[6]],
				datasets: [
					{
						type : 'bar',
						label:'점유율',
						data  : arr,
						backgroundColor:'#0DD186',
						borderColor:'#0DD186',
						borderWidth:4,
						//lineTension:0,
						fill :false
					},
				]
			},
			options:{
				maintainAspectRatio :false,
				scales:{
					xAxes : [{
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
						fontColor:'#FFFFFF',
						fontSize:14
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
