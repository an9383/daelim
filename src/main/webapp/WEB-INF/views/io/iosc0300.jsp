<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<div class="modal fade" id="saveBtnModal" tabindex="-1" role="dialog" aria-labelledby="saveBtnModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="saveBtnModalLabel">주의</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<h6>발주등록을 새로 하시겠습니까?</h6> 
	      		</div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-primary" id="saveBtnModalY" data-dismiss="modal">예</button>
	      			<button type="button" class="btn btn-danger" id="saveBtnModalN" data-dismiss="modal">아니요</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 거래처 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="dealCorpPopUpModal" tabindex="-1" role="dialog" aria-labelledby="dealCorpPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="dealCorpPopUpLabel">공급사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="dealCorpPopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공급사</th>
									<th style="width : 15%">공급사코드</th>
									<th style="width : 25%">대표자</th>
									<th style="width : 15%">대표품목</th>
									<th style="width : 25%">사업자번호</th>
		                   		</tr>
	                   		</thead>
						</table>
					<hr class="text-secondary"> 
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 거래처 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">발주관리(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
	          <!-- 상단 sorting part -->
              <div class="card top_sortbox p-2">
               <div class="row">
                <div class="col-5 row p-0">
                <!-- 일자 -->
                  <label class="input-label-md">년/월</label>
                  <div class="m-1">
                     <div class="input-sub-md">
	                  <div class="form-group input-sub m-0 row">
	                   <input class="form-control-md" type="month" id="mrpMonFrom" name="mrpMonFrom"/>
	                  </div>
                     </div>
                  </div>
                  <!-- ~ -->
                  <label class="input-label-md">~</label>
                  <!-- 일자 -->
                  <div class="m-1">
                     <div class="input-sub-md">
	                  <div class="form-group input-sub m-0 row">
	                   <input class="form-control-md" type="month" id="mrpMonTo" name="mrpMonTo"/>
	                  </div>
                     </div>
                  </div>
                  <!-- 조회 -->
                  <button type="button"  class="btn btn-primary m-1" id="btnRetv">조회</button>
                  <button type="button"  class="btn btn-primary m-1" id="btnAllList">전체조회</button>
               </div> 
              </div>
             </div>
	        <!-- / end 상단 sorting part -->
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 53%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>

					<!-- .table-responsive -->
					<div class="table-responsive">
						<table class="table table-bordered" id="bizOrderMrpTable">
							<colgroup>
								<col width="3%">
								<col width="10%">
								<col width="12%">
								<col width="15%">
								<col width="20%">
								<col width="11%">
								<col width="11%">
								<col width="11%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th><input type="checkbox" id="btnAllCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th>공급사</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">단가</th>
									<th class="text-center">예정수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">확정수량</th>
									<th class="text-center">금액</th>
									<th class="text-center">미확정수량</th>
									<th class="text-center">금액</th>
									<th>상세</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 46%;">
				<div class="card">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<button type="button" class="btn btn-primary float-right d-none" id="btnSave">발주등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<form id="form">
							<div class="table-responsive">
								<table class="table table-sm table-bordered mb-2"
									id="purchaseOrderAdmTable">
									<colgroup>
										<col width="20%">
										<col width="27%">
										<col width="25%">
										<col width="28%">
									</colgroup>
									<tr>
										<th>발주번호</th>
										<td>
											<div class="row">
												<input class="form-control" type="text" id="poNo" name="poNo" style="max-width: 100%" disabled>
											</div>
										</td>
										<th>공급사</th>
										<td>
											<div class="input-sub m-0" style="max-width: 100%">
												<input type="text" class="form-control"
													style="max-width: 100%" id="dealCorpNm" name="dealCorpNm"
													disabled> <input type="hidden" id="dealCorpCd"
													name="dealCorpCd">
												<button type="button"
													class="btn btn-primary input-sub-search d-none"
													name="btnDealCorp" id="btnDealCorp"
													onClick="selectDealCorp();">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>발주자</th>
										<td>
											<div class="input-sub m-0" style="max-width: 100%">
												<input type="hidden" class="form-control"style="max-width: 100%" id="mainChargr"name="mainChargr" disabled> 
												<input type="text"class="form-control" style="max-width: 100%"id="mainChargrNm" name="mainChargrNm" disabled>
												<button type="button" class="btn btn-primary input-sub-search"name="btnMainChargr" id="btnMainChargr" onClick="selectMainChargr();">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
										<th>발주일자</th>
										<td>
											<div class="form-group input-sub m-0"
												style="max-width: 100%">
												<input class="form-control" style="max-width: 100%"
													type="date" id="poDate" name="poDate" maxlength="10" disabled/>
											</div>
										</td>
									</tr>
									<tr>
										<th>발주구분</th>
										<td><select class="custom-select" type="text" id="receiptGubun" style="max-width: 100%" disabled></select></td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3">
											<input class="form-control" type="text" id="poDesc" style="max-width: 100%" disabled/>
										</td>
									</tr>
								</table>
							</div>
						</form>
						<div>
							<button type="button" class="btn btn-success float-left mr-4" id="btnCancle" disabled>
								<span class="oi oi-arrow-left">&nbsp;&nbsp;발주취소</span>
							</button>
							<button class="btn btn-warning d-none" id="btnCancleConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span>처리중
							</button>
							
							<div class="row">
								<div class="row" id="inWhsDateDiv">
									<label class="input-label-sm mr-1">적용일자</label>
									<input class="form-control" style="width:97px;" type="date" id="dayDateFrom"/>
									&nbsp; ~ &nbsp;
									<input class="form-control" style="width:97px;" type="date" id="dayDateTo"/>
									&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-primary" id="btnDateApply">적용</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label class="input-label-sm mr-1">납기일 선택</label>
									&nbsp;&nbsp;
									<input class="form-control" style="width:97px;" type="date" id="selectDay" disabled/>
									&nbsp;&nbsp;
									<button type="button" class="btn btn-primary" id="applyDate" disabled>전체적용</button>
								</div>
							</div>
						</div>
						<div class="table-responsive">
							<table id="purchaseOrderDtlTable" class="table table-bordered">
								<colgroup>
									<col width="3%">
									<col width="14%">
									<col width="8%">
									<col width="18%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="7%">
									<col width="12%">
								</colgroup>
								<thead>
									<tr>	
										<th><input type="checkbox" id="btnAllCheck2" style="min-width: 17px; min-height: 17px;"></th>
										<th>품번</th>
										<th>차종</th>
										<th>품명</th>
										<th>미발주수량</th>
										<th>필요수량</th>
										<th>재고수량</th>
										<th>발주수량</th>
										<th>단위</th>
										<th>납기일자</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
		</div><!-- /.row -->
	</div><!-- / #main  -->
	<!-- Modal Start-->
	<div class="modal fade" id="purchaseOrderDtlPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="purchaseOrderDtlPopupLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="purchaseOrderDtlPopupLabel">발주상세조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive" style="height: 300px">
						<table id="purchaseOrderDtlPopupTable"
							class="table table-sm table-bordered">
							<thead>
								<tr>
									<th>발주번호</th>
									<th>공급사</th>
									<th>품번</th>
									<th>차종</th>
									<th>품명</th>
									<th class="text-center">확정수량</th>
									<th>단위</th>
									<th>납기일자</th>
									<th>변경납기일자</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</div>
