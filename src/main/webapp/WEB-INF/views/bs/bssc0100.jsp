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
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">출고처리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="deliveryOrderAdmTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="11%">
								<col width="15%">
								<col width="15%">
								<col width="9%">
								<col width="9%">
								<col width="9%">
								<col width="11%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>발주처</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">출고지시량</th>
									<th class="text-center">출고량</th>
									<th class="text-center">미출고량</th>
									<th>출고지시일</th>
									<th>납품장소</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnEdit">출고등록</button>
						<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnAdd">출고등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="form">
						<div class="table-responsive">
							<table class="table table-sm table-bordered mb-2">
								<colgroup>
									<col width="25%">
									<col width="25%">
									<col width="25%">
									<col width="25%">
								</colgroup>
								<tr>

<!-- 									<th>출고의뢰</th> -->
<!-- 									<td> -->
<!-- 										<div class="input-sub m-0" style="width: 100%"> -->
<!-- 											<input type="hidden" class="form-control" id="poCorpCd" -->
<!-- 												name="poCorpCd" disabled> <input type="text" -->
<!-- 												class="form-control" id="poCorpNm" name="poCorpNm" disabled> -->
<!-- 											<button type="button" -->
<!-- 												class="btn btn-primary input-sub-search" id="btnPoCorpCd" -->
<!-- 												onclick="selectPoCorpCd()"> -->
<!-- 												<span class="oi oi-magnifying-glass"></span> -->
<!-- 											</button> -->
<!-- 										</div> -->
<!-- 									</td> -->
									<th>출고지시일</th>
									<td>
										<div class="form-group input-sub m-0 row">
											<input class="form-control" style="width: 100%;" type="text"
												id="doDate" name="doDate" disabled />
											<button onclick="fnPopUpCalendar(doDate,doDate,'yyyy-mm-dd')"
												class="btn btn-secondary input-sub-search"
												id="doDateCalendar" type="button">
												<span class="oi oi-calendar"></span>
											</button>
										</div>
									</td>
									<th>발주처</th>
									<td>
										<div class="input-sub m-0" style="width: 100%">
											<input type="hidden" class="form-control" id="poCorpCd" name="poCorpCd" style="text-align:center;" disabled> 
											<input type="text" class="form-control" id="poCorpNm" name="poCorpNm" style="text-align:center;" disabled>
										</div>
									</td>
								<tr>
									<th>납품장소</th>
									<td>
										<div class="input-sub m-0" style="width: 100%">
											<input type="hidden" class="form-control" id="doCorpCd" name="doCorpCd" style="text-align:center;" disabled> 
											<input type="text" class="form-control" id="doCorpNm" name="doCordNm" style="text-align:center;" disabled>
										</div>
									</td>
									<th>차종</th>
									<td>
										<input type="text" class="form-control" id="itemModelNm" style="text-align:center;" disabled>
									</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<input type="hidden" id="itemSeq">
										<input type="text" class="form-control" id="itemCd" style="text-align:center;" disabled>
									</td>
									<th>품명</th>
									<td>
										<input type="text" class="form-control" id="itemNm" style="text-align:center;" disabled>
									</td>
								</tr>
								<tr>
									<th>LH/RH</th>
									<td>
										<input type="text" class="form-control" id="lhrhCdNm" style="text-align:center;" disabled>
									</td>
									<th>색상</th>
									<td>
										<input type="text" class="form-control" id="itemColor" style="text-align:center;" disabled>
									</td>
								</tr>
								<tr>
									<th>포장수량</th>
									<td>
										<input type="text" class="form-control" id="boxCount" style="text-align:right" disabled>
									</td>
									<th>단위</th>
									<td>
										<input type="text" class="form-control" id="itemUnitNm" style="text-align:center;" disabled>
									</td>
								</tr>
								<tr>
									<th>출고지시량</th>
									<td><input type="text" class="form-control" id="targetQty" disabled style="text-align:right"></td>
									<th>출고량</th>
									<td><input type="text" class="form-control" id="outputQty" disabled style="text-align:right"></td>
								</tr>
								<tr>
									<th>미출고량</th>
									<td><input type="text" class="form-control" id="remainQty" disabled style="text-align:right"></td>
									<th></th>
									<td></td>
								</tr>
								<tr>
									<th>Barcode No</th>
									<td colspan="3"><input type="text" class="form-control"
										id="barcodeNo" placeholder="스캐너만 입력" style="max-width: 100%;" disabled></td>
								</tr>
							</table>
						</div>
					</form>
					<div class="card-body col-sm-12 pb-0">
						<button type="button" class="btn btn-warning float-right mr-1" id="btnDtlDel" disabled>삭제</button>
					</div>
					<table class="table table-sm table-bordered mb-2" id="deliveryProcDtlTable">
						<colgroup>
							<col width="25%">
							<col width="30%">
							<%-- <col width="10%"> --%>
							<col width="25%">
							<col width="20%">
							<%-- <col width="20%"> --%>
						</colgroup>
						<thead>
							<tr>
								<th>Barcode No</th>
								<th>품번</th>
								<!-- <th>입고수량</th> -->
								<th>출고일자</th>
								<th>출고수량</th>
								<!-- <th>구억/위치</th> -->
							</tr>
						</thead>

					</table>
				</div>
				<div class="mt-2">
					<button type="button"
						class="btn btn-primary float-right mr-1 d-none" id="btnSave">저장</button>
					<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
						type="button" disabled>
						<span class="spinner-border spinner-border-sm" role="status"
							aria-hidden="true"></span>처리중
					</button>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<!-- Modal1 Start-->
