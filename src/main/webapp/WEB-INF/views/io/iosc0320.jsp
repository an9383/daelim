<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">입고등록(봉제)</li>
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
								<label class="input-label-lg m-0 mt-1" style="font-size: 15.3px;">공급사</label>
							</th>
						</tr>
						<tr><th class="p-0"><input class="form-control m-0" type="text" id="dtlTextSearch" placeholder="통합검색"></th></tr>
						<tr id="allDepartMent"><td>전체</td></tr>
					</thead>
				</table>
			</div>
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 44%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="purchaseOrderTable" class="table table-bordered">
							<%-- <colgroup>
								<col width="10%">
								<col width="10%">
								<col width="12%">
								<col width="19%">
								<col width="6%">
								<col width="8%">
								<col width="8%">
								<col width="0%">
								<col width="10%">
								<col width="7%">
							</colgroup> --%>
							<thead class="thead-light">
								<tr>
									<th>발주번호</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
									<th class="text-center">발주수량</th>
									<th class="text-center">입고수량</th>
									<th>입고일자</th>
									<th>입고상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>

			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 46%;">
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
										<th>발주수량</th>
										<td><input type="text" class="form-control" id="ordQty" style="text-align:right; min-width: 100%;" disabled></td>
										<th>미입고수량</th>
										<td><input type="text" class="form-control" id="diffQty" style="text-align:right; min-width: 100%;" disabled></td>
									</tr>
									<tr>
										<th>포장수량</th>
										<td><input type="text" class="form-control" id="boxCount" style="text-align:right; min-width: 100%;" onkeyup="numberFormat(this, 'int')" disabled></td>
										<th>포장단위</th>
										<td><input type="text" class="form-control" id="itemUnit" style="text-align:center; min-width: 100%;" disabled></td>
									</tr>
									<tr>
										<th>LotNo</th>
										<td>
											<input type="text" class="form-control mr-2" id="lotNo" placeholder="30자리 내외" style="border: solid 2px #346cb0; text-align:right; min-width: 100%;" maxlength="30" disabled>
										</td>
										<th>입고수량</th>
										<td>
											<input type="text" class="form-control mr-3" id="packQty" style="border: solid 2px #346cb0;text-align:right; min-width: 100%;" onkeyup="numberFormat(this, 'int')" disabled>
										</td>
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
		                   			<input class="form-control" type="text" style="width:97px;" id="batchPreInWhsDate" name="batchPreInWhsDate" disabled/>
		                   			<button onclick="fnPopUpCalendar(batchPreInWhsDate,batchPreInWhsDate,'yyyy-mm-dd')"  class="btn btn-secondary input-sub-search" id="batchPreInWhsDateCalendar" type="button">
		                    			<span class="oi oi-calendar"></span>
		                   			</button>
		                  		</div>
		                  	</div>
		                  	<button type="button" class="btn btn-primary float-left mr-1" id="btnBatchApply" disabled>일괄적용</button>
							<button type="button" class="btn btn-warning float-left mr-1" id="btnDtlEdit" disabled>수정</button>
							<button type="button" class="btn btn-danger float-left" id="btnDtlDel" disabled>삭제</button>
							<input class="form-control m-0 float-right" type="text" id="dtlTextSearch2" placeholder="입고일자 검색">
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table class="table table-lg table-bordered mb-2" id="inOutWhsAdmTable">
									<colgroup>
										<col width="4%">
										<%--2023-02-07 doyeji 삭제 
											<col width="14%"> 
										--%>
										<col width="12%">
										<col width="10%">
										<col width="19%">
										<col width="15%">
										<col width="11%">
										<col width="11%">
										<col width="17%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th><input type="checkbox" id="checkAll" name="checkAll"  style="width:1.1rem;height:1;" ></th>
											<!-- 2023-02-07 doyeji 삭제 
											<th class="text-center">입고전표번호</th> 
											-->
											<th class="text-center">입고일자</th>
											<th class="text-center">입고수량</th>
											<th>BarcodeNo</th>
											<th>LotNo</th>
											<th>판정</th>
											<th>승인</th>
											<th>창고</th>
											<th>입고일자</th>
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
			width : "44%"
		}, 200);
		$("#arrow-left").animate({
			display : "none"
		}, 200);
		setTimeout(function() {
			purchaseOrderTable.draw();
			purchaseOrderTable.draw();
		}, 500);
		state = !state;
	});
	
	$("#left-expand").click(function() {
		$("#left-list").animate({
			width : "90%"
		}, 200);
		setTimeout(function() {
			purchaseOrderTable.draw();
			purchaseOrderTable.draw();
		}, 500);
		state = !state;
	});

	let currentHref = "iosc0320";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","입고등록(봉제)"); 
	
	uiProc(true);
	const serverDateFrom = "${serverDateFrom}";
	const serverDateTo = "${serverDateTo}";
	
	let sideView = 'add';
	let tableIdx = null;
	let tableIdx2 = null;
	let poNo;
	let poSeq;	
	let inSeq;
	let inSlipNo;
	let itemSeq;
	let itemCd;
	let ordQty = 0;
	let sum = 0;
	let printArray = new Array();
	let startDate = serverDateFrom;
	let endDate = serverDateTo;
	let batchPreInWhsDateVal = serverDateTo;
	let lotNoVal = "";
	let dealCorpCdVal = '';
	let locationNo;
	let locationCd;
	let locationNm;
	let areaCd;
	let areaNm;
	let floorCd;
	let inWhsPageGubun = '001';
	let mainTrData; // 메인 테이블 데이터
	
	let reloadDepRowIndex = 0;
	let reloadDepPageIndex = 0;
	
	let reloadRowIndex = 0;
	let reloadPageIndex = 0;
	
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
		$('#lotNo').attr('disabled', true);
		$('#packQty').attr('disabled', true);
		$('#packQty').val('');
		$('#btnLotCreate').attr('disabled', true);
		$('#btnDtlEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', true);
		$('#btnBatchApply').attr('disabled', true);
		$('#inOutWhsAdmTable').DataTable().ajax.reload();
    });
	
	// 메인 테이블
    let purchaseOrderTable = $('#purchaseOrderTable').DataTable({
    	dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
        ajax: {
            url: '<c:url value="io/purchaseOrderStatusList"/>',
            type: 'GET',
            data: {
	          	'startDate'		: function(){ return startDate.replace(/-/g,''); },
	            'endDate'		: function(){ return endDate.replace(/-/g,''); },
	            'value'  		: function(){ return '가입고'; },
	            'searchOption' 	: function(){ return "001"; },
	            'inWhsPageGubun': function(){ return inWhsPageGubun;}, //페이지 구분용
		        'mainGubun' 	: function(){ return '002'; },
            	'dealCorpCd'	: function(){ return dealCorpCdVal; },
            	'bongjaeCheck' 	: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '생산'이나 '외주'이나 '외주/생산' 이 아닌것만 조회되도로 구현
            },
        },
        rowId: 'poNo',
        columns : [ 
			{//발주번호
				data :'poNo'
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
				data : 'itemUnitNm'
			}, 
			{//발주수량
				data : 'ordQty',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				className : 'text-right'
			},
			{//입고수량
				data : 'preInWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
				className : 'text-right'
			},
			{//입고일자
				data : 'inWhsDate',
				render: function(data, type, row, meta) {
					if ( data != null && data != '' ) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				}
			},
			{//입고상태
				data : 'statusCd',
				render : function(data, type, row, meta) {
					if ( data != null ) {
						if(data == '입고완료'){
							return '<span style="background-color:#ffec00a8;">' +data+ '</span>';
						} else{
							return data;
						}
						
					} else {
						return '진행중';
					}
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
		drawCallback: function() {
			
		}	    
    });
	
    let html1 = '<div class="row">';
    html1 += '<label class="input-label-sm">발주일자</label><div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="poDateFrom" name="poDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(poDateFrom,poDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="poDateFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub mr-1 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="poDateTo" name="poDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(poDateTo,poDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="poDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '<button type="button" class="btn btn-primary ml-1" id="btnRetv">조회</button>';
    html1 += '<button type="button" class="btn btn-success ml-1" id="btnRefresh123">새로고침</button>';
    html1 += '<label for="check" class="input-label-sm ml-2 mr-0">전체</label>';
    html1 += '<input type="checkbox" style="width:27px" id="check">';
    //html1 += '<button type="button" class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
	
	$('#purchaseOrderTable_length').html(html1);
	$('#poDateFrom').val(serverDateFrom);
	$('#poDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click', function() {
    	startDate =  $('#poDateFrom').val();
    	endDate =  $('#poDateTo').val();

    	if($('#check').is(":checked")){
    		inWhsPageGubun = "";
        } else{
        	inWhsPageGubun = "001";
        }
    	
    	//dealCorpCdVal = '';
		$('#purchaseOrderTable').DataTable().ajax.reload(function(){
			
		});

		$('#departmentTable').DataTable().ajax.reload( function () {
			
			for (var i = 0; i < departmentTable.data().count(); i++) {
				if(departNm != ''){	
					if(departmentTable.row(i).data().dealCorpNm == departNm){
							
							departmentTable.page(reloadDepPageIndex).draw('page');
							departmentTable.row(i).select();					
							break;
											
					} 
				}
				else{				
					departmentTable.page(0).draw('page');						
				}
			}		
  	      
  	     });

    });	

	//전체조회버튼 클릭시
	$('#btnAllList').on('click', function() {
		startDate =  "";
    	endDate =  "";
		dealCorpCdVal = '';
		inWhsPageGubun = "";
		$('#purchaseOrderTable').DataTable().ajax.reload(function(){});
		$('#departmentTable').DataTable().ajax.reload(function(){});
    });

	//새로고침버튼 클릭시
	$('#btnRefresh123').on('click', function() {		        
		$('#purchaseOrderTable tbody tr').removeClass('selected');
       	purchaseOrderTable.rows('.selected').deselect();    		
   		 $('#purchaseOrderTable').DataTable().ajax.reload( function () {
   	         if(reloadRowIndex!=0) {     	        	   	   	         
   	        	purchaseOrderTable.page(reloadPageIndex).draw('page');
   	        	//purchaseOrderTable.row(reloadRowIndex).select();
   	        	$('#purchaseOrderTable tbody tr').eq(reloadRowIndex-(20*reloadPageIndex)).addClass('selected');   	  
   	        	
   	        	//$('#purchaseOrderTable').DataTable().row(reloadRowIndex).addClass('selected');   	        	   	        	
   	         }
   	     });	

    });
    
	// 세부 목록 보기
	$('#purchaseOrderTable tbody').on('click','tr',function() {
		if ( $('#btnSave').attr('class') == 'btn btn-primary float-right' ) {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		if ( $(this).hasClass('selected') ) {
// 			$(this).removeClass('selected');
		} else {
			$('#purchaseOrderTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		mainTrData = purchaseOrderTable.row(this).data(); // 메인 테이블 데이터

		sideView = "edit";
		
		tableIdx = purchaseOrderTable.row(this).index();
		
		poNo = purchaseOrderTable.row(this).data().poNo;
		poSeq = purchaseOrderTable.row(this).data().poSeq;
		ordQty = purchaseOrderTable.row(this).data().ordQty;
		itemSeq = purchaseOrderTable.row(this).data().itemSeq;
		itemCd = purchaseOrderTable.row(this).data().itemCd;
		locationNo = purchaseOrderTable.row(this).data().locNo;
		locationCd = purchaseOrderTable.row(this).data().locCd;
		locationNm = purchaseOrderTable.row(this).data().locationNm;
		areaCd = purchaseOrderTable.row(this).data().areaCd;
		areaNm = purchaseOrderTable.row(this).data().areaCdNm;
		floorCd = purchaseOrderTable.row(this).data().floorNm;

		reloadRowIndex = purchaseOrderTable.row('.selected').index();
		reloadPageIndex = purchaseOrderTable.row('.selected').page();
		
		$('#itemCd').val(purchaseOrderTable.row(this).data().itemCd);
		$('#itemNm').val(purchaseOrderTable.row(this).data().itemNm);
		$('#itemModel').val(purchaseOrderTable.row(this).data().itemModel);
		$('#itemUnit').val(purchaseOrderTable.row(this).data().itemUnitNm);
		$('#boxCount').val(rmDecimal(purchaseOrderTable.row(this).data().boxCount));
		$('#ordQty').val(rmDecimal(purchaseOrderTable.row(this).data().ordQty));

		let ordQtyVal = parseFloat(purchaseOrderTable.row(this).data().ordQty);
		let preInWhsQtyVal = parseFloat(purchaseOrderTable.row(this).data().preInWhsQty);

		console.log("ordQtyVal:"+ordQtyVal);
		console.log("preInWhsQtyVal:"+preInWhsQtyVal);
		
		$('#diffQty').val(ordQtyVal-preInWhsQtyVal>0?rmDecimal(ordQtyVal-preInWhsQtyVal):"0");
		
		$('#btnSave').addClass('d-none');
		$('#lotNo').attr('disabled', true);
		$('#lotNo').val('');
		$('#packQty').attr('disabled', true);
		$('#packQty').val('');
		$('#btnLotCreate').attr('disabled', true);
		$('#btnDtlEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', true);
		$('#btnBatchApply').attr('disabled', true);
		$('#checkAll').prop('checked', false);
		$('#batchPreInWhsDate').val(serverDateTo);

		if ( purchaseOrderTable.row(this).data().poEndDate == "002" ) {
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
			} else {
				$('#partPrintCnt').attr('disabled', true);
				$('#printLargeBarcode').attr('disabled', true);
			}
		});
		
		printArray = [];
	});


	//전체선택클릭
	$('#checkAll').on('click',function(){
		if ( $('#checkAll').prop("checked") ) {
			$('input:checkbox[name=printList]').prop("checked", true);
		} else {
			$('input:checkbox[name=printList]').prop("checked", false);
		}
	});
	

	//등록 버튼 클릭
	$('#btnAdd').on('click',function(){
		if ( sideView != "edit" ) {
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}

		$('#lotNo').attr('disabled',false);
		$('#packQty').attr('disabled',false);
		$('#btnLotCreate').attr('disabled',false);
		$('#btnDtlEdit').attr('disabled',false);
		$('#btnDtlDel').attr('disabled',false);
		$('#btnBatchApply').attr('disabled',false);
		$('#boxCount').attr('disabled',false);
	
	});
	
	//lot생성 버튼 클릭
	$('#btnLotCreate').on('click', function(){
		if ( $('#lotNo').val() == "" ) {
			toastr.warning("LotNo를 입력해주세요.");
			return false;
		}
		if($('#packQty').val()==""){
			toastr.warning("입고수량을 입력해주세요.");
			return false;
		}
		if($('#boxCount').val()=="0" || $('#boxCount').val()==""){
			toastr.warning("포장수량을 확인해주세요.");
			return false;
		}

		$('#resetModal').modal('show');
		
		//입고수량이 발주수량을 넘었는지 체크 -> 체크 안함 (2023.02.03)
		/* var packQty = parseFloat($('#packQty').val().replace(/,/g,''));
		if(packQty<=$('#diffQty').val().replace(/,/g,'')){
			$('#resetModal').modal('show');
		}else{
			toastr.warning("발주수량값을 초과하였습니다. 확인해주세요");
		}  */
	});
	

	//LOT생성 새로고침 버튼 클릭시
	$('#btnLotReset').on('click',function(){
		
		$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){
			packQtyVal = $('#packQty').val().replace(/,/g,'');		//입고수량
			boxCountVal = $('#boxCount').val().replace(/,/g,'');	//포장수량
			lotNoVal = $('#lotNo').val(); 							//lotNo
			
			quotVal = parseInt(packQtyVal/boxCountVal);	//몫
			remainVal = packQtyVal%boxCountVal;			//나머지
			
			console.log("몫:"+quotVal+"/ 나머지:"+remainVal);

			for(var i=0; i<quotVal; i++){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : boxCountVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
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
					'preInWhsQty' : remainVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					'preInWhsDate' : '',
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
		let packQtySum=0;
		
		if (inOutWhsAdmTable.data().count() != 0) {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				packQtySum += parseFloat($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
				console.log("총 입고수량:"+packQtySum)
			});
		}
		
		//입고수량이 발주수량을 넘었는지 체크 -> 체크 안함 (2023.02.03)
// 		if ( packQtySum+parseFloat($('#packQty').val()) <= ordQty ) {
			
			packQtyVal = $('#packQty').val().replace(/,/g,'');		//입고수량
			boxCountVal = $('#boxCount').val().replace(/,/g,'');	//포장수량
			lotNoVal = $('#lotNo').val(); 							//lotNo
			
			quotVal = parseInt(packQtyVal/boxCountVal);				//몫
			remainVal = packQtyVal%boxCountVal;						//나머지
			
			console.log("몫:"+quotVal+"/ 나머지:"+remainVal);

			for(var i=0; i<quotVal; i++){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : boxCountVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
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
			if(remainVal!=0){
				$('#inOutWhsAdmTable').DataTable().row.add({
					'preInWhsQty' : remainVal,
					'statusCd' 	: 'S',
					'inSeq' 	: '',
					'lotNo' 	: lotNoVal,
					'preInWhsDate' : '',
					'locationNo' 	: locationNo,
					'locationCd' 	: locationCd,
					'locationNm' 	: locationNm,
					'areaCd' 		: areaCd,
					'areaNm' 		: areaNm,
					'floorCd' 		: floorCd,
				}).draw(false);	
					
			}

			$('#btnSave').removeClass('d-none');
// 		} else {
// 			toastr.warning("발주수량값을 초과하였습니다. 확인해주세요");
// 		}

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
				'poNo' 		: function(){ return poNo; },
				'poSeq' 	: function(){ return poSeq; },
				'itemSeq' 	: function(){ return itemSeq; },
			},
		},
		columns : [
			{//체크박스
				render: function(data, type, row, meta) {
					return '<input type="checkbox" class="" id="checkLal-'+meta.row+'" name="printList" data-inSlipNo='+row['inSlipNo']+' data-statusCd='+row['statusCd']+' style="width:1.1rem;height:1;" value="">';
				},
				'className' : 'text-center'
			},
			/* 2023-02-27 doyeji 입고전표번호 항목 삭제
				{//입고전표번호
					data : 'inSlipNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="inSlipNo" value="'+data+'" style="text-align:center;" disabled>' ;	
						} else{
							return '<input type="text" class="form-control" name="inSlipNo" value="" placeholder="처리중" style="text-align:center;" disabled>';	
						}	
					},
				}, 
			*/
			{//입고일자
				data : 'preInWhsDate',
				render: function(data, type, row, meta) {	
					let html = '';
					if(row['inSlipNo']!=null){
	    				html += '<input type="hidden" name="inSlipNo" value="'+row['inSlipNo']+'">' ;	
	    				html += '<input type="hidden" name="inSlipSeq" value="'+row['inSlipSeq']+'">' ;
	    				html += '<input type="hidden" name="inSeq" value="'+row['inSeq']+'">' ;
					} else{
						html += '<input type="hidden" name="inSlipNo" value="">';	
						html += '<input type="hidden" name="inSlipSeq" value="">' ;
						html += '<input type="hidden" name="inSeq" value="">' ;
					}	
					
					if(data!=null && data!=""){
						html += '<input class="form-control" type="date" id="preInWhsDate'+meta.row+'" name="preInWhsDate" value="'+moment(data).format("YYYY-MM-DD")+'" style="text-align:center;" disabled/>'  
					} else{
						html += '<input class="form-control" type="date" id="preInWhsDate'+meta.row+'" name="preInWhsDate" value="'+serverDateTo+'" style="text-align:center;"/>'  
					}

					return html;
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
			{//LotNo
				data : 'lotNo',
				render: function(data, type, row, meta) {	
					if(data!=null){
						if(row['barcodeNo']==null){
							return '<input type="text" class="form-control" name="lotNo" value="'+data+'" style="text-align:center;" placeholder="30자리 내외">' ;	
						}else{
							return '<input type="text" class="form-control" name="lotNo" value="'+data+'" style="text-align:center;" placeholder="30자리 내외" disabled>' ;	
						}
					} else{
						return '<input type="text" class="form-control" name="lotNo" value="" style="text-align:center;" placeholder="30자리 내외" disabled>';	
					}	
				},
			},
			{//합/불 판정
				data : 'qaEval',
				render: function(data, type, row, meta){
					if(data!=null){
						if(data == "001"){
							return '<input type="text" class="form-control" name="qaEval" value="합격" style="text-align: center;color: blue;" disabled/>';
						}else if(data == "002"){
							return '<input type="text" class="form-control" name="qaEval" value="불합격" style="text-align: center;color: red;" disabled/>';
						}else if(data == ""){
							return '<input type="text" class="form-control" name="qaEval" placeholder="미판정" style="text-align: center;" disabled/>';
						}
					}else{
						return '<input type="text" class="form-control" name="qaEval" placeholder="미판정" style="text-align: center;" disabled/>';
					}
				},
				'className' : 'text-center'
			},
			{//승인여부
				data : 'approvalCd',
				render: function(data, type, row, meta){
					if(row['statusCd']=="S"){
						return '<input type="text" class="form-control" name="qaEval" placeholder="승인중" style="text-align: center;" disabled/>';
					}else{
						if(data == "001"){
							return '<input type="text" class="form-control" name="qaEval" value="승인" style="text-align: center;color: blue;" disabled/>';
						}else{
							return '<input type="text" class="form-control" name="qaEval" value="미승인" style="text-align: center; color:red;" disabled/>';
						}
					}
				},
				'className' : 'text-center'
			},
			{//창고
				data : 'locationNo',
				render: function(data, type, row, meta) {
					if(data != null){
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="locationCd" value="'+row['locationCd']+'">';
						html += '<input type="hidden" class="form-control" name="areaCd" value="'+row['areaCd']+'">';
						html += '<input type="hidden" class="form-control" name="floorCd" value="'+row['floorCd']+'">';
						html += '<input type="hidden" class="form-control" name="locationNo" value="'+row['locationNo']+'">';
						html += '<input type="text" class="form-control" name="locationData" value="'+row['locationNm']+"/"+row['areaNm']+"/"+row['floorCd']+'" disabled>';
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationDataClick()" disabled>';
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
						html += '<button type="button" name="btnLocationData" class="btn btn-primary input-sub-search" onClick="locationDataClick()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;	
					}	
				},
			},
			{data : 'preInWhsDate'}
		],  
		columnDefs: [
			{"visible" : false, "targets":8}
		],
		drawCallback: function() {
		    $('#inOutWhsAdmTable_filter').addClass('d-none');
		},
        order: [
	        
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	}); 
	
	//일괄적용 버튼 클릭
	$('#btnBatchApply').on('click', function() {
		let check = true;
		
		if (sideView != 'edit') {
			toastr.warning("수정할 발주항목을 선택해주세요.");
			check = false;
			return false;
		}
		
		if ( !$('input[name=printList]').is(':checked') ) {
			toastr.warning("일괄적용할 항목을 체크해주세요.");
			check = false;
			return false;
		}
		
		//1. 선택한 항목들이 수정할 수 있는 것인지 확인
		if(check){
			$('td input[name=printList]:checked').each(function(index, item){
				inSlipNo = $(this).attr('data-inSlipNo');
				if ( inSlipNo != '' && inSlipNo != null ) {
					if ( $(this).attr('data-statusCd') == "L" ) {
						toastr.warning("이미 승인되어 수정 할 수 없습니다.");
						$(this).find('td input[name=printList]').focus();
						check = false;
					}
				}
			});
		}
		
		
		//2. 확인된 항목들 수정 가능하도록 실행
		if (check) {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				if ($(this).find('td input[name=printList]').is(":checked")) {
					let data = inOutWhsAdmTable.row(this).data();
					
					if ( data.statusCd == "S" ) {
						$('input[name=preInWhsDate]').eq(index).attr('disabled', false);
						$('input[name=preInWhsQty]').eq(index).attr('disabled', false);
						$('input[name=lotNo]').eq(index).attr('disabled', false);
						$('button[name=btnLocationData]').eq(index).attr('disabled', false);
						$('input[name=preInWhsDate]').eq(index).val($('#batchPreInWhsDate').val());

						let check = false;
					} else {
						$('button[name=btnLocationData]').eq(index).attr('disabled', false);
					}
				}
			});
			
			$('#btnSave').removeClass('d-none');
		}
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
		if(check){
			$('td input[name=printList]:checked').each(function(index, item){
				inSlipNo = $(this).attr('data-inSlipNo');
				if ( inSlipNo != '' && inSlipNo != null ) {
					if ( $(this).attr('data-statusCd') == "L" ) {
						toastr.warning("이미 승인되어 수정 할 수 없습니다.");
						$(this).find('td input[name=printList]').focus();
						check = false;
					}
				}
			});
		}
		
		//2. 확인된 항목들 수정 가능하도록 실행
		if (check) {
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=printList]').is(":checked") ) {
					let data = inOutWhsAdmTable.row(this).data();
					
					if ( data.statusCd == "S" ) {
						$('input[name=preInWhsDate]').eq(index).attr('disabled', false);
						$('input[name=preInWhsQty]').eq(index).attr('disabled', false);
						$('input[name=lotNo]').eq(index).attr('disabled', false);
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
			toastr.warning("삭제할 발주항목을 체크해주세요.");
			return false;
		}
		
		$('#deleteSmallModal').modal('show');
	});

	//삭제 버튼 클릭
	$('#btnDeleteY').on('click', function() {
		let delRow = [];
		let delcount = 0;
		
		//1. 확인한 항목들 삭제
		$('#my-spinner').show();
		setTimeout(function(){
			$('#inOutWhsAdmTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=printList]').is(":checked") ) {
					let data = inOutWhsAdmTable.row(this).data();
					inSlipNo = data.inSlipNo;   //입고전표번호
					inSlipSeq = data.inSlipSeq;	//입고전표시퀀스
					let barcodeNoVal = data.barcodeNo;	//입고전표시퀀스
					
					if ( inSlipNo != '' && inSlipNo != null ) {
						sum += parseInt($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
						
						$.ajax({
							url : '<c:url value="io/preInOutWhsAdmDelete"/>',
							type : 'GET',
							async : false,
							data : {
								'inSlipNo' 	: function(){ return inSlipNo; },
								'inSlipSeq' : function(){ return inSlipSeq; },
								'barcodeNo' : function(){ return barcodeNoVal; },
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
				}else{
					$('#my-spinner').hide();
				}
			});
			
			if ( delRow.length > 0 ) {
				$('#checkAll').prop('checked', false);
				$('#inOutWhsAdmTable').DataTable().rows(delRow).remove().draw(); //여러 행 삭제
			}
			$('#diffQty').val( parseFloat($('#diffQty').val().replace(/,/g,'')) + sum );
			sum = 0;
			
			$('#purchaseOrderTable').DataTable().ajax.reload(function(){});
			$('#deleteSmallModal').modal('hide');
		},150);
		
	});


	// 저장 처리
	$('#btnSave').on('click', function() {
		var dataArray = new Array();		
		var check = true;  		

		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			sum+=parseInt($(this).find("td input[name=preInWhsQty]").val().replace(/,/g,''));
		});
		
		$('#inOutWhsAdmTable tbody tr').each(function(index, item){
			if($('#inOutWhsAdmTable tbody tr').length>0){
				
				if ($(this).find('td input[name=locationNo]').val()=="") {
					toastr.warning('창고를 입력해 주세요.');
					$(this).find('td button[name=btnLocationData]').focus();
					check = false;
					return false;
				}

				var rowData = new Object();
				
				rowData.inSlipNo = $(this).find("td input[name=inSlipNo]").val();
				rowData.inSlipSeq = $(this).find("td input[name=inSlipSeq]").val();
				rowData.poNo= poNo;
				rowData.poSeq = poSeq;
				rowData.inSeq = $(this).find("td input[name=inSeq]").val();
				rowData.itemSeq= itemSeq;
				rowData.itemCd= itemCd;
				rowData.ordQty = ordQty;
				rowData.preInWhsDate = $(this).find("td input[name=preInWhsDate]").val().replace(/-/g,'');
				rowData.sum = sum;
				rowData.preInWhsQty = $(this).find("td input[name=preInWhsQty]").val().replace(/,/g,'');
				rowData.lotNo = $(this).find("td input[name=lotNo]").val();

				//창고 정보
				rowData.locationCd = $(this).find("td input[name=locationCd]").val();
				rowData.areaCd = $(this).find("td input[name=areaCd]").val();
				rowData.floorCd = $(this).find("td input[name=floorCd]").val();
				rowData.locationNo = $(this).find("td input[name=locationNo]").val();
				
		        dataArray.push(rowData);
		        console.log(rowData);
			} else {
				toastr.warning('입고수량을 입력해주세요');	
				$(this).find("td #packQty").focus();
				check=false;
				return false;
			}
		});
		
		if(check){
			$.ajax({
				url : '<c:url value="io/preInOutWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(res){
					$('#my-spinner').show();
				},
				success : function(res) {		
					sum=0;		
					if (res.result == 'ok') {
						
						// 보기					
						$('#purchaseOrderTable').DataTable().ajax.reload(function(){});
						$('#inOutWhsAdmTable').DataTable().ajax.reload(function(){});
						$('#packQty').attr('disabled',true);
						$('#boxCount').attr('disabled',true);
						$('#lotNo').attr('disabled',true);
						
						$('#btnLotCreate').attr('disabled',true);
						$('#btnAdd').attr('disabled',false);
						
						$('#btnDtlEdit').attr('disabled',true);
						$('#btnDtlDel').attr('disabled',true);
						$('#checkAll').prop('checked',false);
						$('#btnBatchApply').attr('disabled',true);
						toastr.success('저장되었습니다.');
						
						sideView = 'add';
						$('#btnSave').addClass('d-none');
					}else if(res.result == "fail"){
						toastr.warning(res.message);
					}
					else{
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
		$('input[name=lotNo]').attr('disabled',flag);
		$('input[name=srLot]').attr('disabled',flag);
		$('input[name=custItemCd]').attr('disabled',flag);
		$('input[name=custItemNm]').attr('disabled',flag);
		$('input[name=preInWhsQty]').attr('disabled',flag);
		$('input[name=inWhsDesc]').attr('disabled',flag);
		$("select[name=preInStatus]").attr("disabled", flag);
		$("button[name=inWhsDateFromCalendar]").attr("disabled",flag);
	}
	
	var temp = 0; 	// 출력 함수를 실행한 횟수
	var count = 0; 	// 3개씩 출력해야 되는 횟수
	var last = 0;	// 마지막 한번 출력할때의 라벨 갯수
	// 창고 팝업 시작
	var locationPopupTable;
	function locationDataClick() {
		if (locationPopupTable != null && locationPopupTable != 'undefined') {
			locationPopupTable.destroy();
		}
		
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

		$('#locationPopupTable tbody').on('click', 'tr', function() {
			var data = locationPopupTable.row(this).data();
			$('input[name=locationData]').eq(tableIdx2).val(data.locNm + "/" + data.areaNm + "/" + data.floorNm);
			$('input[name=locationCd]').eq(tableIdx2).val(data.locCd);
			$('input[name=areaCd]').eq(tableIdx2).val(data.areaCd);
			$('input[name=floorCd]').eq(tableIdx2).val(data.floorNm);
			$('input[name=locationNo]').eq(tableIdx2).val(data.locNo);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	$('#inOutWhsAdmTable tbody').on('click', 'tr', function(){
		tableIdx2 = $('#inOutWhsAdmTable').DataTable().row(this).index();
	});
	
	
    //공급사 조회
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
			url : '<c:url value="/io/purchaseDealCorpList"/>',
			type : 'GET',
			data : {
				'startDate'		: function(){ return startDate.replace(/-/g,''); },
	            'endDate'		: function(){ return endDate.replace(/-/g,''); },
	            'value'  		: function(){ return '공급사'; },
	            'searchOption' 	: function(){ return "001"; },
	            'inWhsPageGubun': function(){ return inWhsPageGubun;}, //페이지 구분용
		        'mainGubun' 	: function(){ return '002'; },
		        'bongjaeCheck' 	: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '생산'이나 '외주'이나 '외주/생산' 이 아닌것만 조회되도로 구현
            	
			},
		},
        columns: [
           	{//공급사
           		data: 'dealCorpNm'
           	},
        ],        
        drawCallback: function() {
		    $('#departmentTable_filter').addClass('d-none');
		    $('.tb_height').css('height','75vh');
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

	
    var departNm = '';
    $('#departmentTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		reloadDepRowIndex = departmentTable.row('.selected').index();
		reloadDepPageIndex = departmentTable.row('.selected').page();

		
		
		dealCorpCdVal = departmentTable.row(this).data().dealCorpCd;
		startDate = $('#poDateFrom').val().replace(/-/g,'');
		endDate = $('#poDateTo').val().replace(/-/g,'');
		departNm = departmentTable.row(this).data().dealCorpNm;
		if($('#check').is(":checked")){
    		inWhsPageGubun = "";
        } else{
        	inWhsPageGubun = "001";
        }
		$('#purchaseOrderTable').DataTable().ajax.reload();
	});
    
    //전체 선택시
	$('#allDepartMent').on('click', function(){
		$('#departmentTable').DataTable().$('tr.selected').removeClass('selected');
		reloadDepRowIndex = 0;
		dealCorpCdVal = '';
		departNm = '';
		if($('#check').is(":checked")){
    		inWhsPageGubun = "";
        } else{
        	inWhsPageGubun = "001";
        }
		startDate = $('#poDateFrom').val().replace(/-/g,'');
		endDate = $('#poDateTo').val().replace(/-/g,'');
		$('#purchaseOrderTable').DataTable().ajax.reload();
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

</script>
<script>
	// ************************************************************ 라벨출력 ************************************************************
	var cmd = new Array();
	var i = 0;
	// 바코드 인쇄 
	let printCnt = 0;
	
	//라벨인쇄 버튼 클릭
	$('#printLargeBarcode').on('mousedown',function(){
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
		
// 		let mainTrData = purchaseOrderTable.row(".selected").data(); // 메인 테이블 데이터

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
		
				    trDataArr[0] = purchaseOrderTable.row(tableIdx).data().itemCd; //품번
				    trDataArr[1] = purchaseOrderTable.row(tableIdx).data().itemNm; //품명
				    trDataArr[2] = inOutWhsAdmTable.row(idx[1]).data().preInWhsDate; //입고일자
				    trDataArr[2] = moment(trDataArr[2]).format("YY/MM/DD");
					if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "001"){
						trDataArr[3] = "합격"; //합불 판정
					} else if( inOutWhsAdmTable.row(idx[1]).data().qaEval == "002" ) {
						trDataArr[3] = "불합격"; //합불 판정
					} else if ( inOutWhsAdmTable.row(idx[1]).data().qaEval == null ){
						trDataArr[3] = "미판정"; //합불 판정
					}
					trDataArr[4] = purchaseOrderTable.row(tableIdx).data().areaCdNm; //창고
					if (trDataArr[4] != null) {
						trDataArr[4] = trDataArr[4] + " / " + purchaseOrderTable.row(tableIdx).data().floorNm;
					} else {
						trDataArr[4] = "";
					}
					trDataArr[5] = addCommas(parseFloat(inOutWhsAdmTable.row(idx[1]).data().preInWhsQty)); //입고수량
					if (purchaseOrderTable.row(tableIdx).data().itemUnitNm != null) {
						trDataArr[5] += " " + purchaseOrderTable.row(tableIdx).data().itemUnitNm; //단위
					}
					if (inOutWhsAdmTable.row(idx[1]).data().lotNo != null) {
						trDataArr[6] = inOutWhsAdmTable.row(idx[1]).data().lotNo; //lot번호
					} else {
						trDataArr[6] = "";
					}
					trDataArr[7] = purchaseOrderTable.row(tableIdx).data().dealCorpNm; //공급처
					trDataArr[8] = inOutWhsAdmTable.row(idx[1]).data().barcodeNo; //바코드번호
					trDataArr[9] = purchaseOrderTable.row(tableIdx).data().itemModel; //차종
					trDataArr[10] = purchaseOrderTable.row(tableIdx).data().lhRh; //LH/RH
	
			    	printList.push(trDataArr);
			    	columnList.push(columnArr);
				}
	
		    	$.ajax({
					url : '<c:url value="/io/preInOutWhsAdmLabelPrint"/>',
					type : 'GET',
					async : false,
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
