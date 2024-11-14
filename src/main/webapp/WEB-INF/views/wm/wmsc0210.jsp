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
				<li class="breadcrumb-item active">LOT추적(사출)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<!-- 상단 sorting part -->
       	<div class="card top_sortbox p-2">
           	<div class="row">
				<div class="form-group row">
					<label class="col-form-label p-1">자재 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="barcodeNoScan" placeholder="스캐너만 입력">
					</div>
				</div>
           		<div class="form-group row">
					<label class="col-form-label p-1">생산 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="ordLotNoScan" placeholder="스캐너만 입력">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label p-1">출하 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="workOrdNoScan" placeholder="스캐너만 입력">
						<button type="button" class="btn btn-primary input-sub-search" onClick="deliveryListPopup();">
							<span class="oi oi-magnifying-glass"></span>
						</button> 
					</div>
				</div>
				<button type="button" class="btn btn-primary" id="btnAllList">전체조회</button>
          	</div> 
        </div>
	    <!-- / end 상단 sorting part -->
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list">
				<div class="card">
					<div class="row">
						<div class="col-md-9">
							<h6>1.자재 LOT NO 정보</h6>
							<div class="table-responsive">
								<table id="lotTrackTable2" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>자재 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>입고일</th>
											<th class="text-center">입고수량</th>
											<th>수입검사</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="col-md-3">
							<h6>원자재 재고현황</h6>
							<div class="table-responsive">
								<table id="lotTrackStockPaymentTable2" class="table table-bordered tr_highlight_row" style="margin-top: 6px;">
									<thead class="thead-light">
										<tr>
											<th>창고/위치</th>
											<th>재고수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-9">
							<h6>2.생산 LOT NO 정보</h6>
							<div class="table-responsive" style="overflow: hidden;">
								<table id="lotTrackTable1" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>생산 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>생산일</th>
											<th class="text-center">생산수량</th>
											<th>공정검사</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="col-md-3">
							<h6>제품 재고현황</h6>
							<div class="table-responsive">
								<table id="lotTrackStockPaymentTable1" class="table table-bordered tr_highlight_row" style="margin-top: 6px;">
									<thead class="thead-light">
										<tr>
											<th>창고/위치</th>
											<th>재고수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-9">
							<h6>3.출하 LOT NO 정보</h6>
							<div class="table-responsive" style="overflow: hidden;">
								<table id="lotTrackTable5" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>출하 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>출하일</th>
											<th class="text-center">출하수량</th>
											<th>출하검사</th>
											<th>출하상태</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="col-md-3">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / #main  -->
	<!-- 작업지시 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="deliveryOrdModal" tabindex="-1" role="dialog" aria-labelledby="deliveryOrdModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" style="max-width:60vw;">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="deliveryOrdModalLabel">출하정보 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	 
		      		<div class="table-responsive">
		      	         <table id="deliveryOrdTable" class="table table-bordered">
		                    <thead class="thead-light">
		                    	<tr>
			                    	<th>출하일자</th>
			                    	<th>차종</th>
			                    	<th>품번</th>
			                    	<th>품명</th>
			                    	<th>고객사</th>
			                    	<th>생산LotNo</th>
			                    </tr>
		                    </thead>
						</table>
		      		</div>
	 			<hr class="text-secondary"> 
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
			</div>
		</div>
	</div>
	<!-- 작업지시 모달 종료-->
