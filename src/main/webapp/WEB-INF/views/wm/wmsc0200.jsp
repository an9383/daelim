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
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">LOT 추적상세</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<!-- 상단 sorting part -->
       	<div class="card top_sortbox p-2">
           	<div class="row">
           		<div class="form-group row">
					<label class="col-form-label p-1">생산 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="ordLotNoScan" placeholder="스캐너만 입력">
						<!-- <button type="button" class="btn btn-primary input-sub-search" onClick="selectOrdLotNo();">
							<span class="oi oi-magnifying-glass"></span>
						</button>  -->
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label p-1">자재 LOT NO</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="barcodeNoScan" placeholder="스캐너만 입력">
						<!-- <button type="button" class="btn btn-primary input-sub-search" onClick="selectBacodeNo();">
							<span class="oi oi-magnifying-glass"></span>
						</button>  -->
					</div>
				</div>
				<div class="form-group row">
					<label class="col-form-label p-1">작업지시번호</label>
					<div class="input-sub m-0 mr-5">
						<input type="text" class="form-control" id="workOrdNoScan" placeholder="스캐너만 입력">
						<button type="button" class="btn btn-primary input-sub-search" onClick="selectWorkOrd();">
							<span class="oi oi-magnifying-glass"></span>
						</button> 
					</div>
				</div>
          	</div> 
        </div>
	    <!-- / end 상단 sorting part -->
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list">
				<div class="card">
					<div class="row">
						<h6>1.생산 LOT NO 정보</h6>
						<div class="table-responsive" style="overflow: hidden;">
							<table id="lotTrackTable1" class="table table-bordered tr_highlight_row">
								<thead class="thead-light">
									<tr>
										<th>작업지시번호</th>
										<th>생산 LOT NO</th>
										<th>작업상태</th>
										<th>작업구분</th>
										<th>작업자</th>
										<th>검사취출</th>
										<th>양품수량</th>
										<th>생산완료시간</th>
										<th>공정검사</th>
										<th>출하검사</th>
										<th>출하일자</th>
										<th>출하수량</th>
										<th>업체명</th>
										<th>현재고</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row">
						<h6>2.자재 LOT NO 정보</h6>
						<div class="table-responsive">
							<table id="lotTrackTable2" class="table table-bordered tr_highlight_row">
								<thead class="thead-light">
									<tr>
										<th>작업지시번호</th>
										<th>자재 LOT NO</th>
										<th>차종</th>
										<th>품번</th>
										<th>품명</th>
										<th>COLOR</th>
										<th>건조기준(°C)</th>
										<th>건조기준(HR)</th>
										<th>건조조건(°C)</th>
										<th>건조조건(HR)</th>
										<th>수분측정</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row">
						<h6>3.불량 LOT NO 정보</h6>
						<div class="table-responsive">
							<table id="lotTrackTable3" class="table table-bordered tr_highlight_row">
								<thead class="thead-light">
									<tr>
										<th>작업지시번호</th>
										<th>불량 LOT NO</th>
										<th>검사취출</th>
										<th>불량수량</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row">
						<h6>4.작업지시번호</h6>
						<div class="table-responsive">
							<table id="lotTrackTable4" class="table table-bordered tr_highlight_row">
								<thead class="thead-light">
									<tr>
										<th>작업지시번호</th>
										<th>품목구분</th>
										<th>차종</th>
										<th>품번</th>
										<th>품명</th>
										<th>설비병</th>
										<th>생산수량</th>
										<th>양품수량</th>
										<th>불량수량</th>
										<th>생산시간(분)</th>
										<th>비가동시간(분)</th>
										<th>총퍼징횟수</th>
										<th>퍼징</th>
										<th>런너</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- / #main  -->
