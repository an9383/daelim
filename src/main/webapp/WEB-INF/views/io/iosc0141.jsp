<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>
<html>
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
								<col width="21%">
								<col width="13%">
								<col width="13%">
								<col width="13%">
								<col width="13%">
								<col width="21%">
							</colgroup>	
		                    <thead class="thead-light">
			                    <tr>
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
				<li class="breadcrumb-item active">자재출고(봉제)</li>
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
					<div class="table-responsive">
						 <table id="outWhsAdmTable" class="table table-bordered">
		                    <thead class="thead-light">
			                    <tr>
			                        <th class="text-center">차종</th>
			                        <th class="text-center">품번</th>
			                        <th class="text-center">품명</th>
			                        <th class="text-center">출고일자</th>
			                        <th class="text-center">출고수량</th>
			                        <th class="text-center">출고창고</th>
			                    </tr>
		                    </thead>
						</table>
						<table id="outWhsAdmChildTable" class="table table-bordered">
		                    <thead class="thead-light">
			                    <tr>
			                    	<th class="text-center"><input type="checkbox" id="childTableCheckAll" style=""></th>
			                        <th class="text-center">차종</th>
			                        <th class="text-center">품번</th>
			                        <th class="text-center">품명</th>
			                        <th class="text-center">BarcodeNo</th>
			                        <th class="text-center">출고일자</th>
			                        <th class="text-center">출고수량</th>
			                        <th class="text-center">출고창고</th>
			                    </tr>
		                    </thead>
						</table>
					</div>
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar"
				id="myrSidenav" style="width: 47%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
							<i class="mdi mdi-close"></i>
						</a>
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
										<th>출고일자</th>
										<td>
											<input class="form-control" type="date" id="outWhsDate" value="${serverDate}" style="min-width: 100%;"/>
										</td>
										<th>출고담당자</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" id="outWorker" value="${userNumber}">
													<input type="text" class="form-control" id="outWorkerNm" value="${userNm}" style="min-width: 100%" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnOutWorker" onClick="outWorkerSelect()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>출고구분</th>
										<td><select class="custom-select" id="outGubun" style="min-width: 100%;"></select></td>
										<th>출고창고</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" id="locationNo">
													<input type="hidden" id="locationCd">
													<input type="text" class="form-control" id="locationNm" style="min-width: 100%" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnLocation" onClick="locationSelect()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3">
											<input type="text" style="max-width: 100%;" class="form-control" id="inWhsDesc">
										</td>
									</tr>
									<tr>
										<th>BarcodeNo</th>
										<td colspan="3">
											<input type="text" style="max-width: 100%;" class="form-control" id="barcodeNoScan" placeholder="스캐너만 입력">
										</td>
									</tr>
								</table>
							</div>
							<div id="baseInfoButton">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnSave">저장</button>
									<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
								</div>
							</div>
							<div class="table-responsive">
								<table id="barcodeDtlTable" class="table table-bordered">
									<colgroup>
										<col width="20%">
										<col width="10%">
										<col width="10%">
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>BarcodeNo</th>
											<th>구분</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>출고수량</th>
											<th>창고</th>
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
<%@include file="../layout/bottom.jsp" %>

<script>
	const currentHref = "iosc0141";
	const currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title", "자재출고(봉제)");

	$("#left-width-btn").click(function() {
		$("#left-list").animate({
			width : "52%"
		}, 200);
		$("#arrow-left").animate({
			display : "none"
		}, 200);
		setTimeout(function() {
			$('#outWhsAdmTable').DataTable().ajax.reload();
		}, 400);
		state = !state;
	});

	$("#left-expand").click(function() {
		setTimeout(function() {
			$('#outWhsAdmTable').DataTable().ajax.reload();
		}, 400);
	});
	
	const serverDate = '${serverDate}';
	const serverDateFrom = "${serverDateFrom}";
	const serverDateTo = "${serverDateTo}";
	
	let btnView;
	let outWhsDateFromVal = serverDateFrom;
	let outWhsDateToVal = serverDateTo;
	let tableIdx = null;
// 	let workOrdQtyVal = null;
	let workOrdNoVal = null;