</div>
<!-- Modal1 End-->
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "wmsc0210";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "LOT추적(사출)");

	let startDateVal = moment().subtract('1', 'M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');

	let ordLotNoVal = " "; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let barcodeNoVal = " "; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let workOrdNoVal = " "; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let lotTrackGubunVal = "1";

	let itemList = new Array(); // 제품 목록
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	var itemCusCode = new Array(); // 출고처 목록
	<c:forEach items="${itemCusList}" var="info">
	var json = new Object();
	json.baseCd = "${info.dealCorpCd}";
	json.baseNm = "${info.dealCorpNm}";
	itemCusCode.push(json);
	</c:forEach>
	
	//1.자재 LOT NO 정보 테이블
	let lotTrackTable2 = $('#lotTrackTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '100px',
		ajax : {
			url : '<c:url value="wm/lotTrackingList2"/>',
			type : 'GET',
			data : {
				'ordLotNo' 		: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '001'; },
			},
		},
		columns : [
			{//자재 LOT NO
				data : 'barcodeNo',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//차종
				data : 'itemModelNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품번
				data : 'itemCd',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품명
				data : 'itemNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//입고일
				data : 'inWhsDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//입고수량
				data : 'inWhsQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return addCommas(parseFloat(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
			{//수입검사
				data : 'inspectDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});
	
	//2.생산 LOT NO 정보 테이블
	let lotTrackTable1 = $('#lotTrackTable1').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-'>>",
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '250px',
		ajax : {
			url : '<c:url value="wm/lotTrackingList1"/>',
			type : 'GET',
			data : {
				'ordLotNo' 		: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '001'; },
			},
		},
		columns : [
			{//생산 LOT NO
				data : 'ordLotNo',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//차종
				data : 'itemModelNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품번
				data : 'itemCd',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품명
				data : 'itemNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//생산일
				data : 'workEndTime',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//생산수량
				data : 'fairQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return addCommas(parseFloat(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
			{//공정검사
				data : 'inspectDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});
	
	//3.출하 LOT NO 정보 테이블
	let lotTrackTable5 = $('#lotTrackTable5').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-'>>",
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '150px',
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {
				//'mainGubun' 	: function(){ return '001'; },
				'lotNo' 		: function(){ return ordLotNoVal==""?workOrdNoVal:ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				//'lotNo' 		: function(){ return workOrdNoVal; },
			},
		},
		columns : [
			{//출하 LOT NO
				data : 'lotNo',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//차종
				data : 'itemModelNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품번
				data : 'itemCd',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//품명
				data : 'itemNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//출하일
				data : 'outputDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출하수량
				data : 'outputQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return addCommas(parseFloat(data));
					} else {
						return '-';
					}
				}
			},
			{//출하검사
				data : 'inspectDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출하상태
				data : 'doStatusNm'
				
			},
		],
		columnDefs : [ 
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});

	//원자재 재고현황 테이블
	let lotTrackStockPaymentTable2 = $('#lotTrackStockPaymentTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '100px',
		ajax : {
			url : '<c:url value="wm/lotTrackStockPaymentList2"/>',
			type : 'GET',
			data : {
				'ordLotNo' 		: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '001'; },
			},
		},
		columns : [
			{//창고/위치
				render : function ( data, type, row, meta ) {
					if ( row['areaCdNm'] != null ) {
						if ( row['floorNm'] != null && row['locCdNm'] != null ) {
							return row['locCdNm'] + '/' + row['areaCdNm'] + '-' + row['floorNm'];
						} else {
							return '-';
						}
					} else {
						return '-';
					}
				}
			},
			{//재고수량
				data : 'spQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return addCommas(parseFloat(data));;
					} else {
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
		],
		order :[],
		buttons : []
	});
	
	//제품 재고현황 테이블
	let lotTrackStockPaymentTable1 = $('#lotTrackStockPaymentTable1').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-'>>",
		language : lang_kor,
		paging : true,
		info : false,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '250px',
		pageLength : -1,
		ajax : {
			url : '<c:url value="wm/lotTrackStockPaymentList1"/>',
			type : 'GET',
			data : {
				'ordLotNo' 		: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '001'; },
			},
		},
		columns : [
			{//창고/위치
				render : function ( data, type, row, meta ) {
					if ( row['locCdNm'] != null ) {
						if ( row['areaCdNm'] != null && row['floorNm'] != null ) {
							return row['locCdNm'] + '/' + row['areaCdNm'] + '-' + row['floorNm'];
						} else {
							return row['locCdNm'];
						}
					} else {
						return '-';
					}
				}
			},
			{//재고수량
				data : 'spQty',
				render : function ( data, type, row, meta ) {
					if ( data != null & data != '' ) {
						return addCommas(parseFloat(data));;
					} else {
						return '-';
					}
				}
			},
		],
		columnDefs : [
		],
		order : [],
		buttons : []
	});

	//생산 LOTNO SCAN
	$('#ordLotNoScan').keypress(function(e) {
		if ( e.which == 13 ) {
			if ( $('#ordLotNoScan').val() == "" || $('#ordLotNoScan').val() == null ) {
				toastr.warning("생산 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val( korTypeToEng($(this).val()).toUpperCase() );
				$('#ordLotNoScan').select();
				return false;
			}

			$('#barcodeNoScan').val('');
			$('#workOrdNoScan').val('');
			
			toastr.success("생산 LOT NO 스캔헀습니다.");
			ordLotNoVal = $('#ordLotNoScan').val();
			barcodeNoVal = "";
			workOrdNoVal = "";
			lotTrackGubunVal = "1";

			$('#lotTrackTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT추적
			$('#lotTrackTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT추적
			$('#lotTrackTable5').DataTable().ajax.reload(function(){}); // 3.출하LOT추적
			$('#lotTrackStockPaymentTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT 재고현황
			$('#lotTrackStockPaymentTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT 재고현황
			
		}
	});

	//작지번호 SCAN
	$('#workOrdNoScan').keypress(function(e) {
		if ( e.which == 13 ) {
			if ( $('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null ) {
				toastr.warning("출하 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val( korTypeToEng($(this).val()).toUpperCase() );
				$('#workOrdNoScan').select();
				return false;
			}

			$('#barcodeNoScan').val('');
			$('#ordLotNoScan').val('');
			
			toastr.success("출하 LOT NO 스캔헀습니다.");
			ordLotNoVal = $('#workOrdNoScan').val();
			barcodeNoVal = "";
			workOrdNoVal = "";
			lotTrackGubunVal = "1";

			$('#lotTrackTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT추적
			$('#lotTrackTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT추적
			$('#lotTrackTable5').DataTable().ajax.reload(function(){}); // 3.출하LOT추적
			$('#lotTrackStockPaymentTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT 재고현황
			$('#lotTrackStockPaymentTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT 재고현황
			
		}
		
		
	});

	//자재 LOT NO SCAN
	$('#barcodeNoScan').keypress(function(e) {
		if ( e.which == 13 ) {
			if ( $('#barcodeNoScan').val() == "" || $('#barcodeNoScan').val() == null ) {
				toastr.warning("자재 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val( korTypeToEng($(this).val()).toUpperCase() );
				$('#barcodeNoScan').select();
				return false;
			}

			$('#ordLotNoScan').val('');
			$('#workOrdNoScan').val('');
			
			toastr.success("자재 LOT NO 스캔헀습니다.");
			ordLotNoVal = "";
			barcodeNoVal = $('#barcodeNoScan').val();
			workOrdNoVal = "";
			lotTrackGubunVal = "2";

			$('#lotTrackTable1').DataTable().ajax.reload(function() {
				if ( lotTrackTable1.data().count() == 0 ) {
					toastr.warning('생산투입이 되지않은 자재입니다.');
					lotTrackTable1.clear().draw();
					lotTrackTable2.clear().draw();
					lotTrackStockPaymentTable1.clear().draw();
					lotTrackStockPaymentTable2.clear().draw();
				} else {
					$('#lotTrackTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT추적
					$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
					$('#lotTrackTable5').DataTable().ajax.reload(function() {}); // 3.출하LOT추적
					$('#lotTrackStockPaymentTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT 재고현황
					$('#lotTrackStockPaymentTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT 재고현황
				}
			});
		}
	});
	
	//전체조회 버튼 클릭
	$('#btnAllList').on('click', function() {
		$('#ordLotNoScan').val('');  //생산 LOT NO
		$('#barcodeNoScan').val(''); //자재 LOT NO
		$('#workOrdNoScan').val(''); //출하 LOT NO
		
		ordLotNoVal = "";
		barcodeNoVal = "";
		workOrdNoVal = "";
		lotTrackGubunVal = "1";
		
		$('#lotTrackTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT추적
		$('#lotTrackTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT추적
		$('#lotTrackTable5').DataTable().ajax.reload(function(){}); // 3.출하LOT추적
		$('#lotTrackStockPaymentTable1').DataTable().ajax.reload(function(){}); // 1.생산LOT 재고현황
		$('#lotTrackStockPaymentTable2').DataTable().ajax.reload(function(){}); // 2.자재LOT 재고현황
		
    });
	
	//출하정보 조회 모달 테이블
	let deliveryOrdTable = $('#deliveryOrdTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : '50vh',
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmList"/>',
			type : 'GET',
			data : {				
				'startDate': function(){ return moment($('#startDate').val()).format('YYYYMMDD'); },
	           	'endDate': function(){ return moment($('#endDate').val()).format('YYYYMMDD'); },
	           	'dealCorpCd': function(){ return $('#itemCusOption').val(); },
	           	'itemSeq': function(){ return $('#itemList').val(); },
	           	'mainGubun': function(){ return '001'; },
	           	'doStatus' : function(){ return '003'; },
			}
		},
		rowId : 'workOrdNo',
		columns : [
			{
				data :'outputDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '';
					}
				},
				className: 'text-center'
			},
			{
				data :'itemModelNm',
				className: 'text-center'
			},
			{
				data :'itemCd',
				className: 'text-center'
			},
			{
				data :'itemNm',
				className: 'text-center'
			},
			{
				data :'dealCorpNm',
				className: 'text-center'
			},
			{
				data :'lotNo',
				className: 'text-center'
			},
		],
		columnDefs : [],
		order : [],
		buttons: [],
	});

	let html1  = '<div class="row">';
	
	    html1 += '	<label class="input-label-sm mr-2">일자</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
	    
	    html1 += '	<label class="input-label-sm mr-2">제품</label>';
	    html1 += '	<select class="custom-select mr-4" id="itemList"></select>';
	    
	    html1 += '	<label class="input-label-sm mr-2">거래처</label>';
	    html1 += '	<select class="custom-select mr-2" id="itemCusOption"></select>';
	    
	    html1 += '	<button type="button" class="btn btn-primary mr-2" id="btnSearch" onclick="deliveryOrdTable.ajax.reload(function(){});">조회</button>';
	    
	    html1 += '</div>';
		
	$('#deliveryOrdTable_length').html(html1);
	selectBoxAppend(itemCusCode, "itemCusOption", "", "1");
	selectBoxAppend(itemList, "itemList", "", "1");

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	//작업지시번호 목록 테이블 행 클릭 시
	$('#deliveryOrdTable tbody').on('click', 'tr', function() {
		let data = deliveryOrdTable.row(this).data();

		$('#workOrdNoScan').val(data.barcodeNo);

		ordLotNoVal = data.lotNo;
		barcodeNoVal = "";
		workOrdNoVal = $('#workOrdNoScan').val();
		lotTrackGubunVal = "1";

		$('#lotTrackTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT추적
		$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
		$('#lotTrackTable5').DataTable().ajax.reload(function() {}); // 3.출하LOT추적
		$('#lotTrackStockPaymentTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT 재고현황
		$('#lotTrackStockPaymentTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT 재고현황

		$('#deliveryOrdModal').modal('hide');

	});


	//출하 LOT NO 검색시
	function deliveryListPopup(){

		console.log('dd');

		$('#deliveryOrdModal').modal('show');
		
		$('#deliveryOrdTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			deliveryOrdTable.draw();
		},150)
		
	}
	
</script>

</body>
</html>