<%@include file="../layout/bottom.jsp" %>

<style>
.modal-side {
	margin: 10rem auto;
	margin-right: 1rem;
}
</style>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "53%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});
 
	let currentHref = "iosc0300";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","발주관리(봉제)"); 
	
	uiProc(true);
	const serverDate = "${serverDateTo}";
	let mrpMonFromCal = "${serverDateFrom}".substr(0,7);
	let mrpMonToCal = "${serverDateTo}".substr(0,7);
	let mrpDateFromCal = "${serverDateFrom}".substr(0,7);
	let mrpDateToCal = "${serverDateTo}".substr(0,7);
	let dlvDateCal = "${serverDateTo}";
	let mainChargr = "${userNumber}";
	let mainChargrNm = "${userNm}";	
	
	let sideView = 'add';
	let poNo = null;
	let mrpNoVal = null;
	let mrpSeqVal = null;
	let itemCus = null;
	let poStatusOption = ''; //발주상태 초기값 : 진행
	let dealGubun = "";
	
	$('#mrpMonFrom').val(mrpMonFromCal);
	$('#mrpMonTo').val(mrpMonToCal);
	$('#dayDateFrom').val(mrpDateFromCal);
	$('#dayDateTo').val(mrpDateToCal);
	$('#selectDay').val(mrpDateToCal);

	//공통코드 시작
	let receiptGubunCode = new Array(); // 입고구분
	<c:forEach items="${receiptGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	receiptGubunCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	selectBoxAppend(receiptGubunCode, "receiptGubun", "002", ""); 
	
    $('#saveBtnModalY').on('click', function() {
    	itemCus = null;
    	$('#itemCus').val('');
    	
    	uiProc(true);
		$('#form').each(function(){
        	this.reset();
        	$('input[type=hidden]').val('');
    	});
		$('#bizOrderMrpTable').DataTable().ajax.reload(function(){});
		$('#purchaseOrderDtlTable').DataTable().clear().draw();
		
		$('#btnSave').addClass('d-none');
		$('#btnCancle').attr('disabled', true);
		$('#btnAllCheck').prop("checked", false);
		$('input[name=check]').prop("checked", false);
    });
	
	//발주관리(봉제) 목록조회
	let bizOrderMrpTable = $('#bizOrderMrpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		lengthChange : true,	
		destroy : true,	
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		fixedHeader: true,
		pageLength : -1,
		scrollY: "65vh",
		scrollCollapse: true,
		ajax : {
			url : 'io/purchaseOrderList',
			type : 'GET',
			data : {
				'startDate' 		: function(){ return mrpMonFromCal.replace(/-/g,''); },
				'endDate' 			: function(){ return mrpMonToCal.replace(/-/g,''); },
				'poStatusOption' 	: function(){ return poStatusOption; },
				'itemCus' 			: function(){ return itemCus; },
				'mainGubun' 		: function(){ return '002'; },
				'bongjaeCheck' 		: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '생산'이 아닌 것만 조회되도로 구현
			},
		},
		rowId : 'mrpNo',
		columns : [
			{//체크박스
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check" style="min-width: 17px; min-height: 17px;"/>';
				}
			},
			{//공급사
				data : 'dealCorpNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '-';
					}
				},
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
			{//단가 (엑셀에서만 보임)
				data : 'ordUnitCost',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//예정수량
				data : 'preOrderQty',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//예정수량 금액 (엑셀에서만 보임)
				data : 'preOrderQtyCost',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//확정수량
				data : 'orderQty',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//확정수량 금액 (엑셀에서만 보임)
				data : 'orderQtyCost',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//미확정수량
				data : 'unOrderQty',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(data<0){
							return '0';
						}else{
							return rmDecimal(data);
						}
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//미확정수량 금액 (엑셀에서만 보임)
				data : 'unOrderQtyCost',
				render : function(data, type, row, meta) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//상세
				render : function(data,type,row,meta){
					var mrpNo = row['mrpNo'];
					var itemSeq = row['itemSeq'];
					
					return '<button type="button" class="btn btn-secondary" id="btnDtlRead" onclick="btnDtlRead(\''+mrpNo+'\',\''+itemSeq+'\');">보기</button>';
				}
			},
		],
		columnDefs: [
			{targets : [5, 7, 9, 11], "visible": false}
		],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', {
				extend : 'excel'
				,filename : '발주관리(봉제)'
				,title : '발주관리(봉제)'
				,customize : function(xlsx){
					var sheet = xlsx.xl.worksheets['sheet1.xml'];
					var col = $('col', sheet);

			 		col.each(function () {
			 	    	$(this).attr('width', 25);
			 	    });
			 	    
			 		$(col[0]).attr('width', 5);
			 		$(col[5]).attr('width', 12);
			 		$(col[6]).attr('width', 12);
			 		$(col[7]).attr('width', 12);
			 		$(col[8]).attr('width', 12);
			 		$(col[9]).attr('width', 12);
			 		$(col[10]).attr('width', 12);
			 		$(col[11]).attr('width', 12);
				}

		    }, 'print'                                
	    ],
	});
    
	let html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
 	html1 += '<label class="input-label-sm">보기</label>';
	html1 += '<div class="form-group input-sub m-0"><select class="custom-select" id="poStatusOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">미발주항목</option>';
	html1 += '<option value="002">발주완료항목</option>';
    html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">공급사</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="hidden" class="form-control" id="itemRealCus" name="itemRealCus">';
	html1 += '<input type="text" class="form-control" id="itemCus" name="itemCus" disabled>';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" id="itemCusBtn" onClick="itemCusSelectInCorpCd();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	
	html1 += '&nbsp;<button type="button" class="btn btn-primary" id="itemCusDel" onclick="itemCusDelClick();">초기화</button>';
	
	html1 += '</div>';
	html1 += '</div>';
	
	$('#bizOrderMrpTable_length').html(html1);
	
  	//조회 버튼 click
	$('#btnRetv').on('click', function() {
		if($('#mrpMonFrom').val()==''||$('#mrpMonTo').val()==''){
			toastr.warning("날짜를 선택해주세요.");
			return false;
		}
		mrpMonFromCal = $('#mrpMonFrom').val();
		mrpMonToCal = $('#mrpMonTo').val();
		$('#bizOrderMrpTable').DataTable().ajax.reload(function(){});
    });	
	
	//전체조회 버튼 click
	$('#btnAllList').on('click', function() {
	  mrpMonFromCal = "";
	  mrpMonToCal = "";
      
      //공급사
      $('#itemRealCus').val(''); 
	  $('#itemCus').val('');
	  itemCus = '';
	  
      $('#bizOrderMrpTable').DataTable().ajax.reload( function () {});
    });

	let html2 = '<button type="button" class="btn btn-md btn-success float-right mr-3" id="btnMove">발주추가&nbsp;&nbsp;<span class="oi oi-arrow-right"></span></button>';
	$('#bizOrderMrpTable_filter').append(html2);
	
	// 발주추가버튼 클릭
	$('#btnMove').on('click', function() {
		if ( !$('input:checkbox[name=check]').is(":checked") ) {
			toastr.warning("발주등록할 항목을 선택해주세요.");
			return false;
		}
		
		uiProc(false); //화면처리
 		
		if ( purchaseOrderDtlTable.data().count() == 0 ) {
			$('#form').each(function(){
	        	this.reset();
	    	});
			
			$('#poNo').val("자동생성");
			$('#poDate').val(dlvDateCal);
			$('#mainChargr').val(mainChargr);
			$('#mainChargrNm').val(mainChargrNm);
			$('#btnSave').removeClass('d-none');	
			$('#btnCancle').attr('disabled', false);
			$('#purchaseOrderDtl').DataTable().clear().draw();
		}

		let tempDealCorpCd;
		let tempDealCorpNm;
		var arrRow = new Array();
		
 		$('#bizOrderMrpTable tbody tr').each(function(index, item) {
 			let data = bizOrderMrpTable.row(this).data();
			
			if ( $(this).find('td input[name=check]').is(":checked") ) {
				
				let realQty = '';
	 			$.ajax({
					url : '<c:url value="tm/stockPaymentAdmList"/>',
					type : 'GET',
					async : false,
					data : {
						'tmMon' : function(){ return serverDate.replace(/-/g, '').substr(0, 6); },
						'tmDate' : function(){ return serverDate.replace(/-/g, ''); },
						'mainGubun' : function(){ return '002'; },
						'realStockPage' : function(){ return 'Y';},
						'itemSeq' : function(){ return data.itemSeq; },
					},
					success : function(res){
						let data = res.data;
						if (data != null) {
							realQty = data[0].realQty;
						} else {
							realQty = '0';
						}
						
					}
				})
				
				mrpNoVal = data.mrpNo;
				itemSeqVal = data.itemSeq;
				tempDealCorpCd = data.dealCorpCd;
				tempDealCorpNm = data.dealCorpNm;
				let ordQty = data.unOrderQty - (realQty<0?0:realQty) >= 0 ? Math.round(data.unOrderQty - (realQty<0?0:realQty)) : 0;
				var obj = new Array();
				obj = {
					"mrpYear" 	: data.mrpYear,
					"mrpMon" 	: data.mrpMon,
					"itemSeq" 	: data.itemSeq,
					"itemCd" 	: data.itemCd,
					"itemModel" : data.itemModel,
					"itemNm" 	: data.itemNm,
					"unOrdQty" 	: data.unOrderQty,
					"needQty" 	: data.unOrderQty,
					"realQty" 	: realQty,
					"ordQty" 	: ordQty,
					"itemUnit" 	: data.itemUnitNm,
					"dlvDate" 	: data.dlvDate,
				}
				arrRow.push(obj);
			}
 		});  

 		$('#purchaseOrderDtlTable').DataTable().rows.add(arrRow).draw(true);

 	/* 	{
			"mrpYear" 	: data.mrpYear,
			"mrpMon" 	: data.mrpMon,
			"itemSeq" 	: data.itemSeq,
			"itemCd" 	: data.itemCd,
			"itemModel" : data.itemModel,
			"itemNm" 	: data.itemNm,
			"unOrdQty" 	: data.unOrderQty,
			"needQty" 	: data.unOrderQty,
			"realQty" 	: realQty,
			"ordQty" 	: ordQty,
			"itemUnit" 	: data.itemUnitNm,
			"dlvDate" 	: data.dlvDate,
		} */
		
 		$('#dealCorpCd').val(tempDealCorpCd);
		$('#dealCorpNm').val(tempDealCorpNm);
 		$('#btnAllCheck').prop("checked", false);
 		
	});
	
	//초기화 버튼 클릭시
	function itemCusDelClick(){
		$('#itemRealCus').val(''); 
		$('#itemCus').val('');
		
		itemCus = '';
		$('#bizOrderMrpTable').DataTable().ajax.reload( function () {});
	}
	
	//공급사 팝업 시작
	let dealCorpPopUpTable4;
	function itemCusSelectInCorpCd() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		let dealArr = ['002','003'];
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({
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
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealArr' :  function(){return dealArr;},
				},
			},
			rowId : 'dealCorpSeq',
			columns : [ 
			{
				data : 'dealCorpNm'
			}, 
			{
				data : 'dealCorpCd'
			}, 
			{
				data : 'presidentNm'
			}, 
			{
				data : 'repreItem'
			}, 
			{
				data : 'corpNo'
			} 
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			let data = dealCorpPopUpTable4.row(this).data();
			$('#itemRealCus').val(data.dealCorpCd);
			$('#itemCus').val(data.dealCorpNm);
			$('#dealCorpPopUpModal4').modal('hide');
			
			itemCus = data.dealCorpCd;
			$('#bizOrderMrpTable').DataTable().ajax.reload( function () {});
		});
		$('#dealCorpPopUpModal4').modal('show');
	}

	
    // 발주관리(봉제) 목록선택
	$('#bizOrderMrpTable tbody').on('click','tr',function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=check]').prop('checked', false);
		} else {
			//$('#bizOrderMrpTable').DataTable().$('tr.selected').removeClass('selected');

			//미발주수량이 있는 내역확인
			if ( $(this).find('input[name=check]').is(":disabled") ) {
				toastr.warning("미확정수량이 없는 발주내역입니다.");
			} else {
				$(this).addClass('selected');
				$(this).find('input[name=check]').prop('checked',true);
			}
		}
		
		poNo = bizOrderMrpTable.row(this).data().poNo;
		mrpNoVal = bizOrderMrpTable.row(this).data().mrpNo;
		mrpSeqVal = bizOrderMrpTable.row(this).data().mrpSeq;
		itemSeqVal = bizOrderMrpTable.row(this).data().itemSeq;
		
		$('#btnDtlSave').addClass('d-none');
	});
	
	// 발주조건 변경
	$('#poStatusOption').on('change', function() {
		poStatusOption =  $('#poStatusOption').val();
		$('#bizOrderMrpTable').DataTable().ajax.reload( function () {});
    });	
    
	// 모든 체크박스 선택
	$('#btnAllCheck').on('click', function() {
		if ( $('#btnAllCheck').prop("checked") ) {
			$('#bizOrderMrpTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input[name=check]').is(':disabled') ) {
					$(this).find('input:checkbox[name=check]').prop("checked", true);
					$(this).addClass('selected');
				}
			});
		} else {
			$('#bizOrderMrpTable tbody tr').each(function(index, item) {	
				if ( !$(this).find('input[name=check]').is(':disabled') ) {
					$(this).find('input:checkbox[name=check]').prop("checked", false);
					$(this).removeClass('selected');
				}
			});
		}
	})
	
	//발주 목록조회
	let purchaseOrderDtlTable = $('#purchaseOrderDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		fixedHeader: true,
		scrollY: "45vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="io/purchaseOrderRead"/>',
			type : 'GET',
			data : {
				'mrpNo' 	: function(){ return mrpNoVal; },
				'itemCd' 	: function(){ return null; },
			}
		},	
		columns : [
			{//체크박스
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check2" style="min-width: 17px; min-height: 17px;"/>';
				}
			},
			{//품번
				data : 'itemCd',
				render : function(data,type, row, meta){
					
					if(data!=null){
						var html = '<input type="text" class="form-control p-0" style="max-width:100%; text-align:center; border:none;" name="itemCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="mrpNo" value="'+mrpNoVal+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'" disabled>';
						return html;
					} else{
						return '<input type="text" class="form-control" name="itemCd" value="" disabled>';
					}		
				}
			}, 
			{//차종
				data : 'itemModel',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control p-0" style="text-align:center; border:none;"" name="itemModel" value="'+data+'" disabled>';		
					} else{
						return '<input type="text" class="form-control p-0" style="text-align:center;" name="itemModel" value="" disabled>';
					}	
				}
			},
			{//품명
				data : 'itemNm',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control" name="itemNm" value="'+data+'" style="text-align:center; border:none;" disabled>';		
						
					} else{
						return '<input type="text" class="form-control" name="itemNm" value="" style="text-align:center;" disabled>';
					}	
				}
			},
			{//미발주수량
				data : 'unOrdQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" name="unOrdQty" value="'+rmDecimal(data)+'" style="text-align:right;" disabled>';		
						
					} else{
						return '<input type="text" class="form-control number-float0" name="unOrdQty" value="0" style="text-align:right;" disabled>';
					}	
				}
			},
			{//필요수량
				data : 'needQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" name="needQty" value="'+rmDecimal(data)+'" style="text-align:right;" disabled>';		
						
					} else{
						return '<input type="text" class="form-control number-float0" name="needQty" value="0" style="text-align:right;" disabled>';
					}	
				}
			},
			{//재고수량
				data : 'realQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" name="realQty" value="'+rmDecimal(data)+'" style="text-align:right;" disabled>';		
					} else{
						return '<input type="text" class="form-control number-float0" name="realQty" value="0" style="text-align:right;" disabled>';
					}	
				}
			},
			{//발주수량
				data : 'ordQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control number-float0 focused-input" id="ordQty_'+meta.row+'" name="ordQty"  onkeyup="numberFormat(this, \'int\')" onkeydown="moveFocus('+meta.row+')" value="'+rmDecimal(data)+'" style="text-align:right;">';		
					} else {
						return '<input type="text" class="form-control number-float0 focused-input" id="ordQty_'+meta.row+'" name="ordQty" onkeyup="numberFormat(this, \'int\')" onkeydown="moveFocus('+meta.row+')" value="0" style="text-align:right;">';
					}	
				}
			},
			{//단위
				data : 'itemUnit',
				render : function(data, type, row, meta){
					if(data!=null){
						return '<input type="text" class="form-control p-0" name="itemUnit" value="'+data+'" style="text-align:center; border:none;"" disabled>';		
					} else{
						return '<input type="text" class="form-control p-0" name="itemUnit" value="" style="text-align:center;" disabled>';
					}	
				}
			},
			{//납기일자
				data : 'dlvDate',
				render : function(data, type, row, meta){
					return '<input class="form-control" type="date" style="text-align:center" value="'+dlvDateCal+'" name="dlvDate">';
				}
			},
		],
		columnDefs: [
			//{ "targets": [9,10] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        ],
	    order: [],
	    buttons: [],
	});
	
	//모든 체크박스 선택
	$('#btnAllCheck2').on('click', function() {
		if ( $('#btnAllCheck2').prop("checked") ) {
			$('input:checkbox[name=check2]').prop("checked",true);
		} else {
			$('input:checkbox[name=check2]').prop("checked",false);
		}
	});
	
	//납기일 전체 적용 버튼 클릭
	$('#applyDate').on('click', function() {
		if($('#selectDay').val()==''||$('#selectDay').val()==null){
			toastr.warning("날짜를 선택해주세요.");
			return false;
		}
		$('#purchaseOrderDtlTable tbody tr').each(function(index, item){
 			if($(this).find('td input[name=check2]').is(':checked')){
 				$(this).find('td input[name=dlvDate]').val($('#selectDay').val());
 	 		}
		});
		toastr.success("적용되었습니다.");
	});
	
	// 발주취소버튼 클릭
	$('#btnCancle').on('click', function() {
		let array = [];
		let i = 0;
		$('#purchaseOrderDtlTable tbody tr').each(function(index, item){
 			if($(this).find('td input[name=check2]').is(':checked')){
 				array[i]=index;
 				i++;
 	 		}
		});

		$('#purchaseOrderDtlTable').DataTable().rows(array).remove().draw();
		$('#btnAllCheck2').prop('checked',false);
	});
	
	// 필요수량 적용버튼 클릭
	$('#btnDateApply').on('click', function() {
		if ( $('#dayDateFrom').val() == '' ) {
			toastr.warning("적용일자를 입력해주세요.");
			$('#dayDateFrom').focus();
			return false;
		}
		if ( $('#dayDateTo').val() == '' ) {
			toastr.warning("적용일자를 입력해주세요.");
			$('#dayDateTo').focus();
			return false;
		}
		if ( $('#dayDateFrom').val().replace(/-/g,'').substr(0, 6) != $('#dayDateTo').val().replace(/-/g,'').substr(0, 6) ) {
			toastr.warning("같은 달의 적용일자를 입력해주세요.");
			$('#dayDateTo').focus();
			return false;
		}
		if ( $('#dayDateTo').val().replace(/-/g,'') - $('#dayDateFrom').val().replace(/-/g,'') < 0 ) {
			toastr.warning("적용일자의 간격이 1일 미만입니다.");
			$('#dayDateTo').focus();
			return false;
		}
		if ( !$('input:checkbox[name=check2]').is(":checked") ) {
			toastr.warning("필요수량을 적용할 항목을 선택해주세요.");
			return false;
		}

		let dayArr = '';
		let forStart = $('#dayDateFrom').val().replace(/-/g,'').substr(6, 8)*1;
		let forLast = $('#dayDateTo').val().replace(/-/g,'').substr(6, 8)*1;
		for ( var i = forStart; i <= forLast; i++ ) { //적용일자 간격 계산
			let dayVal = '';
			if (i < 10) {dayVal = '0' + i}
			else {dayVal = '' + i}
			
			if (i == forStart) { dayArr =  "'" + dayVal + "'" }
	        else { dayArr = dayArr + ", '" + dayVal + "'" }
		}
		
		$('#my-spinner').show(function(){
			$('#purchaseOrderDtlTable tbody tr').each(function(index, item) {
	 			let data = purchaseOrderDtlTable.row(this).data();
				
				if ( $(this).find('td input[name=check2]').is(":checked") ) {
					let needQty = '';
		 			$.ajax({
		 				url : '<c:url value="io/purchaseNeedQtyRead"/>',
		 				type : 'GET',
		 				async : false,
		 				data : {
		 					'mrpYear' 	: function(){ return data.mrpYear; },
		 					'mrpMon' 	: function(){ return data.mrpMon; },
		 					'itemSeq' 	: function(){ return data.itemSeq; },
		 					'dayArr' 	: function(){ return dayArr; },
		 				},
						success : function(res){
							if (res.result == 'ok') {
								needQty = res.needQty;
							} else {
								toastr.error(res.message);
							}
						},
					});
		 			
		 			$(this).find('td input[name=needQty]').val(rmDecimal(needQty));
		 			let ordQty = needQty - data.realQty >= 0 ? needQty - data.realQty : 0; //필요수량 - 재고수량 = 발주수량
		 			$(this).find('td input[name=ordQty]').val(rmDecimal(ordQty));
				}
	 		});
			
			$('#my-spinner').hide();
	 		toastr.success('필요수량이 적용되었습니다.');
		});
 		
	});
	
	//발주등록 버튼 클릭시
	$('#btnSave').on('click', function() {
		let dataArray = new Array();
		let check = true;
		
		if (!$.trim($('#dealCorpNm').val())) {
			$('#btnDealCorp').focus();
			toastr.warning('공급사를 선택해 주세요.');
			check = false;
			return false;
		}
		if (!$.trim($('#mainChargrNm').val())) {
			$('#btnMainChargr').focus();
			toastr.warning('발주자를 선택해 주세요.');
			check = false;
			return false;
		}
		if (!$.trim($('#receiptGubun').val())) {
			$('#receiptGubun').focus();
			toastr.warning('발주구분을 선택해 주세요.');
			check=false;
			return false;
		}
		if(!$.trim($('#poDate').val())){
			$('#poDate').focus();
			toastr.warning('발주일자를 선택해 주세요.');
			check=false;
			return false;
		}
			
		$('#purchaseOrderDtlTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=ordCnt]').val() != 0 ) {
				if ( $(this).find('td input[name=ordQty]').val().replace(/,/g,'')*1 <= 0 ) {
					toastr.warning('발주수량을 입력해 주세요.');
					$(this).find('td input[name=ordQty]').focus();
					check = false;
					return false;
				}
				if($(this).find('td input[name=dlvDate]').val()==''){
					toastr.warning('납기일을 입력해주세요.');
					$(this).find('td input[name=dlvDate]').focus();
					check = false;
					return false;
				}
				
				let rowData = new Object();
				//발주 기본정보
				rowData.dealCorpCd = $('#dealCorpCd').val();
				rowData.mainChargr = $('#mainChargr').val();
				rowData.poDate = $('#poDate').val().replace(/-/g,'');
				rowData.receiptGubun = $('#receiptGubun option:selected').val();
				rowData.poDesc = $('#poDesc').val();

				//발주 상세내역
				rowData.mrpNo = $(this).find('td input[name=mrpNo]').val();
				rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
			    rowData.ordQty = $(this).find('td input[name=ordQty]').val().replace(/,/g,'');
			    rowData.dlvDate = $(this).find('td input[name=dlvDate]').val().replace(/-/g,"");
		        dataArray.push(rowData);
		        console.log(rowData);
			}
		});

		if (check) {
			$.ajax({
				url :'<c:url value="io/purchaseOrderAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
				    	itemCus = null;
				    	$('#itemCus').val('');
						uiProc(true);
						$('#form').each(function(){
				        	this.reset();
				        	$('input[type=hidden]').val('');
				    	});
						$('#bizOrderMrpTable').DataTable().ajax.reload(function(){});
						$('#purchaseOrderDtlTable').DataTable().clear().draw();
						
						$('#btnSave').addClass('d-none');
						$('#btnCancle').attr('disabled', true);
						$('#btnAllCheck').prop("checked", false);
						$('input[name=check]').prop("checked", false);
						$('#btnAllCheck2').prop("checked", false);
						
						toastr.success('등록되었습니다.');
					} else if (res.result == "fail") {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide(); //처리완료..
				}
			});
		}
	});
	
	//발주상세 팝업 시작
	let purchaseOrderDtlPopupTable;
	function btnDtlRead(mrpNo,itemSeq) {
		mrpNoVal = mrpNo;
		itemSeqVal = itemSeq;
		if (purchaseOrderDtlPopupTable == null || purchaseOrderDtlPopupTable == undefined) {
			purchaseOrderDtlPopupTable = $('#purchaseOrderDtlPopupTable').DataTable({
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
					url : '<c:url value="/io/purchaseOrderRead"/>',
					type : 'GET',
					data : {
						'mrpNo'  	: function(){ return mrpNoVal; },
						'itemSeq' 	: function(){ return itemSeqVal; },
					},
				},
				rowId : 'matrlUser',
				columns : [ 
					{data : 'poNo',},
					{data : 'dealCorpNm'},
					{data : 'itemCd'},
					{data : 'itemModel'},
					{data : 'itemNm'},
					{
						data : 'ordQty',
						'className' : 'text-right'
					},
					{data : 'itemUnit'},
					{
						data : 'dlvDate',
						render : function(data, type, row, meta) {
							return moment(data).format('YYYY-MM-DD'); 
						}
					},
					{
						data : 'dlvChangeDate',
						render : function(data, type, row, meta) {
							if(data!=null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},
				],
				columnDefs : [ 
					{"defaultContent" : "-","targets" : "_all","className" : "text-center"},
					{ targets: [5,7], render: $.fn.dataTable.render.number( ',' ) },
				],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
		}
		$('#purchaseOrderDtlPopupTable').DataTable().ajax.reload(function(){});
		$('#purchaseOrderDtlPopupModal').modal('show');
 	}
	
	//거래처 팝업 시작
   	let dealCorpPopUpTable;
   	let dealArr = ['002','003'];
   	function selectDealCorp(){	   	
		if(dealCorpPopUpTable == null || dealCorpPopUpTable == undefined) {
			dealCorpPopUpTable = $('#dealCorpPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange: true,
				serverSide : false,
		        pageLength: 15,
				ajax : {
					url : '<c:url value="bm/dealCorpDataList"/>',
					type : 'GET',
					data : {
						'dealArr' 	: function(){ return dealArr; },
						'dealGubun' : function(){ return dealGubun; },
					},
				},
				rowId : 'dealCorpCd',
				columns : [ {
					data : 'dealCorpNm'
				}, {
					data : 'dealCorpCd'
				}, {
					data : 'presidentNm'
				}, {
					data : 'repreItem'
				}, {
					data : 'corpNo'
				} ],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

			let html1 = '<div class="row">';
			html1 += '<label class="input-label-sm">거래구분</label>'; 
			html1 += '<select class="custom-select" id="dealGubun">';
			html1 += '<option value="" selected>전체</option>';
			html1 += '<option value="002">공급사</option>';
			html1 += '<option value="003">외주사</option>';
			html1 += '</select>';
			html1 += '</div>';
			
			$('#dealCorpPopUpTable_length').html(html1);

			//거래구분 변경시
			$('#dealGubun').on('change', function() {
				dealGubun = $("#dealGubun").val();	//발주구분
				$('#dealCorpPopUpTable').DataTable().ajax.reload( function () {});
		    });	
		    

		    $('#dealCorpPopUpTable tbody').on('click', 'tr', function () {
		    	let data = dealCorpPopUpTable.row( this ).data();
			    $('#dealCorpCd').val(data.dealCorpCd);
			    $('#dealCorpNm').val(data.dealCorpNm);
			    $('#telNo').val(data.telNo);
			    $('#mainChargr').val(data.bizCharger);
			    
				$('#dealCorpPopUpModal').modal('hide');		
		    });
		} else {
			$('#dealCorpPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal').modal('show');		
   	} 
	
    //담당자 팝업 시작
	let userPopUpTable;
	function selectMainChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 15,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {
					}
				},
				rowId : 'userNumber',
				columns : [ {
					data : 'userNm'
				}, {
					data : 'departmentNm'
				}, {
					data : 'postNm'
				}, {
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				let data = userPopUpTable.row(this).data();
				$('#mainChargr').val(data.userNumber);
				$('#mainChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}
	
	function uiProc(flag) {
		$("#poDesc").attr("disabled", flag);
		$('#btnDealCorp').attr('disabled',flag);
		$('#btnMainChargr').attr('disabled',flag);
		$('#poDate').attr('disabled',flag);
		$('#receiptGubun').attr('disabled',flag);
		$('#selectDay').attr('disabled',flag);
		$('#applyDate').attr('disabled',flag);
	}


	//확정수량 텍스트박스 커서 이동 (엔터키 클릭 시)
	$(document).on('keypress', 'input[name=ordQty]', function(e) {
		if(e.which == 13) {
			let $this = $(this);
			let index = $this.closest('tr').index();
			let nextIndex = index + 1;
			setTimeout(function(){
			    if(nextIndex < purchaseOrderDtlTable.rows().count()) {
			    	purchaseOrderDtlTable.row(nextIndex).nodes().to$().find('input[name=ordQty]').focus();
			    	setTimeout(function(){
			    		purchaseOrderDtlTable.row(nextIndex).nodes().to$().find('input[name=ordQty]').select();
				    },100)
			    } else {
			    	purchaseOrderDtlTable.row(0).nodes().to$().find('input[name=ordQty]').focus();
			    	setTimeout(function(){
			    		purchaseOrderDtlTable.row(0).nodes().to$().find('input[name=ordQty]').select();
			    	},100)
			    }
			},100)
		}
	});

</script>   	
</body>
</html>