// 	let itemSeq = null;
// 	let upperItemSeq = null;
	let itemGubunVal = '004';
	let locCdVal = '017';
	let locCdCheck = '';
	let itemSeqVal = ' ';
	let outWhsDateVal = ' ';
	let outLocationNoVal = ' ';
	let outGubunVal = ' ';
	
	//공통코드 처리 시작
	let outGubunArray = new Array();
	<c:forEach items="${outGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	outGubunArray.push(json);
	</c:forEach>
	
	let itemGubunArray = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubunArray.push(json);
	</c:forEach>
	
	selectBoxAppend(outGubunArray, "outGubun", "", "");
	//공통코드 처리 끝
	
	//'* 선입선출 적용중 *' 메시지 시작
	window.onload = function() {
		fn_bright();
	}
	
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
	//'* 선입선출 적용중 *' 메시지 끝
	
	//자재출고(봉제) 목록조회
 	let outWhsAdmTable = $('#outWhsAdmTable').DataTable({
 		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
		pageLength : 20,
		scrollY : '35vh',
		ajax : {
			url : '<c:url value="io/outWhsAdmParentList"/>',
			type : 'GET',
			data : {
				'startDate'	: function(){ return outWhsDateFromVal.replace(/-/g,''); },
				'endDate'	: function(){ return outWhsDateToVal.replace(/-/g,''); },
				'itemGubun'	: function(){ return itemGubunVal; },
			},
		},
		columns : [
			{ data : 'itemModelNm', className : 'text-center text-nowrap' }, //차종
			{ data : 'itemCd', className : 'text-center text-nowrap' }, //품번
			{ data : 'itemNm', className : 'text-center text-nowrap' }, //품명
			{//출고일자
				data : 'outWhsDate', className : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출고수량
				data : 'outQty', className : 'text-right text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
			{//출고창고
				data : 'outLocationNm', className : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return row['outAreaNm'];
					} else if ( row['outGubunNm'] != null ) {
						return row['outGubunNm'];
					} else {
						return '-';
					}
				}
			},
		],
		order : [
		],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs: [ ],
        drawCallback: function() {}
	});
	
	//자식 테이블 조회
 	let outWhsAdmChildTable = $('#outWhsAdmChildTable').DataTable({
 		dom : "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : '20vh',
		ajax : {
			url : '<c:url value="io/outWhsAdmList"/>',
			type : 'GET',
			data : {
				'startDate'		: function(){ return outWhsDateFromVal.replace(/-/g,''); },
				'endDate'		: function(){ return outWhsDateToVal.replace(/-/g,''); },
				'itemGubun'		: function(){ return itemGubunVal; },
				'itemSeq'		: function(){ return itemSeqVal; },
				'outWhsDate'	: function(){ return outWhsDateVal; },
				'outLocationNo'	: function(){ return outLocationNoVal; },
				'outGubun'		: function(){ return outGubunVal; },
			},
		},
		columns : [
			{ render: function(data, type, row, meta) { return '<input type="checkbox" name="childTableCheck" style="" checked/>'; }, orderable: false },
			{ data : 'itemModelNm', 'className' : 'text-center text-nowrap' }, //차종
			{ data : 'itemCd', 'className' : 'text-center text-nowrap' }, //품번
			{ data : 'itemNm', 'className' : 'text-center text-nowrap' }, //품명
			{ data : 'barcodeNo', 'className' : 'text-center text-nowrap' }, //BarcodeNo
			{//출고일자
				data : 'outWhsDate', 'className' : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//출고수량
				data : 'outQty', 'className' : 'text-right text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
			{//출고창고
				data : 'outLocationNm', 'className' : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return row['outAreaNm'];
					} else if ( row['outGubunNm'] != null ) {
						return row['outGubunNm'];
					} else {
						return '-';
					}
				}
			},
		],
		order : [],
		buttons : [],
		columnDefs: [],
        drawCallback: function() {}
	});
 	
 	//전체 체크박스 클릭시
	$('#childTableCheckAll').click(function() {
		$('input[type="checkbox"][name="childTableCheck"]').prop('checked', this.checked);
	});
 	
	//자식 테이블 행 클릭시
	$('#outWhsAdmChildTable tbody').on('click', 'tr', function(event){
		if (event.target.type !== 'checkbox') {
	    	$(this).find('input[type="checkbox"][name="childTableCheck"]').prop('checked', !$(this).find('input[type="checkbox"][name="childTableCheck"]').prop('checked'));
		}
	});

	
	//메인 테이블 설정
 	let html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;<label class="input-label-sm">출고일자</label>'; 
    html1 += '<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="outWhsDateFrom" value="'+serverDateFrom+'"/>';
    html1 += '</div>';
    html1 += '&nbsp; ~ &nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:97px;" type="date" id="outWhsDateTo" value="'+serverDateTo+'"/>';
    html1 += '</div>';
 	html1 += '&nbsp;&nbsp;&nbsp;<label class="input-label-sm">구분</label>'; 
	html1 += '<select class="custom-select" id="itemGubunBox"></select>';
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnAllList">전체조회</button>'
    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-danger" id="btnDelete">삭제</button>'
    html1 += '</div>';
     
 	$('#outWhsAdmTable_length').html(html1);
 	selectBoxAppend(itemGubunArray, "itemGubunBox", "004", "");
 	
 	// 조회버튼 클릭시
 	$('#btnRetv').on('click', function() {
 		outWhsDateFromVal = $('#outWhsDateFrom').val();
     	outWhsDateToVal = $('#outWhsDateTo').val();
     	itemGubunVal = $('#itemGubunBox').val();
 		$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
     });	

 	// 전체조회 클릭시
 	$('#btnAllList').on('click', function() {
 		outWhsDateFromVal = "";
 		outWhsDateToVal = "";
 		itemGubunVal = "";
 		$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
    });

	//메인 테이블 행 클릭시
	$('#outWhsAdmTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#outWhsAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		itemSeqVal = outWhsAdmTable.row(this).data().itemSeq;
		outWhsDateVal = outWhsAdmTable.row(this).data().outWhsDate;
		outLocationNoVal = outWhsAdmTable.row(this).data().outLocationNo;
		outGubunVal = outWhsAdmTable.row(this).data().outGubun;
		$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){
			$('#childTableCheckAll').prop('checked', true);
		});
	});
	
	let selectedDataArray = new Array();
	
 	//삭제 버튼 클릭시
    $('#btnDelete').on('click', function() {
    	if ( $('input[type="checkbox"][name="childTableCheck"]:checked').length > 0 ) {
    		selectedDataArray = new Array();
    		$('#outWhsAdmChildTable tbody tr').each(function(index, item) {
    			if ( $(this).find('td input[type="checkbox"][name=childTableCheck]').is(":checked") ) {
    				let rowData = new Object();
    				rowData.outSlipNo = outWhsAdmChildTable.row(this).data().outSlipNo;
    				rowData.outSlipSeq = outWhsAdmChildTable.row(this).data().outSlipSeq;
    				
    				selectedDataArray.push(rowData);
    			}
    		});
    		
    		let owaIdxList = $('#outWhsAdmChildTable').DataTable().rows(function (idx, data, node) {
    		    return $(node).find('td input[type="checkbox"][name="childTableCheck"]').is(':checked');
    		}).data().pluck('owaIdx').toArray().join("','");
    		selectedDataArray[0].owaIdxList = `'\${owaIdxList}'`;
    		
    		$('#deleteSmallModal').modal('show');
    	} else {
    		toastr.warning("삭제할 행을 선택해주세요.");
    	}
    });
 	
	//삭제 버튼 클릭
	$('#btnDeleteY').on('click', function() {
		$.ajax({
			url : '<c:url value="io/outWhsAdmDelete"/>',
			type : 'POST',
			datatype : 'json',
			data : JSON.stringify(selectedDataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(res){
				$('#my-spinner').show();
			},
			success : function(res) {
				if ( res.result == "ok" ) {
					toastr.success('삭제되었습니다.');
					$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
					$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){});
					$('#deleteSmallModal').modal('hide');
				} else if ( res.result == "fail" ) {
					$('#deleteSmallModal').modal('hide');
				    toastr.warning(res.message);
				} else {
				    toastr.error(res.message);
				}
			},
			complete : function() {
				$('#my-spinner').hide();		
			}
		});
	});
	
	//바코드 스캔 테이블 
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		pageLength : -1,
		scrollY : '50vh',
		ajax : {
			url : '<c:url value="io/barcodeListByBongjae"/>',
			type : 'GET',
			data : {
				'barcodeNo'  : function(){ return $('#barcodeNoScan').val(); },
			},
		},
		rowId : 'barcodeNo',
		columns : [
			{//BarcodeNo
				data : 'barcodeNo',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" name="barcodeNo" value="'+data+'" style="width:100%;text-align:center;" disabled>' ;
					} else {
						return '<input type="text" class="form-control" name="barcodeNo" value="" style="width:100%;text-align:center;" disabled>' ;
					}		    			
	    		}
			},
			{//구분
				data : 'itemGubunNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="'+data+'" disabled>';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemGubunNm" value="" disabled>';
					}		
    			}
			},
			{//차종
				data : 'itemModelNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModelNm" value="'+data+'" disabled>';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemModelNm" value="" disabled>';
					}		
    			}
			},
			{//품번
				data : 'itemCd',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">';
						html += '<input type="hidden" name="itemGubun" value="'+row['itemGubun']+'">';
						return html;
					} else {
						var html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemCd" value="" disabled>';	
						html += '<input type="hidden" name="itemSeq" value="">';
						html += '<input type="hidden" name="itemGubun" value="">';
						return html;
					}		    			
	    		}
			},
			{//품명
				data : 'itemNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="'+data+'" disabled>';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="itemNm" value="" disabled>';
					}		
    			}
			},
			{//출고수량
				data : 'outQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="outQty" value="'+rmDecimal(data)+'" placeholder="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\')">';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="outQty" value="" onkeyup="numberFormat(this, \'int\')">';	
					}			    			
	    		}
			},
			{//창고
				data : 'locationNm',
				render : function ( data, type, row, meta ) {
					let html;
					if ( data != null ) {
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="'+data+'" disabled>';
						html += '<input type="hidden" name="locationNo" value="'+row['locationNo']+'" disabled>';
						html += '<input type="hidden" name="locationCd" value="'+row['locationCd']+'" disabled>';
						return html;
					} else {
						html = '<input type="text" class="form-control" style="max-width:100%; text-align:center;" name="locationNm" value="" disabled>';
						html += '<input type="hidden" name="locationNo" value="" disabled>';
						html += '<input type="hidden" name="locationCd" value="" disabled>';
						return html;
					}
	    		}
			},
		],
		order : [ [ 0, 'asc' ] ],
	});  
	
	//바코드 스캔 테이블 항목 클릭시
	$('#barcodeDtlTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = '';
			return false;
		} else {
			$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#barcodeDtlTable').DataTable().row(this).index();
		btnView = 'delete';
	});
	
	// 바코드 스캔
	$('#barcodeNoScan').keypress(function(e){
		let check = true;
		
		if ( e.keyCode == 13 ) { //엔터 키 클릭 시
			if(!$.trim($('#barcodeNoScan').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNoScan').focus();
				$('#barcodeNoScan').val().select();
				check = false;
				return false;
			}
			if(!$.trim($('#outWorker').val())){
				toastr.warning('출고담당자를 선택해주세요.');
				$('#btnOutWorker').focus();
				check = false;
				return false;
			}
			//스캔시 이미 스캔한 데이터는 제외하고 선입선출 되도록 구현
			let barcodeList = "";
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if ( $(this).find('td input[name=barcodeNo]').val() == $('#barcodeNoScan').val() ) {
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNoScan').select();
					check = false;
					return false;
				} else {
					if (index == 0) {
						barcodeList += "'" + $(this).find('td input[name=barcodeNo]').val() + "'";
					} else {
						barcodeList +=  ", '" + $(this).find('td input[name=barcodeNo]').val() + "'";
					}
				}
			});

			if (check) {
			 	$.ajax({
	            	url: '<c:url value="io/matrlBarcodeRead"/>',
	                type: 'GET',
	                async : false,
	                data: {
	                	'barcodeNo'		: function(){ return $('#barcodeNoScan').val(); },
	                	'barcodeList'	: function(){ return barcodeList; }, //매퍼에선 #가 아닌 $로 넣어놓기
	                },
	                success: function (res) {
	                    if (res.result == 'ok') {
	                    	let data = res.data;
	                    	$('#barcodeDtlTable').DataTable().row.add({
	                    		'barcodeNo' 	: data[0].barcodeNo,
	                    		'itemGubunNm' 	: data[0].spTypeNm,
	                    		'itemModelNm'	: data[0].itemModelNm,
	                    		'itemCd' 		: data[0].spCd,
	                    		'itemSeq' 		: data[0].itemSeq,
                    			'itemGubun' 	: data[0].spType,
	                    		'itemNm' 		: data[0].spNm,
	                    		'outQty' 		: data[0].realQty,
	                    		'locationNm' 	: data[0].locationNm,
	                    		'locationNo' 	: data[0].locationNo,
	                    		'locationCd' 	: data[0].locationCd,
	                    	}).draw(false);
			                $('#barcodeNoScan').select();
							$('#btnSave').removeClass('d-none');
							$('button[name=btnConfirm]').attr('disabled', true);
							$('button[name=btnConfirm]').removeClass('bg-white');
							$('#left-expand').addClass('d-none');
	                        toastr.success(res.message);
	                        
	                    } else if ( res.result == "fail" ) {
	                    	toastr.warning(res.message);
	                    	$('#barcodeNoScan').select();
	                    	
		                } else {
		                	toastr.error(res.message, '', {timeOut: 5000});
			            }
		             },
		             complete:function(){
		             }
		        });
			}
		}
	});
	
	//삭제 버튼 클릭시 
	$('#btnDel').on('click', function() {
		if ( btnView != 'delete' ) {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		$('#barcodeDtlTable').DataTable().rows(tableIdx).remove().draw();
		
		if ( barcodeDtlTable.data().count() <= 0 ) {
			$('#btnSave').addClass('d-none');
		}
		btnView = "";
			
	});
	
	//저장 버튼 클릭시
	$('#btnSave').on('click', function() {
		let check = true;
		let dataArray = new Array();
		
		if(!$.trim($('#outWorkerNm').val())){
			toastr.warning('출고담당자를 선택해주세요.');
			$('#btnOutWorker').focus();
			check = false;
			return false;
		}
		let inWhsCheck = '';
		if ( $('#outGubun option:selected').text() == '외주출고' || $('#outGubun option:selected').text() == '생산출고' ) {
			if(!$.trim($('#locationNo').val())){
				toastr.warning('창고를 선택해주세요.');
				$('#btnLocation').focus();
				check = false;
				return false;
			} else {
				inWhsCheck = 'Y'; //이동입고 진행 O
			}
		} else {
			inWhsCheck = 'N'; //이동입고 진행 X
		}
		
		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=outQty]').val().replace(/,/g, '')*1 <= 0 ) {
				toastr.warning("출고수량을 입력해주세요.");
				$(this).find('td input[name=outQty]').focus();
				check = false;
				return false;
			}
			if ( $(this).find('td input[name=outQty]').val().replace(/,/g, '')*1 > $(this).find('td input[name=outQty]').attr('placeholder').replace(/,/g, '')*1 ) {
				toastr.warning("출고수량을 " + $(this).find('td input[name=outQty]').attr('placeholder').replace(/,/g, '') + "개 이하로 입력해주세요.");
				$(this).find('td input[name=outQty]').focus();
				check = false;
				return false;
			}
			
			let rowData = new Object();
			rowData.outGubun 	= $('#outGubun').val();
			rowData.lotNo 		= $(this).find('td input[name=barcodeNo]').val();
			rowData.barcodeNo 	= $(this).find('td input[name=barcodeNo]').val();
			rowData.itemSeq 	= $(this).find('td input[name=itemSeq]').val();
			rowData.itemGubun 	= $(this).find('td input[name=itemGubun]').val();
			rowData.outQty 		= $(this).find('td input[name=outQty]').val().replace(/,/g, '');
			rowData.outWhsDate 	= $('#outWhsDate').val().replace(/-/g, '');
			rowData.outWorker 	= $('#outWorker').val();
			rowData.statusCd 	= 'O';
			rowData.inWhsDesc 	= $('#inWhsDesc').val();
			rowData.inWhsCheck 	= inWhsCheck;
			//창고
			rowData.preLocationNo = $(this).find('td input[name=locationNo]').val();
			rowData.preLocationCd = $(this).find('td input[name=locationCd]').val();
			//출고창고
			rowData.locationNo = $('#locationNo').val();
			rowData.locationCd = $('#locationCd').val();
			
	        dataArray.push(rowData);
	        console.log(rowData);
		});
		
		if (check) {
			$.ajax({
				url : '<c:url value="io/outWhsAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$('#my-spinner').show(); //처리중..
				},
				success : function(res) {
					if (res.result == 'ok') {
						$('#outWhsAdmTable').DataTable().ajax.reload(function(){});	
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNoScan').val("");
						$('#barcodeNoScan').focus();
						$('#btnSave').addClass('d-none');
						$('button[name=btnConfirm]').attr('disabled', false);
						$('button[name=btnConfirm]').addClass('bg-white');
						$('#left-expand').removeClass('d-none');
						toastr.success('저장되었습니다.');
					} else if ( res.result == "underCnt" ) {
						toastr.error('미입력된 바코드('+res.data+'개)가 있습니다. 확인해주세요.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');		
					$('#my-spinner').hide(); //처리완료..
				}
			});
		}
		
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
   	
	//출고구분 변경시
	$('#outGubun').on('change', function(){
		if ( $('#outGubun option:selected').text() == '외주출고' ) {
			$('#btnLocation').attr('disabled', false);
			locCdVal = '017';
			locCdCheck = '';
		} else if ( $('#outGubun option:selected').text() == '생산출고' ) {
			$('#btnLocation').attr('disabled', false);
			locCdVal = '';
			locCdCheck = 'Y';
		} else {
			$('#btnLocation').attr('disabled', true);
		}
		$('#locationNo').val('');
		$('#locationCd').val('');
		$('#locationNm').val('');
	});
	
	//선입선출 모달 '예' 버튼 클릭시
	$('#fifoBtnModalY').on('click', function(){
		$('#barcodeDtlTable').DataTable().row.add({}).draw(false);
		$('#btnSave').removeClass('d-none');
		$('button[name=btnConfirm]').attr('disabled', true);
		$('button[name=btnConfirm]').removeClass('bg-white');
		$('#left-expand').addClass('d-none');

		setTimeout(function(){
			$('#barcodeNoScan').select();
		},150);
		
        toastr.success("추가되었습니다.");
	});
	
	//확정여부 모달
	$('#confirmSaveModalY').on('click', function() {
		$.ajax({
			url  : '<c:url value="io/updateConfirmYn" />',
			type : 'GET',
			data : {
				'workOrdNo' : function(){ return workOrdNoVal; },
				'confirmYn' : function(){ return '001'; },
			},
			success : function(res){
				if (res.result == 'ok') {
					$('#outWhsAdmTable').DataTable().ajax.reload(function() {});	
					
					toastr.success('확정되었습니다.');
				}else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');		
			}
		});
	});
	
	// 구역/위치 팝업 시작
	let locationPopupTable;
	function locationSelect() {
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
					'mainGubun' 	: function(){ return '002'; },
					'locCd' 		: function(){ return locCdVal; },
					'locCdCheck' 	: function(){ return locCdCheck; },
				},
			},
			columns : [
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

		$('#locationPopupTable tbody').on('click', 'tr', function() {
			let data = locationPopupTable.row(this).data();
			$('#locationNo').val(data.locNo);
			$('#locationCd').val(data.locCd);
			$('#locationNm').val(data.locNm + '/' + data.areaNm);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
</script>

</body>
</html>