</div>
<!-- Modal1 End-->
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>
	let currentHref = "wmsc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","LOT추적상세"); 

	let ordLotNoVal = null;
	let barcodeNoVal = null;
	let workOrdNoVal = null;
	let lotTrackGubunVal = "";

	// 1.생산 LOT NO 테이블
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
		scrollY : '250px',
		pageLength : 100,
		/* select : {
			style : 'single',
			toggleable : false,
			items : 'row'
		}, */
		ajax : {
			url : '<c:url value="wm/lotTrackingList1"/>',
			type : 'GET',
			data : {
				'ordLotNo' : function() {return ordLotNoVal;},
				'barcodeNo' : function() {return barcodeNoVal;},
				'workOrdNo' : function() {return workOrdNoVal;},
				'lotTrackGubun' : function() {return lotTrackGubunVal;},
			},
		},
		columns : [ 
			{
				data : 'workOrdNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'ordLotNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workStatus',
				render : function(data,type,row,meta){
					if(data!=null){
						if(data=="001"){
							return '<label title="진행중" style="color: green; font-size: 15px;">●</label>';
						}else if(data=="002"){
							return '<label title="진행완료" style="color: black; font-size: 15px;">●</label>';
						}else{
							return '-'
						}
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workGubunNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workChargrNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'inspectGubunNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'fairQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workEndTime',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data,'YYYYMMDDHHmm').format('YYYY-MM-DD HH:mm');
					}else{
						return '-';
					}
				}
			},
			{
				render : function(data,type,row,meta){
					return '-';
				}
			},
			{
				data : 'inspectDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			{
				data : 'outDate',
				render : function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			{
				data : 'outQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'poCorpNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'remainQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
			{targets : [ 6,11,13 ],className : 'text-right',render : $.fn.dataTable.render.number(',')},
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});


	// 2.자재 LOT NO 테이블
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
		scrollY : '100px',
		pageLength : 100,
		/* select : {
			style : 'single',
			toggleable : false,
			items : 'row'
		}, */
		ajax : {
			url : '<c:url value="wm/lotTrackingList2"/>',
			type : 'GET',
			data : {
				'ordLotNo' : function() {return ordLotNoVal;},
				'barcodeNo' : function() {return barcodeNoVal;},
				'workOrdNo' : function() {return workOrdNoVal;},
				'lotTrackGubun' : function() {return lotTrackGubunVal;},
			},
		},
		columns : [ 
			{
				data : 'workOrdNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'barcodeNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemModelNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemCd',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemColor',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemCel',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemHr',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'matrlCel',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'matrlHr',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workOrdNo',
				render : function(data,type,row,meta){
					return '-';
				}
			},
		],
		columnDefs : [ 
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});

	
	// 3.불량 LOT NO 테이블
	let lotTrackTable3 = $('#lotTrackTable3').DataTable({
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
		scrollY : '100px',
		pageLength : 100,
		/* select : {
			style : 'single',
			toggleable : false,
			items : 'row'
		}, */
		ajax : {
			url : '<c:url value="wm/lotTrackingList3"/>',
			type : 'GET',
			data : {
				'ordLotNo' : function() {return ordLotNoVal;},
				'barcodeNo' : function() {return barcodeNoVal;},
				'workOrdNo' : function() {return workOrdNoVal;},
				'lotTrackGubun' : function() {return lotTrackGubunVal;},
			},
		},
		columns : [ 
			{
				data : 'workOrdNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'ordLotNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'inspectGubunNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'faultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
			{targets : [3 ],className : 'text-right',render : $.fn.dataTable.render.number(',')},
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	});
	

	// 4.작업지시번호 테이블
	let lotTrackTable4 = $('#lotTrackTable4').DataTable({
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
		scrollY : '300px',
		pageLength : 100,
		/* select : {
			style : 'single',
			toggleable : false,
			items : 'row'
		}, */
		ajax : {
			url : '<c:url value="wm/lotTrackingList4"/>',
			type : 'GET',
			data : {
				'ordLotNo' : function() {return ordLotNoVal;},
				'barcodeNo' : function() {return barcodeNoVal;},
				'workOrdNo' : function() {return workOrdNoVal;},
				'lotTrackGubun' : function() {return lotTrackGubunVal;},
			},
		},
		columns : [ 
			{
				data : 'workOrdNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemGubunNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemModelNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemCd',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'itemNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'equipNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'outputQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'fairQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'faultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workTime',
				render : function(data,type,row,meta){
					if(data!=null && data!="") {
						let realWorkTime = parseInt(data) - parseInt(row['workNonTime']);
						
						if(realWorkTime>=60) {
							return (realWorkTime/60).toFixed(0)+' 시간 '+(realWorkTime%60).toFixed(0)+' 분 ';
						}else {
							return '0 시간 '+realWorkTime+' 분 ';
						}
					}else{
						return '-';
					}
				}
			},
			{
				data : 'workNonTime',
				render : function(data,type,row,meta){
					if(data!=null){
						let nonWorkTime = parseInt(data);
						
						if(nonWorkTime>=60) {
							return (nonWorkTime/60).toFixed(0)+' 시간 '+(nonWorkTime%60).toFixed(0)+' 분 ';
						}else {
							return '0 시간 '+nonWorkTime+' 분 ';
						}
					}else{
						return '-';
					}
				}
			},
			{
				data : 'totalFuzzQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return parseInt(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'fuzzQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'runnerQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
		],
		columnDefs : [ 
			{targets : [6,7,8],className : 'text-right',render : $.fn.dataTable.render.number(',')},
			{targets : '_all',className : 'text-center'},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : []
	}); 
	 

	//생산 LOTNO SCAN
	$('#ordLotNoScan').keypress(function(e) {
		if (e.which == 13) {
			if ($('#ordLotNoScan').val() == "" || $('#ordLotNoScan').val() == null) {
				toastr.warning("생산 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#ordLotNoScan').select();
				return false;
			}

			$('#barcodeNoScan').val('');
			$('#workOrdNoScan').val('');
			
			
			toastr.success("생산LOTNO 스캔헀습니다.");
			ordLotNoVal = $('#ordLotNoScan').val();
			barcodeNoVal = "";
			workOrdNoVal = "";
			lotTrackGubunVal = "1";

			$('#lotTrackTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT추적
			$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
			$('#lotTrackTable3').DataTable().ajax.reload(function() {}); // 3.뷸량LOT추적
			$('#lotTrackTable4').DataTable().ajax.reload(function() {}); // 4.작업지시번호
		}
	});

	//자재 LOTNO SCAN
	$('#barcodeNoScan').keypress(function(e) {
		console.log('자재바코드스캔')
		if (e.which == 13) {
			if ($('#barcodeNoScan').val() == "" || $('#barcodeNoScan').val() == null) {
				toastr.warning("자재 LOT NO를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#barcodeNoScan').select();
				return false;
			}

			$('#ordLotNoScan').val('');
			$('#workOrdNoScan').val('');
			
			toastr.success("자재LOTNO 스캔헀습니다.");
			ordLotNoVal = "";
			barcodeNoVal = $('#barcodeNoScan').val();
			workOrdNoVal = "";
			lotTrackGubunVal = "2";

			$('#lotTrackTable1').DataTable().ajax.reload(function() {
				if(lotTrackTable1.data().count() == 0) {
					toastr.warning('생산투입이 되지않은 자재입니다.');
					lotTrackTable2.clear().draw();
					lotTrackTable3.clear().draw();
					lotTrackTable4.clear().draw();
				} else {
					$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
					$('#lotTrackTable3').DataTable().ajax.reload(function() {}); // 3.뷸량LOT추적
					$('#lotTrackTable4').DataTable().ajax.reload(function() {}); // 4.작업지시번호
				}
			}); // 1.생산LOT추적
		}
	});

	//작지번호 SCAN
	$('#workOrdNoScan').keypress(function(e) {
		if (e.which == 13) {
			if ($('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null) {
				toastr.warning("작업지시번호를 입력 후 다시 시도해주세요.");
				$(this).val(korTypeToEng($(this).val()).toUpperCase());
				$('#workOrdNoScan').select();
				return false;
			}

			$('#ordLotNoScan').val('');
			$('#barcodeNoScan').val('');
			
			toastr.success("생산LOTNO 스캔헀습니다.");
			ordLotNoVal = "";
			barcodeNoVal = "";
			workOrdNoVal = $('#workOrdNoScan').val();
			lotTrackGubunVal = "3";

			$('#lotTrackTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT추적
			$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
			$('#lotTrackTable3').DataTable().ajax.reload(function() {}); // 3.뷸량LOT추적
			$('#lotTrackTable4').DataTable().ajax.reload(function() {}); // 4.작업지시번호
		}
	});
	

	//작업지시번호 목록 조회 팝업
	var workOrdPopUpTable;
	function selectWorkOrd() {
		if (workOrdPopUpTable == null || workOrdPopUpTable == undefined) {
			workOrdPopUpTable = $('#workOrdPopUpTable').DataTable({
				language : lang_kor,
				paging : true,
				searching : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : false,
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {
						'menuAuth' : 'wmsc0080'
					},
				},
				rowId : 'workOrdNo',
				columns : [ {
					data : 'workOrdNo'
				}, {
					data : 'itemGubunNm'
				}, {
					data : 'itemNm'
				}, {
					data : 'ordLotNo'
				}, {
					data : 'workOrdQty'
				}, ],
				columnDefs : [ {
					targets : [ 4 ],
					render : $.fn.dataTable.render.number(',')
				}, {
					targets : [ 0, 1, 2, 3 ],
					className : 'text-center-td'
				}, {
					targets : [ 4 ],
					className : 'text-right-td'
				} ],
				order : [ [ 0, 'desc' ] ]
			});

			$('#workOrdPopUpTable tbody').on('click', 'tr', function() {
				var data = workOrdPopUpTable.row(this).data();

				$('#workOrdNoScan').val(data.workOrdNo);

				ordLotNoVal = "";
				barcodeNoVal = "";
				workOrdNoVal = $('#workOrdNoScan').val();
				lotTrackGubunVal = "3";

				$('#lotTrackTable1').DataTable().ajax.reload(function() {}); // 1.생산LOT추적
				$('#lotTrackTable2').DataTable().ajax.reload(function() {}); // 2.자재LOT추적
				$('#lotTrackTable3').DataTable().ajax.reload(function() {}); // 3.뷸량LOT추적
				$('#lotTrackTable4').DataTable().ajax.reload(function() {}); // 4.작업지시번호

				$('#workOrdPopUpModal').modal('hide');

			});
		} else {
			$('#workOrdPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrdPopUpModal').modal('show');
	}
</script>

</body>
</html>