<div class="modal fade bd-example-modal-lg" id="deliveryOrderPopupModal"
	tabindex="-1" role="dialog" aria-labelledby="deliveryOrderPopupLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="deliveryOrderPopupLabel">출고의뢰현황 조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<hr class="text-secondary">
				<div class="table-responsive" style="height: 650px">
					<table id="deliveryOrderPopupTable" class="table table-bordered">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>출고요청일</th>
								<th>오더구분</th>
								<th>발주처</th>
								<th>품명(Type)</th>
								<th class="text-center">출고지시량</th>
								<th class="text-center">출하량</th>
								<th class="text-center">미출하량</th>
								<th>납기일</th>
								<th>납품장소</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetPartCnt">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal1 End-->
<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "bssc0100";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","출고처리"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = 'add';
	uiProc(true);
	uiProc2(true);

	var index = 0;
	var tableIdx;

	var doNo;
	var doSeq;
	var itemSeq;
	var itemCd;
	var itemNm;
	var itemGubunNm;
	var barcodeNo;
	var outputDtlQty;
	var sum = 0;
	var poCorpCd = '';

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	
	var poCorpNmgubun = new Array();
	<c:forEach items="${poCorpNmgubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.dealCorpCd}";
	json.baseNm = "${info.dealCorpNm}";
	poCorpNmgubun.push(json);
	</c:forEach>

	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
	         this.reset();
	    });
	    sideView = 'add';
		uiProc(true);
		uiProc2(true);

		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
		$('#btnDtlDel').attr('disabled', true);
		$('#deliveryProcDtl').DataTable().clear().draw();
		$('#deliveryOrderAdmTable').dataTable().$('tr.selected').removeClass('selected');
	});

	//출고의뢰등록 목록조회
	let deliveryOrderAdmTable = $('#deliveryOrderAdmTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,	
			destroy : true,	
			paging : true,
			searching : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 20,
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {				 
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); },
	           	'poCorpCd': function() { return poCorpCd; },
			}	
		},	
		rowId : '',
		columns : [ 
				{data :'poCorpNm'},
				{data :'itemModelNm'},
				{data :'itemCd'},
				{data :'itemNm'},
				{data: 'targetQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} 
					}, "className": "text-right" 	
				},
				{data: 'outputQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} else {
							return '';
						}
					}, "className": "text-right" 	
				},
				{data: 'remainQty',
					render: function(data, type, row, meta) {
						if(data != null){
							return addCommas(data);
						} else {
							return '';
						}
					}, "className": "text-right" 	
				},
				{data :'doDate',
					render : function(data, type, row, meata){
						return moment(data).format("YYYY-MM-DD");
					}
				},
