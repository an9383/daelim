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
	<!-- 거래처 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="dealCorpCdModal" tabindex="-1" role="dialog" aria-labelledby="dealCorpCdModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="dealCorpCdLabel">거래처조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="dealCorpCdTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   			<th style="width : 20%">No.</th>
									<th style="width : 20%">거래처</th>
									<th style="width : 15%">거래처코드</th>
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
	<!-- 추가 제품조회 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="itemSmPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemSmPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="itemSmPopUpLabel">품목조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
	                  <div class="row mb-1">
					  	<button type="button" class="btn btn-primary float-right mr-1" id="btnItemSmAdd">품목추가</button>
					  </div>
	                  <div class="table-responsive">
						<table id="itemSmAllPopupTable" class="table table-bordered">
							<thead class="thead-light">
			                    <tr>
		                            <th class="text-center"><input type="checkbox" id="popupAllSmCheck" style="width: 1.2rem; height: 1.2rem;"></th>
		                            <th class="text-center">출고일자</th>
		                            <th class="text-center">생산일자</th>
		                            <th class="text-center">바코드</th>
		                            <th class="text-center">차종</th>
		                            <th class="text-center">품번</th>
		                            <th class="text-center">품명</th>
		                            <th class="text-center">출하수량</th>
		                            <th class="text-center">고객사</th>
		                        </tr>
		                    </thead>
						</table>
					</div>
					<hr class="mb-2 mt-2">
					<div class="row">
						<button type="button" class="btn btn-danger float-right mr-1" id="btnItemSmDel">품목삭제</button>
					</div>
					<hr class="mb-2 mt-2">
					<div class="table-responsive">
						<table id="itemSmAllTempTable" class="table table-bordered">
							<thead class="thead-light">
			                    <tr>
			                   	 	<th class="text-center"><input type="checkbox" id="tempAllSmCheck" style="width: 1.2rem; height: 1.2rem;"></th>
		                            <th class="text-center">출고일자</th>
		                            <th class="text-center">생산일자</th>
		                            <th class="text-center">바코드</th>
		                            <th class="text-center">차종</th>
		                            <th class="text-center">품번</th>
		                            <th class="text-center">품명</th>
		                            <th class="text-center">출하수량</th>
		                            <th class="text-center">고객사</th>
		                        </tr>
		                    </thead>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetItemSmList">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>		
	<!-- 추가 제품조회 모달 종료-->
	<!-- 신규추가 제품조회 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="itemPartPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemPartPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="itemPartPopUpLabel">품목조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body ">
	                  <div class="row mb-1">
					  	<button type="button" class="btn btn-primary float-right mr-1" id="btnItemAdd">품목추가</button>
					  </div>
	                  <div class="table-responsive">
						<table id="itemAllPopupTable" class="table table-bordered">
							<thead class="thead-light">
			                    <tr>
		                            <th class="text-center"><input type="checkbox" id="popupAllCheck" style="width: 1.2rem; height: 1.2rem;"></th>
		                            <th class="text-center">바코드</th>
		                            <th class="text-center">차종</th>
		                            <th class="text-center">품번</th>
		                            <th class="text-center">품명</th>
		                            <th class="text-center">현재고</th>
		                            <th class="text-center">창고</th>
		                            <th class="text-center">구역/위치</th>
		                        </tr>
		                    </thead>
						</table>
					</div>
					<hr class="mb-2 mt-2">
					<div class="row">
						<button type="button" class="btn btn-danger float-right mr-1" id="btnItemDel">품목삭제</button>
					</div>
					<hr class="mb-2 mt-2">
					<div class="table-responsive">
						<table id="itemAllTempTable" class="table table-bordered">
							<thead class="thead-light">
			                    <tr>
			                   	 	<th class="text-center"><input type="checkbox" id="tempAllCheck" style="width: 1.2rem; height: 1.2rem;"></th>
		                            <th class="text-center">바코드</th>
		                            <th class="text-center">차종</th>
		                            <th class="text-center">품번</th>
		                            <th class="text-center">품명</th>
		                            <th class="text-center">현재고</th>
		                            <th class="text-center">창고</th>
		                            <th class="text-center">구역/위치</th>
		                        </tr>
		                    </thead>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnGetItemList">가져오기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>		
	<!-- 신규추가 제품조회 모달 종료-->
	<!-- 처리결과 모달 시작 -->
	<div class="modal fade" id="resultInputModal" tabindex="-1" aria-labelledby="resultInputModalLabel" aria-hidden="true" style="top:0px;">
		<div class="modal-dialog modal-xl" style="width:100%; max-width: 60%;">
			<div class="modal-content" style="border: solid #2196F3 10px; border-radius: 10px;">
				<div class="modal-body p-2">
					<div class="container" style="padding:0px; min-width:100%;">
						<div class="row p-0" style="height:100%;">
							<div class="col-md-12 p-0">
								<table class="table table-bordered m-0">
									<colgroup>
									   <col width="8%">
									   <col width="15%">
									   <col width="8%">
									   <col width="27%">
									   <col width="8%">
									   <col width="34%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th class="text-center" style="font-size: 2em;">차종</th>
											<td style="height: 9vh; font-size: 3vh; text-align: center;" id="itemModelTd"></td>
											<th class="text-center" style="font-size: 2em;">품번</th>
											<td style="height: 9vh; font-size: 3vh; text-align: center;" id="itemCdTd"></td>
											<th class="text-center" style="font-size: 2em;">품명</th>
											<td style="height: 9vh; font-size: 3vh; text-align: center;" id="itemNmTd"></td>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered m-0">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th class="text-center" style="font-size: 2.5em;">양품수량<span class="text-danger">*</span></th>
											<td class="p-0">
												<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="fairQty" value="0" onkeyup="numberFormat(this, 'int'); changeFaultyQty();" style="height: 11vh; font-size: 5.5vh; color: blue;">
											</td>
											<th class="text-center" style="font-size: 2.5em;">불량수량<span class="text-danger">*</span></th>
											<td class="p-0">
												<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="faultyQty" value="0" onkeyup="numberFormat(this, 'int'); changeFairQty();" style="height: 11vh; font-size: 5.5vh; color: red;">
											</td>
										</tr>
										<tr>
											<td colspan="4">
												<button type="button" class="btn btn-outline-primary" id="btnResultSave" style="font-size:3.5em;width:100%;height: 2.4em;font-weight: 700; border-width: 5px;">반 출 처 리</button>
											</td>
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
	<!-- 처리결과 모달 종료 -->
	<!-- 처리취소 확인 모달 시작 -->
	<div class="modal fade" id="cancelSmallModal" tabindex="-1" role="dialog" aria-labelledby="cancelSmallLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="cancelSmallLabel">처리취소</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	        		</button>
	      		</div>
	      		<div class="modal-body">
	      			<h6>처리취소된 데이터는 복구가 불가능합니다.<br>정말 취소하시겠습니까?</h6> 
	      		</div>
	      		<div class="modal-footer">
	      			<button type="button" class="btn btn-danger" id="btnCancelY">처리취소</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 처리취소 확인 모달 시작 -->
	
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">반출등록(사출)</li>
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
						<button id="left-width-btn" onclick="openrNav();"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						 <table id="outWhsAdmTable" class="table table-bordered">
		                    <thead class="thead-light">
			                    <tr>
			                        <th class="text-center">공급사</th>
			                        <th class="text-center">차종</th>
			                        <th class="text-center">품번</th>
			                        <th class="text-center">품명</th>
			                        <th class="text-center">반출일자</th>
			                        <th class="text-center">반출수량</th>
			                    </tr>
		                    </thead>
						</table>
						<hr>
						<table id="outWhsAdmChildTable" class="table table-bordered">
		                    <thead class="thead-light">
			                    <tr>
			                    	<th class="text-center" style="vertical-align: middle;">
			                    		<input type="checkbox" id="childTableCheckAll" style="width: 1.2rem; height: 1.2rem;">
			                    	</th>
			                        <th class="text-center" style="vertical-align: middle;">차종</th>
			                        <th class="text-center" style="vertical-align: middle;">품번</th>
			                        <th class="text-center" style="vertical-align: middle;">품명</th>
			                        <th class="text-center" style="vertical-align: middle;">반출일자</th>
			                        <th class="text-center" style="vertical-align: middle;">반출수량</th>
			                        <th class="text-center" style="vertical-align: middle;">바코드</th>
			                        <th class="text-center" style="vertical-align: middle;">처리결과</th>
			                    </tr>
		                    </thead>
						</table>
					</div>
				</div>
			</div>
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 44%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
<!-- 						<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()"> -->
<!-- 							<i class="mdi mdi-close"></i> -->
<!-- 						</a> -->
					</div>
					<div id="myTabContent" class="tab-content">
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
										<th>반출일자</th>
										<td>
											<input class="form-control" type="date" id="toDate" value="${serverDate}" style="min-width: 100%;"/>
										</td>
										<th>반출담당자</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" id="toWorker" value="${userNumber}">
													<input type="text" class="form-control" id="outWorkerNm" value="${userNm}" style="min-width: 100%" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="btnOutWorker" onClick="outWorkerSelect()">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th>고객사</th>
										<td>
											<div class="row">
												<div class="input-sub m-0" style="min-width: 100%">
													<input type="hidden" class="form-control" id="kindDealCorpCd">
													<input type="hidden" class="form-control" id="listDealCorpCd">
													<input type="text" class="form-control" id="dealCorpCdFind" style="min-width:100%;" disabled>
													<button type="button" class="btn btn-primary input-sub-search" id="dealCorpCdBtn" onClick="dealCorpCdModalShow();">
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</div>
										</td>
										<th></th>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="baseInfoButton">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right mr-1" id="btnSave">저장</button>
			                   		<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
			                   		<button type="button" class="btn btn-success float-right mr-1" id="btnNewAdd">신규추가</button>
			                   		<button type="button" class="btn btn-success float-right mr-1" id="btnAdd">추가</button>
								</div>
							</div>
							<div class="table-responsive">
								<table id="itemInsertTable" class="table table-bordered">
									<colgroup>
										<col width="20%">
										<col width="15%">
										<col width="22%">
										<col width="28%">
										<col width="15%">
									</colgroup>	
									<thead class="thead-light">
										<tr>
											<th>바코드</th>
											<th>차종</th>
											<th>품번</th>
											<th>품명</th>
											<th>반출수량</th>
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
	const CURRENT_HREF = "bssc0241";
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');
	$('#'+CURRENT_PAGE).closest('.has-child','li').addClass('has-open has-active');
	$('#'+CURRENT_PAGE).closest('.menu-item').addClass('has-active');    
	$(document).attr("title", "반출등록(사출)");

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
			$('#outWhsAdmChildTable').DataTable().ajax.reload();
		}, 400);
	});
	
	const SERVER_DATE = '${serverDate}';
	const SERVER_DATE_FROM = "${serverDateFrom}";
	const SERVER_DATE_TO = "${serverDateTo}";
	
	let outWhsDateFromVal = SERVER_DATE_FROM;
	let outWhsDateToVal = SERVER_DATE_TO;
	let toDateVal = null;
	let itemSeqVal = ' '; //페이지 처음 들어갔을 때 자식 테이블 조회 안되도록 공백(' ') 부여
	let itemCusVal = null;
	let prcssTrDate = null;
	
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
	
	let dealGubunCode = new Array();
	<c:forEach items="${dealGubunList}" var="info">
	if ( "${info.baseCd}" != '002' ) { //공급사 제외
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		dealGubunCode.push(json);
	}
	</c:forEach>
	
	selectBoxAppend(outGubunArray, "outGubun", "", "");
	//공통코드 처리 끝
	
	//반출등록(사출) 목록조회
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
		scrollY : '32vh',
		ajax : {
			url : '<c:url value="bs/takeOffAdmGroupList"/>',
			type : 'GET',
			data : {
				'mainGubun'	: function(){ return '001'; },
				'startDate'	: function(){ return outWhsDateFromVal.replace(/-/g,''); },
				'endDate'	: function(){ return outWhsDateToVal.replace(/-/g,''); },
				'itemCus'	: function(){ return itemCusVal; },
			},
		},
		columns : [
			{ data : 'itemCusNm', className : 'text-center text-nowrap' }, //공급사
			{ data : 'itemModelNm', className : 'text-center text-nowrap' }, //차종
			{ data : 'itemCd', className : 'text-center text-nowrap' }, //품번
			{ data : 'itemNm', className : 'text-center text-nowrap' }, //품명
			{//반출일자
				data : 'toDate', className : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '-';
				}
			},
			{//반출수량
				data : 'toQty', className : 'text-right text-nowrap',
				render : function ( data, type, row, meta ) {
					return data != null ? rmDecimal(data) : '';
				}
			},
		],
		order : [],
		buttons : [ 'copy', 'excel', 'print' ],
		columnDefs: [ ],
        drawCallback: function() {}
	});
	
	//자식 테이블 조회
 	let outWhsAdmChildTable = $('#outWhsAdmChildTable').DataTable({
 		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
			url : '<c:url value="bs/takeOffAdmList"/>',
			type : 'GET',
			data : {
				'itemSeq'	: function(){ return itemSeqVal; },
				'toDate'	: function(){ return toDateVal; },
			},
		},
		columns : [
			{//체크박스
				render: function(data, type, row, meta) {
					return '<input type="checkbox" name="childTableCheck" style="width: 1.2rem; height: 1.2rem;" checked/>';
				}, orderable: false
			},
			{ data : 'itemModelNm', 'className' : 'text-center text-nowrap' }, //차종
			{ data : 'itemCd', 'className' : 'text-center text-nowrap' }, //품번
			{ data : 'itemNm', 'className' : 'text-center text-nowrap' }, //품명
			{//반출일자
				data : 'toDate', 'className' : 'text-center text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null && data != '' ) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '-';
					}
				}
			},
			{//반출수량
				data : 'toQty', 'className' : 'text-right text-nowrap',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '-';
					}
				}
			},
			{ data : 'barcodeNo', 'className' : 'text-center text-nowrap' }, //바코드
			{//처리결과
				data : 'prcssYn', 'className' : 'text-center text-nowrap', orderable: false,
				render : function ( data, type, row, meta ) {
					if ( data === 'Y' ) {
						return `<button class="btn btn-success" onClick="prcssResultClick(\${meta.row});">처리완료</button>`;
					} else {
						return `<button class="btn btn-primary" onClick="prcssResultClick(\${meta.row});">처리결과</button>`;
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
 	
    html1 += '<label class="input-label-sm">반출일자</label>';
    html1 += '<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control" style="width:110px;" type="date" id="outWhsDateFrom" value="'+SERVER_DATE_FROM+'"/>';
    html1 += '</div>';
    html1 += '&nbsp;~&nbsp;<div class="form-group input-sub m-0 row">';
    html1 += '<input class="form-control mr-2" style="width:110px;" type="date" id="outWhsDateTo" value="'+SERVER_DATE_TO+'"/>';
    html1 += '</div>';
	
    html1 += '<label class="input-label-sm">공급사</label><div class="form-group input-sub m-0 row">';  
    html1 += '<input type="text" class="form-control" id="itemCusNm" name="itemCusNm" style="width:120px" disabled>';
    html1 += '<input type="hidden" class="form-control" id="itemCus" name="itemCus" disabled>';
  	html1 += '<button type="button" id="btnItemCus" class="btn btn-primary input-sub-search" onClick="itemCusSelectInCorpCd()">';
  	html1 += '<span class="oi oi-magnifying-glass"></span>';
  	html1 += '</button></div>';
  	html1 += '<button type="button" id="itemCusDelete" class="btn closeBtn mr-2" onclick="itemCusDelete();">';
    html1 += '<i class="mdi mdi-close"></i>';
    html1 += '</button>';
    
    html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
    
    html1 += '</div>';
     
 	$('#outWhsAdmTable_length').html(html1);
 	selectBoxAppend(itemGubunArray, "itemGubunBox", "004", "");
 	
	//자식 테이블 설정
 	let html2 = '<div class="row">';
 	html2 += '<button type="button" class="btn btn-danger ml-1 mr-2" id="btnChildDel">삭제</button>'
 	html2 += '<button type="button" class="btn btn-danger mr-2" id="btnPrcssCancel">처리취소</button>'
 	html2 += '<button type="button" class="btn btn-success" id="printBarcode">바코드출력</button>';
 	html2 += '</div>';
     
 	$('#outWhsAdmChildTable_length').html(html2);
 	
 	// 조회버튼 클릭시
 	$('#btnRetv').on('click', function() {
 		outWhsDateFromVal = $('#outWhsDateFrom').val();
     	outWhsDateToVal = $('#outWhsDateTo').val();
 		$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
 		outWhsAdmChildTable.clear().draw();
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
		toDateVal = outWhsAdmTable.row(this).data().toDate;
		$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){
			$('#childTableCheckAll').prop('checked', true);
		});
	});
	
	let delSelectedData = new Array();
 	//삭제 버튼 클릭시
    $('#btnChildDel').on('click', function() {
    	if ( $('input[type="checkbox"][name="childTableCheck"]:checked').length > 0 ) {
    		delSelectedData = new Array();
    		$('#outWhsAdmChildTable tbody tr').each(function(index, item) {
    			if ( $(this).find('td input[type="checkbox"][name=childTableCheck]').is(":checked") ) {
    				let rowData = new Object();
    				rowData.idx = outWhsAdmChildTable.row(this).data().idx;
    				rowData.barcodeNo = outWhsAdmChildTable.row(this).data().barcodeNo;
    				rowData.regDate = outWhsAdmChildTable.row(this).data().toRegDate; //반출등록 수불데이터 등록일자
    				
    				delSelectedData.push(rowData);
    			}
    		});
    		
    		let idxList = $('#outWhsAdmChildTable').DataTable().rows(function (idx, data, node) {
    		    return $(node).find('td input[type="checkbox"][name="childTableCheck"]').is(':checked');
    		}).data().pluck('idx').toArray().join("','");
    		delSelectedData[0].idxList = `'\${idxList}'`;
    		
    		$('#deleteSmallModal').modal('show');
    	} else {
    		toastr.warning("삭제할 행을 선택해주세요.");
    	}
    });
 	
	//삭제 버튼 클릭 시 > 모달 창의 삭제 버튼 클릭 시
	$('#btnDeleteY').on('click', function() {
		$.ajax({
			url : '<c:url value="bs/takeOffAdmDelete"/>',
			type : 'POST',
			datatype : 'json',
			data : JSON.stringify(delSelectedData),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(res){
				$('#my-spinner').show();
			},
			success : function(res) {
				if ( res.result == "ok" ) {
					toastr.success('삭제되었습니다.');
					$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
					$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){});
				} else if ( res.result == "fail" ) {
				    toastr.warning(res.message);
				} else {
				    toastr.error(res.message);
				}
			},
			complete : function() {
				$('#my-spinner').hide();		
				$('#deleteSmallModal').modal('hide');
			}
		});
	});
	
	let cancelSelectedData = new Array();
 	//처리취소 버튼 클릭시
    $('#btnPrcssCancel').on('click', function() {
    	if ( $('input[type="checkbox"][name="childTableCheck"]:checked').length > 0 ) {
    		cancelSelectedData = new Array();
    		$('#outWhsAdmChildTable tbody tr').each(function(index, item) {
    			if ( $(this).find('td input[type="checkbox"][name=childTableCheck]').is(":checked") ) {
    				let rowData = new Object();
    				rowData.idx = outWhsAdmChildTable.row(this).data().idx;
    				rowData.barcodeNo = outWhsAdmChildTable.row(this).data().barcodeNo;
    				rowData.regDate = outWhsAdmChildTable.row(this).data().prRegDate; //반출처리 수불데이터 등록일자
    				rowData.itemGubun = outWhsAdmChildTable.row(this).data().itemGubun;
    				
    				cancelSelectedData.push(rowData);
    			}
    		});
    		
    		let idxList = $('#outWhsAdmChildTable').DataTable().rows(function (idx, data, node) {
    		    return $(node).find('td input[type="checkbox"][name="childTableCheck"]').is(':checked');
    		}).data().pluck('idx').toArray().join("','");
    		cancelSelectedData[0].idxList = `'\${idxList}'`;
    		
    		$('#cancelSmallModal').modal('show');
    	} else {
    		toastr.warning("처리취소할 행을 선택해주세요.");
    	}
    });
 	
	//처리취소 버튼 클릭 시 > 모달 창의 처리취소 버튼 클릭 시
	$('#btnCancelY').on('click', function() {
		$.ajax({
			url : '<c:url value="bs/takeOffAdmCancel"/>',
			type : 'POST',
			datatype : 'json',
			data : JSON.stringify(cancelSelectedData),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(res){
				$('#my-spinner').show();
			},
			success : function(res) {
				if ( res.result == "ok" ) {
					toastr.success('처리취소되었습니다.');
					$('#outWhsAdmTable').DataTable().ajax.reload(function(){});
					$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){});
				} else if ( res.result == "fail" ) {
				    toastr.warning(res.message);
				}  else {
				    toastr.error(res.message);
				}
			},
			complete : function() {
				$('#my-spinner').hide();
				$('#cancelSmallModal').modal('hide');
			}
		});
	});
	
	//품목 추가 테이블 
	let itemInsertTable = $('#itemInsertTable').DataTable({
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
			url : '<c:url value="io/purchaseOrderDtlList"/>',
			type : 'GET',
			data : {
			}	
		},
		columns : [
			{ //바코드
				data : 'barcodeNo', className: 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '자동생성';
				}
			},
			{ data : 'itemModelNm', className: 'text-center' }, //차종
			{ data : 'itemCd', className: 'text-center' }, //품번
			{ data : 'itemNm', className: 'text-center' }, //품명
			{ //반출수량
				data : 'toQty', className: 'text-center',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="toQty" value="'+rmDecimal(data)+'" placeholder="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\'); moveFocus();">';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="toQty" value="" onkeyup="numberFormat(this, \'int\'); moveFocus();">';	
					}			    			
	    		}
			},
		],
		order : [],
	});  
	
	//품목 추가 테이블 항목 클릭시
	$('#itemInsertTable tbody').on('click', 'tr', function(){
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			return false;
		} else {
			$('#itemInsertTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	
	//삭제 버튼 클릭시 
	$('#btnDel').on('click', function() {
		if ( Boolean($('#itemInsertTable').DataTable().row('.selected').data()) ) {
			$('#itemInsertTable').DataTable().row('.selected').remove().draw();
		} else {
			toastr.warning('삭제할 항목을 선택해주세요.');
		}
	});
	
	//저장 버튼 클릭시
	$('#btnSave').on('click', function() {
		if ( itemInsertTable.data().length > 0 ) {
			let check = true;
			let dataArray = new Array();
			
			if(!$.trim($('#kindDealCorpCd').val())){
				toastr.warning('고객사를 선택해주세요.');
				$('#dealCorpCdBtn').focus();
				check = false;
				return false;
			}
			
			$('#itemInsertTable tbody tr').each(function(index, item){
				let trDate = itemInsertTable.row(this).data();
				
				if ( $(this).find('td input[name=toQty]').val().replace(/,/g, '')*1 <= 0 ) {
					toastr.warning("반출수량을 입력해주세요.");
					$(this).find('td input[name=toQty]').focus();
					check = false;
					return false;
				}
				if ( trDate.kindDealCorpCd === "btnAdd" &&
						$(this).find('td input[name=toQty]').val().replace(/,/g, '')*1 > $(this).find('td input[name=toQty]').attr('placeholder').replace(/,/g, '')*1 ) {
					toastr.warning("반출수량을 " + $(this).find('td input[name=toQty]').attr('placeholder').replace(/,/g, '') + "개 이하로 입력해주세요.");
					$(this).find('td input[name=toQty]').focus();
					check = false;
					return false;
				}
				
				let rowData = new Object();
				rowData.kindDealCorpCd 	= trDate.kindDealCorpCd;
				rowData.mainGubun 		= "001"; //부적합관리(사출) 창고 조회 데이터
				rowData.locCd 			= "023"; //부적합관리(사출) 창고 조회 데이터 / 새로 추가되는 것인지 그러면 바꿔야함
				rowData.itemSeq 		= trDate.itemSeq;
				rowData.itemGubun 		= trDate.itemGubun;
				rowData.barcodeNo 		= trDate.barcodeNo;
				rowData.toQty 			= $(this).find('td input[name=toQty]').val().replace(/,/g, '');
				rowData.toDate 			= $('#toDate').val().replace(/-/g, '');
				rowData.toWorker 		= $('#toWorker').val();
				rowData.prcssYn 		= 'N';
				rowData.beforeLocNo 	= trDate.locationNo;
				rowData.beforeLocCd 	= trDate.locationCd;
				
		        dataArray.push(rowData);
		        console.log(rowData);
			});
			
			if (check) {
				$.ajax({
					url : '<c:url value="bs/takeOffAdmCreate"/>',
					type : 'POST',
					datatype: 'json',
					data: JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					beforeSend : function() {
						$('#my-spinner').show();
					},
					success : function(res) {
						if (res.result == 'ok') {
							$('#outWhsAdmTable').DataTable().ajax.reload(function(){});	
							$('#outWhsAdmChildTable').DataTable().clear().draw();
							$('#itemInsertTable').DataTable().clear().draw();
							$('button[name=btnConfirm]').attr('disabled', false);
							$('button[name=btnConfirm]').addClass('bg-white');
							$('#left-expand').removeClass('d-none');
							toastr.success('반출등록 되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#my-spinner').hide();
					}
				});
			}
		} else {
			toastr.warning("저장할 항목을 추가해주세요.");
			$('#btnAdd').focus();
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
					{ data : 'userNm' }, //성명
					{ data : 'departmentNm' }, //부서
					{ data : 'postNm' }, //직위
					{ data : 'chargeDutyNm' }, //담당
					{ data : 'userDesc' }, //비고
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
			   	$('#toWorker').val(data.userNumber);
			   	$('#userPopUpModal').modal('hide');		    	
			});
   		} else {
   			$('#userPopUpTable').DataTable().ajax.reload();
   		}
		$('#userPopUpModal').modal('show');
   	}
	
	//공급사 팝업 시작
	let dealCorpCdTable;
	let dealGubunList = '001';
	function dealCorpCdModalShow() {
		if ( dealCorpCdTable == null || dealCorpCdTable == undefined ) {
			dealCorpCdTable = $('#dealCorpCdTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
				async : false,
				pageLength : -1,
				scrollY : '50vh',
				select: {
		            style: 'multi'
		        },
				ajax : {
					url : '<c:url value="/bm/dealCorpDataList"/>',
					type : 'GET',
					data : {
						'dealGubun' :  function(){ return dealGubunList; },
					},
				},
				rowId : 'dealCorpSeq',
				columns : [ 
					{ render : function(data, type, row, meta) { return meta.row+1; }, className : "text-center" }, //No.
					{ data : 'dealCorpNm', className : "text-center" }, //거래처
					{ data : 'dealCorpCd', className : "text-center" }, //거래처코드
					{ data : 'presidentNm', className : "text-center" }, //대표자
					{ data : 'repreItem', className : "text-center" }, //대표품목
					{ data : 'corpNo', className : "text-center" }, //사업자번호
				],
				columnDefs : [],
				order : [],
				buttons : [],
			});

			let html2 = '<div class="row">';
			
// 			html2 += '<label class="input-label-sm">거래구분</label>';
// 			html2 += '<div class="form-group input-sub m-0">';
// 			html2 += '<select class="custom-select mr-3" id="dealGubunOption">';
// 			html2 += '<option value="001" selected>고객사</option>';
// 			html2 += '<option value="003">외주사</option>';
			
			html2 += '</select></div>&nbsp;&nbsp;&nbsp;';
			html2 += '<button type="button" class="btn btn-primary" id="btnDealCorpSelect">선택</button>'
			html2 += '</div>';

			$('#dealCorpCdTable_length').html(html2);
		}
		
		$('#dealCorpCdModal').modal('show');
		setTimeout(function(){
			dealCorpCdTable.draw();
			dealCorpCdTable.draw();
		}, 300);
		
		//선택 버튼 클릭시
		$('#btnDealCorpSelect').on('click', function() {
			if ( dealCorpCdTable.rows('.selected').data().length > 0 ) {
				let selectedRows = dealCorpCdTable.rows('.selected');
				let dealCorpNmVal = selectedRows.data().pluck('dealCorpNm').toArray()[0];
				dealCorpNmVal += selectedRows.data().length > 1 ? ' 외 ' + ( selectedRows.data().length - 1 ) + '개' : '';
				$('#dealCorpCdFind').val(dealCorpNmVal);
				
				$('#kindDealCorpCd').val('001'); //고객사: 001, 외주사: 003 / $('#dealGubunOption').val()
				$('#listDealCorpCd').val(`'\${selectedRows.data().pluck('dealCorpCd').toArray().join("','")}'`);
				
				
				$('#dealCorpCdModal').modal('hide');
			} else {
				toastr.warning('항목을 선택해주세요.');
			}
		});
		
		//공급사 팝업 거래구분 조회조건 변경 시
		$('#dealGubunOption').on('change', function() {
			dealGubunList = $("#dealGubunOption option:selected").val();
			$('#dealCorpCdTable').DataTable().ajax.reload(function(){});
		});
		
	}
	
	//추가버튼 클릭시
	$('#btnAdd').on('click', function(){
		if ( Boolean($('#listDealCorpCd').val()) ) {
			$('#itemSmPopUpModal').modal('show');
			$('#itemSmAllPopupTable').DataTable().ajax.reload(function(){});
			$('#itemSmAllTempTable').DataTable().ajax.reload(function(){});
			setTimeout(function(){
				itemSmAllPopupTable.draw();
				itemSmAllTempTable.draw();
				itemSmAllTempTable.draw();
				itemSmAllPopupTable.draw();
			}, 300);
		} else {
			toastr.warning("고객사를 선택해주세요.");
			$('#dealCorpCdBtn').focus();
		}
	});
	
	//추가 품목조회 팝업 상단 목록
	let itemSmAllPopupTable = $('#itemSmAllPopupTable').DataTable({
		dom : "<'row'<'col-sm-5 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
	    language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        lengthChange : true,
        pageLength : -1,
        scrollY: "30vh",
		ajax : {
			url : '<c:url value="bs/takeOffItemInjectList"/>',
			type : 'GET',
			data : {
				'mainGubun'		: function(){ return "001"; },
				'kindDealCorpCd': function(){ return "btnAdd"; }, //추가 or 신규추가
				'itemCusList'	: function(){ return $('#listDealCorpCd').val(); },
			},
		},
		columns : [
			{ //체크박스
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" name="popupCheckSmBox" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			{ //출고일자
				data : 'outputDate', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ //생산일자
				data : 'workEndTime', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ //바코드
				data : 'barcodeNo', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //차종
				data : 'itemModelNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //품번
				data : 'itemCd', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : row['spCd'];
				}
			},
			{ //품명
				data : 'itemNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : row['spNm'];
				}
			},
			{ //출하수량
				data : 'toQty', 'className' : 'text-right',
				render : function ( data, type, row, meta ) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //고객사
				data : 'itemCusNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
		],
		columnDefs : [],
		drawcallback : [],
		order : [],
		buttons : [],
	});

	//추가 품목조회 팝업 하단 목록
	let itemSmAllTempTable = $('#itemSmAllTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		searching: false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: "20vh",
		ajax : {
			url : '<c:url value="tm/itemAllTempTableReset"/>',
			type : 'GET',
			data : {},
		},
		columns : [
			{ //체크박스
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="tempCheckSmBox" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			{ //출고일자
				data : 'outputDate', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ //생산일자
				data : 'workEndTime', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ //바코드
				data : 'barcodeNo', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
			{ data : 'itemCd', 'className' : 'text-center' }, //품번
			{ data : 'itemNm', 'className' : 'text-center' }, //품명
			{ //출하수량
				data : 'toQty', 'className' : 'text-right',
				render : function ( data, type, row, meta ) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //고객사
				data : 'itemCusNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
		],
		columnDefs : [],
		drawcallback : [],
		order : [],
		buttons : [],
	});
	
	//추가 품목추가 버튼 클릭시
	$('#btnItemSmAdd').on('click',function(){
		if ( !$('input:checkbox[name=popupCheckSmBox]').is(":checked") ) {
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		}
		
		$('#itemSmAllPopupTable tbody tr').each(function(index, item) {
			let data = itemSmAllPopupTable.row(this).data();
			if ( $(this).find('td input[name=popupCheckSmBox]').is(":checked") ) {
				itemSmAddFunc(data); //행 추가 함수
			}
		});

		$('input[name=popupCheckSmBox]').prop("checked", false);
		$('#popupAllSmCheck').prop("checked", false);
		$('#itemSmAllPopupTable tbody tr').removeClass('selected');
	});
	
	//추가 품목삭제 버튼 클릭시
	$('#btnItemSmDel').on('click',function(){
		if ( !$('input:checkbox[name=tempCheckSmBox]').is(":checked") ) {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#itemSmAllTempTable tbody tr').each(function(index, item) {
			if ( $(this).find('td input[name=tempCheckSmBox]').is(":checked") ) {
				arr.push(index);
			}
		});
		$('#itemSmAllTempTable').DataTable().rows(arr).remove().draw();	
		$('input[name=tempCheckSmBox]').prop("checked", false);
		$('#tempAllSmCheck').prop("checked", false);
	});
	
	//추가 가져오기 버튼 클릭시
	$('#btnGetItemSmList').on('click', function(){
		$('#itemSmAllTempTable tbody tr').each(function(index, item) {
			let data = itemSmAllTempTable.row(this).data();
			
			$('#itemInsertTable').DataTable().row.add({
				"kindDealCorpCd": 'btnAdd'
				, "itemSeq" 	: data.itemSeq
				, "barcodeNo" 	: data.barcodeNo
				, "itemGubun" 	: data.itemGubun
				, "itemModelNm" : data.itemModelNm
				, "itemCd" 		: data.itemCd
				, "itemNm" 		: data.itemNm
				, "toQty" 		: data.toQty
				, "locationNo" 	: data.locationNo != null ? data.locationNo : ''
				, "locationCd" 	: data.locationCd != null ? data.locationCd : ''
			}).draw(true);
		});
		
		$('#itemSmPopUpModal').modal('hide');
		$('#itemSmAllTempTable').DataTable().clear().draw();
		$('input[name=toQty]').eq(0).focus(); //반출수량 입력칸 포커스
		$('input[name=toQty]').eq(0).select();
	});
	
	//추가 품목조회 팝업창 상단 테이블 행 클릭 시
	$(document).on('click', '#itemSmAllPopupTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=popupCheckSmBox]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=popupCheckSmBox]').prop('checked',true);
		}
	});
	
	//추가 품목조회 팝업창 상단 테이블 행 더블클릭 시 품목추가처럼 행 추가되는 기능
	$(document).on('dblclick', '#itemSmAllPopupTable tbody tr', function () {
		let data = itemSmAllPopupTable.row(this).data();
		itemSmAddFunc(data); //행 추가 함수
	});
	
	//추가 행 추가 함수
	function itemSmAddFunc(data) {
		$('#itemSmAllTempTable').DataTable().row.add({ //행 추가
			"itemSeq"    : data.itemSeq,
			"barcodeNo"  : data.barcodeNo,
			"itemGubun"  : data.itemGubun,
			"itemCd"     : data.itemCd,
			"itemNm"     : data.itemNm,
			"itemModelNm": data.itemModelNm,
			"toQty"		 : data.toQty,
			"locationNo" : data.locationNo,
			"locationCd" : data.locationCd,
			"locationNm" : data.locationNm,
			"areaCd" 	 : data.areaCd,
			"areaNm"     : data.areaNm,
			"floorNm"    : data.floorNm,
			"outputDate" : data.outputDate,
			"workEndTime": data.workEndTime,
			"itemCusNm"	 : data.itemCusNm,
		}).draw(true);
	}

	//추가 품목조회 팝업창 하단 테이블 행 클릭 시
	$(document).on('click', '#itemSmAllTempTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=tempCheckSmBox]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=tempCheckSmBox]').prop('checked', true);
		}
	});
	
	//추가 모두 체크하기(팝업 상단)
	$('#popupAllSmCheck').on('click',function(){
		if($('#popupAllSmCheck').prop("checked")){
			$('input:checkbox[name=popupCheckSmBox]').prop("checked", true);
			$('#itemSmAllPopupTable tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=popupCheckSmBox]').prop("checked",false);
			$('#itemSmAllPopupTable tbody tr').removeClass('selected');
		}
	});
	
	//추가 모두 체크하기(팝업 하단)
	$('#tempAllSmCheck').on('click',function(){
		if($('#tempAllSmCheck').prop("checked")){
			$('input:checkbox[name=tempCheckSmBox]').prop("checked",true);
			$('#itemSmAllTempTable tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=tempCheckSmBox]').prop("checked",false);
			$('#itemSmAllTempTable tbody tr').removeClass('selected');
		}
	});
	
	///////////////////////////////////////////////////////////////////////////////////////////////////
	
	//신규추가버튼 클릭시
	$('#btnNewAdd').on('click', function(){
		if ( Boolean($('#listDealCorpCd').val()) ) {
			$('#itemPartPopUpModal').modal('show');
			$('#itemAllPopupTable').DataTable().ajax.reload(function(){});
			$('#itemAllTempTable').DataTable().ajax.reload(function(){});
			setTimeout(function(){
				itemAllPopupTable.draw();
				itemAllTempTable.draw();
				itemAllTempTable.draw();
				itemAllPopupTable.draw();
			}, 300);
		} else {
			toastr.warning("고객사를 선택해주세요.");
			$('#dealCorpCdBtn').focus();
		}
	});
	
	//신규추가 품목조회 팝업 상단 목록
	let itemAllPopupTable = $('#itemAllPopupTable').DataTable({
		dom : "<'row'<'col-sm-5 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
	    language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        lengthChange : true,
        pageLength : -1,
        scrollY: "30vh",
		ajax : {
			url : '<c:url value="bs/takeOffItemInjectList"/>',
			type : 'GET',
			data : {
				'mainGubun'		: function(){ return "001"; },
				'kindDealCorpCd': function(){ return "btnNewAdd"; }, //추가 or 신규추가
				'itemCusList'	: function(){ return $('#listDealCorpCd').val(); },
			},
		},
		columns : [
			{ //체크박스
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" name="popupCheckBox" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			{ //바코드
				data : 'barcodeNo', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //차종
				data : 'itemModelNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //품번
				data : 'itemCd', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : row['spCd'];
				}
			},
			{ //품명
				data : 'itemNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : row['spNm'];
				}
			},
			{ //현재고
				data : 'toQty', 'className' : 'text-right',
				render : function ( data, type, row, meta ) { 
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //창고
				data : 'locationNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //구역/위치
				data : 'areaNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return row['locationNm'] == "외주창고" ? data : data + " / " + row['floorNm'];
					} else {
						return '';
					}
				}
			},
		],
		columnDefs : [],
		drawcallback : [],
		order : [],
		buttons : [],
	});

	//신규추가 품목조회 팝업 하단 목록
	let itemAllTempTable = $('#itemAllTempTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : true,
		searching: false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: "20vh",
		ajax : {
			url : '<c:url value="tm/itemAllTempTableReset"/>',
			type : 'GET',
			data : {},
		},
		columns : [
			{ //체크박스
				render : function(data, type, row,meta) {
					return '<input type="checkbox" name="tempCheckBox" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			{ //바코드
				data : 'barcodeNo', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
			{ data : 'itemCd', 'className' : 'text-center' }, //품번
			{ data : 'itemNm', 'className' : 'text-center' }, //품명
			{ //현재고
				data : 'toQty', 'className' : 'text-right',
				render : function ( data, type, row, meta ) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //창고
				data : 'locationNm', 'className' : 'text-center',
				render : function ( data, type, row, meta ) {
					return data != null ? data : '';
				}
			},
			{ //구역/위치
				data : 'areaNm', 'className' : 'text-center',
				render : function(data,type,row,meta){
					if ( data != null ) {
						return row['locationNm'] == "외주창고" ? data : data + " / "+row['floorNm'];
					} else {
						return '';
					}
				}
			},
		],
		columnDefs : [],
		drawcallback : [],
		order : [],
		buttons : [],
	});
	
	//신규추가 품목추가 버튼 클릭시
	$('#btnItemAdd').on('click',function(){
		if ( !$('input:checkbox[name=popupCheckBox]').is(":checked") ) {
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		}
		
		$('#itemAllPopupTable tbody tr').each(function(index, item) {
			let data = itemAllPopupTable.row(this).data();
			if ( $(this).find('td input[name=popupCheckBox]').is(":checked") ) {
				itemAddFunc(data); //행 추가 함수
			}
		});

		$('input[name=popupCheckBox]').prop("checked", false);
		$('#popupAllCheck').prop("checked", false);
		$('#itemAllPopupTable tbody tr').removeClass('selected');
	});
	
	//신규추가 품목삭제 버튼 클릭시
	$('#btnItemDel').on('click',function(){
		if ( !$('input:checkbox[name=tempCheckBox]').is(":checked") ) {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#itemAllTempTable tbody tr').each(function(index, item) {
			if ( $(this).find('td input[name=tempCheckBox]').is(":checked") ) {
				arr.push(index);
			}
		});
		$('#itemAllTempTable').DataTable().rows(arr).remove().draw();	
		$('input[name=tempCheckBox]').prop("checked", false);
		$('#tempAllCheck').prop("checked", false);
	});
	
	//신규추가 가져오기 버튼 클릭시
	$('#btnGetItemList').on('click', function(){
		$('#itemAllTempTable tbody tr').each(function(index, item) {
			let data = itemAllTempTable.row(this).data();
			
			$('#itemInsertTable').DataTable().row.add({
				"kindDealCorpCd": 'btnNewAdd'
				, "itemSeq" 	: data.itemSeq
				, "barcodeNo" 	: data.barcodeNo
				, "itemGubun" 	: data.itemGubun
				, "itemModelNm" : data.itemModelNm
				, "itemCd" 		: data.itemCd
				, "itemNm" 		: data.itemNm
				, "toQty" 		: data.toQty
				, "locationNo" 	: data.locationNo != null ? data.locationNo : ''
				, "locationCd" 	: data.locationCd != null ? data.locationCd : ''
			}).draw(true);				
		});
		
		$('#itemPartPopUpModal').modal('hide');
		$('#itemAllTempTable').DataTable().clear().draw();
		$('input[name=toQty]').eq(0).focus(); //반출수량 입력칸 포커스
		$('input[name=toQty]').eq(0).select();
	});
	
	//신규추가 품목조회 팝업창 상단 테이블 행 클릭 시
	$(document).on('click', '#itemAllPopupTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=popupCheckBox]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=popupCheckBox]').prop('checked',true);
		}
	});
	
	//신규추가 품목조회 팝업창 상단 테이블 행 더블클릭 시 품목추가처럼 행 추가되는 기능
	$(document).on('dblclick', '#itemAllPopupTable tbody tr', function () {
		let data = itemAllPopupTable.row(this).data();
		itemAddFunc(data); //행 추가 함수
	});
	
	//신규추가 행 추가 함수
	function itemAddFunc(data) {
		let overlapCheck = true;
		if ( $('#kindDealCorpCd').val() === "003" ) { //외주사일 경우
			overlapCheck = !$('#itemAllTempTable').DataTable().rows().data().toArray().some(function (row) {
	            return row.barcodeNo === data.barcodeNo;
	        });
		}
		
		if (overlapCheck) { //같은 barcodeNo를 가진 행이 없으면
			$('#itemAllTempTable').DataTable().row.add({ //행 추가
				"itemSeq"    : data.itemSeq,
				"barcodeNo"  : data.barcodeNo,
				"itemGubun"  : data.itemGubun,
				"itemCd"     : data.itemCd,
				"itemNm"     : data.itemNm,
				"itemModelNm": data.itemModelNm,
				"toQty"		 : data.toQty,
				"locationNo" : data.locationNo,
				"locationCd" : data.locationCd,
				"locationNm" : data.locationNm,
				"areaCd" 	 : data.areaCd,
				"areaNm"     : data.areaNm,
				"floorNm"    : data.floorNm,
			}).draw(true);
		} else {
			toastr.warning(`\${data.barcodeNo} 항목이 이미 추가되었습니다.`);
		}
	}

	//신규추가 품목조회 팝업창 하단 테이블 행 클릭 시
	$(document).on('click', '#itemAllTempTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=tempCheckBox]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=tempCheckBox]').prop('checked',true);
		}
	});
	
	//신규추가 모두 체크하기(팝업 상단)
	$('#popupAllCheck').on('click',function(){
		if($('#popupAllCheck').prop("checked")){
			$('input:checkbox[name=popupCheckBox]').prop("checked",true);
			$('#itemAllPopupTable tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=popupCheckBox]').prop("checked",false);
			$('#itemAllPopupTable tbody tr').removeClass('selected');
		}
	});
	
	//신규추가 모두 체크하기(팝업 하단)
	$('#tempAllCheck').on('click',function(){
		if($('#tempAllCheck').prop("checked")){
			$('input:checkbox[name=tempCheckBox]').prop("checked",true);
			$('#itemAllTempTable tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=tempCheckBox]').prop("checked",false);
			$('#itemAllTempTable tbody tr').removeClass('selected');
		}
	});
	
	////////////////////////////////////////////////////////////////////////////////////////////////
	
	//처리결과 버튼 클릭시
	function prcssResultClick (idx) {
		prcssTrDate = outWhsAdmChildTable.row(idx).data();
		
		$('#itemModelTd').text(prcssTrDate.itemModelNm); //차종
		$('#itemCdTd').text(prcssTrDate.itemCd); //품번
		$('#itemNmTd').text(prcssTrDate.itemNm); //품명
		$('#fairQty').val(rmDecimal( prcssTrDate.prcssYn === 'Y' ? prcssTrDate.fairQty : prcssTrDate.toQty )); //양품수량
		$('#fairQty').attr('placeholder', rmDecimal(prcssTrDate.toQty)); //양품수량 - 힌트
		$('#faultyQty').val( prcssTrDate.prcssYn === 'Y' ? rmDecimal(prcssTrDate.faultyQty) : 0 ); //불량수량
		
		if ( prcssTrDate.prcssYn === 'Y' ) { //처리완료가 되었는지
			$('#btnResultSave').attr('disabled', true);
			$('#fairQty').attr('disabled', true);
			$('#faultyQty').attr('disabled', true);
			$('#btnResultSave').text("반 출 처 리 완 료");
		} else {
			$('#btnResultSave').attr('disabled', false);
			$('#fairQty').attr('disabled', false);
			$('#faultyQty').attr('disabled', false);
			$('#btnResultSave').text("반 출 처 리");
		}
		
		$('#resultInputModal').modal('show');
	}
	
	//처리결과 버튼 클릭 시 > 모달 안 반출처리 버튼 클릭시
	$('#btnResultSave').on('click', function() {
		let check = true;
		
		if ( Number($('#fairQty').val().replace(/,/g, '')) + Number($('#faultyQty').val().replace(/,/g, ''))
				!= Number($('#fairQty').attr('placeholder').replace(/,/g, '')) ) {
			toastr.warning(`수량의 합이 \${$('#fairQty').attr('placeholder')}개가 되도록 입력해주세요.`);
			check = false;
			return false;
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="bs/takeOffPrcssCreate"/>',
				type : 'POST',
				data : {
					'prcssYn' 		: function(){ return 'Y'; },
					'fairQty' 		: function(){ return $('#fairQty').val().replace(/,/g, ''); },
					'faultyQty' 	: function(){ return $('#faultyQty').val().replace(/,/g, ''); },
					'itemGubun' 	: function(){ return prcssTrDate.itemGubun; },
					'itemSeq' 		: function(){ return prcssTrDate.itemSeq; },
					'idx' 			: function(){ return prcssTrDate.idx; },
					'barcodeNo' 	: function(){ return prcssTrDate.barcodeNo; },
					'beforeLocNo' 	: function(){ return prcssTrDate.afterLocNo; },
					'beforeLocCd' 	: function(){ return prcssTrDate.afterLocCd; },
					'afterLocNo' 	: function(){ return prcssTrDate.itemLocNo; },
					'afterLocCd' 	: function(){ return prcssTrDate.itemLocCd; },
				},
				beforeSend : function() {
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						$('#outWhsAdmChildTable').DataTable().ajax.reload(function(){});
						$('#resultInputModal').modal('hide');
						toastr.success('반출처리 되었습니다.');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
		
	});
	
	//공급사 팝업 시작
	let dealCorpPopUpTable4;
	let dealArr = ['001'];
	function itemCusSelectInCorpCd() {
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({	
			dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
			pageLength : 15,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataList"/>',
				type : 'GET',
				data : {
					'dealArr' :  function(){ return dealArr; },
				},
			},
			rowId : 'dealCorpSeq',
			columns : [
				{ data : 'dealCorpNm' },
				{ data : 'dealCorpCd' },
				{ data : 'presidentNm' },
				{ data : 'repreItem' },
				{ data : 'corpNo' } 
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

// 		let html2 = '<div class="row">';
// 		html2 += '<label class="input-label-sm">거래구분</label>';
// 		html2 += '<div class="form-group input-sub m-0">';
// 		html2 += '<select class="custom-select" id="dealGubunOption" onChange="dealOnchange()">';
// 		html2 += '</select></div>&nbsp;&nbsp;&nbsp;';
// 		html2 += '</div>';

// 		$('#dealCorpPopUpTable4_length').html(html2);
// 		selectBoxAppend(dealGubunCode, "dealGubunOption", '001', "1");
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			$('#itemCus').val(data.dealCorpCd);
			$('#itemCusNm').val(data.dealCorpNm);
			itemCusVal = data.dealCorpCd;
			$('#dealCorpPopUpModal4').modal('hide');
			$('#deliveryOrderAdmTable').DataTable().ajax.reload( function () {});
		});
		
		$('#dealCorpPopUpModal4').modal('show');
	}

	//공급사 팝업 조회조건 변경시
	function dealOnchange() {
		if ( Boolean($("#dealGubunOption option:selected").val()) ) {
			dealArr = $("#dealGubunOption option:selected").val();
		} else {
			dealArr = ['001', '003'];
		}
		$('#dealCorpPopUpTable4').DataTable().ajax.reload(function(){});
	}
	
	//공급사 조회조건 값 초기화
	function itemCusDelete(){
		$('#itemCusNm').val('');
		$('#itemCus').val('');
		itemCusVal = '';
	}
	
	//처리결과 모달 양품수량 변경시
	function changeFaultyQty() {
		const negativeCheck = Number($('#fairQty').attr('placeholder').replace(/,/g, '')) - Number($('#fairQty').val().replace(/,/g, ''));
		const faultyQtyVal = rmDecimal( negativeCheck > 0 ? negativeCheck : 0 );
		$('#faultyQty').val(faultyQtyVal); //불량수량 = 반출수량 - 양품수량
	}
	
	//처리결과 모달 불량수량 변경시
	function changeFairQty() {
		const negativeCheck = Number($('#fairQty').attr('placeholder').replace(/,/g, '')) - Number($('#faultyQty').val().replace(/,/g, ''));
		const fairQtyVal = rmDecimal( negativeCheck > 0 ? negativeCheck : 0 );
		$('#fairQty').val(fairQtyVal); //양품수량 = 반출수량 - 불량수량
	}
	
	//반출수량 커서이동
	function moveFocus() {
		if ( event.keyCode == 13 ) {
			let $this = $(event.target);
			let index = $this.closest('tr').index();
			let nextIndex = index + 1;
		    if(nextIndex < itemInsertTable.rows().count()) {
		    	itemInsertTable.row(nextIndex).nodes().to$().find('input[name="toQty"]').focus();
		    	itemInsertTable.row(nextIndex).nodes().to$().find('input[name="toQty"]').select();
		    } else {
		    	itemInsertTable.row(0).nodes().to$().find('input[name="toQty"]').focus();
		    	itemInsertTable.row(0).nodes().to$().find('input[name="toQty"]').select();
		    }
		}
	}
	
</script>

<script>
	// ************************************************************ 라벨출력 ************************************************************
	$('#printBarcode').on('click', function() {
		let labelToday = new Date();
		console.log("라벨출력 printBarcode onClick 시작시간: " + labelToday);
		
		let trPrintList = new Array(); 	// 통합된 프린트할 데이터 배열
		let columnList = new Array();	// 통합된 프린트할 컬럼 배열
		let columnArr = new Array();	// 각 용지의 컬럼 배열
		let paperSize = "";				// 용지 사이즈
		
		//예외처리
		if ( !$('input[name=childTableCheck]').is(':checked') ) {
			toastr.warning("인쇄할 항목을 선택해주세요.");
			return false;
		}
		
		$('input[name=childTableCheck]:checked').each(function(index, item) {
			let subTrData = outWhsAdmChildTable.row($(this).closest('tr')).data(); // 바코드 테이블 행	
			let trPrintArr = new Array(); // 각 용지의 데이터 배열
		    
			// 양식에 맞추어 컬럼 집어넣기
			paperSize = "productLabel";
			columnArr = ["차종", "품목번호", "품명", "반출일자", "수 량", "작업자", "납품처", "비고"];
			
			trPrintArr[0] = subTrData.itemModelNm; //차종
			trPrintArr[1] = subTrData.itemCd; //품목번호
			trPrintArr[2] = subTrData.itemNm; //품명
			trPrintArr[3] = moment(subTrData.toDate).format("YY/MM/DD"); //반출일자
			trPrintArr[4] = rmDecimal(parseFloat(subTrData.toQty)) + " " + subTrData.itemUnitNm; //수 량
			trPrintArr[5] = subTrData.toWorkerNm; //작업자
			trPrintArr[6] = subTrData.itemCusNm; //납품처
			trPrintArr[7] = ''; //비고
			trPrintArr[8] = subTrData.barcodeNo; //바코드

			trPrintList.push(trPrintArr);
			columnList.push(columnArr);
		})
		
		if (trPrintList.length > 0) {
	    	labelPrint(trPrintList, columnList, paperSize);
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
