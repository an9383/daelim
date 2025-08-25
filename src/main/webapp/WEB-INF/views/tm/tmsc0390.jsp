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
				<li class="breadcrumb-item"><a href="#">재고관리</a></li>
				<li class="breadcrumb-item active">부적합창고현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 55%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table class="table table-bordered" id="inventoryTable">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="20%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center">구분</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">단위</th>
									<th class="text-center">현재고</th>
									<th class="text-center">단가</th>
									<th class="text-center">금액</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 44%;">
				<div class="card" id="formBox">
					<div class="table-responsive">
						<table class="table table-lg table-bordered mb-2" id="barcodeListTable">
							<colgroup>
								<col width="15%">
								<col width="25%">
								<col width="10%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center-th">입고일자</th>
									<th class="text-center-th">바코드</th>
									<th class="text-center-th">단위</th>
									<th class="text-center-th">수량</th>
									<th class="text-center-th">불량내역</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<style>
	.bg-1 {
	  background-color: #F5DDAD !important;
	}
	.bg-2 {
	  background-color: #F1BCAE !important;
	}
	.bg-3 {
	  background-color: #C9DECF !important;
	}
	.bg-4 {
	  background-color: #A9CBD7 !important;
	}
</style>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "55%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "tmsc0390";
	let currentPage = $('.' + currentHref).attr('id');
	$(document).attr("title", "부적합창고현황");
	
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');

	const SERVER_DATE_TO = "${serverDateTo}";
	const SERVER_DATE = "${serverDateTo}";
	const SERVER_MONTH_TO = SERVER_DATE.substring(0, 7);
	
	let serverMonthTo = SERVER_MONTH_TO;
	let spCdVal = "";
	let dateRangeVal = "";
	let itemCd = "";
	let itemNm = "";
	let itemCus = "";
	let spUnit = "";
	let selectSpType = "";
	let mainGubunVal = "";
	let itemCusVal = "";
	let unfitGubunVal = "";
	
	//공통코드 처리 시작
	let itemGubunList = new Array(); 
	<c:forEach items="${itemGubunList}" var="info">
	if ( "${info.baseCd}" != '002' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		itemGubunList.push(json);
	}
	</c:forEach>
	
	let locCdCode = new Array(); // 창고코드
	<c:forEach items="${locCd}" var="info">
	if ( "${info.etc1}" == '봉제' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		locCdCode.push(json);
	}
	</c:forEach>
	
	let mainGubunList = new Array(); // 공정
	<c:forEach items="${mainGubunList}" var="info">
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		mainGubunList.push(json);
	</c:forEach>
	
	let unfitGubunList = new Array(); // 구분
	<c:forEach items="${unfitGubunList}" var="info">
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		unfitGubunList.push(json);
	</c:forEach>
	//공통코드 처리 끝

	//재고현황 목록조회
	let inventoryTable = $('#inventoryTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row mt-2'<'col-sm-12 col-md-9'i><'col-sm-12 col-md-3'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : true,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "70vh",
		rowId : 'poNo',
		ajax : {
			url : '<c:url value="qm/stockPaymentUnfitList"/>',
			type : 'GET',
			data : {
				'tmMon' 		: function(){ return serverMonthTo.replace(/-/g, ''); },
				'mainGubun' 	: function(){ return mainGubunVal; },
				'itemCus' 		: function(){ return itemCusVal; },
				'realQtyOption' : function(){ return "Y"; },
			}
		},
		rowId : 'partCd',
		columns : [
			{ data : 'spTypeNm' }, //구분
			{ data : 'itemModelNm' }, //차종
			{ data : 'spCd' }, //품번
			{ data : 'spNm' }, //품명
			{ data : 'spUnit' }, //단위
			{//현재고
				data : 'realQty', "className" : "text-right",
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(Math.round(data));
					} else {
						return '';
					}
				}
			},
			{ data : 'itemCost', visible: false }, //단가
			{ data : 'realQtyCost', visible: false }, //금액
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});

	// 세부 목록 보기
	$('#inventoryTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
//  			$(this).removeClass('selected');
 			return false;
		} else {
			$('#inventoryTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		$("#checkAll").prop("checked", false);

		spCdVal = inventoryTable.row(this).data().itemSeq;
		itemCd = inventoryTable.row(this).data().spCd;
		itemNm = inventoryTable.row(this).data().spNm;
		itemCus = inventoryTable.row(this).data().itemCus;
		spUnit = inventoryTable.row(this).data().spUnit;
		selectSpType = inventoryTable.row(this).data().spType; // 구분 (001 : 제품, 003 : 반제품, 004 : 원자재)
		
		$('#barcodeListTable').DataTable().ajax.reload(function(){});

		if ( inventoryTable.row(this).data().spType == "003" || inventoryTable.row(this).data().spType == "004" || inventoryTable.row(this).data().spType == "005" ) {
			$('#topDiv').removeClass('d-none');	//입고일자 범례표시
			
			let tr = $(this).closest('tr');
			let row = inventoryTable.row( tr );
			let idx = $.inArray( tr.attr('id'), detailRows );

	        if ( row.child.isShown() ) {
	            tr.removeClass( 'details' );
	            row.child.hide();
	 
	            // Remove from the 'open' array
	            detailRows.splice( idx, 1 );
	        } else {
	            tr.addClass( 'details' );
	            row.child( format( row.data() ) ).show();
	 
	            // Add to the 'open' array
	            if ( idx === -1 ) {
	                detailRows.push( tr.attr('id') );
	            }
	        }
		} else {
			$('#topDiv').addClass('d-none');	//입고일자 범례표시
		}
	});

	let html1 = '<div class="row">';
	
	html1 += '<label class="input-label-sm m-1">기간 조회</label>';
	html1 += '<input class="form-control mtz-monthpicker-widgetcontainer" type="text" id="demo-2" style="max-width:70px;">';
	
	html1 += '<label class="input-label-sm m-1 ml-3">공정</label>';
    html1 += '<select id="mainGubunBox" class="custom-select custom-select-sm" style="max-width:70px;"></select>';
    
    html1 += '<label class="input-label-sm m-1 ml-3">협력사</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="hidden" class="form-control" id="itemRealCus">';
	html1 += '<input type="text" class="form-control" id="itemCus" style="width:100px;" disabled>';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" id="itemCusBtn" onClick="itemCusSelectInCorpCd();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += `<button type="button" id="itemCusDelete" class="btn form-control mr-2 p-0" style="width: 30px;" onclick="funcItemCusDelete();">`;
	html1 += '<i class="mdi mdi-close"></i>';
	html1 += '</button>';
    
    html1 += '<button type="button" class="btn btn-primary ml-3" id="btnRefresh">새로고침</button>'
    
	html1 += '</div>';

	$('#inventoryTable_length').html(html1);
	$('#demo-2').val(serverMonthTo);
	
	selectBoxAppend(mainGubunList, "mainGubunBox", "", "1");
	
	//기간 조회 설정
	let nowYear = SERVER_DATE.substr(0,4) * 1;
	$('#demo-2').monthpicker({
		pattern : 'yyyy-mm',
		selectedYear : nowYear,
		startYear : nowYear - 100,
		finalYear : nowYear + 100,
	});
	
	//기간조회, 공정 변경시
	$('#demo-2, #mainGubunBox').on('change', function() {
		spCdVal = "";
		serverMonthTo = $('#demo-2').val();
		mainGubunVal = $('#mainGubunBox').val();
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		$('#barcodeListTable').DataTable().clear().draw();
	});

	//새로고침 버튼
	$('#btnRefresh').on('click', function(){
		spCdVal = "";
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		$('#barcodeListTable').DataTable().clear().draw();
	});
	
	//협력사 삭제 시
	function funcItemCusDelete() {
		$('#itemCus').val('');
		$('#itemRealCus').val('');
		itemCusVal = '';
		
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		$('#barcodeListTable').DataTable().clear().draw();
	}
	
	//공급사 팝업 시작
	let dealCorpPopUpTable4;
	function itemCusSelectInCorpCd() {
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
// 		var dealArr = ['002','003'];
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
// 						'dealArr' :  function(){return dealArr;},
					},
				},
				columns : [
					{ data : 'dealCorpNm' },
					{ data : 'dealCorpCd' },
					{ data : 'presidentNm' },
					{ data : 'repreItem' },
					{ data : 'corpNo' },
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		});
		
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	$(document).on('click', '#dealCorpPopUpTable4 tbody tr', function() {
		let data = dealCorpPopUpTable4.row(this).data();
		$('#itemRealCus').val(data.dealCorpCd);
		$('#itemCus').val(data.dealCorpNm);
		
		itemCusVal = data.dealCorpCd;
		$('#inventoryTable').DataTable().ajax.reload(function(){});
		
		$('#dealCorpPopUpModal4').modal('hide');
	});

	//창고 상세내역 시작
	let detailRows = [];
	function format (d) {
		let locHtml = '';
		$.ajax({
			url : '<c:url value="qm/stockPaymentUnfitLocList"/>',
			type : 'GET',
            async: false,
			data : {
				'tmMon' 		: function(){ return serverMonthTo.replace(/-/g, ''); },
				'mainGubun' 	: function(){ return mainGubunVal; },
				'realQtyOption' : function(){ return "Y"; },
				'itemSeq' 		: function(){ return spCdVal; },
			},
            success: function (res) {
                let data = res.data;
                if ( res.result == 'ok' ) {
                	locHtml	 = '<table class="table table-bordered">';
                	locHtml	+= '	<thead class="thead-light">';
                	locHtml	+= '		<tr>';
        			locHtml	+= '			<th style="">창고</th>';
        			locHtml	+= '			<th style="">현재고</th>';
        			locHtml	+= '		</tr>';
        			locHtml	+= '	</thead>';
        			locHtml	+= '	<tbody>';
                    for ( var i=0; i < data.length; i++ ) {
                    	locHtml	+= '		<tr>';
            			locHtml	+= '			<td class="text-center-td">'+data[i].locationNm+'</td>';
            			locHtml	+= '			<td class="text-center-td">'+rmDecimal(Math.round(data[i].realQty))+'</td>';
            			locHtml	+= '		</tr>';
                    }
                    locHtml	+= '	</tbody>';
                    locHtml	+= '</table>';
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return locHtml;
	}
	//창고 상세내역 끝
	
	//우측 상단 목록조회
	let barcodeListTable = $('#barcodeListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row mt-2'<'col-sm-12 col-md-9'i><'col-sm-12 col-md-3'B>>",
		language : lang_kor,
		paging : true,
		info : true,
		searching : true,
		ordering : true,
		processing : false,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "70vh",
		ajax : {
			url : '<c:url value="qm/stockPaymentUnfitBarcodeList"/>',
			type : 'GET',
			data : {
				'itemSeq' 		: function(){ return spCdVal; },
				'tmMon' 		: function(){ return serverMonthTo.replace(/-/g, ''); },
				'mainGubun' 	: function(){ return mainGubunVal; },
				'unfitGubun' 	: function(){ return unfitGubunVal; },
				'realQtyOption' : "Y",
			},
		},
		rowId : 'rowId',
		columns : [
			{//입고일자
				data : 'unfitFaultyDate',
				render : function(data, type, row, meta) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'barcodeNo' }, //바코드
			{ data : 'spUnit' }, //단위
			{//수량
				data : 'realQty', "className" : "text-right",
				render : function (data, type, row, meta) {
					return data != null ? rmDecimal( Number(data) + Number(row['unfitOtherCnt']) ) : '';
				}
			},
			{ data : 'faultyDtl' }, //불량내역
		],
		columnDefs : [
			{ targets : '_all', className : 'text-center'} 
		],
		order : [],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback : function(){
			
		}//drawCallback 끝
	});

	let html2 = '<div class="row">';
	
	html2 += '<label class="input-label-sm">구분</label>';
    html2 += '<select id="unfitGubunBox" class="custom-select custom-select-sm" style="max-width:100px;"></select>';
    
	html2 += '</div>';
	
	$('#barcodeListTable_length').html(html2);
	selectBoxAppend(unfitGubunList, "unfitGubunBox", "", "1");
	
	//구분 변경시
	$('#unfitGubunBox').on('change', function() {
		unfitGubunVal = $('#unfitGubunBox').val();
		$('#barcodeListTable').DataTable().ajax.reload(function(){});
	});
	
</script>

</body>
</html>