// 				{data :'dlvDate',
// 					render : function(data, type, row, meata){
// 						return moment(data).format("YYYY-MM-DD");
// 					}
// 				},
				{data :'doCorpNm'},
		],
	  	order: [
	    ], 
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

	//출고처리목록 보기
	$('#deliveryOrderAdmTable tbody').on('click','tr',function() {
		sideView = "edit";

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right mr-1') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#deliveryOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		var tempPoCorpCd = deliveryOrderAdmTable.row(this).data().poCorpCd;
		var tempItemSeq = deliveryOrderAdmTable.row(this).data().itemSeq;
		
		$.ajax({
			url : '<c:url value="bs/deliveryOrderAdmRead"/>',
			type : 'GET',
			async : false,
			data :{
				'poCorpCd' : function(){return tempPoCorpCd;},
				'itemSeq' : function(){return tempItemSeq;},
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					doNo = data[0].doNo;
					doSeq = data[0].doSeq;
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		
		itemSeq = deliveryOrderAdmTable.row(this).data().itemSeq;
		itemCd = deliveryOrderAdmTable.row(this).data().itemCd;

		$('#poCorpCd').val(deliveryOrderAdmTable.row(this).data().poCorpCd);
		$('#poCorpNm').val(deliveryOrderAdmTable.row(this).data().poCorpNm);
		$('#doCorpCd').val(deliveryOrderAdmTable.row(this).data().doCorpCd);
		$('#doCorpNm').val(deliveryOrderAdmTable.row(this).data().doCorpNm);

		$('#doDate').val(moment(deliveryOrderAdmTable.row(this).data().doDate).format('YYYY-MM-DD'));
		$('#itemSeq').val(deliveryOrderAdmTable.row(this).data().itemSeq);
		$('#itemCd').val(deliveryOrderAdmTable.row(this).data().itemCd);
		$('#itemNm').val(deliveryOrderAdmTable.row(this).data().itemNm);
		$('#itemModelNm').val(deliveryOrderAdmTable.row(this).data().itemModelNm);
		$('#lhrhCdNm').val(deliveryOrderAdmTable.row(this).data().lhrhCdNm);
		$('#itemColor').val(deliveryOrderAdmTable.row(this).data().itemColor);
		$('#boxCount').val(addCommas(deliveryOrderAdmTable.row(this).data().boxCount));
		$('#itemUnitNm').val(deliveryOrderAdmTable.row(this).data().itemUnitNm);
		$('#targetQty').val(addCommas(deliveryOrderAdmTable.row(this).data().targetQty));
		$('#outputQty').val(addCommas(deliveryOrderAdmTable.row(this).data().outputQty));
		$('#remainQty').val(addCommas(deliveryOrderAdmTable.row(this).data().remainQty));

		//console.log(deliveryOrderAdmTable.row(this).data().doDate)

		$('#deliveryProcDtlTable').DataTable().ajax.reload(function() {});

		$('#btnSave').addClass('d-none');
		$('#btnEdit').attr('disabled', false);
		$('#btnDtlDel').attr('disabled', true);
		uiProc(true);
	});

	//출고처리 상세조회
	let deliveryProcDtlTable = $('#deliveryProcDtlTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bs/deliveryProcDtlRead"/>',
			type : 'GET',
			data : {
				'doNo' : function() {return doNo;},
				'doSeq' : function() {return doSeq;}
			}
		},
		rowId : '',
		columns : [
				{data : 'barcodeNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
		    				return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>';	
						} else{
							var html = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>' ;	
								html += '<input type="hidden" name="locationNo" value="'+locationNo+'" >' ;
								html += '<input type="hidden" name="inLoc" value="'+inLoc+'" >' ;
								html += '<input type="hidden" name="inArea" value="'+inArea+'" >' ;
								html += '<input type="hidden" name="inFloor" value="'+inFloor+'" >' ;
							return html;
						}		    			
		    		}
				}, 
				{
					data : 'itemCd',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<input type="hidden" name="itemDtlSeq" value="'+row['itemSeq']+'" >' ;
							html += '<input type="text" class="form-control" style="text-align:center;" name="itemDtlCd" value="'+data+'" disabled>' ;
							return html;

						} else {
							var html = '<input type="hidden" name="itemDtlSeq" value="'+row['itemSeq']+'" >' ;
							html += '<input type="text" class="form-control" style="text-align:center;" name="itemDtlCd" value="'+itemCd+'" disabled>' ;
							return html;
						}
					}
				},
				{
					data : 'doDtlDate',
					render : function(data, type, row, meta) {
						var value = "";
						if (data != null) {
							value = '<input class="form-control" type="text" id="doDtlDate'
									+ index
									+ '" value="'
									+ moment(data).format(
											"YYYY-MM-DD")
									+ '" name="doDtlDate" disabled>';
							value2 = '<button onclick="fnPopUpCalendar(doDtlDate'
									+ index
									+ ',doDtlDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="doDtlDateCalendar'
									+ index
									+ '" name="dlvDateCalendar" type="button" disabled>';
						} else {
							value = '<input class="form-control" type="text" id="doDtlDate'+index+'" value="'+serverDate+'" name="doDtlDate" disabled>';
							value2 = '<button onclick="fnPopUpCalendar(doDtlDate'
									+ index
									+ ',doDtlDate'
									+ index
									+ ',\'yyyy-mm-dd\')" class="btn btn-secondary input-sub-search" id="doDtlDateCalendar'
									+ index
									+ '" name="dlvDateCalendar" type="button">';
						}
						var html = '<div class="form-group input-sub m-0">';
						html += value;
						html += value2;
						html += '<span class="oi oi-calendar"></span></button>';
						html += '</div>';

						index++;
						return html;
					}
				}, 
				{
					data : 'outputDtlQty',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control number-float0" style="text-align:right;" name="outputDtlQty" value="'+addCommas(data)+'" disabled>';

						} else {
							return '<input type="text" class="form-control number-float0" style="text-align:right;" name="outputDtlQty" value="'+addCommas(outputDtlQty)+'">';
						}
					}
				},
				/*  {
					data : 'doDtlDesc',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center;" name="doDtlDesc" value="'+data+'" disabled>';

						} else {
							return '<input type="text" class="form-control" style="text-align:center;" name="doDtlDesc" value="">';
						}
					}
				}, */ 
				],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	$('#deliveryProcDtlTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#deliveryProcDtlTable').DataTable().$(
					'.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#deliveryProcDtlTable').DataTable().row(
				this).index();
		btnView == "edit";
	});

	//등록버튼 클릭시 
	$('#btnAdd').on('click', function() {

		sideView = 'add';
		
		$('#form').each(function() {
			this.reset();
		});

		uiProc(false);
		$('#btnEdit').attr('disabled', true);
		$('#btnDtlDel').attr('disabled', false);

		$('#deliveryProcDtlTable').DataTable().clear().draw();

		$('#btnSave').removeClass('d-none');
	});

	//수정버튼 클릭시 
	$('#btnEdit').on('click', function() {

		if (sideView != "edit") {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		uiProc(false);
		uiProc2(false);

		//$('#doDate').val(serverDate);
		$('#btnDtlDel').attr('disabled', false);
		//selectBoxAppend(ordGubunCode, "ordGubun", "" , "");
		$('#btnSave').removeClass('d-none');
		//doNo = "";
		//$('#deliveryOrderDtlTable').DataTable().ajax.reload(function() {});

	});


	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		var check2=true;  	
		if(e.keyCode == 13){
			
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check2 = false;
				return false;
			}
			
			if(check2){
			 	$.ajax({
	            	url: '/wm/barcodeNoScanOutList',
	                type: 'GET',
	                data: {
	                	'barcodeNo'  :  $('#barcodeNo').val(),
	                	'itemSeq'  :  function(){return itemSeq},                 
	                },
	                success: function (res) {
	                    let data = res.data;
	                    
	                    if (res.result == 'ok') {
	                    	barcodeNo = data.workOrdNo;
		                    workOrdNo = data.workOrdNo;
		                    itemSeq = data.itemSeq;
		                    itemNm = data.itemNm;
		                    itemGubunNm = data.itemGubunNm;
		                    outputDtlQty =  Math.floor(data.remainQty);

		                    locationNo = data.locationNo;
		                    inLoc = data.inLoc;
		                    inArea = data.inArea;
		                    inFloor = data.inFloor;
		                    
	                    	$('#deliveryProcDtlTable').DataTable().row.add({}).draw(false);
							$('#btnSave').removeClass('d-none');
	                        toastr.success("추가되었습니다.");
	                        
	                    }else{
	                    	if(res.result == 'fail') {
		                    	toastr.warning(res.message);
		                    }else if(res.result == 'error') {
		                    	toastr.error(res.message, '', {timeOut: 5000});
		                    }    
	                    	$('#barcodeNo').select();
		                } 
		             }
		        });
			}
		}
	});
	

	// 삭제폼
	$('#btnDtlDel').on('click', function() {

		if (btnView == "edit") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$('#deliveryProcDtlTable').DataTable().rows(tableIdx).remove().draw();

	});

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=outputDtlQty]", function(event){
		var preInWhsQtyData = $(this).val();
		
		if (!((event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("");
			$(this).select();
			event.preventDefault();
			return false;
		}
		$(this).val(addCommas(uncomma($(this).val())));
	});

	// 저장 처리
	$('#btnSave').on('click',function() {

		var check = true;
		var dataArray = new Array();

		$('#deliveryProcDtlTable tbody tr').each(function(index, item) {

			if (deliveryProcDtlTable.data().count() != 0) {

				if ($(this).find('td input[name=outputDtlQty]').val() == "") {
					toastr.warning('출고량을 입력해주세요.');
					$('input [name=outputDtlQty]').focus();
					check = false;
					return false;
				}
				
			} else {
				toastr.warning('LOT NO를 스캔해주세요.');
				check = false;
				return false;
			}

			var rowData = new Object();
			rowData.doNo = doNo;
			rowData.doSeq = doSeq;
			rowData.itemSeq = itemSeq;
			rowData.targetQty = $('#targetQty').val().replace(/,/g,'');

			var outputDtlQtyValue = $(this).find('td input[name=outputDtlQty]').val().replace(/,/g,'');
			rowData.outputDtlQty = outputDtlQtyValue == null ? "": outputDtlQtyValue;
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.doDtlDate = $(this).find('td input[name=doDtlDate]').val().replace(/-/g, '');
			
			rowData.locationNo = $(this).find('td input[name=locationNo]').val();
			rowData.inLoc = $(this).find('td input[name=inLoc]').val();
			rowData.inArea = $(this).find('td input[name=inArea]').val();
			rowData.inFloor = $(this).find('td input[name=inFloor]').val();

			$('#deliveryProcDtlTable tbody tr').each(function(index,item) {
				sum += parseInt($(this).find("td input[name=outputDtlQty]").val().replace(/,/g,''));
			});

			rowData.sum = sum;
			dataArray.push(rowData);
			console.log(rowData);
			sum = 0;
		});

		var url = '<c:url value="/bs/deliveryProcDtlCreate"/>';
		/*f (sideView == "add") {
			url = '<c:url value="/bs/deliveryProcDtlCreate"/>';
		}  else if (sideView == "edit") {
			url = '<c:url value="/bs/deliveryProcDtlUpdate"/>';
		} */

		if (check == true) {
			$.ajax({
				url : url,
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
				},
				success : function(res) {
					if (res.result == 'ok') {
	
						if (sideView == "edit") {
							toastr.success('수정되었습니다.');
						} else {
							toastr.success('등록되었습니다.');
						}
	
						$('#deliveryOrderAdmTable').DataTable().ajax.reload(function() {});
						$('#deliveryProcDtlTable').DataTable().$('.selected').removeClass('selected');

						$('#outputQty').val(res.outputQty);
						$('#remainQty').val(res.remainQty);
						
						$('#btnSave').addClass('d-none');
	
						$('#btnEdit').attr('disabled',false);
						$('#btnDtlDel').attr('disabled', true);
						$('#barcodeNo').attr('disabled', true);
						$('#barcodeNo').val("");
	
						uiProc(true);
						uiProc2(true);
	
					} else if (res.result == "excess") {
						toastr.warning('출고량을 초과하였습니다. 확인해주세요.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
	
				}
			});
		}
	});

	var sysdate = "${serverTime}";

    var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">출고지시일</label><div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled />';
    html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateToToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>&nbsp;&nbsp;&nbsp;';   
    html1 += '<label class="input-label-sm">발주처</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="poCorpNmgubun" name="poCorpNmgubun" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
    html1 += '&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;'
    html1 += '</div>';
    
	$('#deliveryOrderAdmTable_length').html(html1);
	$('#doDateFrom').val(serverDateFrom);
	$('#doDateTo').val(serverDateTo);
	
	selectBoxAppend(poCorpNmgubun, "poCorpNmgubun", "", "1");
	
	$('#btnRetv').on('click', function() {
		serverDateFrom =  $('#doDateFrom').val();
		serverDateTo =  $('#doDateTo').val();
		poCorpCd =  $('#poCorpNmgubun').val();
		$('#deliveryOrderAdmTable').DataTable().ajax.reload( function () {});
    });	

	// 고객사 팝업창 
	var stradePopUpTable;
	function selectCustCd() {

		stradePopUpTable = $('#stradePopUpTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			destroy : true,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			ajax : {
				url : '<c:url value="/bm/stradeList"/>',
				type : 'GET',
				data : {}
			},
			rowId : 'trCd',
			columns : [ {
				data : 'trCd',
				'className' : 'text-center'
			}, {
				data : 'trNm',
				'className' : 'text-center'
			}, {
				data : 'ceoNm',
				'className' : 'text-center'
			}, {
				data : 'tel',
				'className' : 'text-center'
			}, {
				data : 'divAddr1',
				'className' : 'text-center'
			}, ],
			order : [ [ 0, 'asc' ] ],

		});
		$('#stradePopUpTable tbody').on('click', 'tr', function() {
			var data = stradePopUpTable.row(this).data();

			$('#custCd').val(data.trNm);
			$('#stradePopUpModal').modal('hide');
		});
		$('#stradePopUpModal').modal('show');
	}

	// 발주처 팝업창 
	var deliveryOrderPopupTable;
	function selectPoCorpCd() {

		deliveryOrderPopupTable = $('#deliveryOrderPopupTable').DataTable({
			language : lang_kor,
			lengthChange : false,
			destroy : true,
			paging : true,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			pageLength : 20,
			ajax : {
				url : '<c:url value="bs/deliveryOrderAdmList"/>',
				type : 'GET',
				data : {
					'doStatus' : '001'
				}
			},
			rowId : '',
			columns : [
				{ data : 'doDate',
					render : function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
			 	{ data : 'ordGubunNm'	},
				{ data : 'poCorpNm'		},
				{ data : 'itemNm'		},
				{ data : 'targetQty',	
					render : function(data, type, row, meta) {
						return addCommas(data);
					}
				}, 
				{ data : 'outputQty',
					render : function(data, type, row, meta) {
						return addCommas(data);
					}
				},
				{ data : 'remainQty',
					render : function(data, type, row, meta) {
						return addCommas(data);
					}
				},
				{ data : 'dlvDate',
					render : function(data, type, row, meta) {
					return moment(data).format("YYYY-MM-DD");
					}
				}, 
				{ data : 'doCorpNm'},
				],
			columnDefs : [ {
				targets : [ 4, 5, 6 ],
				className : 'text-right'
			}, {
				targets : '_all',
				className : 'text-center'
			},

			],
			order : [ [ 0, 'asc' ] ],

		});
		$('#deliveryOrderPopupTable tbody').on('click', 'tr', function() {
			var data = deliveryOrderPopupTable.row(this).data();
			$('#poCorpCd').val(data.poCorpCd);
			$('#poCorpNm').val(data.poCorpNm);
			$('#doDate').val(moment(data.doDate).format('YYYY-MM-DD'));
			$('#ordGubun').val(data.ordGubunNm);
			$('#itemSeq').val(data.itemSeq);
			$('#itemNm').val(data.itemNm);
			$('#targetQty').val(data.targetQty);
			$('#outputQty').val(data.outputQty);
			$('#remainQty').val(data.remainQty);
			$('#doCorpCd').val(data.doCorpCd);
			$('#doCorpNm').val(data.doCorpNm);

			itemSeq = data.itemSeq;
			itemNm = data.itemNm;
			doNo = data.doNo;
			doSeq = data.doSeq;
			console.log(itemSeq);

			$('#deliveryProcDtlTable').DataTable().clear().draw();

			$('#deliveryOrderPopupModal').modal('hide');

		});
		$('#deliveryOrderPopupModal').modal('show');
	}

	function uiProc(flag) {
		$('#doDateCalendar').attr('disabled', flag);
		$('#btnPoCorpCd').attr('disabled', flag);
		$('#btnDoCorpCd').attr('disabled', flag);
		$('#barcodeNo').attr('disabled', flag);
	}

	function uiProc2(flag) {
		$('input[name=outputDtlQty]').attr('disabled', flag);
		$('button[name=dlvDateCalendar]').attr('disabled', flag);
		$('input[name=doDtlDesc]').attr('disabled', flag);
	}
</script>

</body>
</html>
