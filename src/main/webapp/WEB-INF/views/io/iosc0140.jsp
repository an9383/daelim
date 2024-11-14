<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>
<html>
<div class="page-wrapper" id="page-wrapper">

<!-- 프린트 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="printPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="margin-right: 40%;">
		<div class="modal-content" style="width: 150%;">
			<div class="modal-header">
				<h5 class="modal-title" id="printPopUpLabel">제품 BOM 내역</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<div id="printlModel">
					<label style="color: black;font-weight: 350;font-size: 40px;font-weight: 500;" class="d-flex justify-content-center" id="AAA">
						제품 BOM 내역
					</label>
					<br><br>
					
					<table id="topPrintTable" class="table table-bordered" style="font-size: 15px; color: black;">
						<thead class="thead-light" style="font-size: 15px; color: black;">
						</thead>
					</table>
					
					<table id="printTable" class="table table-bordered" style="font-size: 15px; color: black;">
						<thead class="thead-light" style="font-size: 15px; color: black;">
							<tr>
								<th>품번</th>
								<th>품명</th>
								<th>차종</th>
								<th>단위</th>
								<th>소요량</th>
								<th>총소요량</th>
								<th>재고현황</th>
							</tr>
						</thead>
						<tbody style="font-size: 15px; color: black;"></tbody>
					</table>
				</div>
			</div>
			<hr class="text-secondary">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 프린트 모달 종료-->

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">자재출고</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 52%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav();"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						 <table id="workOrdPopUpTable" class="table table-bordered">
							<colgroup>
						 		<col width="3%">
						 		<col width="10%">
						 		<col width="7%">
						 		<col width="17%">
						 		<col width="14%">
						 		<col width="10%">
						 		<col width="10%">
						 		<col width="7%">
						 		<col width="7%">
						 		<col width="8%">
						 		<col width="7%">
						 	</colgroup>
		                    <thead class="thead-light">
		                    <tr>
		                      <th>No.</th>
		                      <th>작업지시번호</th>
		                      <th>구분</th>
		                      <th>품번</th>
		                      <th>고객사</th>
		                      <th>작업지시일</th>   
		                      <th>납기일</th>
		                      <th>긴급여부</th>
		                      <th class="text-center">지시수량</th>      
		                      <th>BOM조회</th>    
		                      <th>출고조회</th>  
		                    </tr>
		                    </thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar"
				id="myrSidenav" style="width: 47%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form">
							<div class="table-responsive">
								<table id="barcodeAdmTable" class="table table-bordered">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<td colspan="4" id="topContents" style="font-size: 20px; font-weight: bold; background: yellow;text-align: center;">* 선입선출 적용중 *</td>
									</tr>
									<tr>
										<th>출고일</th>
										<td>
											<div class="form-group input-sub m-0 row"
												style="min-width: 100%">
												<input class="form-control" type="text" id="preOutWhsDate"
													name="preOutWhsDate" disabled style="min-width: 100%" />
												<button
													onclick="fnPopUpCalendar(preOutWhsDate,preOutWhsDate,'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search"
													id="preOutWhsDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
										<th></th>
										<td></td>
									</tr>
									<tr>
										<th>작업지시번호</th>
										<td>
											<input type="text" class="form-control" id="workOrdNo"
												name="workOrdNo" style="min-width: 100%" placeholder="스캐너만 입력">
										</td>
										<th>담당자</th>
										<td><input type="hidden" id="preWorkCharger"
											name="preWorkCharger">
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="text" class="form-control"
														id="preWorkChargerNm" name="preWorkChargerNm"
														style="min-width: 100%" disabled>
													<button type="button"
														class="btn btn-primary input-sub-search"
														id="btnItemChargr" onClick="selectItemChargr()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div></td>
									</tr>
									<tr>
										<th>창고</th>
										<td colspan="3">
											<input type="text"style="max-width: 100%;" class="form-control" value="재공창고" disabled>
											<input type="hidden"style="max-width: 100%;" class="form-control" id="locationNo" value="20210825-001">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="locationCd" value="003">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="areaCd" value="001">
											<input type="hidden"style="max-width: 100%;" class="form-control" id="floorCd" value="재공창고">
										</td>
									</tr>
									<tr>
										<th>Barcode No</th>
										<td colspan="3"><input type="text"
											style="max-width: 100%;" class="form-control" id="barcodeNo"
											placeholder="스캐너만 입력"></td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3"><input type="text"
											style="max-width: 100%;" class="form-control" id="inWhsDesc"></td>
									</tr>
								</table>
							</div>
							<div id="baseInfoButton">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary d-none float-right mr-1" id="btnSave">저장</button>
									<button class="btn btn-primary d-none" id="btnAddConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
									</button>
									<button type="button" class="btn btn-warning float-right mr-1" id="btnDel">삭제</button>
									<button class="btn btn-primary d-none" id="btnDelConfirmLoading" type="button" disabled>
										<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
									</button>
								</div>
							</div>
							<div class="table-responsive">
								<table id="barcodeDtlTable" class="table table-bordered">
									<colgroup>
										<col width="18%">
										<col width="18%">
										<col width="13%">
										<col width="7%">
										<col width="11%">
										<col width="11%">
										<col width="8%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>바코드</th>
											<th>품번</th>
											<th>차종</th>
											<th>단위</th>
											<th>남은 출고량</th>
											<th>출고량</th>
											<th>창고</th>
											<th>구역/위치</th>
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
</div>
<!-- /.page-wrapper -->

<!-- Modal Start-->
<div class="modal fade bd-example-modal-xl" id="itemMotorEbomPopupModal"
	tabindex="-1" role="dialog" aria-labelledby="itemMotorEbomPopupLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="itemMotorEbomPopupLabel">BOM조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="table-responsive" style="height: 600px;">
					<div class="d-none">
						<div id="barcodeDiv">
							<svg id="barcodeNo2"></svg>
						</div>
					</div>
					<br>
					<table class="table table-bordered">
						<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>품번</th>
								<td>
									<input type="text" class="form-control" id="itemCd2" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>품명</th>
								<td>
									<input type="text" class="form-control" id="itemNm2" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>거래처</th>
								<td>
									<input type="text" class="form-control" id="itemCus2" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
							</tr>
							<tr>
								<th>작업지시일</th>
								<td>
									<input type="text" class="form-control" id="workOrdDate2" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>납기일</th>
								<td>
									<input type="text" class="form-control" id="dlvDate2" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>지시수량</th>
								<td>
									<input type="text" class="form-control" id="workOrdQty2" style="max-width:100%; border:none; text-align:right;" disabled>
								</td>
							</tr>
						</thead>
					</table>
					<table id="itemMotorEbomPopupTable" class="table table-bordered">
						<colgroup>
							<col width="3%">
							<col width="3%">
							<col width="15%">
							<col width="17%">
							<col width="29%">
							<col width="6%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">선택</th>
								<th class="text-center">품번</th>
								<th class="text-center">품명</th>
								<th class="text-center">차종</th>
								<th class="text-center">단위</th>
								<th class="text-center">소요량</th>
								<th class="text-center">총소요량</th>
								<th class="text-center">재고현황</th>
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
<!-- Modal End-->

