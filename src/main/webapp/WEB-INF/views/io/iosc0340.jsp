<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 자재출고조회 모달 시작 -->
	<div class="modal fade" id="outWhsAdmPopupModal" tabindex="-1" role="dialog" aria-labelledby="outWhsAdmPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="outWhsAdmPopupLabel">자재출고조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive">
						<table id="outWhsAdmPopupTable" class="table table-sm table-bordered">
							<thead>
								<tr>
									<th class="text-center">외주사</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">소요량</th>
									<th class="text-center">필요수량</th>
									<th class="text-center">재고수량</th>
									<th class="text-center">부족수량</th>
									<th class="text-center">상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 자재출고조회 모달 끝 -->
	<!-- 창고조회 모달 시작 -->
	<div class="modal fade" id="locationPopupModal" tabindex="-1" role="dialog" aria-labelledby="locationPopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="locationPopupLabel">창고정보조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			      	<hr class="text-secondary">	         
		                <table id="locationPopupTable" class="table table-bordered">
		                	<colgroup>
								<col width="12%">
								<col width="20%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="12%">
								<col width="20%">
							</colgroup>	
		                    <thead class="thead-light">
			                    <tr>
			                    	<th>구분</th>
			                    	<th>창고코드</th>
			                    	<th>창고구분</th>
			                    	<th>구역</th>
			                    	<th>위치</th>
			                    	<th>사용여부</th>
			                    	<th>비고</th>
			                    </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 창고조회 모달 끝 -->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">외주관리</a></li>
				<li class="breadcrumb-item active">외주입고(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<div class="left-list m-0" style="width: 9%;">
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
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="outsourcingWhsTable" class="table table-bordered">
							<colgroup>
								<col width="13%">
								<col width="13%">
								<col width="22%">
								<col width="26%">
								<col width="8%">
								<col width="10%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">외주처</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">입고일자</th>
									<th class="text-center">자재출고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>

			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 35%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav();"><i
							class="mdi mdi-close"></i></a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<div class="card-body col-sm-12 p-1 mb-2">
							<input type="number" class="form-control text-right float-left mr-1" id="partPrintCnt" placeholder="매수" style="width:40px;" value="1" disabled>
							<button type="button" class="btn btn-warning float-left mr-1" id="printLargeBarcode" disabled>라벨인쇄</button>
							<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
							<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록/수정</button>
						</div>
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th>외주처</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" id="locationNo">
													<input type="hidden" id="locationCd">
													<input type="hidden" id="areaCd">
													<input type="text" class="form-control" id="locationNm" style="min-width: 100%" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnLocation" onClick="locationSelect('외주처')" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
										<th>발주자</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" id="outWorker" value="${userNumber}">
													<input type="text" class="form-control" id="outWorkerNm" value="${userNm}" style="min-width: 100%" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnOutWorker" onClick="outWorkerSelect()" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>포장수량</th>
										<td><input type="text" class="form-control" id="boxCount" style="text-align:right; min-width: 100%;" onkeyup="numberFormat(this, 'int')"  disabled></td>
										<th>입고수량</th>
										<td><input type="text" class="form-control mr-3" id="inQty" style="border: solid 2px #346cb0;text-align:right; min-width: 100%;" onkeyup="numberFormat(this, 'int')"  disabled></td>
									</tr>
									<tr>
										<td colspan="6">
											<button type="button" class="btn btn-primary" id="btnLotCreate" style="min-width: 100%;" disabled>바코드 생성</button>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<!--하단 등록 부분 상단 버튼 영역-->
						<div class="card-body col-sm-12 p-1">
		                    <div class="input-sub float-left mr-1">
		                  		<div class="form-group input-sub m-0 row">
		                  			<label class="input-label-sm">입고일자</label>
		                   			<input class="form-control" type="date" style="width:97px;" id="batchPreInWhsDate"/>
		                  		</div>
		                  	</div>
		                  	<button type="button" class="btn btn-primary float-left mr-1" id="btnBatchApply" disabled>일괄적용</button>
							<button type="button" class="btn btn-warning float-left mr-1 d-none" id="btnDtlEdit" disabled>수정</button>
							<button type="button" class="btn btn-danger float-left" id="btnDtlDel" disabled>삭제</button>
							<input class="form-control m-0 float-right" type="text" id="dtlTextSearch2" placeholder="입고일자 검색">
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table class="table table-lg table-bordered mb-2" id="inOutWhsAdmTable">
									<colgroup>
										<col width="5%">
										<col width="20%">
										<col width="20%">
										<col width="30%">
										<col width="25%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" id="checkAll" name="checkAll" style="min-width:17px; min-height:17px;"></th>
											<th class="text-center">입고일자</th>
											<th class="text-center">입고수량</th>
											<th class="text-center">BarcodeNo</th>
											<th class="text-center">창고</th>
											<th>입고일자</th> <!-- 숨김 -->
										</tr>
									</thead>
								</table>
							</div>
						</form>
					</div>
					
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
		<!-- Modal Start-->
	<div class="modal modal-alert fade" id="resetModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="resetModal" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
			        <h5 class="modal-title" id="confirmSaveModalLabel">알림</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
		      	</div>
				<div class="modal-body">
					<h6>LOT생성 새로생성/추가 방식을 선택해주세요.</h6>
				</div>
				<div class="modal-footer">
			      	<button type="button" class="btn btn-warning " id="btnLotReset" data-dismiss="modal">새로생성</button>
			      	<button type="button" class="btn btn-warning " id="btnLotAdd" data-dismiss="modal">추가</button>
			      	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			    </div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</div>
<%@include file="../layout/bottom.jsp" %>
<style>
input[type="checkbox"]:focus {
	outline-color : #0078a5;
	outline-style: solid;
	outline-width : 1px;
}
</style>
<script>
	$("#left-width-btn").click(function() {
		$("#left-list").animate({
			width : "55%"
		}, 200);
		$("#arrow-left").animate({
			display : "none"
		}, 200);
		setTimeout(function() {
			outsourcingWhsTable.draw();
			outsourcingWhsTable.draw();
		}, 500);
		state = !state;
	});
	
	$("#left-expand").click(function() {
		$("#left-list").animate({
			width : "90%"
		}, 200);
		setTimeout(function() {
			outsourcingWhsTable.draw();
			outsourcingWhsTable.draw();
		}, 500);
		state = !state;
	});

	let currentHref = "iosc0340";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title", "외주입고(봉제)"); 
	
	uiProc(true);
	const serverDateFrom = "${serverDateFrom}";
	const serverDateTo = "${serverDateTo}";
	const userNumberVal = "${userNumber}";
	const userNmVal = "${userNm}";
	
	let startDate = serverDateFrom;
	let endDate = serverDateTo;
	let batchPreInWhsDateVal = serverDateTo;
	let sideView = 'add';
	let tableIdx = null;
	let tableIdx2 = null;
	let poNoVal = '';
	let poSeqVal = '';	
	let inSeq = '';
	let inSlipNo = '';
	let itemSeqVal = '';
	let itemCdVal = '';
	let itemGubunVal = '';
	let ordQtyVal = 0;
	let printArray = new Array();
	let dealCorpCdVal = '';
	let locationNo = '';
	let locationCd = '';
	let locationNm = '';
	let areaCd = '';
	let areaNm = '';
	let floorCd = '';
	let outCorpCdVal = '';
	let outCorpLocNoVal = ''; //외주창고
	let mainTrData = ''; // 메인 테이블 데이터
	
	$('input[name=preInWhsDate]').val(serverDateTo);
	$('#batchPreInWhsDate').val(serverDateTo);
	
	//공통코드 처리 시작		
 	let inspectYnCode = new Array(); // 상태유무
	<c:forEach items="${inspectYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspectYnCode.push(json);
	</c:forEach> 

	let payYnCode = new Array(); // 상태유무
	<c:forEach items="${payYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	payYnCode.push(json);
	</c:forEach> 
	//공통코드 처리 끝		
	
	$('#saveBtnModalY').on('click', function(){
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#inQty').attr('disabled', true);
		$('#inQty').val('');
		$('#btnLotCreate').attr('disabled', true);
		$('#btnDtlEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', true);
		$('#btnBatchApply').attr('disabled', true);
		$('#inOutWhsAdmTable').DataTable().ajax.reload();
    });
	
	//메인 테이블
    let outsourcingWhsTable = $('#outsourcingWhsTable').DataTable({
    	dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
        pageLength : 20,
        scrollY : '67vh',
        ajax : {
			url : '<c:url value="/io/outsourcingWhsList"/>',
			type : 'GET',
			data : {
				'startDate' 	: function(){ return startDate.replace(/-/g, ''); },
				'endDate' 		: function(){ return endDate.replace(/-/g,''); },
				'dealCorpCd' 	: function(){ return dealCorpCdVal; },
				'bongjaeCheck' 	: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '외주'이거나 '외주/생산' 인 것만 조회되도로 구현
			},
		},
        columns : [
        	{ data : 'dealCorpNm' }, //외주처
			{ data : 'itemModelNm' }, //차종
			{ data : 'itemCd' }, //품번
			{ data : 'itemNm' }, //품명
			{//입고수량
				data : 'preInWhsQty', className : 'text-right',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '';
					}
				}
			},
			{//입고일자
				data : 'preInWhsDate',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				}
			},
			{//자재출고
				render : function ( data, type, row, meta ) {
					let itemSeq = row['itemSeq'];
					return '<button type="button" class="btn btn-secondary" onclick="outWhsDtlRead(\''+itemSeq+'\',\''+row['outCorpLocNo']+'\');">보기</button>';
				}
			},
		],
		columnDefs: [
		],   
        order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
    });
	
    let html1 = '<div class="row">';
    html1 += '<label class="input-label-sm">입고일자</label><div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="poDateFrom"/>';
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="poDateTo"/>'; 
    html1 += '</div>';   
    html1 += '<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>'
    html1 += '<button type="button" class="btn btn-primary mr-1" id="btnAllList">전체조회</button>'
    html1 += '<button type="button" class="btn btn-primary mr-1" id="btnDealCorpList">외주사 전체조회</button>'
   
    html1 += '</div>';
	
	$('#outsourcingWhsTable_length').html(html1);
	$('#poDateFrom').val(serverDateFrom);
	$('#poDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click', function() {
    	startDate =  $('#poDateFrom').val();
    	endDate =  $('#poDateTo').val();
    	dealCorpCdVal = '';
		$('#outsourcingWhsTable').DataTable().ajax.reload(function(){});
		$('#departmentTable').DataTable().ajax.reload(function(){});
    });	

	//거래처 전체조회 클릭시
	$('#btnDealCorpList').on('click', function() {
		startDate =  "";
    	endDate =  "";
		dealCorpCdVal = dealCorpCdVal;
		$('#outsourcingWhsTable').DataTable().ajax.reload(function(){});
		$('#departmentTable').DataTable().ajax.reload(function(){});
    });
    
	//전체조회버튼 클릭시
	$('#btnAllList').on('click', function() {
		startDate =  "";
    	endDate =  "";
		dealCorpCdVal = '';
		$('#outsourcingWhsTable').DataTable().ajax.reload(function(){});
		$('#departmentTable').DataTable().ajax.reload(function(){});
    });
	
	// 세부 목록 보기
	$('#outsourcingWhsTable tbody').on('click','tr',function() {
		if ( $('#btnSave').attr('class') == 'btn btn-primary float-right' ) {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		if ( $(this).hasClass('selected') ) {
// 			$(this).removeClass('selected');
		} else {
			$('#outsourcingWhsTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		mainTrData = outsourcingWhsTable.row(this).data(); // 메인 테이블 데이터
		
		sideView = "edit";
		
		tableIdx = outsourcingWhsTable.row(this).index();
// 		poNoVal = outsourcingWhsTable.row(this).data().poNo;
// 		poSeqVal = outsourcingWhsTable.row(this).data().poSeq;
// 		ordQtyVal = outsourcingWhsTable.row(this).data().ordQty;
		itemSeqVal = outsourcingWhsTable.row(this).data().itemSeq;
		itemCdVal = outsourcingWhsTable.row(this).data().itemCd;
		itemGubunVal = outsourcingWhsTable.row(this).data().itemGubun;
		locationNo = outsourcingWhsTable.row(this).data().locNo;
		locationCd = outsourcingWhsTable.row(this).data().locCd;
		locationNm = outsourcingWhsTable.row(this).data().locNm;
		areaCd = outsourcingWhsTable.row(this).data().areaCd;
		areaNm = outsourcingWhsTable.row(this).data().areaCdNm;
		floorCd = outsourcingWhsTable.row(this).data().floorNm;
		outCorpCdVal = outsourcingWhsTable.row(this).data().dealCorpCd;	//외주처
		outCorpLocNoVal = outsourcingWhsTable.row(this).data().outCorpLocNo; //외주창고
		
		$('#boxCount').val(rmDecimal(outsourcingWhsTable.row(this).data().boxCount));
		$('#inQty').val('');
		$('#batchPreInWhsDate').val(serverDateTo);
		$('#btnSave').addClass('d-none');
		$('#btnLocation').attr('disabled', true);
		
		$('#locationNo').val(outsourcingWhsTable.row(this).data().outCorpLocNo);
		$('#locationCd').val(outsourcingWhsTable.row(this).data().outCorpLocCd);
		$('#areaCd').val(outsourcingWhsTable.row(this).data().outCorpAreaCd);
		$('#locationNm').val(outsourcingWhsTable.row(this).data().outCorpAreaNm);
		
		$('#outWorker').val(userNumberVal);
		$('#outWorkerNm').val(userNmVal);
		$('#btnOutWorker').attr('disabled', true);
		$('#inQty').attr('disabled', true);
		$('#btnLotCreate').attr('disabled', true);
		$('#btnDtlEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', true);
		$('#btnBatchApply').attr('disabled', true);
		$('#checkAll').prop('checked', false);

		if ( outsourcingWhsTable.row(this).data().poEndDate == "002" ) {
			$('#btnAdd').attr('disabled', true);
			$('#btnDel').attr('disabled', true);
		} else {
			$('#btnAdd').attr('disabled', false);
			$('#btnDel').attr('disabled', false);
		}

		//라벨인쇄 활성화/비활성화
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){
			if ( inOutWhsAdmTable.data().count() > 0 ) {
				$('#partPrintCnt').attr('disabled', false);
				$('#printLargeBarcode').attr('disabled', false);
				$('input[name=printList]').attr('disabled', false);
			} else {
				$('#partPrintCnt').attr('disabled', true);
				$('#printLargeBarcode').attr('disabled', true);
				$('input[name=printList]').attr('disabled', true);
			}
		});

		printArray = [];
	});
	
	//자재출고 팝업 시작
	let outWhsAdmPopupTable;
	function outWhsDtlRead (itemSeq, outCorpLocNo) {
		let inQtyVal = 1;
		itemSeqVal = itemSeq;
		outCorpLocNoVal = outCorpLocNo;
		if (outWhsAdmPopupTable == null || outWhsAdmPopupTable == undefined) {
			outWhsAdmPopupTable = $('#outWhsAdmPopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/io/outBomInputList"/>',
					type : 'GET',
					data : {
						'itemSeq' 		: function(){ return itemSeqVal; },
						'inQty'  		: function(){ return inQtyVal; },
						'locationNo'  	: function(){ return outCorpLocNoVal; },
					},
				},
				rowId : 'matrlUser',
				columns : [
					{//외주사
						data : 'locationNm',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return row['locationNm'];
							} else {
								return '';
							}
						}
					},
					{//품번
						data : 'itemCd'
					},
					{//품명
						data : 'itemNm'
					},
					{//소요량
						data : 'itemConsumpt',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return '';
							}
						},
						'className' : 'text-right'
					},
					{//필요수량
						data : 'needQty',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return '';
							}
						},
						'className' : 'text-right'
					},
					{//재고수량
						data : 'spQty',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return '0';
							}
						},
						'className' : 'text-right'
					},
					{//부족수량
						data : 'lackQty',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return '';
							}
						},
						'className' : 'text-right'
					},
					{//상태
						data : 'inWhsCheck',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								if ( data == '충분' ) {
									return '<span style="color:blue;">충분</span>';
								} else {
									return '<span style="color:red;">부족</span>';
								}
							} else {
								return '';
							}
						}
					},
				],
				columnDefs : [ 
					{"defaultContent" : "-","targets" : "_all","className" : "text-center"},
				],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
			
		    let html1 = '<div class="row">';
			
		    html1 += '<label class="input-label-sm">입고수량</label><div class="form-group input-sub mr-1 row">';
		    html1 += '<input class="form-control text-right" style="width:97px;" type="text" id="inQtyBox" onkeyup="numberFormat(this, \'int\')" value="1"/>';
		    html1 += '</div>';
		    html1 += '</div>';
			
			$('#outWhsAdmPopupTable_length').html(html1);
		} else {
			$('#outWhsAdmPopupTable').DataTable().ajax.reload(function(){});
		}
		
		$('#inQtyBox').on('keyup', function(){
			inQtyVal = $('#inQtyBox').val().replace(/,/g, '');
			$('#outWhsAdmPopupTable').DataTable().ajax.reload(function(){});
		});
		
		$('#outWhsAdmPopupModal').modal('show');
 	}
	
	//전체선택클릭
	$('#checkAll').on('click',function(){
		if ( $('#checkAll').prop("checked") ) {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item) {
				if ( !$(this).find('input:checkbox[name=printList]').is(':disabled') ) {
					$(this).find('input:checkbox[name=printList]').prop("checked", true);
				}
			});
		} else {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input:checkbox[name=printList]').is(':disabled') ) {
					$(this).find('input:checkbox[name=printList]').prop("checked", false);
				}
			});
		}
	});
	

	//등록/수정 버튼 클릭 - 사실 명칭만 수정이지 수정 기능은 없음. 등록 기능과 삭제 버튼 활성화하는 버튼임.
	$('#btnAdd').on('click',function(){
		if ( sideView != "edit" ) {
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}

		$('#btnLocation').attr('disabled', false);
		$('#btnOutWorker').attr('disabled', false);
		$('#inQty').attr('disabled', false);
		$('#btnLotCreate').attr('disabled', false);
		$('#btnDtlEdit').attr('disabled', false);
		$('#btnDtlDel').attr('disabled', false);
		$('#btnBatchApply').attr('disabled', false);
		$('#boxCount').attr('disabled', false);
		$('input:checkbox[name=printList]').attr("disabled", false);
	});
	
	//lot생성 버튼 클릭
	$('#btnLotCreate').on('click', function(){
		if ( $('#locationNo').val() == "" ) {
			toastr.warning("외주처를 선택해주세요.");
			$('#btnLocation').focus();
			return false;
		}
		if ( $('#outWorker').val() == "" ) {
			toastr.warning("발주자를 선택해주세요.");
			$('#btnOutWorker').focus();
			return false;
		}
		if ( $('#boxCount').val()*1 <= 0 ) {
			toastr.warning("포장수량을 확인해주세요.");
			$('#boxCount').focus();
			return false;
		}
		if ( $('#inQty').val()*1 <= 0  ) {
			toastr.warning("입고수량을 확인해주세요.");
			$('#inQty').focus();
			return false;
		}
		
		$('#resetModal').modal('show');
	});
	

	//LOT생성 새로고침 버튼 클릭시
	$('#btnLotReset').on('click',function(){
		
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){
			packQtyVal = $('#inQty').val().replace(/,/g,'');		//입고수량
			boxCountVal = $('#boxCount').val().replace(/,/g,'');	//포장수량
			quotVal = parseInt(packQtyVal/boxCountVal);	//몫
			remainVal = packQtyVal%boxCountVal;			//나머지
			
			console.log("몫:"+quotVal+"/ 나머지:"+remainVal);

			for(var i=0; i<quotVal; i++){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : boxCountVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: '',
					'preInWhsDate' : '',
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);
			}

			//나머지가 0이 아닐경우
			if ( remainVal != 0 ) {
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' 	: remainVal,
					'statusCd' 		: 'S',
					'inSeq' 		: '',
					'lotNo' 		: '',
					'preInWhsDate' 	: '',
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);
			}
		});

		$('#btnSave').removeClass('d-none');
	});
	
	//LOT생성 추가 버튼 클릭시
	$('#btnLotAdd').on('click',function(){
		packQtyVal = $('#inQty').val().replace(/,/g,'');		//입고수량
		boxCountVal = $('#boxCount').val().replace(/,/g,'');	//포장수량
		quotVal = parseInt(packQtyVal/boxCountVal);				//몫
		remainVal = packQtyVal%boxCountVal;						//나머지
		console.log("몫: " + quotVal + "/ 나머지: " + remainVal);

		for ( var i=0; i<quotVal; i++ ) {
			$('#inOutWhsAdmTable').DataTable().row.add({
				'preInWhsQty' 	: boxCountVal,
				'statusCd' 		: 'S',
				'inSeq' 		: '',
				'lotNo' 		: '',
				'preInWhsDate' 	: '',
				'locationNo' 	: locationNo,
				'locationCd' 	: locationCd,
				'locationNm' 	: locationNm,
				'areaCd' 		: areaCd,
				'areaNm' 		: areaNm,
				'floorCd' 		: floorCd,
			}).draw(false);	
		}

		//나머지가 0이 아닐경우
		if ( remainVal != 0 ) {
			$('#inOutWhsAdmTable').DataTable().row.add({
				'preInWhsQty' 	: remainVal,
				'statusCd' 		: 'S',
				'inSeq' 		: '',
				'lotNo' 		: '',
				'preInWhsDate' 	: '',
				'locationNo' 	: locationNo,
				'locationCd' 	: locationCd,
				'locationNm' 	: locationNm,
				'areaCd' 		: areaCd,
				'areaNm' 		: areaNm,
				'floorCd' 		: floorCd,
			}).draw(false);
		}

		$('#btnSave').removeClass('d-none');
	});
	
	// 세부목록
	let inOutWhsAdmTable = $('#inOutWhsAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>",
		language : lang_kor,
		destroy : true,
		paging : false,
		searching: true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: "50vh",
		ajax : {
			url : '<c:url value="io/preInOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'itemSeq' 		: function(){ return itemSeqVal; },
				'dealCorpCd' 	: function(){ return outCorpCdVal; },
				'startDate' 	: function(){ return startDate.replace(/-/g, ''); },
				'endDate' 		: function(){ return endDate.replace(/-/g,''); },
			},
		},
		columns : [
			{//체크박스
				data : 'barcodeNo', 'className' : 'text-center',
				render: function(data, type, row, meta) {
					if (data != null && data != "") {
						return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="printList" style="min-width:17px; min-height:17px;">';
					} else {
						return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="printList" style="min-width:17px; min-height:17px;">';
					}
				}
			},
			{//입고일자
				data : 'preInWhsDate',
				render: function(data, type, row, meta) {	
					if(data!=null && data!=""){
						return '<input class="form-control" type="date" id="preInWhsDate'+meta.row+'" name="preInWhsDate" value="'+moment(data).format("YYYY-MM-DD")+'" style="text-align:center;" disabled/>'  
					} else{
						return '<input class="form-control" type="date" id="preInWhsDate'+meta.row+'" name="preInWhsDate" value="'+serverDateTo+'" style="text-align:center;"/>'  
					}
				}		   
			},
			{//입고수량
				data : 'preInWhsQty',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control number-float0" name="preInWhsQty" value="'+rmDecimal(data)+'" style="text-align:right;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control number-float0" name="preInWhsQty" value="0" style="text-align:right;">';	
					}		    			
	    		}
			},
			{//BarcodeNo
				data : 'barcodeNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
	    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="text-align:center;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="barcodeNo" value="" placeholder="처리중" style="text-align:center;" disabled>';	
					}	
				},
			},
			{//창고
				data : 'locationNo',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="locationCd" value="'+row['locationCd']+'">';
						html += '<input type="hidden" class="form-control" name="areaCd" value="'+row['areaCd']+'">';
						html += '<input type="hidden" class="form-control" name="floorCd" value="'+row['floorCd']+'">';
						html += '<input type="hidden" class="form-control" name="locationNo" value="'+row['locationNo']+'">';
						html += '<input type="text" class="form-control" name="locationData" value="'+row['locationNm']+"/"+row['areaNm']+"/"+row['floorCd']+'" disabled>';
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationSelect(\'창고\')" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;	
					} else {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="locationCd" value="">';
						html += '<input type="hidden" class="form-control" name="areaCd" value="">';
						html += '<input type="hidden" class="form-control" name="floorCd" value="">';
						html += '<input type="hidden" class="form-control" name="locationNo" value="">';
						html += '<input type="text" class="form-control" name="locationData" value="" disabled>';
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationSelect(\'창고\')">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;	
					}	
				},
			},
			{ data : 'preInWhsDate', "visible" : false }, //입고일자
		],  
		columnDefs: [],
		drawCallback: function() {
		    $('#inOutWhsAdmTable_filter').addClass('d-none');
		},
        order: [
	        
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	}); 
	
	//인쇄항목 선택
	$(document).on('change', 'input:checkbox[name=printList]', function() {
		if ( $(this).is(':checked') ) {
	    	var obj = new Object();
	    	obj.code = outsourcingWhsTable.row('.selected').data().partCd;
	    	obj.rev = outsourcingWhsTable.row('.selected').data().partRev;
	    	obj.item = outsourcingWhsTable.row('.selected').data().partNm;
	    	obj.spec = outsourcingWhsTable.row('.selected').data().partSpec;
	    	obj.date = inOutWhsAdmTable.row($(this).parents().parents()).data().preInWhsDate;
	    	obj.cnt = inOutWhsAdmTable.row($(this).parents().parents()).data().preInWhsQty;
	    	obj.barcodeNo = inOutWhsAdmTable.row($(this).parents().parents()).data().barcodeNo;
    		printArray.push(obj);
	    } else {
		    var barcodeNo = inOutWhsAdmTable.row($(this).parents().parents()).data().barcodeNo;
		    if(printArray.findIndex(i => i.barcodeNo == barcodeNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.barcodeNo == barcodeNo),1);
			}
		}
	});
	
	//입고일자 일괄적용 버튼 클릭
	$('#btnBatchApply').on('click', function(){
		if ( $('#batchPreInWhsDate').val() == "" ) {
			toastr.warning("입고일자를 선택해주세요.");
			return false;
		} else {
			batchPreInWhsDateVal = $('#batchPreInWhsDate').val();
		}
		if ( !$('input[name=printList]').is(':checked') ) {
			toastr.warning("일괄적용할 발주항목을 체크해주세요.");
			return false;
		}

		let check = false;
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=printList]').is(":checked") && !$(this).find('td input[name=preInWhsDate]').attr('disabled') ) {
				$(this).find('td input[name=preInWhsDate]').val(batchPreInWhsDateVal);
				check = true;
			}
		});
		
		if (check) { $('#btnSave').removeClass('d-none'); }
	});
	
	//수정 버튼 클릭
	$('#btnDtlEdit').on('click', function() {
		let check = true;
		
		if (sideView != 'edit') {
			toastr.warning("수정할 발주항목을 선택해주세요.");
			check = false;
			return false;
		}
		if ( !$('input[name=printList]').is(':checked') ) {
			toastr.warning("수정할 발주항목을 체크해주세요.");
			check = false;
			return false;
		}
		
		//1. 선택한 항목들이 수정할 수 있는 것인지 확인
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=printList]').is(":checked") && check ) {
				let data = inOutWhsAdmTable.row(this).data();
				inSlipNo = data.inSlipNo; //입고전표번호
				
				if ( inSlipNo != '' && inSlipNo != null ) {
					if ( data.statusCd == "L" ) {
						toastr.warning("이미 승인되어 수정 할 수 없습니다.");
						$(this).find('td input[name=printList]').focus();
						check = false;
					}
				} else {
					toastr.warning('입고등록되지 않은 바코드번호입니다.');
					$(this).find('td input[name=printList]').focus();
					check = false;
				}
			}
		});
		
		//2. 확인된 항목들 수정 가능하도록 실행
		if (check) {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=printList]').is(":checked") ) {
					let data = inOutWhsAdmTable.row(this).data();
					
					if ( data.statusCd == "S" ) {
						$('input[name=preInWhsDate]').eq(index).attr('disabled', false);
						$('input[name=preInWhsQty]').eq(index).attr('disabled', false);
						$('button[name=btnLocationData]').eq(index).attr('disabled', false);
					} else {
						$('button[name=btnLocationData]').eq(index).attr('disabled', false);
					}
				}
			});
			
			$('#btnSave').removeClass('d-none');
		}
	});

	//삭제 버튼 클릭
	$('#btnDtlDel').on('click', function() {
		if ( sideView != 'edit' ) {
			toastr.warning("삭제할 발주항목을 선택해주세요.");
			return false;
		}
		if ( !$('input[name=printList]').is(':checked') ) {
			toastr.warning("삭제할 입고항목을 체크해주세요.");
			return false;
		}
		
		//아직 바코드가 생성되지 않은 항목은 행 삭제만 진행 (복구 불가능하다는 경고문 띄워즐 필요 없음.)
		let rowsToDelete = []; // 체크된 행을 저장할 배열
		let allRowsWithoutBarcodeNo = true;
		
		$('#inOutWhsAdmTable tbody tr').each(function(index, item) {
		    if ($(this).find('td input[name=printList]').is(":checked")) {
		        let data = inOutWhsAdmTable.row(this).data();
		        if (data.barcodeNo) {
		            // data.barcodeNo가 있는 경우, 삭제할 행 없음
		            allRowsWithoutBarcodeNo = false;
		            return false; // 루프 종료
		        }
		        // data.barcodeNo가 없는 경우, 삭제할 행을 배열에 추가
		        rowsToDelete.push(this);
		    }
		});
		
		// 모든 행에서 data.barcodeNo 값이 없으면 테이블에서 체크된 행 모두 삭제
		if (allRowsWithoutBarcodeNo) {
		    inOutWhsAdmTable.rows(rowsToDelete).remove().draw();
		    return false;
		}
		////
		
		$('#deleteSmallModal').modal('show');
	});
	
	
	//삭제 버튼 클릭
	$('#btnDeleteY').on('click', function() {
		let delRow = [];
		let delcount = 0;
		let check = true;
		
		//2. 확인한 항목들 삭제
		$('#my-spinner').show();
		setTimeout(function(){
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=printList]').is(":checked") ) {
					let data = inOutWhsAdmTable.row(this).data();
					let poNoVal = data.poNo;
					let poSeqVal = data.poSeq;
					let inSlipNoVal = data.inSlipNo;
					let inSlipSeqVal = data.inSlipSeq;
					let barcodeNoVal = data.barcodeNo;
					let preInWhsQtyVal = data.preInWhsQty; //입고수량
	
					if ( inSlipNoVal != '' && inSlipNoVal != null ) {
						$.ajax({
							url : '<c:url value="io/outscWhsDelete"/>',
							type : 'GET',
							async : false,
							data : {
								'poNo' 			: function(){ return poNoVal; },
								'poSeq' 		: function(){ return poSeqVal; },
								'inSlipNo' 		: function(){ return inSlipNoVal; },
								'inSlipSeq' 	: function(){ return inSlipSeqVal; },
								'barcodeNo' 	: function(){ return barcodeNoVal; },
								// TB_OUT_WHS_ADM - USE_QTY 수정
								'owaVoItemSeq' 		: function(){ return itemSeqVal; },
								'owaVoLocationNo' 	: function(){ return outCorpLocNoVal; },
								'owaVoInQty'		: function(){ return preInWhsQtyVal; },
								////
							},
							success : function(res) {
								if ( res.result == "ok" ) {
									delRow[delcount] = index;
									delcount++;
									toastr.success(res.message);
								} else if (res.result == "fail") {
									toastr.warning(res.message);
								} else {
								    toastr.error(res.message);
								}
								$('#my-spinner').hide();
							}
						});
					} else {
						$('#my-spinner').hide();
						delRow[delcount] = index;
						delcount++;
					}
				} else {
					$('#my-spinner').hide();
				}
			});
				
			if ( delRow.length > 0 ) {
				$('#checkAll').prop('checked', false);
				$('#inOutWhsAdmTable').DataTable().rows(delRow).remove().draw(); //여러 행 삭제
			}
			
			$('#outsourcingWhsTable').DataTable().ajax.reload(function(){});
			$('#deleteSmallModal').modal('hide');
		},150);
	});


	// 저장 처리
	$('#btnSave').on('click', function() {
		let check = true;
		let dataArray = new Array();
		
		let sumInQtyVal = 0; //등록할 입고수량 계산
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			if ( !$(this).find('td input[name=preInWhsDate]').is(':disabled') ) {
				sumInQtyVal += parseInt($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
			}
		});
		
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			if ( inOutWhsAdmTable.data().count() != 0 ) {
				if ( !$(this).find('td input[name=preInWhsDate]').is(':disabled') ) {
					if ( $(this).find('td input[name=locationNo]').val() == "" ) {
						toastr.warning('창고를 입력해 주세요.');
						$(this).find('td button[name=btnLocationData]').focus();
						check = false;
						return false;
					}

					let rowData = new Object();
					rowData.inSlipNo = inOutWhsAdmTable.row(index).data().inSlipNo==null||inOutWhsAdmTable.row(index).data().inSlipNo=="undefined" ? "" : inOutWhsAdmTable.row(index).data().inSlipNo;
					rowData.inSlipSeq = inOutWhsAdmTable.row(index).data().inSlipSeq==null||inOutWhsAdmTable.row(index).data().inSlipSeq=="undefined" ? "" : inOutWhsAdmTable.row(index).data().inSlipSeq;
					rowData.inSeq = inOutWhsAdmTable.row(index).data().inSeq==null||inOutWhsAdmTable.row(index).data().inSeq=="undefined" ? "" : inOutWhsAdmTable.row(index).data().inSeq; 
					rowData.itemSeq = itemSeqVal;
					rowData.itemCd = itemCdVal;
					rowData.itemGubun = itemGubunVal;
					rowData.ordQty = $(this).find("td input[name=preInWhsQty]").val().replace(/,/g,'');
					rowData.preInWhsDate = $(this).find("td input[name=preInWhsDate]").val().replace(/-/g,'');
					rowData.preInWhsQty = $(this).find("td input[name=preInWhsQty]").val().replace(/,/g,'');
					rowData.lotNo = '';
					rowData.dealCorpCd = $('#areaCd').val();
					rowData.mainChargr = $('#outWorker').val();
					rowData.locationCd = $(this).find("td input[name=locationCd]").val();
					rowData.areaCd = $(this).find("td input[name=areaCd]").val();
					rowData.floorCd = $(this).find("td input[name=floorCd]").val();
					rowData.locationNo = $(this).find("td input[name=locationNo]").val();
					rowData.outLocationNo = $('#locationNo').val();
					rowData.outLocationCd = $('#locationCd').val();
					rowData.sumInQty = sumInQtyVal;
					
			        dataArray.push(rowData);
			        console.log(rowData);
				}
			} else {
				toastr.warning('입고수량을 입력해주세요.');	
				$(this).find("td #inQty").focus();
				check = false;
				return false;
			}
		});
		
		if ( (dataArray == null || dataArray == '') && check ) {
			toastr.warning('바코드를 생성해주세요.');	
			return false;
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="io/outscWhsCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(res){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						sideView = 'add';
						$('#outsourcingWhsTable').DataTable().ajax.reload(function(){});
						$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){});
						$('#inQty').attr('disabled', true);
						$('#boxCount').attr('disabled', true);
						$('#btnLotCreate').attr('disabled', true);
						$('#btnAdd').attr('disabled', false);
						$('#btnDtlEdit').attr('disabled', true);
						$('#btnDtlDel').attr('disabled', true);
						$('#checkAll').prop('checked', false);
						$('#btnBatchApply').attr('disabled', true);
						$('#btnSave').addClass('d-none');
						
						toastr.success('저장되었습니다.');
					} else if ( res.result == "fail" ) {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
					$('#btnAddConfirm').removeClass('d-none');		
				}
			});
		}
		
	});
	
	function uiProc(flag) {
		$('input[name=srLot]').attr('disabled',flag);
		$('input[name=custItemCd]').attr('disabled',flag);
		$('input[name=custItemNm]').attr('disabled',flag);
		$('input[name=preInWhsQty]').attr('disabled',flag);
		$('input[name=inWhsDesc]').attr('disabled',flag);
		$("select[name=preInStatus]").attr("disabled", flag);
		$("button[name=inWhsDateFromCalendar]").attr("disabled",flag);
	}
	
	let popupCheckVal = '';
	// 외주처/창고 팝업 시작
	let locationPopupTable;
	function locationSelect(popupCheck) {
		popupCheckVal = popupCheck;
		if (locationPopupTable != null && locationPopupTable != 'undefined') {
			locationPopupTable.destroy();
		}
		
		if ( popupCheckVal == '외주처' ) {
			locationPopupTable = $('#locationPopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
				async : false,
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/locationAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun'		: function(){ return '002'; },
						'locCd' 		: function(){ return '017'; },
						'outscCheck' 	: function(){ return itemSeqVal; },
					},
				},
				columns : [
					{//구분
						data : 'mainGubunNm' 
					},
					{//창고코드
						data : 'locNo',
							render : function(data, type, row, meta){
								if(data!=null){
									return data;
								} else{
									return '-';
								}
							}
					}, 
					{//창고구분
						data : 'locNm'
					}, 
					{//구역
						data : 'areaNm'
					}, 
					{//위치
						data : 'floorNm'
					}, 
					{//사용여부
						data : 'useYnNm'
					}, 
					{//비고
						data : 'locDesc'
					},
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
		} else if (popupCheckVal == '창고') {
			locationPopupTable = $('#locationPopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
				async : false,
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/locationAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : '002',
					},
				},
				columns : [ 
					{
						data : 'mainGubunNm' 
					},
					{
						data : 'locNo' , 
							render : function(data, type, row, meta){
								if(data!=null){
									return data;
								} else{
									return '-';
								}
							}
					}, 
					{
						data : 'locNm'
					}, 
					{
						data : 'areaNm'
					}, 
					{
						data : 'floorNm'
					}, 
					{
						data : 'useYnNm'
					}, 
					{
						data : 'locDesc'
					},  
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
		}
		
		$('#locationPopupTable tbody').on('click', 'tr', function() {
			let data = locationPopupTable.row(this).data();
			
			if ( popupCheckVal == '외주처' ) {
				$('#locationNo').val(data.locNo);
				$('#locationCd').val(data.locCd);
				$('#locationNm').val(data.locNm + "/" + data.areaNm );
				$('#areaCd').val(data.areaCd);
			} else if ( popupCheckVal == '창고' ) {
				$('input[name=locationData]').eq(tableIdx2).val(data.locNm + "/" + data.areaNm + "/" + data.floorNm);
				$('input[name=locationCd]').eq(tableIdx2).val(data.locCd);
				$('input[name=areaCd]').eq(tableIdx2).val(data.areaCd);
				$('input[name=floorCd]').eq(tableIdx2).val(data.floorNm);
				$('input[name=locationNo]').eq(tableIdx2).val(data.locNo);
			}
			
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	$('#inOutWhsAdmTable tbody').on('click', 'tr', function(){
		tableIdx2 = $('#inOutWhsAdmTable').DataTable().row(this).index();
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
				'startDate'	: function(){ return startDate.replace(/-/g,''); },
	            'endDate'	: function(){ return endDate.replace(/-/g,''); },
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
// 			$(this).removeClass('selected');
		} else {
			$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		dealCorpCdVal = departmentTable.row(this).data().dealCorpCd;
		startDate = $('#poDateFrom').val().replace(/-/g,'');
		endDate = $('#poDateTo').val().replace(/-/g,'');
		$('#outsourcingWhsTable').DataTable().ajax.reload();
	});
    
    //전체 선택시
	$('#allDepartMent').on('click', function(){
		$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
		
		dealCorpCdVal = '';
		startDate = $('#poDateFrom').val().replace(/-/g,'');
		endDate = $('#poDateTo').val().replace(/-/g,'');
		$('#outsourcingWhsTable').DataTable().ajax.reload();
	})
	
	// 통합검색
	$('#dtlTextSearch').on('keyup',function() {
		$('#departmentTable_filter').find('input').val($(this).val());
		$('#departmentTable_filter').find('input').trigger('keyup');
	});

	// 통합검색
	$('#dtlTextSearch2').on('keyup',function() {
		$('#inOutWhsAdmTable_filter').find('input').val($(this).val());
		$('#inOutWhsAdmTable_filter').find('input').trigger('keyup');
	});
	
	//담당모달
	let userPopUpTable;
   	function outWorkerSelect(){
   		if (userPopUpTable == null || userPopUpTable == undefined) {
   			userPopUpTable = $('#userPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 15,
				ajax : {
					url : '<c:url value="/sm/matrlUserDataList"/>',
					type : 'GET',
					data : {
						'empCd' : function(){ return '001'; },
					},
				},
				rowId : 'matrlUser',
				columns : [
					{//성명
						data : 'userNm'
					},
					{//부서
						data : 'departmentNm'
					},
					{//직위
						data : 'postNm'
					},
					{//담당
						data : 'chargeDutyNm'
					},
					{//비고
						data : 'userDesc'
					},
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
				
			$('#userPopUpTable tbody').on('click', 'tr', function () {
			   	let data = userPopUpTable.row(this).data();	
			   	$('#outWorkerNm').val(data.userNm);
			   	$('#outWorker').val(data.userNumber);
			   	$('#userPopUpModal').modal('hide');		    	
			});
   		} else {
   			$('#userPopUpTable').DataTable().ajax.reload();
   		}
		$('#userPopUpModal').modal('show');
   	}

</script>
<script>
	var cmd = new Array();
	var i = 0;
	// 바코드 인쇄 
	let printCnt = 0;
	
	//라벨인쇄 버튼 클릭
	$('#printLargeBarcode').on('click',function(){
		let labelToday = new Date();
		console.log("라벨출력 printLargeBarcode onClick 시작시간: " + labelToday);
		
		let printList = new Array(); 	// 통합된 프린트할 데이터 배열
		let columnList = new Array();	// 통합된 프린트할 컬럼 배열
		let columnArr = new Array();	// 각 용지의 컬럼 배열
		let paperSize = "";				// 용지 사이즈
		
		//예외처리
		if($('#partPrintCnt').val()=="" || $('#partPrintCnt').val()==0){
			toastr.warning("인쇄할 매수를 입력해주세요.");
			return false;
		}

		if(!$('input[name=printList]').is(':checked')){
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		}
		
		// 양식에 맞추어 컬럼 집어넣기
		if (mainTrData.itemGubun == '004' || mainTrData.itemGubun == '003') { // 자재 & 반제품
			paperSize = "materialLabel";

			columnArr.push("차종");
			columnArr.push("품목번호");
			columnArr.push("품명");
			columnArr.push("입고일자");
			columnArr.push("합부판정");
			columnArr.push("위치");
			columnArr.push("입고수량");
			columnArr.push("업체로트");
			columnArr.push("입고처");
		} else { // 그 외
			paperSize = "commonLabel";

			columnArr.push(".");
		}
		
		printCnt = $('#partPrintCnt').val();

		$('input[name=printList]:checked').each(function() {
		    let idx  = $(this).attr("id").split('-');
		    
	    	if(inOutWhsAdmTable.row(idx[1]).data().approvalCd == '001' && inOutWhsAdmTable.row(idx[1]).data().qaEval != null) {
				for (let i = 0; i < printCnt; i++) {
					let trDataArr = new Array();
		
				    trDataArr[0] = outsourcingWhsTable.row(tableIdx).data().itemCd; //품번
				    trDataArr[1] = outsourcingWhsTable.row(tableIdx).data().itemNm; //품명
				    trDataArr[2] = inOutWhsAdmTable.row(idx[1]).data().preInWhsDate; //입고일자
				    trDataArr[2] = moment(trDataArr[2]).format("YYYY.MM.DD");
					if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "001"){
						trDataArr[3] = "합 격"; //합불 판정
					} else if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "002" ) {
						trDataArr[3] = "불합격"; //합불 판정
					} else if ( inOutWhsAdmTable.row(idx[1]).data().qaEval == null ){
						trDataArr[3] = "미판정"; //합불 판정
					}
					trDataArr[4] = inOutWhsAdmTable.row(idx[1]).data().areaNm + " / " + inOutWhsAdmTable.row(idx[1]).data().floorCd; //창고
					trDataArr[5] = parseFloat(inOutWhsAdmTable.row(idx[1]).data().preInWhsQty); //입고수량
					if (outsourcingWhsTable.row(tableIdx).data().itemUnitNm != null) {
						trDataArr[5] += " " + outsourcingWhsTable.row(tableIdx).data().itemUnitNm; //단위
					}
					if (inOutWhsAdmTable.row(idx[1]).data().lotNo != null) {
						trDataArr[6] = inOutWhsAdmTable.row(idx[1]).data().lotNo; //lot번호
					} else {
						trDataArr[6] = "";
					}
					trDataArr[7] = outsourcingWhsTable.row(tableIdx).data().dealCorpNm; //공급처
					trDataArr[8] = inOutWhsAdmTable.row(idx[1]).data().barcodeNo; //바코드번호
					trDataArr[9] = outsourcingWhsTable.row(tableIdx).data().itemModelNm; //차종
					trDataArr[10] = ''; //LH/RH
	
					printList.push(trDataArr);
			    	columnList.push(columnArr);
				}
	
		    	$.ajax({
					url : '<c:url value="/io/preInOutWhsAdmLabelPrint"/>',
					type : 'GET',
					data : {
						'inSlipNo' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipNo; },
						'inSlipSeq' : function(){ return inOutWhsAdmTable.row(idx[1]).data().inSlipSeq; }
					},
					success : function(res) {
					}
				});
	    	}
		});

		if(printList.length > 0) {
			labelPrint(printList, columnList, paperSize); // 라벨출력
		}
	});

	//Do printing...
	function labelPrint(printList, columnList, paperSize) {
	    sendJson(printList, columnList, paperSize);
	}
	
	function sendJson(printList, columnList, paperSize) {
		
		var obj = {
			printNo 	: 1,				// 출력할 프린터 번호
			printCnt 	: printList.length, // 출력될 장수
            printLalCnt : 1,				// 출력될 라벨 수
            printOrder 	: 1,				// 남은 라벨 수
            data 		: printList,		// 데이터
            column		: columnList,		// 컬럼
            paperSize 	: paperSize,		// 용지 양식 이름
            company 	: "Daerim",			// 기업 이름
            reseverd6 	: "",
            reseverd7 	: ""
		};
		var send = JSON.stringify(obj);
		//console.log(send);
		sendMessage(send)
	}
	
	function labelPrint12(data, action) {
		console.log("data: " + data.itemCd);
		let cmds = {};
		   
		let cmd = "";
		    cmd += "{D0520,0980,0500|}";
		    cmd += "{AY;+04,0|}";
		    cmd += "{AX;-020,+000,+00|}";
		    cmd += "{C|}";
		    
		    //행
		    cmd += "{LC;0010,0035,0980,0110,1,5|}";
		    cmd += "{LC;0010,0035,0980,0180,1,5|}";
		    cmd += "{LC;0010,0035,0980,0250,1,5|}";
		    cmd += "{LC;0010,0035,0980,0320,1,5|}";
		    cmd += "{LC;0010,0035,0980,0485,1,5|}";
		    
		    //열
		    cmd += "{LC;0155,0035,0155,0320,0,5|}";
		    cmd += "{LC;0335,0180,0335,0320,0,5|}";
		    cmd += "{LC;0490,0180,0490,0320,0,5|}";
		    cmd += "{LC;0640,0180,0640,0320,0,5|}";
		    cmd += "{LC;0795,0180,0795,0320,0,5|}";
		    
		    //데이터
		    cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
		    cmd += "{PV23;0170,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
		    cmd += "{PV23;0045,0160,0040,0040,01,0,00,B=품명|}";
		    cmd += "{PV23;0170,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
		    cmd += "{PV23;0030,0230,0040,0040,01,0,00,B=입고일|}";
		    cmd += "{PV23;0170,0230,0035,0035,01,0,00,B="+moment(data.preInWhsDate).format('YYYY.MM.DD')+"|}"; 
		    cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=입고수량|}";
		    cmd += "{PV23;0170,0300,0035,0035,01,0,00,B="+data.preInWhsQty+" "+data.itemUnitNm+"|}";
		    cmd += "{PV23;0345,0230,0040,0040,01,0,00,B=합부판정|}";
		    cmd += "{PV23;0517,0230,0040,0040,01,0,00,B="+data.qaEval+"|}";
		    cmd += "{PV23;0345,0300,0040,0040,01,0,00,B=업체로트|}";
		    if (data.lotNo != null) {
		    cmd += "{PV23;0505,0300,0035,0035,01,0,00,B="+data.lotNo+"|}";
		    }
		    cmd += "{PV23;0681,0230,0040,0040,01,0,00,B=창고|}";
		    if (data.areaCdNm != null) {
		    	cmd += "{PV23;0810,0230,0035,0035,01,0,00,B="+data.areaCdNm + '/' + data.floorNm+"|}";
		    }
		    cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=업체명|}";
		    cmd += "{PV23;0810,0300,0035,0035,01,0,00,B="+data.dealCorpNm+"|}";
		    cmd += "{XB03;0160,0350,9,3,03,0,0100,+0000000001,000,1,00|}";
		    cmd += "{RB03;"+data.barcodeNo+"|}";
		    cmd += "{XS;I,0001,0002C4001|}";
		
		cmds.cmd = cmd; // 인쇄 명령어
		cmds.action = action; // 동작
		
		sendMessage(JSON.stringify(cmds)); // 전송
	}
 
