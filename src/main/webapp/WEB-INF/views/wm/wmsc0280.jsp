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
				<li class="breadcrumb-item active">LOT추적(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<!-- 상단 sorting part -->
       	<div class="card top_sortbox p-2 mb-2">
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
						<button type="button" class="btn btn-primary input-sub-search" onClick="selectOrdLotNo();">
							<span class="oi oi-magnifying-glass"></span>
						</button> 
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label p-1">출하 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="workOrdNoScan" placeholder="스캐너만 입력">
						<button type="button" class="btn btn-primary input-sub-search" onClick="selectWorkOrdNo();">
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
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="row">
						<div class="col-md-12 mb-1">
							<div class="card-body p-0">
								<span style="background: #b2f6ff;font-size: 1.0rem;font-weight: bold;">1.생산 LOT NO 정보</span>
								<input class="form-control float-right" type="text" id="textSearch" placeholder="통합검색" style="width:20vw;">
							</div>
							<div class="table-responsive" style="overflow: hidden;">
								<table id="lotTrackTable1" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>생산 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>생산일자</th>
											<th class="text-center">생산수량</th>
											<th>공정검사</th>
											<th>출하일자</th>
											<th>출하수량</th>
											<th>출하검사</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6">
							<div class="card-body p-0">
								<span style="background: #b2f6ff;font-size: 1.0rem;font-weight: bold;">2.자재 LOT NO 정보</span>
								<input class="form-control float-right" type="text" id="textSearch2" placeholder="통합검색" style="width:20vw;">
							</div>
							<div class="table-responsive">
								<table id="lotTrackTable2" class="table table-bordered tr_highlight_row">
									<thead class="thead-light">
										<tr>
											<th>자재 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>입고일자</th>
											<th class="text-center">입고수량</th>
											<th>투입일자</th>
											<th class="text-center">투입수량</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card-body p-0">
								<span style="background: #b2f6ff;font-size: 1.0rem;font-weight: bold;">3.자재 세부내역</span>
								<input class="form-control float-right" type="text" id="textSearch3" placeholder="통합검색" style="width:20vw;">
							</div>
							<div class="table-responsive">
								<table id="lotTrackTable10" class="table table-bordered tr_highlight_row" style="margin-top: 6px;">
									<thead class="thead-light">
										<tr>
											<th>자재 LOT NO</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>입고일자</th>
											<th>투입일자</th>
											<th class="text-center">투입수량</th>
										</tr>
									</thead>
								</table>
							</div>
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
		      	         <table id="deliveryOrdTable" class="table table-bordered tr_highlight_row">
		                    <thead class="thead-light">
		                    	<tr>
		                    		<th><input type="checkbox" style="width:1.1rem;height:1.1rem;" id="dodCheckAll"></th>
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
	<!-- 생산LOTNO 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="ordLotNoModal" tabindex="-1" role="dialog" aria-labelledby="ordLotNoModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg" style="max-width:60vw;">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="ordLotNoModalLabel">생산LOTNO 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	 
		      		<div class="table-responsive">
		      	         <table id="ordLotNoTable" class="table table-bordered tr_highlight_row">
		                    <thead class="thead-light">
		                    	<tr>
		                    		<th><input type="checkbox" style="width:1.1rem;height:1.1rem;" id="ordLotCheckAll"></th>
			                    	<th>생산일자</th>
			                    	<th>차종</th>
			                    	<th>품번</th>
			                    	<th>품명</th>
			                    	<th class="text-center">생산수량</th>
			                    	<th>생산LotNo</th>
			                    	<th>작업지시번호</th>
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
	<!-- 생산LOTNO 모달 종료-->
	<!-- 품목  모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemCdModal" tabindex="-1" role="dialog" aria-labelledby="itemCdLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemCdLabel">품목조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
        			<table id="itemCdTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
	                   			<th style="width : 7%">구분</th>
	                   			<th style="width : 8%">품목구분</th>
								<th style="width : 25%">품번</th>
								<th style="width : 30%">품명</th>
								<th style="width : 15%">고객사</th>
								<th style="width : 15%">상태</th>
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
	<!-- 품목 코드 모달 종료-->
</div>
<!-- Modal1 End-->
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "wmsc0280";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "LOT추적(봉제)");

	let startDateVal = moment().subtract('1', 'M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');

	let ordLotNoVal = []; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let barcodeNoVal = " "; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let workOrdNoVal = " "; //처음 메뉴에 들어갔을 때 데이터가 조회 안되도록 구현
	let lotTrackGubunVal = "1";
	let popupGubun = "1";
	let ordLotNoVal2 = [];
	let ordLotNoVal3 = [];

	let itemList = new Array(); // 제품 목록(출하)
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	let itemList2 = new Array(); // 제품 목록(생산)
	<c:forEach items="${itemList2}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemCd}";
	itemList2.push(json);
	</c:forEach>

	let itemCusCode = new Array(); // 출고처 목록
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
				+ "<<'float-left'i><'float-right'B>>",
		language : lang_kor,
		paging : false,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '40vh',
		ajax : {
			url : '<c:url value="wm/lotTrackList7"/>',
			type : 'GET',
			data : {
				'ordLotNoList' 	: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun'		: function(){ return '002'; },
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
				data : 'inQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return rmDecimal(Math.round(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
			{//출고일
				data : 'outWhsDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출고수량
				data : 'outQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return rmDecimal(Math.round(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
		],
		columnDefs : [ 
		],
		drawCallback: function() {
		    $('#lotTrackTable2_filter').addClass('d-none');
		},
		order : [ [ 0, 'asc' ] ],
		buttons: [
	    	 'copy', 'excel', 'print'
	    ],
	});

	// 통합검색
	$('#textSearch2').on('keyup',function() {
		$('#lotTrackTable2_filter').find('input').val($(this).val());
		$('#lotTrackTable2_filter').find('input').trigger('keyup');
	});
	
	//작업지시번호 목록 테이블 행 클릭 시
	$('#lotTrackTable2 tbody').on('click', 'tr', function() {

		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
		} else {
			$('#lotTrackTable2').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		lotTrackGubunVal='1';
		ordLotNoVal2 = [];
		ordLotNoVal2.push(lotTrackTable2.row(this).data().barcodeNo);
		workOrdNoVal = '';
		barcodeNoVal = '';
		$('#lotTrackTable10').DataTable().ajax.reload(function(){});
	});
	
	
	//2.생산 LOT NO 정보 테이블
	let lotTrackTable1 = $('#lotTrackTable1').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<<'float-left'i><'float-right'B>>",
		language : lang_kor,
		paging : false,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '20vh',
		ajax : {
			url : '<c:url value="wm/lotTrackingList1"/>',
			type : 'GET',
			data : {
				'ordLotNoList' 	: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '002'; },
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
					if(data!=null && data!=""){
						return '<span style="color: blue; font-weight: bold;">O</span>';
					}else{
						return '<span style="color: red; font-weight: bold;">X</span>';
					}
				}
			},
			{//출하일자
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
					if ( data != null && data != '' ) {
						return addCommas(parseFloat(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
			{//출하검사
				data : 'outputInspectDate',
				render : function ( data, type, row, meta ) {
					if(data!=null && data!=""){
						return '<span style="color: blue; font-weight: bold;">O</span>';
					}else{
						return '<span style="color: red; font-weight: bold;">X</span>';
					}
				}
			},
		],
		columnDefs : [ 
			{targets : '_all',className : 'text-center'},
		],
		drawCallback: function() {
		    $('#lotTrackTable1_filter').addClass('d-none');
		},
		order : [ [ 0, 'asc' ] ],
		buttons: [
	    	 'copy', 'excel', 'print'
	    ],
	});

	// 통합검색
	$('#textSearch').on('keyup',function() {
		$('#lotTrackTable1_filter').find('input').val($(this).val());
		$('#lotTrackTable1_filter').find('input').trigger('keyup');
	});

	//생산LOTNO 목록 테이블 행 클릭 시
	$('#lotTrackTable1 tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
		} else {
			$('#lotTrackTable1').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		lotTrackGubunVal='1';
		ordLotNoVal = [];
		ordLotNoVal.push(lotTrackTable1.row(this).data().ordLotNo);
		workOrdNoVal = '';
		barcodeNoVal = '';
		$('#lotTrackTable2').DataTable().ajax.reload(function(){});
		$('#lotTrackTable10').DataTable().clear().draw();
	});
	

	//4.자재 LOT NO 정보 테이블
	let lotTrackTable10 = $('#lotTrackTable10').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12 p-0'tr>>"
				+ "<<'float-left'i><'float-right'B>>",
		language : lang_kor,
		paging : false,
		info : true,
		searching : true,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '40vh',
		ajax : {
			url : '<c:url value="wm/lotTrackList7"/>',
			type : 'GET',
			data : {
				'ordLotNoList' 	: function(){ return ordLotNoVal2; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun'		: function(){ return '002'; },
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
			{//출고일
				data : 'outWhsDate',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출고수량
				data : 'outQty',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return rmDecimal(Math.round(data));
					} else {
						return '-';
					}
				},
				className: 'text-right'
			},
		],
		columnDefs : [ 
		],
		drawCallback: function() {
		    $('#lotTrackTable10_filter').addClass('d-none');
		},
		order : [ [ 0, 'asc' ] ],
		buttons: [
	    	 'copy', 'excel', 'print'
	    ],
	});

	// 통합검색
	$('#textSearch3').on('keyup',function() {
		$('#lotTrackTable10_filter').find('input').val($(this).val());
		$('#lotTrackTable10_filter').find('input').trigger('keyup');
	});

	//자재세부내역 상세보기
	$('#lotTrackTable10 tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
 			$(this).removeClass('selected');
		} else {
			$('#lotTrackTable10').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		ordLotNoVal3 = lotTrackTable10.row(this).data().barcodeNo;
		 
		var tr = $(this).closest('tr');
	    var row = lotTrackTable10.row( tr );
	    var idx = $.inArray( tr.attr('id'), detailRows );
	
	    if ( row.child.isShown() ) {
	        tr.removeClass( 'details' );
	        row.child.hide();
	
	        // Remove from the 'open' array
	        detailRows.splice( idx, 1 );
	    }
	    else {
	        tr.addClass( 'details' );
	        if(format( row.data())!=''){
	        	row.child( format( row.data() ) ).show();

	        	// Add to the 'open' array
		        if ( idx === -1 ) {
		            detailRows.push( tr.attr('id') );
		        }
		    }
	    }
	});


	//개발관리 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var subHtml1 = '';

		$.ajax({
			url : '<c:url value="wm/lotTrackList7"/>',
            type: 'GET',
            data : {
				'ordLotNoList' 	: function(){ return ordLotNoVal3; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun'		: function(){ return '002'; },
			},
            async: false,
            success: function (res) {
                
                if(res.result == 'ok') {
                	let data = res.data;
	                if(data.length>0){
	                	subHtml1 += '<table class="table table-bordered" style="background:#f9d13042;">';
	                	subHtml1 += '	<thead class="thead-light">';
	                	subHtml1 += '		<tr>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">자재 LOT NO</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">차종</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">품번</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">품명</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">입고일자</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">투입일자</th>';
	        			subHtml1 += '			<th style="background:#f8c73bd1;">투입수량</th>';
	        			subHtml1 += '		</tr>';
	        			subHtml1 += '	</thead>';
	        			subHtml1 += '	<tbody>';
	                    for(var i=0;i<data.length;i++) {
	                    	subHtml1	+= '		<tr>';
	                    	subHtml1	+= '			<td class="text-center-td">'+data[i].barcodeNo+'</td>';
	            			subHtml1	+= '			<td class="text-center-td">'+data[i].itemModelNm+'</td>';
	            			subHtml1	+= '			<td class="text-center-td">'+data[i].itemCd+'</td>';
	            			subHtml1	+= '			<td class="text-center-td">'+data[i].itemNm+'</td>';
	            			subHtml1	+= '			<td class="text-center-td">'+moment(data[i].inWhsDate).format('YYYY-MM-DD')+'</td>';
	            			subHtml1	+= '			<td class="text-center-td">'+moment(data[i].outWhsDate).format('YYYY-MM-DD')+'</td>';
	            			subHtml1	+= '			<td class="text-right-td">'+addCommas(data[i].outQty)+'</td>';
	            			subHtml1	+= '		</tr>';
	                    }
	                    subHtml1	+= '	</tbody>';
	                    subHtml1	+= '</table>';
	                }
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return subHtml1;
	}
	//개발관리 상세내역 끝
	

	
	//제품 재고현황 테이블
	let lotTrackStockPaymentTable1 = $('#lotTrackStockPaymentTable1').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : true,
		searching : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '60vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="wm/lotTrackStockPaymentList1"/>',
			type : 'GET',
			data : {
				'ordLotNo' 		: function(){ return ordLotNoVal; },
				'barcodeNo' 	: function(){ return barcodeNoVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'lotTrackGubun' : function(){ return lotTrackGubunVal; },
				'mainGubun' 	: function(){ return '002'; },
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
		buttons: [
	    	 'copy', 'excel', 'print'
	    ],
	});

	//자재 LOT NO 스캔
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
					lotTrackTable10.clear().draw();
					lotTrackTable1.clear().draw();
					lotTrackTable2.clear().draw();
				} else {
					$('#lotTrackTable10').DataTable().clear().draw();
					$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //1.자재 LOT NO 정보
					$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //2.생산 LOT NO 정보
				}
			});
		}
	});

	
	//생산 LOT NO 스캔
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

			$('#lotTrackTable10').DataTable().clear().draw();
			$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //1.자재 LOT NO 정보
			$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //2.생산 LOT NO 정보
		}
	});
	
	//출하 LOT NO 스캔
	$('#workOrdNoScan').keypress(function(e) {
		if ( e.which == 13 ) {
			if ( $('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null ) {
				toastr.warning("출하 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val( korTypeToEng($(this).val()).toUpperCase() );
				$('#workOrdNoScan').select();
				return false;
			}

			$('#ordLotNoScan').val('');
			$('#barcodeNoScan').val('');
			
			toastr.success("출하 LOT NO 스캔헀습니다.");
			ordLotNoVal = $('#workOrdNoScan').val();
			barcodeNoVal = "";
			workOrdNoVal = "";
			lotTrackGubunVal = "1";

			$('#lotTrackTable10').DataTable().clear().draw();
			$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //1.자재 LOT NO 정보
			$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //2.생산 LOT NO 정보
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

		$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //1.자재 LOT NO 정보
		$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //2.생산 LOT NO 정보
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
			url : '<c:url value="wm/itemWhsOutDtlPopupList"/>',
			type : 'GET',
			data : {				
				'startDate': function(){ return moment($('#startDate').val()).format('YYYYMMDD'); },
	           	'endDate': function(){ return moment($('#endDate').val()).format('YYYYMMDD'); },
	           	'itemCus': function(){ return $('#itemCusOption').val(); },
	           	'itemCd': function(){ return $('#itemCd').val(); },
	           	'mainGubun': function(){ return '002'; },
			}
		},
		rowId : 'workOrdNo',
		columns : [
			{
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" style="width:1.1rem;height:1.1rem;" name="dodCheck" data-ordLotNo='+row['barcodeNo']+' />'
				},
				className : 'text-center'
			},
			{
				data :'outDate',
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
				data :'itemCusNm',
				className: 'text-center'
			},
			{
				data :'barcodeNo',
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

	    html1 += '	<label class="input-label-sm mr-2">품번</label>';
	    html1 += '	<div class="form-group input-sub mr-2">';
	    html1 += '  <input class="form-control mr-2" type="text" id="itemCd" placeholder="품번을 입력해주세요." style="width:155px;"/>';
		html1 += '	<button type="button" class="btn btn-primary input-sub-search" onclick="itemCdSelect()">';
		html1 += '	<span class="oi oi-magnifying-glass"></span></button></div>';	
	    html1 += '	<label class="input-label-sm mr-2">거래처</label>';
	    html1 += '	<select class="custom-select mr-2" id="itemCusOption"></select>';
	    html1 += '	<button type="button" class="btn btn-primary mr-2" id="btnSearch" onclick="deliveryOrdTable.ajax.reload(function(){});">조회</button>';
	    html1 += '	<button type="button" class="btn btn-success mr-2" id="btnSelect2">선택</button>';
	    html1 += '</div>';
		
	$('#deliveryOrdTable_length').html(html1);
	selectBoxAppend(itemCusCode, "itemCusOption", "", "2");

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	//생산 LOTNO 전체선택 클릭시
	$('#dodCheckAll').on('click',function(){
		if($(this).is(':checked')){
			$('input[name=dodCheck]').prop('checked',true);
		}else{
			$('input[name=dodCheck]').prop('checked',false);
		}
	});

	//작업지시번호 목록 테이블 행 클릭 시
	$('#deliveryOrdTable tbody').on('click', 'tr', function() {
		if($(this).find('input[name=dodCheck]').is(':checked') ) {
			$(this).find('input[name=dodCheck]').prop('checked',false);
        } else {
        	$(this).find('input[name=dodCheck]').prop('checked',true);
        }
	});

	//선택 버튼 클릭시
	$('#btnSelect2').on('click',function(){

		if(!$('input[name=dodCheck]').is(':checked')){
			toastr.warning('출하LOTNO를 선택해주세요.');
			return false;
		}
		
		ordLotNoList=[];
		$('input[name=dodCheck]:checked').each(function(index,item){
			ordLotNoList.push($(this).attr('data-ordLotNo'));
		});
		
		$('#workOrdNoScan').val(ordLotNoList[0]);

		ordLotNoVal = ordLotNoList;
		barcodeNoVal = "";
		workOrdNoVal = "";
		lotTrackGubunVal = "1";

		$('#lotTrackTable10').DataTable().clear().draw();
		$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //1.생산 LOT NO 정보
		$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //2.자재 LOT NO 정보
		
		$('#barcodeNoScan').val('');
		$('#ordLotNoScan').val('');
		
		$('#deliveryOrdModal').modal('hide');
	})

	//생산LOT 조회 모달 테이블
	let ordLotNoTable = $('#ordLotNoTable').DataTable({
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
			url : '<c:url value="wm/lotTrackList6"/>',
			type : 'GET',
			data : {				
				'startDate': function(){ return moment($('#workStartDate').val()).format('YYYYMMDD'); },
	           	'endDate': function(){ return moment($('#workEndDate').val()).format('YYYYMMDD'); },
	           	'itemCus': function(){ return $('#itemCusOption2').val(); },
	           	'itemCd': function(){ return $('#itemCd2').val(); },
	           	'mainGubun': function(){ return '002'; },
			}
		},
		rowId : 'workOrdNo',
		columns : [
			{
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" style="width:1.1rem;height:1.1rem;" name="ordLotCheck" data-ordLotNo='+row['ordLotNo']+' />'
				},
				className : 'text-center'
			},
			{
				data :'workStartTime',
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
				data :'outputQty',
				render : function(data,type,row,meta){
					return rmDecimal(Math.round(data));
				},
				className: 'text-right'
			},
			{
				data :'ordLotNo',
				className: 'text-center'
			},
			{
				data :'workOrdNo',
				className: 'text-center'
			},
		],
		columnDefs : [],
		order : [],
		buttons: [],
	});

	let html2  = '<div class="row">';
	
	html2 += '	<label class="input-label-sm mr-2">생산일자</label>';
	html2 += '	<input class="form-control mr-2" type="date" id="workStartDate" style="width:100px;"/>';
	html2 += '	<label class="input-label-sm mr-2">~</label>';
	html2 += '	<input class="form-control mr-4" type="date" id="workEndDate" style="width:100px;" />';
	html2 += '	<label class="input-label-sm mr-2">품번</label>';
	html2 += '	<div class="form-group input-sub m-0">';
	html2 += '  <input class="form-control" type="text" id="itemCd2" placeholder="품번을 입력해주세요." style="width:155px;"/>';
	html2 += '	<button type="button" id="btnItemCd" class="btn btn-primary input-sub-search" onclick="itemCdSelect()">';
	html2 += '	<span class="oi oi-magnifying-glass"></span></button></div>';
	html2 += '	<button type="button" id="itemCdDelete" class="btn form-control mr-1 ml-1" style="width: 40px;" onclick="deleteItemCd()">';
	html2 += '	<i class="mdi mdi-close"></i>';
	html2 += '	</button>';
	html2 += '	<label class="input-label-sm mr-2">거래처</label>';
	html2 += '	<select class="custom-select mr-2" id="itemCusOption2"></select>';
	html2 += '	<button type="button" class="btn btn-primary mr-2" id="btnSearch2" onclick="ordLotNoTable.ajax.reload(function(){});">조회</button>';
	html2 += '	<button type="button" class="btn btn-success mr-2" id="btnSelect">선택</button>';
	html2 += '</div>';
		
	$('#ordLotNoTable_length').html(html2);
	selectBoxAppend(itemCusCode, "itemCusOption2", "", "2");

	$('#workStartDate').val(startDateVal);
	$('#workEndDate').val(endDateVal);

	function deleteItemCd(){
		$('#itemCd2').val('');
	}

	//생산 LOTNO 전체선택 클릭시
	$('#ordLotCheckAll').on('click',function(){
		if($(this).is(':checked')){
			$('input[name=ordLotCheck]').prop('checked',true);
		}else{
			$('input[name=ordLotCheck]').prop('checked',false);
		}
	});

	//작업지시번호 목록 테이블 행 클릭 시
	$('#ordLotNoTable tbody').on('click', 'tr', function() {
		if($(this).find('input[name=ordLotCheck]').is(':checked') ) {
			$(this).find('input[name=ordLotCheck]').prop('checked',false);
        } else {
        	$(this).find('input[name=ordLotCheck]').prop('checked',true);
        }
	});

	let ordLotNoList = [];

	//선택 버튼 클릭시
	$('#btnSelect').on('click',function(){

		if(!$('input[name=ordLotCheck]').is(':checked')){
			toastr.warning('생산LOTNO를 선택해주세요.');
			return false;
		}
		
		ordLotNoList=[];
		$('input[name=ordLotCheck]:checked').each(function(index,item){
			ordLotNoList.push($(this).attr('data-ordLotNo'));
		});
		
		$('#ordLotNoScan').val(ordLotNoList[0]);

		ordLotNoVal = ordLotNoList;
		barcodeNoVal = "";
		workOrdNoVal = "";
		lotTrackGubunVal = "1";

		$('#lotTrackTable10').DataTable().clear().draw();
		$('#lotTrackTable1').DataTable().ajax.reload(function(){}); //1.생산 LOT NO 정보
		$('#lotTrackTable2').DataTable().ajax.reload(function(){}); //2.자재 LOT NO 정보
		
		$('#barcodeNoScan').val('');
		$('#workOrdNoScan').val('');
		
		$('#ordLotNoModal').modal('hide');
	})
	
	//생산LOTNO 검색시
	function selectOrdLotNo(){
		popupGubun = "1";
		$('#ordLotCheckAll').prop('checked',false);
		$('input[name=ordLotCheck]').prop('checked',false);
		
		$('#ordLotNoModal').modal('show');
		setTimeout(function(){
			ordLotNoTable.draw();
		},150)
	};

	//출하LOTNO 검색시
	function selectWorkOrdNo(){
		popupGubun = "2";
		$('#dodCheckAll').prop('checked',false);
		$('input[name=dodCheck]').prop('checked',false);
		
		$('#deliveryOrdModal').modal('show');
		setTimeout(function(){
			deliveryOrdTable.draw();
		},150)
	};

	//코드 팝업 시작
	var itemCdTable;
	function itemCdSelect() {
		if (itemCdTable != null && itemCdTable != 'undefined') {
			itemCdTable.destroy();
		}
		itemCdTable = $('#itemCdTable').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language : lang_kor,
			paging : false,
			info : true,
			ordering : true,
			processing : true,
			autoWidth : false,
			scrollX : false,
			lengthChange : true,
			async : false,
			scrollY : "50vh",
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [ 
				{
					data : 'mainGubunNm'
				},
				{
					data : 'itemGubunNm'
				},
				{
					data : 'itemCd'
				}, 
				{
					data : 'itemNm'
				}, 
				{
					data : 'itemCusNm'
				}, 
				{
					data : 'stateCdNm'
				}  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
			drawCallback : function(){
			}
		});
		
		$('#itemCdTable tbody').on('click', 'tr', function() {
			var data = itemCdTable.row(this).data();
			if(popupGubun=="1"){
				$('#itemCd2').val(data.itemCd);
			}else if(popupGubun=="2"){
				$('#itemCd').val(data.itemCd);
			}else{
				$('#itemCd').val(data.itemCd);
			}
		
			$('#itemCdModal').modal('hide');
		});

		$('#itemCdModal').modal('show');
	}


	

</script>

</body>
</html>