<!-- Modal Start--><!-- 츨고조회 -->
<div class="modal fade bd-example-modal-xl" id="preOutWhsBarcodePopupModal"
	tabindex="-1" role="dialog" aria-labelledby="preOutWhsBarcodePopupLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="preOutWhsBarcodePopupLabel">출고현황 조회</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="table-responsive" style="height: 600px;">
					<div class="d-none">
						<div id="barcodeDiv2">
							<svg id="barcodeNo3"></svg>
						</div>
					</div>
					<table class="table table-bordered">
						<colgroup>
							<col width="15%">
							<col width="25%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>품번</th>
								<td>
									<input type="text" class="form-control" id="itemCd" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>품명</th>
								<td>
									<input type="text" class="form-control" id="itemNm" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>거래처</th>
								<td>
									<input type="text" class="form-control" id="itemCus" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
							</tr>
							<tr>
								<th>작업지시일</th>
								<td>
									<input type="text" class="form-control" id="workOrdDate" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>납기일</th>
								<td>
									<input type="text" class="form-control" id="dlvDate" style="max-width:100%; border:none; text-align:center;" disabled>
								</td>
								<th>지시수량</th>
								<td>
									<input type="text" class="form-control" id="workOrdQty" style="max-width:100%; border:none; text-align:right;" disabled>
								</td>
							</tr>
						</thead>
					</table>
					<table id="preOutWhsBarcodePopupTable" class="table table-bordered">
						<colgroup>
							<col width="5%">
							<col width="13%">
							<col width="15%">
							<col width="18%">
							<col width="8%">
							<col width="5%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="7%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">Barcode No</th>
								<th class="text-center">품번</th>
								<th class="text-center">품명</th>
								<th class="text-center">차종</th>
								<th class="text-center">단위</th>
								<th class="text-center">소요량</th>
								<th class="text-center">총소요량</th>
								<th class="text-center">재고현황</th>
								<th class="text-center">출고수량</th>
								<th class="text-center">저장위치</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary d-none" id="btnQtySave">저장</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal End--><!-- 출고조회 -->
<%@include file="../layout/bottom.jsp" %>
<style>
#th{
	padding-bottom: 10px;
}