</script>
<script>
	//웹 서버를 접속한다.
	var webSocket = new WebSocket("ws://localhost:8181");
	// 웹 서버와의 통신을 주고 받은 결과를 출력할 오브젝트를 가져옵니다.
	var messageTextArea = document.getElementById("installedPrinterName");
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
		toastr.success('인쇄 서버에 연결되었습니다.')
		$('#wsStateView').text('연결됨');
		$('#wsStateView').css('color','#19FF00');
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
		toastr.error('인쇄 서버가 종료되었습니다.')
		$('#wsStateView').text('연결끊김');
		$('#wsStateView').css('color','#FF0004');
	};
	// 소켓 통신 중에 에러가 발생되면 호출되는 함수
	webSocket.onerror = function(message){
		toastr.warning('현재 인쇄프로그램이 종료되어있습니다. 인쇄프로그램을 시작해주세요.')
	};
	// 소켓 서버로 부터 메시지가 오면 호출되는 함수.
	webSocket.onmessage = function(message){
		// 출력 area에 메시지를 표시한다.
		console.log(message);
	};
	// 서버로 메시지를 전송하는 함수
	function sendMessage(cmd){
		if(webSocket.readyState == 1) {
			let labelToday = new Date();
			console.log("라벨출력 sendMessage() 시작시간: " + labelToday);
			
			webSocket.send(cmd);
		} else {
			toastr.error('인쇄 서버와의 연결을 확인해주세요.');
			//webSocket = new WebSocket("ws://localhost:8181");
		}
	}
</script>
   	

</body>
</html>