</style>
<script>

	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "52%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
			setTimeout(function() {	
				$("#btnRetv").click();
			},400);
		}
		state = !state;
	});

	$("#left-expand").click(function() {
		setTimeout(function() {	
			$("#btnRetv").click();
		},400);
	})

	let currentHref = "iosc0140";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","자재출고"); 
	
	let workOrdDateFromCal = "${serverDateFrom}";
	let workOrdDateToCal = "${serverDateTo}";
	let preOutWhsDateCal = "${serverDateTo}";
	let userNumber = "${userNumber}";
	let userNm = "${userNm}";
	
	let btnView;
	let btnVal = 'add';
	let tableIdx = null;
	let poNo = null;
	let poSeq = null;
	let inSeq = null;
	let barcodeNo = null;
	let workOrdQtyVal = null;
	let workOrdNoVal = null;
	let workOrdNo = null;
	let itemCd = null;
	let itemSeq = null;
	let upperItemSeq = null;
	let itemGubun = null;
	let itemNm = null;
	let itemModel = null;
	let itemUnit = null;

	//BOM조회 / 출고조회 버튼시 사용되는 변수
	let itemSeqVal = null;
	let itemCdVal = null;
	let itemNmVal = null;
	let itemCusVal = null;
	let workOrdDateVal = null;
	let dlvDateVal = null;
	let remainQty = null;
	let preOutQty = null;
	let locationNm = null;
	let locationCd = null;
	let locationNo = null;
	let areaNm = null;
	let areaCd = null;
	let floorCd = null;
	let popUpCheck = '';
	let workEmerYn = '';
	
	$('#preOutWhsDate').val(preOutWhsDateCal);
	$('#preWorkCharger').val(userNumber);
	$('#preWorkChargerNm').val(userNm);
	
	//선입선출 적용중 메시지 시작
	function fn_bright() {
		let color1 = "black"; // 기본   색상코드 RGB
		let color2 = "red";   // 변경될 색상코드 RGB
		let interval = 1000;  // millisecond 1000[1초], 2000[2초]
		
		let obj = document.getElementById('topContents');
		
		if ( obj.style.color == color1 ) {
			obj.style.color = color2;
		} else {
			obj.style.color = color1;
		}
		
		setTimeout("fn_bright();", interval);
	}
	
	window.onload = function() {
		fn_bright();
	}
	//선입선출 적용중 메시지 끝
	
	$('#saveBtnModalY').on('click', function() {
		btnView = '';
		$('#workOrdNo').val('');
		$('#barcodeNo').val('');
		$('#inWhsDesc').val('');
		$('#btnSave').addClass('d-none');
		$('button[name=btnConfirm]').addClass('bg-white');
		$('#left-expand').removeClass('d-none');
		$('#barcodeDtlTable').DataTable().ajax.reload(function(){});
		$('#workOrdPopUpTable').dataTable().$('tr.selected').removeClass('selected');
	});

	//확정여부 모달
	$('#confirmSaveModalY').on('click', function() {
		$.ajax({
			url  : '<c:url value="io/updateConfirmYn" />',
			type : 'GET',
			data : {
				'workOrdNo' : workOrdNoVal,
				'confirmYn' : '001',
			},
			success : function(res){
				if (res.result == 'ok') {
					$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});	
					
					toastr.success('확정되었습니다.');
				}else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');				
			}
		});
	});
	
	//자재출고 목록조회
 	let workOrdPopUpTable = $('#workOrdPopUpTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "70vh",
		ajax : {
			url : '<c:url value="po/workOrderModalDataList"/>',
			type : 'GET',
			data : {
				'startDate'		: function(){ return workOrdDateFromCal.replace(/-/g,''); },
				'endDate'		: function(){ return workOrdDateToCal.replace(/-/g,''); },
				'value' 		: function(){ return '1'; },
				'workEmerYn'	: function(){ return workEmerYn; },
	            'menuAuth'		: function(){ return 'posc0010'; },
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{//No.
				render : function ( data, type, row, meta ) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{//작업지시번호
				data : 'workOrdNo'
			},	
			{//구분
				data : 'itemGubunNm'
			},	
			{//품번
				data : 'itemCd'
			},
			{//고객사
				data : 'itemCusNm'
			},
			{//작업지시일
				data : 'workOrdDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},	
			{//납기일
				data : 'dlvDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//긴급여부
				data : 'workEmerYnNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						if ( data == "긴급" ) {
							return '<span style="color:red">'+data+'</span>';
						} else {
							return data;
						}
					} else {
						return '-';
					}
				}
			},
			{//지시수량
				data : 'workOrdQty'
			},	
			{//BOM조회
				render : function ( data, type, row, meta ) {
					return '<button type="button" class="btn btn btn-outline-info bg-white" name="btnSelectEbom" onclick="selectEbom('+meta.row+');">조회</button>';
				}
			}, 
			{//출고조회
				render : function ( data, type, row, meta ) {
					return '<button type="button" class="btn btn btn-outline-success bg-white" name="btnSelectBarcode" onclick="selectBarcode('+meta.row+');">조회</button>';
				}
			},		
		],
		order : [
		],
		columnDefs: [
        	{ targets: [8], className:'text-right', render: $.fn.dataTable.render.number( ',' ) },
        	{ targets: '_all', className: 'text-center' },
        ],
        drawCallback: function() {
		    var api = this.api();
		}
	});
	
 	let html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">작업지시일자</label>'; 
    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateFrom" name="preOutWhsDateFrom" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateFrom,preOutWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preOutWhsDateFromFromCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';
    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateTo" name="preOutWhsDateTo" disabled/>';
    html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateTo,preOutWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="workOrdDateToCalendar" type="button">';
    html1 += '<span class="oi oi-calendar"></span>';
    html1 += '</button>'; 
    html1 += '</div>';  
 	html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">긴급여부</label>'; 
	html1 += '<select class="custom-select" id="workEmerYn">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">긴급</option>';
	html1 += '<option value="002">일반</option>';
	html1 += '</select>';
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '</div>';
     
 	$('#workOrdPopUpTable_length').html(html1);
 	$('#preOutWhsDateFrom').val(workOrdDateFromCal);
 	$('#preOutWhsDateTo').val(workOrdDateToCal);
	
 	// 조회버튼 클릭시
 	$('#btnRetv').on('click', function() {
 		workOrdDateFromCal = $('#preOutWhsDateFrom').val();
     	workOrdDateToCal = $('#preOutWhsDateTo').val();
     	workEmerYn = $('#workEmerYn option:selected').val();
 		$('#workOrdPopUpTable').DataTable().ajax.reload(function(){});
     });	

 	// 전체조회 클릭시
 	$('#btnAllList').on('click', function() {
 		workOrdDateFromCal = "";
 		workOrdDateToCal = "";
 		workEmerYn = "";
 		$('#workOrdPopUpTable').DataTable().ajax.reload(function(){});
    });
	
 	//팝업창 닫았을때
	$(document).mousedown(function(e){
		if( $("#itemMotorEbomPopupModal, #preOutWhsBarcodePopupModal").is(":visible") ) {
			popUpCheck='';
		}
	});

	//ESC눌렀을때
	$(document).keydown(function(e){
		var code = e.keyCode || e.which;
		if (code == 27) {
 			if( $("#itemMotorEbomPopupModal, #preOutWhsBarcodePopupModal").is(":visible") ) {
 				popUpCheck='';
 			}
	    }
	});
 		
	//상세테이블 클릭시
	$('#workOrdPopUpTable tbody').on('click','tr',function(){

		if($('#btnSave').attr('class') == 'btn btn-primary float-right mr-1' && popUpCheck!='ok') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}
		if(popUpCheck == 'ok'){
			return false;
		}
    	
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#workOrdPopUpTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			//$('button[type=button]').addClass('bg-white');
		} 

		$('button[name=btnConfirm]').attr('disabled', false);
		$('button[name=btnConfirm]').addClass('bg-white');
		$('#left-expand').removeClass('d-none');

		tableIdx = $('#workOrdPopUpTable').DataTable().row(this).index();
		upperItemSeq = workOrdPopUpTable.row(tableIdx).data().itemSeq;
		workOrdQtyVal = workOrdPopUpTable.row(tableIdx).data().workOrdQty; 
		
		$('#workOrdNo').val(workOrdPopUpTable.row(tableIdx).data().workOrdNo);
	});
	
	//바코드 목록조회
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/barcodeList"/>',
			type : 'GET',
			data : {
				'barcodeNo'  : function(){return $('#barcodeNo').val()}
			},
		},
		rowId : 'barcodeNo',
		columns : [
				{data : 'barcodeNo',
					render: function(data, type, row, meta) {	
						if(data!=null){
							var html  = '<input type="text" class="form-control" id="barcodeNo'+meta.row+'" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>' ;
							html += '<input type="hidden" name="poNo" value="'+row['poNo']+'">';
							html += '<input type="hidden" name="poSeq" value="'+row['poSeq']+'">';
							html += '<input type="hidden" name="inSeq" value="'+row['inSeq']+'">';
							html += '<input type="hidden" name="outSeq" value="'+row['outSeq']+'">';
							return html;
						} else{
							var html  = '<input type="text" class="form-control" name="barcodeNo" value="'+barcodeNo+'" style="width:100%;text-align:center;" disabled>' ;
							html += '<input type="hidden" name="poNo" value="'+poNo+'">';
							html += '<input type="hidden" name="poSeq" value="'+poSeq+'">';
							html += '<input type="hidden" name="inSeq" value="'+inSeq+'">';
							html += '<input type="hidden" name="outSeq" value="">';
							return html;
						}		    			
		    		}
				},

				{data : 'itemCd',
					render: function(data, type, row, meta) {	
						if(data!=null){
							var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+data+'" disabled>';
							html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">';
							html += '<input type="hidden" name="itemGubun" value="'+row['itemGubun']+'">';
							return html;
						} else{
							var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="partCd" value="'+itemCd+'" disabled>';	
							html += '<input type="hidden" name="itemSeq" value="'+itemSeq+'">';
							html += '<input type="hidden" name="itemGubun" value="'+itemGubun+'">';
							return html;
						}		    			
		    		}
				},
				{data : 'itemModel',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModel" value="'+data+'" disabled>';
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModel" value="'+itemModel+'" disabled>';
						}		
	    			}
				},
				{data : 'itemUnit',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemUnit" value="'+data+'" disabled>';
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemUnit" value="'+itemUnit+'" disabled>';
						}		
	    			}
				},
				{data : 'remainQty',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+rmDecimal(Math.floor(data))+'" disabled>';	
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="remainQty" value="'+rmDecimal(remainQty)+'" disabled>';	
						}			    			
		    		}
				},
				{data : 'preOutQty',
					render: function(data, type, row, meta) {	
						if(data!=null){
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="'+rmDecimal(Math.floor(row['remainQty']))+'" disabled>';
						} else{
							return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="preOutQty" value="'+rmDecimal(remainQty)+'">';	
						}			    			
		    		}
				},
				{data : 'locationCd',
					render: function(data, type, row, meta) {
						var html;
						
						if(data!=null){
							html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="'+row['locationNm']+'" disabled>';
							html += '<input type="hidden" name="locationCd" value="'+data+'" disabled>';

							return html;
						} else{
							html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="'+locationNm+'" disabled>';
							html += '<input type="hidden" name="locationCd" value="'+locationCd+'" disabled>';
							html += '<input type="hidden" name="locationNo" value="'+locationNo+'" disabled>';
							return html;
						}
		    		}
				},
				{data : 'areaCd',
					render: function(data, type, row, meta) {
						var html;
						if(data!=null){
							html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="areaNm" value="'+row['areaNm']+'" disabled>';
							html += '<input type="hidden" name="areaCd" value="'+data+'" disabled>';

							return html;
						} else{
							html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="areaNm" value="'+areaNm+'" disabled>';
							html += '<input type="hidden" name="areaCd" value="'+areaCd+'" disabled>';
							html += '<input type="hidden" name="floorCd" value="'+floorCd+'" disabled>';

							return 	html;		
						}
						
		    		}
				},
		 ],
		order : [ [ 0, 'asc' ] ],
		
	});  
	
	//상세테이블 클릭시
	$('#barcodeDtlTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#barcodeDtlTable').DataTable().row(this).index();
		console.log(tableIdx);
		btnView = 'delete';
		
	});
	
	// 바코드입력
	$('#barcodeNo').keypress(function(e){
		let check = true;
		
		if ( e.keyCode == 13 ) { //엔터 키 클릭 시
			$('#btnGoPrint').attr('disabled', true);
			
			if(!$.trim($('#preWorkCharger').val())){
				toastr.warning('담당을 선택해주세요.');
				$('#btnItemChargr').focus();
				return false;
			}
			if(!$.trim($('#workOrdNo').val())){
				toastr.warning('작지번호를 선택해주세요.');
				check = false;
				return false;
			}
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').val().select();
				check = false;
				return false;
			}

			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if($(this).find('td input[name=barcodeNo]').val()==$('#barcodeNo').val()){
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').select();
					check=false;
					return false;
				}
			});

			if(check){
			 	$.ajax({
	            	url: '<c:url value="io/barcodeList"/>',
	                type: 'GET',
	                data: {
	                	'workOrdNo'	: function(){ return $('#workOrdNo').val(); },
	                	'barcodeNo'	: function(){ return $('#barcodeNo').val(); },
	                	'itemSeq'	: function(){ return upperItemSeq; },
	                },
	                success: function (res) {
	                    let data = res.data;
	                    
	                    if (res.result == 'ok' || res.result == "fifo") {

	                    	poNo = data.poNo;
	                    	poSeq = data.poSeq;
	                    	inSeq = data.inSeq;
	                    	
	                    	barcodeNo = data.barcodeNo;
	                    	itemSeq = data.itemSeq;
	                    	itemCd = data.itemCd;
	                    	itemNm = data.itemNm;
	                    	itemModel = data.itemModel;
	                    	itemUnit= data.itemUnit;
	                    	itemGubun = data.itemGubun;
			                preOutQty = res.preOutQty==null?"0":(rmDecimal(parseFloat(workOrdQtyVal.replace(/,/g,''))*parseFloat(res.preOutQty)));
			                remainQty = data.remainQty;
			                locationNo= data.locationNo;
			                locationCd = data.locationCd;
			                locationNm = data.locationNm;
			                areaCd = data.areaCd;
			                areaNm = data.areaNm;
			                floorCd = data.floorCd;
							
			                if(res.result == "fifo"){
	                    		$('#fifoBtnModal').modal('show');
	                    		$('#barcodeNo').select();
		                    }else{
		                    	$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
				                $('#barcodeNo').select();
								$('#btnSave').removeClass('d-none');
								$('button[name=btnConfirm]').attr('disabled', true);
								$('button[name=btnConfirm]').removeClass('bg-white');
								$('#left-expand').addClass('d-none');
		                        toastr.success("추가되었습니다.");
			               }
	                       
	                    } else if (res.result == "fail"){
	                    	toastr.warning(res.message);
	                    	$('#barcodeNo').select();
		                }else {
		                	toastr.error(res.message, '', {timeOut: 5000});
			            }
		             },
		             complete:function(){
		             }
		        });
			}
		}
	});
	
	//선입선출 모달 '예' 버튼 클릭시
	$('#fifoBtnModalY').on('click', function(){
		$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
		$('#btnSave').removeClass('d-none');
		$('button[name=btnConfirm]').attr('disabled', true);
		$('button[name=btnConfirm]').removeClass('bg-white');
		$('#left-expand').addClass('d-none');

		setTimeout(function(){
			$('#barcodeNo').select();
		},150);
		

        toastr.success("추가되었습니다.");
             
	});
	
	//선입선출 모달 '예' 버튼 클릭시
	$('#fifoBtnModalN').on('click',function(){
		setTimeout(function(){
			$('#barcodeNo').select();
		},150);
	});
	
	// 라인삭제버튼 
	$('#btnDel').on('click', function() {
		if(btnView != 'delete') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#barcodeDtlTable').DataTable().rows(tableIdx).remove().draw();
		
		if(barcodeDtlTable.data().count() == 0){
			$('#btnSave').addClass('d-none');
		}
		btnView = "";
			
	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {
		let check = true;
		let dataArray = new Array();
		
		if(!$.trim($('#workOrdNo').val())){
			toastr.warning('작지번호를 선택해주세요.');
			$('#btnWorkOrdNo').focus();
			return false;
		}
		if(!$.trim($('#preWorkChargerNm').val())){
			toastr.warning('담당자를 선택해주세요.');
			$('#btnItemChargr').focus();
			return false;
		}

		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if($(this).find('td input[name=preOutQty]').val()=='' || $(this).find('td input[name=preOutQty]').val()=='0') {
				toastr.warning("출고량을 확인해주세요.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;
				return false;
			}

			var preOutQty = parseFloat($(this).find('td input[name=preOutQty]').val().replace(/,/g,''));
			var remainQty = parseFloat($(this).find('td input[name=remainQty]').val().replace(/,/g,''));

			if(remainQty<preOutQty) {
				toastr.warning("출고량을 초과하였습니다.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;
				return false;
			} 

				 
			var rowData = new Object();
			rowData.itemSeq = itemSeq;
			
			rowData.workOrdNo = $('#workOrdNo').val();
			rowData.preOutWhsDate = $('#preOutWhsDate').val().replace(/-/g,'');
			rowData.preWorkCharger = $('#preWorkCharger').val();
			rowData.inWhsDesc= $('#inWhsDesc').val();

			rowData.poNo = $(this).find('td input[name=poNo]').val();
			rowData.poSeq = $(this).find('td input[name=poSeq]').val();
			rowData.inSeq= $(this).find('td input[name=inSeq]').val();
			rowData.outSeq= $(this).find('td input[name=outSeq]').val();
			rowData.barcodeNo = $(this).find('td input[name=barcodeNo]').val();
			rowData.itemGubun = $(this).find('td input[name=itemGubun]').val();
			
			rowData.preOutQty = $(this).find('td input[name=preOutQty]').val().replace(/,/g,'');

			//이동 전 창고
			rowData.preLocationNo = $(this).find('td input[name=locationNo]').val();
			rowData.preLocationCd = $(this).find('td input[name=locationCd]').val();
			rowData.preAreaCd = $(this).find('td input[name=areaCd]').val();
			rowData.preFloorCd = $(this).find('td input[name=floorCd]').val();
			
			//이동 후 창고
			rowData.locationNo = $('#locationNo').val();
			rowData.locationCd = $('#locationCd').val();
			rowData.areaCd = $('#areaCd').val();
			rowData.floorCd = $('#floorCd').val();
			
			rowData.outCase = "001";
			
	        dataArray.push(rowData);
	        console.log(rowData)
		});
		
		if(check){
			$.ajax({
				url : '<c:url value="io/preOutWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$('#my-spinner').show(); //처리중..
				},
				success : function(res) {				
					if (res.result == 'ok') {			
						$('#preOutWhsAdmTable').DataTable().ajax.reload(function() {});	
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val("");
						$('#barcodeNo').focus();
						$('#workOrdNo').val("");
						$('#btnSave').addClass('d-none');
						$('#btnGoPrint').attr('disabled',false);
						$('button[name=btnConfirm]').attr('disabled', false);
						$('button[name=btnConfirm]').addClass('bg-white');
						$('#left-expand').removeClass('d-none');
						toastr.success('저장되었습니다.');
					}else if(res.result=="underCnt"){
						toastr.error('미입력된 바코드('+res.data+'개)가 있습니다. 확인해주세요.');
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide(); //처리완료..
					
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});
	
	//담당모달
	let userPopUpTable;
   	function selectItemChargr(){
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
					data : {},
				},
				rowId : 'matrlUser',
				columns : [ {
						data : 'userNm'
					}, {
						data : 'departmentNm'
					}, {
						data : 'postNm'
					}, {
						data : 'chargrDutyNm'
					}, {
						data : 'teamNm'
					}, {
						data : 'workplaceNm'
					} ],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
				
			$('#userPopUpTable tbody').on('click', 'tr', function () {
			   	var data = userPopUpTable.row( this ).data();	
			   	$('#preWorkChargerNm').val(data.userNm);
			   	$('#preWorkCharger').val(data.userNumber);
			   	$('#userPopUpModal').modal('hide');		    	
			});
   		}
		$('#userPopUpModal').modal('show');
   	}
	
 	//BOM코드 팝업 시작
	let itemMotorEbomPopupTable;
	function selectEbom(idx) {
		popUpCheck ='ok';

		itemSeqVal = workOrdPopUpTable.row(idx).data().itemSeq;
		itemCdVal = workOrdPopUpTable.row(idx).data().itemCd;
		itemNmVal = workOrdPopUpTable.row(idx).data().itemNm;
		itemCusVal = workOrdPopUpTable.row(idx).data().itemCusNm;
		workOrdDateVal = moment(workOrdPopUpTable.row(idx).data().workOrdDate).format('YYYY-MM-DD');
		dlvDateVal = moment(workOrdPopUpTable.row(idx).data().dlvDate).format('YYYY-MM-DD');
		workOrdQtyVal = rmDecimal(workOrdPopUpTable.row(idx).data().workOrdQty);

		$('#itemCd2').val(itemCdVal);
		$('#itemNm2').val(itemNmVal);
		$('#itemCus2').val(itemCusVal);
		$('#workOrdDate2').val(workOrdDateVal);
		$('#dlvDate2').val(workOrdDateVal);
		$('#workOrdQty2').val(workOrdQtyVal); 
		
		workOrdNo = workOrdPopUpTable.row(idx).data().workOrdNo;
		
		JsBarcode('#barcodeNo2', workOrdNo,{
			height : 30,
			displayValue : false,
			marginTop : 5,
			marginBottom  :5,
		});

		array = new Array();
		
		if (itemMotorEbomPopupTable == null || itemMotorEbomPopupTable == undefined) {
			itemMotorEbomPopupTable = $('#itemMotorEbomPopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-5 plus-btn'B><'col-sm-12 col-md-7'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : false,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : 'bm/itemMotorEbomList',
					type : 'GET',
					data : {
						 'itemSeq' : function(){return itemSeqVal;},
						 'itemLvl' : '0',
					}
				},
				rowId : '',
				columns : [ 
					{
						render: function(data, type, row, meta) {	
							return meta.row + meta.settings._iDisplayStart + 1;		
						}	
					},
					{
						render: function(data, type, row, meta) {
							return '<input type="checkbox" name="partCheckbox" id="checkBox-' + meta.row + '" value="" style="width:20px;height:20px;">';
						},
						'className' : 'text-center p-0 pt-1'
					},
					{data : 'itemCd'}, 
					{data : 'itemNm'}, 
					{data : 'itemModel'}, 
					{data : 'itemUnit'}, 
					{data : 'itemConsumpt',
						"className": "text-right",
						render: function(data, type, row, meta) {
							return rmDecimal(data);
						}
					}, 
					{data : 'totalConsumpt',
						"className": "text-right",
						render: function(data, type, row, meta) {
							console.log(row['itemConsumpt']);
							console.log(workOrdQtyVal);
							console.log(row['itemConsumpt']*workOrdQtyVal)
							return rmDecimal(Math.ceil(row['itemConsumpt']*workOrdQtyVal.replace(/,/g,'')));
						}
					}, 
					{data : 'tmQty',
						"className": "text-right",
						render: function(data, type, row, meta) {
							if(data!=null){
								return rmDecimal(data);
							}else{
								return '0';
							}
						}
					}, 
				],
				columnDefs : [ 
					{"targets" : '_all' , "className" : "text-center"},
				],
				order : [ [ 0, 'asc' ] ],
				buttons : [ 
						{
							extend : 'print',
							text : '전체 인쇄',
							title : '제품 출고 BOM 내역',
							exportOptions: {
			                	columns  : [2,3,4,5,6,7,8]
			                },
							customize : function(wind){
								
								var html = "<tr><td colspan='5' style='border-top: 1px solid #ffffff'></td>";
								html += "<td colspan='1' style='border-left: solid 1px gray;''>인계자</td>";
								html += "<td colspan='1'>인수자</td></tr>";
								
								html += "<tr style='height:60px;'><td colspan='5'></td>";
								html += "<td colspan='1'><span></span></td>";
								html += "<td colspan='1'><span></span></td></tr>"; 
								

								
								html += "<tr><th colspan='1'><label class='input-label-md'>작업지시번호</label></th>";
								html += "<td colspan='2'>"+workOrdNo+"</td>";
								html += "<td colspan='4'>"+$('#barcodeDiv').html()+"</td></tr>";

								html += "<tr><th colspan='1'><label class='input-label-md'>품목번호</label></th>";
								html += "<td colspan='2'>"+itemCdVal+"</td>";
								html += "<th colspan='1'><label class='input-label-md'>품명</label></th>";
								html += "<td colspan='3'>"+itemNmVal+"</td></tr>";

								html += "<tr><th colspan='1'><label class='input-label-md'>접수일</label></th>";
								html += "<td colspan='2'>"+workOrdDateVal+"</td>";
								html += "<th colspan='1'><label class='input-label-md'>납기일</label></th>";
								html += "<td colspan='3'>"+dlvDateVal+"</td>";

								html += "<tr><th colspan='1'><label class='input-label-md'>고객사</label></th>";
								html += "<td colspan='2'>"+itemCusVal+"</td>";
								html += "<th colspan='1'><label class='input-label-md' style='text-align:right;'>지시수량</label></th>";
								html += "<td colspan='3'>"+rmDecimal(workOrdQtyVal)+"</td></tr>";

								html += "<tr><td colspan='7' style='border:d-none; height:25px;'></td></tr>";	
								
								$(wind.document.body).css('text-align','center').css('font-size','15px');
								$(wind.document.body).find('table').css('text-align','center') .css('font-size','15px');;
								$(wind.document.body).find('table thead').prepend(html);
							},
							className : 'btn-primary',
							init : function(api,node,config){
								$(node).removeClass('btn-secondary')
							}
						}
				],
			});

			//선택출력 버튼 html
			$('.plus-btn').append('<button type="button" class="btn btn-primary ml-1" id="btnPrint">선택 인쇄</button>');

			//선택출력 버튼 click
			$('#btnPrint').on('click',function() {
				if($('input:checkbox[name=partCheckbox]:checked').is(':checked') == false){
					toastr.warning("출력할 내역을 선택해주세요.");
					return false;		
				}
				$('#my-spinner').show();
				
				body();
				
				setTimeout(function() {
					$('#printlModel').print({
						deferred: $.Deferred().done(function() {
							array = new Array();
							$('#topPrintTable thead').empty();
							$('#printTable tbody').empty();
							$('#itemMotorEbomPopupTable').DataTable().ajax.reload(function() {});
						})
					});
					$('#my-spinner').hide();
				},300);
			});
		}else{
			$('#itemMotorEbomPopupTable').DataTable().ajax.reload(function() {});
		}
		$('#itemMotorEbomPopupModal').modal('show');		
   	}

	let array = new Array();

	//BOM조회 선택 event
	$(document).on('change','input:checkbox[name=partCheckbox]',function() {
		if($(this).is(':checked')) {
			
			//선택 시 값 저장 해주기
			var obj = new Object();
			obj.itemCd = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemCd;				//품번
			obj.itemNm = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemNm;				//품명
			obj.itemModel = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemModel;			//차종
			obj.itemUnit = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemUnit;			//단위
			obj.itemConsumpt = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemConsumpt;	//소요량
			obj.totalConsumpt = itemMotorEbomPopupTable.row($(this).parents().parents()).data().itemConsumpt * workOrdQtyVal;	//총소요량
			//obj.tmQty = itemMotorEbomPopupTable.row($(this).parents().parents()).data().tmQty;					//재고현황
			obj.tmQty = "0";					//재고현황
			//obj.preOutQty = itemMotorEbomPopupTable.row($(this).parents().parents()).data().preOutQty;			//출고수량
			//obj.floorCd = itemMotorEbomPopupTable.row($(this).parents().parents()).data().floorCd;				//제품위치
			//obj.workOrdNo = itemMotorEbomPopupTable.row($(this).parents().parents()).data().workOrdNo;			//작지번호

			array.push(obj);
	    } else {
	    	var workOrdNo = itemMotorEbomPopupTable.row($(this).parents().parents()).data().workOrdNo;
		    if(array.findIndex(i => i.workOrdNo == workOrdNo) != -1) {
		    	array.splice(array.findIndex(i => i.workOrdNo == workOrdNo),1);
			}
	    }
	});

	//출력부분
	function body(){

		var html2 = "<tr><td colspan='5' style='border-top: 1px solid #ffffff'></td>";
		html2 += "<td colspan='1' style='border-left: solid 1px gray;''>인계자</td>";
		html2 += "<td colspan='1'>인수자</td></tr>";
		html2 += "<tr style='height:60px;'><td colspan='5'></td>";
		html2 += "<td colspan='1'><span></span></td>";
		html2 += "<td colspan='1'><span></span></td></tr>"; 
		
		html2 += "<tr><th colspan='1'><label class='input-label-md'>작업지시번호</label></th>";
		html2 += "<td colspan='2'>"+workOrdNo+"</td>";
		html2 += "<td colspan='4'>"+$('#barcodeDiv').html()+"</td></tr>";

		html2 += "<tr><th colspan='1'><label class='input-label-md'>품목번호</label></th>";
		html2 += "<td colspan='2'>"+itemCdVal+"</td>";
		html2 += "<th colspan='1'><label class='input-label-md'>품명</label></th>";
		html2 += "<td colspan='3'>"+itemNmVal+"</td></tr>";

		html2 += "<tr><th colspan='1'><label class='input-label-md'>접수일</label></th>";
		html2 += "<td colspan='2'>"+workOrdDateVal+"</td>";
		html2 += "<th colspan='1'><label class='input-label-md'>납기일</label></th>";
		html2 += "<td colspan='3'>"+dlvDateVal+"</td>";

		html2 += "<tr><th colspan='1'><label class='input-label-md'>고객사</label></th>";
		html2 += "<td colspan='2'>"+itemCusVal+"</td>";
		html2 += "<th colspan='1'><label class='input-label-md' style='text-align:right;'>지시수량</label></th>";
		html2 += "<td colspan='3'>"+rmDecimal(workOrdQtyVal)+"</td></tr>";

		html2 += "<tr><td colspan='7' style='border:d-none; height:25px;'></td></tr>";	
		
		$('#topPrintTable thead').css('text-align','center');
		$('#topPrintTable thead').append(html2);
		
		for(var i=0;i<array.length;i++){
			var	html = "<tr><td class='text-center-td'>"+array[i].itemCd+"</td>";
			html += "<td class='text-center-td'>"+array[i].itemNm+"</td>";
			html += "<td class='text-center-td'>"+array[i].itemModel+"</td>";
			html += "<td class='text-center-td'>"+array[i].itemUnit+"</td>";
			html += "<td class='text-center-td'>"+array[i].itemConsumpt+"</td>";
			html += "<td class='text-center-td'>"+rmDecimal(array[i].totalConsumpt)+"</td>";
			html += "<td class='text-center-td'>"+rmDecimal(array[i].tmQty)+"</td>";
			$('#printTable tbody').append(html);
		}
	};

	//출력 프린트 클릭시
	$('#btnPrint').on('click',function() {
		if($('input:checkbox[name=partCheckbox]:checked').is(':checked') == false){
			toastr.warning("값을 먼저 선택해주세요.");
			return false;		
		}
		$('#my-spinner').show();
		
		body();
		
		setTimeout(function() {
			$('#printlModel').print({
				deferred: $.Deferred().done(function() {
					array = new Array();
					$('#topPrintTable thead').empty();
					$('#printTable tbody').empty();
					$('#itemMotorEbomPopupTable').DataTable().ajax.reload(function() {});
				})
			});
			$('#my-spinner').hide();
		},300);
	});
	

 	//BOM코드 팝업 시작
	let preOutWhsBarcodePopupTable;
	function selectBarcode(idx) {
		popUpCheck='ok';
		btnVal = 'add';

		itemCdVal = workOrdPopUpTable.row(idx).data().itemCd;
		itemNmVal = workOrdPopUpTable.row(idx).data().itemNm;
		itemCusVal = workOrdPopUpTable.row(idx).data().itemCusNm;
		workOrdDateVal = moment(workOrdPopUpTable.row(idx).data().workOrdDate).format('YYYY-MM-DD');
		dlvDateVal = moment(workOrdPopUpTable.row(idx).data().dlvDate).format('YYYY-MM-DD');
		workOrdQtyVal = rmDecimal(workOrdPopUpTable.row(idx).data().workOrdQty);

		$('#itemCd').val(itemCdVal);
		$('#itemNm').val(itemNmVal);
		$('#itemCus').val(itemCusVal);
		$('#workOrdDate').val(workOrdDateVal);
		$('#dlvDate').val(workOrdDateVal);
		$('#workOrdQty').val(workOrdQtyVal); 
		
		workOrdNo = workOrdPopUpTable.row(idx).data().workOrdNo;
		
		JsBarcode('#barcodeNo3', workOrdNo,{
			height : 30,
			displayValue : false,
			marginTop : 5,
			marginBottom  :5,
		});
		
		if (preOutWhsBarcodePopupTable == null || preOutWhsBarcodePopupTable == undefined) {
			preOutWhsBarcodePopupTable = $('#preOutWhsBarcodePopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-5'B><'col-sm-12 col-md-7'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : false,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="io/preOutWhsAdmRead"/>',
					type : 'GET',
					data : {
						 'workOrdNo'  : function(){return workOrdNo;},
						 'outCase' 	: '001'
					}
				},
				rowId : 'contNo',
				columns : [ {
					render: function(data, type, row, meta) {	
						return meta.row + meta.settings._iDisplayStart + 1;		
					}	
				},
				{data : 'barcodeNo'}, 
				{data : 'itemCd'}, 
				{data : 'itemNm'}, 
				{data : 'itemModelNm'}, 
				{data : 'itemUnitNm'}, 
				{data : 'itemConsumpt',
					render: function(data, type, row, meta) {
						return rmDecimal(data);
					},
					"className": "text-right",
				}, 
				{data : 'totalConsumpt',
					render: function(data, type, row, meta) {
						return rmDecimal(data);
					},
					"className": "text-right",
				}, 
				{data : 'tmQty',
					"className": "text-right",
					render: function(data, type, row, meta) {
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '';
						}
					}
				}, 
				{data : 'preOutQty' ,
					"className": "text-right",
					render: function(data, type, row, meta) {

						if(btnVal == "edit"){
							return '<input class="form-control" type="text" name="preOutQty" value="'+rmDecimal(data)+'" style="text-align:right;">';
						}else{
							return rmDecimal(data);
						}
					}
				},
				{data : 'floorCd',
					render :function(data, type, row, meta){
						if(data!=null){
							return data;
						}else{
							return '-';
						}
					}
				}, 
				],
				columnDefs : [ {
					targets : [6,7,8,9 ],
					render : $.fn.dataTable.render.number(','),
					className : 'text-right'
				} ,{
					"targets" : '_all' , "className" : "text-center"
				},
				],
				order : [ [ 0, 'asc' ] ],
				buttons : [ 
					{
						extend : 'print',
						text : '전체인쇄',
						title : '제품출고현황',
						customize : function(wind){
							
							var html = "<tr><td colspan='7' style='border-top: 1px solid #ffffff'></td>";
							html += "<td colspan='2' style='border-left: solid 1px gray;''>인계자</td>";
							html += "<td colspan='2'>인수자</td></tr>";
							
							html += "<tr style='height:60px;'><td colspan='7'></td>";
							html += "<td colspan='2'><span></span></td>";
							html += "<td colspan='2'><span></span></td></tr>"; 
							
							html += "<tr><th colspan='2'><label class='input-label-md'>작업지시번호</label></th>";
							html += "<td colspan='2'>"+workOrdNo+"</td>";
							html += "<td colspan='7'>"+$('#barcodeDiv2').html()+"</td></tr>";

							html += "<tr><th colspan='2'><label class='input-label-md'>품목번호</label></th>";
							html += "<td colspan='2'>"+itemCdVal+"</td>";
							html += "<th colspan='3'><label class='input-label-md'>품명</label></th>";
							html += "<td colspan='4'>"+itemNmVal+"</td></tr>";

							html += "<tr><th colspan='2'><label class='input-label-md'>접수일</label></th>";
							html += "<td colspan='2'>"+workOrdDateVal+"</td>";

							html += "<th colspan='3'><label class='input-label-md'>납기일</label></th>";
							html += "<td colspan='4'>"+dlvDateVal+"</td>";

							html += "<tr><th colspan='2'><label class='input-label-md'>고객사</label></th>";
							html += "<td colspan='2'>"+itemCusVal+"</td>";
							html += "<th colspan='3'><label class='input-label-md' style='text-align:right;'>지시수량</label></th>";
							html += "<td colspan='4'>"+rmDecimal(workOrdQtyVal)+"</td></tr>";

							html += "<tr><td colspan='11' style='border:d-none; height:25px;'></td></tr>";	
							
							$(wind.document.body).css('text-align','center').css('font-size','15px');
							$(wind.document.body).find('table').css('text-align','center') .css('font-size','15px');;
							$(wind.document.body).find('table thead').prepend(html);
						},
						className : 'btn-success',
						init : function(api,node,config){
							$(node).removeClass('btn-secondary')
							
						}
					}
				],
			});

			
		}else{
			$('#preOutWhsBarcodePopupTable').DataTable().ajax.reload(function() {});
		}
		$('#preOutWhsBarcodePopupModal').modal('show');		
   	} 
   	
	//출고량 수정
	$('#btnQtyEdit').on('click',function(){

		if(preOutWhsBarcodePopupTable.data().count()==0){
			toastr.warning("수정할 출고현황 목록이 없습니다. 확인해주세요.");
			return false;
		}
		
		btnVal = 'edit';
		$('#preOutWhsBarcodePopupTable').DataTable().ajax.reload(function() {});
		
		$('#btnQtySave').removeClass('d-none');
	});

	//출고량 저장
	$('#btnQtySave').on('click',function(){

		var dataArray = new Array();		
		var check=true;  	
	
		$('#preOutWhsBarcodePopupTable tbody tr').each(function(index, item){
			if($(this).find('td input[name=preOutQty]').val()=='' || $(this).find('td input[name=preOutQty]').val()=='0') {
				toastr.warning("출고량을 확인해주세요.");
				$(this).find('td input[name=preOutQty]').focus();
				check = false;
				
				return false;
			}

			var rowData = new Object();

			console.log('index: '+index)
			
			rowData.barcodeNo = preOutWhsBarcodePopupTable.row(index).data().barcodeNo;
			//rowData.poSeq = preOutWhsBarcodePopupTable.row(index).data().poSeq;
			//rowData.inSeq= preOutWhsBarcodePopupTable.row(index).data().inSeq;
			//rowData.outSeq= preOutWhsBarcodePopupTable.row(index).data().outSeq;
			//rowData.preOutQty = $(this).find('td input[name=preOutQty]').val().replace(/,/g,'');
			
	        dataArray.push(rowData);
	        console.log(rowData)
		});

		if(check){
			$.ajax({
				url : '<c:url value="io/updatePreOutQty"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {
						btnVal = 'add';
						
						$('#preOutWhsBarcodePopupTable').DataTable().ajax.reload(function() {});	
						$('#btnQtySave').addClass('d-none');

						toastr.success('수정되었습니다.');
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					//처리완료..
					$('#my-spinner').hide();
					
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
		
	});
	
	//출고 확정버튼
	let itemRevVal = null;
	function selectConfirm(idx){

		toastr.success("확정되었습니다.");
	}
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta){

		var shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '"><option value="">'+ '선택' +'</option>';
		
		var option;
		for(key in obj) {
			var tmp; 
			if(obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}	
	
	$(document).on('keyup',"input[name=preOutQty]", function(event){
		
		var preInWhsQtyData = $(this).val();
		
		if ( !(	(event.which >= 48 && event.which <= 57) || (event.which >= 96 && event.which <= 105) || (event.which >= 37 && event.which <= 40) || event.which == 8 || event.which == 9 || event.which == 13 || event.which == 16 || event.which == 46)	) {
			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
 			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(rmDecimal(uncomma($(this).val())));
		
	});

	//콤마(,) 삭제
	function uncomma(x) {
	    x = String(x);
	    return x.replace(/[^\d]+/g, '');
	}
	
</script>

</body>
</html>
