<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!-- 사진 모달 시작-->
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close"></span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!-- 사진 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">출하검사관리대장(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 64%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="completeAdmTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th>출하요청번호</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>승인여부</th>
									<th>판정</th>
									<th>출하일자</th>
									<th>요청수량</th>
									<th>검사일</th>
									<th class="text-center">검사수량</th>
									<th class="text-center">양품수량</th>
									<th class="text-center">불량수량</th>
									<th>출하상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
				<!-- <button type="button" class="btn btn-success float-right">Excel</button> -->
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width:35%;">
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Head">출하검사성적서&검사기준서</a>
						</li>
					</ul>
				</div>
				
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<!--오른쪽 등록 부분 상단 버튼 영역-->
							<div class="card-body col-sm-12">
								<button type="button" class="btn btn-success float-left mr-1" id="btnApprove">승인</button>
								<button type="button" class="btn btn-primary float-left mr-1" id="btnInspPopup">검사항목</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
							</div>
							<!--/오른쪽 등록 부분 상단 버튼 영역-->
							<!--====================TAB-UI=======================-->
							<!-- .card-header -->
		
							<div class="card-body p-0">
								<div id="myTabContent" class="tab-content">
									<div class="tab-pane fade active show" id="tab1">
										<!--/오른쪽 등록 부분 상단 버튼 영역-->
										<form id="form">
											<div class="table-responsive">
												<table class="table table-lg table-bordered mb-2" id="completeDtlTable">
													<colgroup>
														<col width="20%">
														<col width="30%">
														<col width="20%">
														<col width="30%">
													</colgroup>
													<tr>
														<th>구분</th>
														<td>
															<input type="text" class="form-control" id="itemGubun" name="itemGubun" style="max-width: 100%; text-align:center;" disabled>
														</td>
														<th>차종</th>
														<td>
															<input type="text" class="form-control" id="itemModel" name="itemModel" style="max-width: 100%;text-align:center;" disabled>
														</td>
													</tr>
													<tr>
														<th>품번</th>
														<td>
															<input type="text" class="form-control" id="itemCd" name="itemCd" style="max-width: 100%;text-align:center;" disabled>
														</td>
														<th>품명</th>
														<td>
															<input type="text" class="form-control" id="itemNm" name="itemNm" style="max-width: 100%;text-align:center;" disabled>
														</td>
													</tr>
													<tr>
														<th>판정</th>
														<td><select id="qaEval" class="custom-select" style="max-width: 100%;" disabled></select></td>
														<th></th>
														<td></td>												
													</tr>
													<tr>
														<th>검사일</th>
														<td>
															<div class="form-group input-sub m-0 row"
																style="max-width: 100%">
																<input class="form-control" type="text" id="inspectDate" name="inspectDate" style="max-width: 100%;" disabled />
																<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')"
																	class="btn btn-secondary input-sub-search"
																	id="inspectDateCalendar" type="button">
																	<span class="oi oi-calendar"></span>
																</button>
															</div>
														</td>
														<th>검사자</th>
														<td>
															<div class="input-sub m-0" style="max-width: 100%">
																<input type="hidden" class="form-control" style="max-width: 100%" id="inspectChargr" name="inspectChargr" disabled> 
																<input type="text" class="form-control" style="max-width: 100%" id="inspectChargrNm" name="inspectChargrNm" disabled>
																<button type="button" class="btn btn-primary input-sub-search" name="btnAdmChargr" id="btnAdmChargr" onclick="selectadmChargr();" disabled="disabled">
																	<span class="oi oi-magnifying-glass"></span>
																</button>
															</div>
														</td>
													</tr>
													<tr>
														<th>요청수량</th>
														<td><input type="text" class="form-control text-right" id="targetQty" name="targetQty" style="max-width: 100%;" disabled></td>
														<th>검사수량</th>
														<td><input type="text" class="form-control text-right" id="inspectCnt" name="inspectCnt" style="max-width: 100%;"disabled></td>
													</tr>
													<tr>
														<th>양품수량</th>
														<td><input type="text" class="form-control text-right" id="pairQty" name="pairQty" style="max-width: 100%;" disabled></td>
														<th>불량수량</th>
														<td><input type="text" class="form-control text-right" id="faultyQty" name="faultyQty" style="max-width: 100%;" disabled></td>
													</tr>
													<tr>
														<th>초.중.종<br>시료수 체크</th>
														<td><select class="custom-select" id="cavityCnt" name="cavityCnt" disabled></select></td>
													</tr>
													<tr>
														<th>비고</th>
														<td colspan="3"><input type="text" class="form-control" id="inspectDesc" name="inspectDesc" style="max-width: 100%;" disabled></select>
													</tr>
												</table>
											</div>
											<!-- --------------------------------------------- -->
										</form>
										<form id="form3">
											<div class="table-responsive">
												<table id="completeSubTable" class="table table-bordered">
													<colgroup>
														<col width="10%">
														<col width="20%">
														<col width="15%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
													</colgroup>
													<thead class="thead-light">
														<tr>
															<th>No.</th>
															<th>생산LOTNO</th>
															<th class="text-center">요청수량</th>
															<th class="text-center">양품수량</th>
															<th>판정</th>
															<th class="text-center">불량수량</th>
														</tr>
													</thead>
												</table>
											</div>
										</form>
										<form id="form8" enctype="multipart/form-data">
											<div class="table-responsive">
												<table class="table table-bordered">
													<colgroup>
														<col width="50%">
														<col width="50%">
													</colgroup>
													<tr>
														<th colspan="2">제품사진</th>
													</tr>
													<tr>
														<th>사진1</th>
														<th>사진2</th>
													</tr>
													<tr>
														<td>
															<div class="custom-file" style="height: 150px;">
																<img alt="등록된 사진이 없습니다." id="imageFile1" src="" onClick="imgShow(imgSrc1)"
																	name="imageFile1" style="width: 100%; height: 100%">
															</div>
														</td>
			
														<td>
															<div class="custom-file" style="height: 150px;">
																<img alt="등록된 사진이 없습니다." id="imageFile2" src="" onClick="imgShow(imgSrc2)"
																	name="imageFile2" style="width: 100%; height: 100%">
															</div>
														</td>
													</tr>
													<tr>
														<th>사진3</th>
														<th>사진4</th>
													</tr>
													<tr>
														<td>
															<div class="custom-file" style="height: 150px;">
																<img alt="등록된 사진이 없습니다." id="imageFile3" src="" onClick="imgShow(imgSrc3)"
																	name="imageFile3" style="width: 100%; height: 100%">
															</div>
														</td>
			
														<td>
															<div class="custom-file" style="height: 150px;">
																<img alt="등록된 사진이 없습니다." id="imageFile4" src="" onClick="imgShow(imgSrc4)"
																	name="imageFile4" style="width: 100%; height: 100%">
															</div>
														</td>
													</tr>
												</table>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1 mb-2">
								<button type="button" class="btn btn-primary float-left mr-1" id="btnAttachAdd" >추가</button>
								<button type="button" class="btn btn-warning float-left mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnAttachSave">저장</button>
							</div>
							<form id="form31" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemInspectAttachTable">
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="60%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>내용</th>
												<th>출하검사성적서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!-- /.card -->
						<!--====================/TAB-UI=======================-->
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
<!-- 불량유형 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="faultyTypePopUpModal" tabindex="-1" role="dialog" aria-labelledby="faultyTypePopUpModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title" id="faultyTypePopUpLabel">불량유형등록</h5>
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span>
           </button>
         </div> 
         <div class="modal-body">
       		<table id="" class="table table-bordered">
				<colgroup>
					<col width="20%">
					<col width="30%">
					<col width="20%">
					<col width="30%">
				</colgroup>										
				<thead class="thead-light">
					<tr>
						<th>생산 LOT NO</th>
						<td><input type="text" class="form-control" id="popupLotNo" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
						<th>요청수량</th>
						<td><input type="text" class="form-control" id="popupTargetQty" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
					</tr>
				</thead>
			</table>
	        <table id="faultyTypePopUpTable" class="table table-bordered">
		   		<colgroup>
					<col width="10%">
					<col width="25%">
					<col width="20%">
					<col width="20%">
					<col width="25%">
				</colgroup>										
				<thead class="thead-light">
					<tr>
						<th>No.</th>
						<th>불량유형</th>
						<th>불량수량</th>
						<th>불량등록일</th>
						<th>비고</th>
					</tr>
				</thead>
		 	</table>
       	 </div>
         <div class="modal-footer">
       		<button type="button" class="btn btn-primary float-right" id="btnFaultyTypeSave">저장</button>
           <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         </div>
       </div>
     </div>
   </div>
<!-- 불량유형 모달 모달 종료-->
	<!--  Modal Start-->
	<div class="modal fade" id="inspPopupModal" tabindex="-1" role="dialog" aria-labelledby="inspSavePopupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document" style="min-width:1000px;">
			<div class="modal-content" >
				<div class="modal-header">
					<h5 class="modal-title" id="inspPopuppLabel">검사항목등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="">
						<button type="button" class="btn btn-primary" id="btnExt">외관</button>
						<button type="button" class="btn btn-primary" id="btnSize">치수</button>
						
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspSave">저장</button>
						<!-- <button type="button" class="btn btn-warning float-right mr-1" id="btnInspEdit">수정</button> -->
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:370px;">기준</th>
										<th rowspan="2" style="min-width:60px;">확인방법</th>
										<th colspan="10" id="extBlueTh" style="min-width: 900px; background-color: #6bbcfb;">초.중.종 시료수</th>
									</tr>
									<tr>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
										<th>X6</th>
										<th>X7</th>
										<th>X8</th>
										<th>X9</th>
										<th>X10</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv">
							<table class="table table-bordered" id="sizeAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:30px;">순번</th>
										<th rowspan="2" style="min-width:100px;">목록</th>
										<th rowspan="2" style="min-width:50px;">확인방법</th>
										<th colspan="2" style="min-width:200px;">기준</th>
										<th colspan="10" id="sizeBlueTh" style="min-width: 900px; background-color: #6bbcfb;">초.중.종 시료수</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<th>X1</th>
										<th>X2</th>
										<th>X3</th>
										<th>X4</th>
										<th>X5</th>
										<th>X6</th>
										<th>X7</th>
										<th>X8</th>
										<th>X9</th>
										<th>X10</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--  Modal End-->
<%@include file="../layout/bottom.jsp"%>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>

	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "64%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "qmsc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "출하검사관리대장(봉제)");
	
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	let menuAuth = 'qmsc0200';

	var doDateFromCal = "${serverDateFrom}";
	var doDateToCal = "${serverDateTo}";
	var serverDate = "${serverDateTo}";
	
	var index = 0;
	var workOrdNo = null;
	var itemCd = null;
	var itemRev = null;
	var ordDate = null;
	var tableIdx = null;
	var itemSeq = null;

	var doNo = null;
	var doNoSub = null;
	var icaSeq = null;
	var doStatus = null;
	var approvalYn = null;
	var ordLotNo = null;
	var qaEval = null;
	var userNm =  "${userNm}";
	var userNumber = "${userNumber}";
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	var approvalYnOption = "";	//승연여부
	var qaEvalOption = "";		//판정
	var doStatusOption = "출하요청";
	var pairQty = null;
	var targetQty = null;
	var itemGubun = null;
	var inspCdVal = null;
	var cavityCnt = null;
	var inspCavityVal = '001';
	let outputDate = null;
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	//승인여부
	$.ajax({
		url : '<c:url value="sm/approvalAuthAdmList"/>',
		type: 'GET',
		dataType: 'json',
		async: false,
		data: {
			'userId' 	: function() { return userId;},
			'apprDesc'	: function() { return menuUrl;}
		},
		success: function(res) {
			let data = res.data;
			if (data.length != 0) {
				$('#btnApprove').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
			}
		},
	});

	uiProc(true);

	//공통코드 시작
	var qaEvalCode=new Array();
    <c:forEach items="${qaEval}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	qaEvalCode.push(json);
	</c:forEach>

	var baseInfoAdmList=new Array();
	<c:forEach items="${baseInfoAdmList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseInfoCd}";
	json1.baseNm = "${info.baseInfoNm}";
	baseInfoAdmList.push(json1);
	</c:forEach>
	
	var judgeCode=new Array();	//판정
    <c:forEach items="${judge}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	judgeCode.push(json);
	</c:forEach>

	var silhangCode=new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	silhangCode.push(json);
	</c:forEach>
	
	var contentsCode=new Array();
    <c:forEach items="${contents}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	contentsCode.push(json);
	</c:forEach>

	var cavityCode = new Array();
	<c:forEach items="${cavity}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	cavityCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	
	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		
		$('#btnSave').addClass('d-none');
		$('#btnTypeAdd').attr('disabled', true);
	});
	
	selectBoxAppend(qaEvalCode, "qaEval", " ", "2");
	selectBoxAppend(baseInfoAdmList, "faultyType", " ", "2");
	selectBoxAppend(cavityCode, "cavityCnt", "005", "2");
	
	// 목록
	let completeAdmTable = $('#completeAdmTable').on( 'error.dt', function ( e, settings, techNote, message ) {
        if(techNote == 7) {
            toastr.error("로그인 세션이 만료 되었습니다.<br/>재로그인 해 주세요.");
            setTimeout(function() {
            	location.href = "/qmsc0200";
            	}, 200);    
        }
     } ).DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+"<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'p>B>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="qm/itemCompleteAdmDataList"/>',
			type : 'GET',
			data : {
				'menuAuth' 		: function(){ return menuAuth; },
				'startDate' 	: function(){ return doDateFromCal.replace(/-/g,""); },
				'endDate' 		: function(){ return doDateToCal.replace(/-/g,""); },
				'doStatus' 		: function(){ return doStatusOption; },
				'approvalYn'	: function(){ return approvalYnOption; },
				'qaEval' 		: function(){ return qaEvalOption; },
				'mainGubun' 	: function(){ return '002'; },
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{//출하요청번호
				data : 'doNo'
			},
			{//차종
				data : 'itemModelNm'
			},				
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//승인여부
			 	data : 'approvalYnNm',
			 	render: function(data, type, row, meta){
					if (data != null) {
						if (data == "승인") {
							return '<span style="color:blue;">'+data+'</span>';;
						} else {
							return '<span style="color:red;">'+data+'</span>';
						}
					} else {
						return '<span style="color:black;">미판정</span>';
					}
				}
			}, 		
			{//판정
				data : 'qaEvalNm',
				render: function(data, type, row, meta){
					if (data != null) {
						if (data == "합격") {
							return '<span style="color:blue;">'+data+'</span>';
						} else {
							return '<span style="color:red;">'+data+'</span>';
						}
					} else {
						return '<span style="color:black;">미판정</span>';
					}
				}
			},	
			{//출하일자
				data : 'outputDate',
				render: function(data, type, row, meta){
					if (data != null) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '-';
					}
				}
			},
			{//요청수량
				data : 'targetQty',
				render: function(data, type, row, meta){
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//검사일
				data : 'inspectDate',
				render: function(data, type, row, meta){
					if (data != null) {
						return moment(data).format("YYYY-MM-DD");
					} else {
						return '-';
					}
				}
			},				
			{//검사수량
				data : 'inspectCnt',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//양품수량
				data : 'pairQty',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//불량수량
				data : 'faultyQty',
				render: function(data, type, row, meta){	
					if (data != null) {
						return addCommas(data);
					} else {
						return '0';
					}
				}
			},
			{//출하상태
				data : 'doStatus'
			}
		],
		columnDefs: [
 			{ targets: [7,9,10,11] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
		buttons : [ 'copy', 
			{ extend : 'excel',
			title : '출하검사관리대장(봉제)'}, 
			'print' ],
	});


	var html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">출하일자</label>';
	html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateFrom" name="doDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(doDateFrom,doDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="doDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="doDateTo" name="doDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(doDateTo,doDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="diDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';

	html1 += '&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
	html1 += '<select class="custom-select" id="approvalYnOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">승인</option>';
	html1 += '<option value="002">미승인</option>';
	html1 += '</select>';
	
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">판정</label>'; 
	html1 += '<select class="custom-select" id="qaEvalOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">합격</option>';
	html1 += '<option value="002">불합격</option>';
	html1 += '</select>';

	html1 += '&nbsp;&nbsp;<label class="input-label-sm">출하상태</label>'; 
	html1 += '<select class="custom-select" id="doStatusOption">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">출하요청</option>';
	html1 += '<option value="002">검사완료</option>';
	html1 += '<option value="003">출하완료</option>';
	html1 += '</select>';
	
	html1 += '&nbsp;&nbsp;<button type="button" class="btn btn-primary mr-1" id="btnRetv">조회</button>';
	html1 += '<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>';
	html1 += '</div>';

	$('#completeAdmTable_length').html(html1);
	$('#doDateFrom').val(doDateFromCal);
	$('#doDateTo').val(doDateToCal);

	// 조회버튼
	$('#btnRetv').on('click', function() {
		doDateFromCal = $('#doDateFrom').val();
		doDateToCal = $('#doDateTo').val();
		approvalYnOption = $('#approvalYnOption option:selected').val();
		qaEvalOption = $('#qaEvalOption option:selected').val();
		doStatusOption = $('#doStatusOption option:selected').val();
		
		$('#completeAdmTable').DataTable().ajax.reload(function() {});
	});

	// 전체조회버튼
	$('#btnAllRetv').on('click', function() {
		doDateFromCal = "";
		doDateToCal = "";
		approvalYnOption = "";
		qaEvalOption = "";
		doStatusOption = "";
		$('#completeAdmTable').DataTable().ajax.reload(function() {});
	});

	$('#saveBtnModalY').on('click', function() {
		$('#btnSave').trigger('click');
	});
	
	//데이터 클릭 시
	$('#completeAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		$('#tab1Head').tab('show');
		$('#tab2Head').removeClass('disabled');
		
		if ($(this).hasClass('selected')) {
		} else {
			$('#completeAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#completeAdmTable').DataTable().row(this).index();

		var data = completeAdmTable.row(this).data();
		
		mainGubun = data.mainGubun;
		itemSeq = data.itemSeq;
		doNo = data.doNo;
		doNoSub = data.doNoSub;
		doStatus = data.doStatus;
		approvalYn = data.approvalYn;
		qaEval = data.qaEval;
		inspectDate = data.inspectDate;
		outputDate = data.outputDate;
		pairQty = data.pairQty;
		targetQty = data.targetQty;
		itemGubun = data.itemGubun;
		inspCdVal = data.inspCd;
		cavityCnt = data.cavityCnt;
		

		$('#itemGubun').val(data.itemGubunNm);
		$('#itemModel').val(data.itemModelNm);
		$('#itemCd').val(data.itemCd);
		$('#itemNm').val(data.itemNm);
		$('#qaEval').val(data.qaEval); 
		$('#targetQty').val(data.targetQty==null?"0":addCommas(data.targetQty));		//요청수량
		$('#inspectDate').val(data.inspectDate==null?"":moment(data.inspectDate).format('YYYY-MM-DD'));				//검사일
		$('#inspectCnt').val(data.inspectCnt==null?"0":addCommas(data.inspectCnt));		//검사수량
		$('#inspectChargr').val(data.inspectChargr==null?"":data.inspectChargr);		//검사자
		$('#inspectChargrNm').val(data.inspectChargrNm==null?"":data.inspectChargrNm);	//검사자명
		$('#pairQty').val(data.pairQty==null?"0":addCommas(data.pairQty));				//합격수량
		$('#faultyQty').val(data.faultyQty==null?"0":addCommas(data.faultyQty));		//불량수량

		selectBoxAppend(cavityCode, "cavityCnt", data.cavityCnt==null?"005":data.cavityCnt, "2");

		//완제품거사관리 바코드별 목록조회
		$('#completeSubTable').DataTable().ajax.reload(function(){});
		$('#completeSubTable').addClass('tr_highlight_row');	//hover

		//검사항목 목록조회
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
			
		uiProc(true);
		sideView = 'edit';

		$('#btnInspPopup').attr('disabled',false);	//검사항목 활성화
		$('#btnInspAdd').removeClass('d-none');		//수정버튼 숨김처리
		$('#btnInspSave').removeClass('d-none');		//저장버튼 숨김처리
		
		//출하등록 한 경우
		if ( doStatus == "출하완료" ) {
			$('#btnApprove').attr('disabled', false);	//승인버튼 비활성화
			$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
			$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화

			$('#btnApprove').text('승인취소');	//승인취소
			
		} else {
			//승인한 경우
			if ( approvalYn == "001" ) {
				$('#btnApprove').attr('disabled', false);	//승인버튼 비활성화
				$('#btnAdd').attr('disabled', true);
		    	$('#btnEdit').attr('disabled', true);	

		    	$('#btnApprove').text('승인취소');	//승인취소
				
			//승인 안한 경우
			} else if ( approvalYn == "002" ) {
				//등록/수정 버튼
				if ( inspectDate != null ) {
			    	$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
				} else {
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
				}

				//검사등록 버튼
				if ( qaEval != null && qaEval != "" ) {
					$('#btnApprove').attr('disabled', false);//승인버튼 비활성화
				} else {
					$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
				}	

				$('#btnApprove').text('승인');	//승인
			} else {
				//등록/수정 버튼
				if ( inspectDate != null ) {
			    	$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
				} else {
					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', true);
				}

				//검사등록 버튼
				if ( qaEval != null && qaEval != "" ) {
					$('#btnApprove').attr('disabled', false);//승인버튼 비활성화
				} else {
					$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
				}	

				$('#btnApprove').text('승인');	//승인
			}
		}

		imgPrint(); //제품사진 조회
		
	});
	
	//완제품검사관리 바코드별 목록조회
	let completeSubTable = $('#completeSubTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		//ordering: false,
			ajax : {
			url : '<c:url value="qm/itemCompleteAdmList"/>',
			type : 'GET',
			data : {
				'doNo' :  function(){return doNo;},
				'doNoSub' :  function(){return doNoSub;},
			},
		},
		columns : [ 
			{
				render : function(data,type,row,meta){
					return meta.row+1;
				}
			}, 
			{data : 'lotNo',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{data : 'targetQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '-';
					}
				}
			},
			{data : 'pairQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return addCommas(data);
					}else{
						return '0';
					}
				}
			},
			{data : 'judgment',
				render : function(data,type,row,meta){
					if(data!=null && data!=""){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}
					}else{
						return '<span>미판정</span>';
					}
				}
			},
			{data : 'faultyQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '0';
					}
				}
			},			
		],
		columnDefs: [
			{ targets: [2,3,5] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"className": "text-center", "targets": "_all"},
        ],
	    order: [
	    ],
	});


	//수입검사관리대장 바코드별 목록 더블클릭시
    $('#completeSubTable tbody').on( 'dblclick', 'tr', function () {

    	if($('#qaEval option:selected').val()==""){
			toastr.warning("우선 검사항목을 등록해주세요.");
			return false;
        }
        
       	if($(this).hasClass('selected')){
	        $(this).removeClass('selected');
        }else {
        	$('#completeSubTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

		tableIdx = $('#completeSubTable').DataTable().row(this).index();
		 
		icaSeq =  completeSubTable.row(this).data().doSeq;	//완제품검사 시퀀스
		lotNo =  completeSubTable.row(this).data().lotNo;
		targetQty =  completeSubTable.row(this).data().targetQty;
		selectFaultyType();

		$('#popupLotNo').val(lotNo);
		$('#popupTargetQty').val(targetQty);

		if(approvalYn=="002"){
			$('#btnFaultyTypeSave').removeClass('d-none');
	   		$('input[name=faultyTypeQty]').attr('disabled',false)
	   		$('input[name=faultyTypeDate]').attr('disabled',false)
	   		$('input[name=faultyTypeDesc]').attr('disabled',false)
		}else{
			$('#btnFaultyTypeSave').addClass('d-none');
	   		$('input[name=faultyTypeQty]').attr('disabled',true)
	   		$('input[name=faultyTypeDate]').attr('disabled',true)
	   		$('input[name=faultyTypeDesc]').attr('disabled',true)
		}

		
		
		
    });

	//불량유형 팝업 시작
	var faultyTypePopUpTable;
	
	function selectFaultyType() {
		if (faultyTypePopUpTable == null || faultyTypePopUpTable == undefined) {
			faultyTypePopUpTable = $('#faultyTypePopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : false,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				searching : false,
				ajax : {
					url : '<c:url value="qm/itemCompleteFaultyTypeRead"/>',
					type : 'GET',
					async : false,
					data : {
						'doNo' : function(){return doNo;},
						'doNoSub' : function(){return doNoSub;},
						'icaSeq' : function(){return icaSeq;}, 
					}
				},
				rowId : 'etc1',
				columns : [ 
					{
						render: function(data, type, row, meta){
							return meta.row+1;
						}
					},
					{data : 'faultyTypeNm',
						render: function(data, type, row, meta){
							var html="";
							html += '<input type="hidden" name="faultyTypeCd" value="'+row['faultyTypeCd']+'" style="text-align:center;">';
							html += '<input type="text" class="form-control" name="faultyTypeNm" value="'+data+'"  style="text-align:center; border:none;" readonly >';
							return html;
						}
					},
					{data : 'faultyTypeQty',
						render: function(data, type, row, meta) {
							if(data!=null){
								return '<input type="text" class="form-control" name="faultyTypeQty" value="'+data+'"  style="text-align:right;">';
							}else{
								return '<input type="text" class="form-control" name="faultyTypeQty" value="0" style="text-align:right;">';
							}
						}
					},
					{data : 'faultyTypeDate',
						render: function(data, type, row, meta) {	
							if(data!=null){
								return '<input type="date" class="form-control"  name="faultyTypeDate" value="'+moment(data).format("YYYY-MM-DD")+'" />';  
								
							} else{
								return '<input type="date" class="form-control" name="faultyTypeDate" value="'+serverDate+'" />'  

							}
						}
					},		   
					{data : 'faultyTypeDesc',
						render: function(data, type, row, meta) {
							if(data!=null){
								return '<input type="text" class="form-control" name="faultyTypeDesc" maxlength="64" placeholder="64자 내외" value="'+data+'">';
							}else{
								return '<input type="text" class="form-control" name="faultyTypeDesc" maxlength="64" placeholder="64자 내외" value="">';
							}
						}
					}
			],
		    order: [
		        [ 2, 'desc' ] ,[1,'asc']
		    ],
		    columnDefs: [
	        	{"className": "text-center", "targets": "_all"},
	        	
	        ],
		});
		} else {
			$('#faultyTypePopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#faultyTypePopUpModal').modal('show');
	}


	// 완제품검사관리대장 바코드별 저장 처리
	$('#btnFaultyTypeSave').on('click',function() {
		var dataArray = new Array();		
		var check=true;  		
		var sum=0;

		if ($('#inspectChargrNm').val() == "") {				 
			toastr.warning('팝업창을 닫고 검사자를 입력해주세요.');
			check=false;
			jrCheck=false;
			return false;
		}  

		if(!$.trim($('input[name=faultyTypeQty]').val())){
			toastr.warning('불량수량을 입력해주세요.');
			check=false;
			jrCheck=false;
			return false;
		}
		
		$('#faultyTypePopUpTable tbody tr').each(function(index, item){
			sum+=parseFloat($(this).find("td input[name=faultyTypeQty]").val().replace(/,/g,''));
			if(sum>$('#popupPreInWhsQty').val()){
				toastr.warning("불량수량값을 초과했습니다.");
				check=false;
				jrCheck=false;
				return false;
			}
		});

		if(check){
			$('#faultyTypePopUpTable tbody tr').each(function(index, item){
				var rowData = new Object();
				
				rowData.doNo= doNo;
				rowData.doNoSub = doNoSub;
				rowData.icaSeq = icaSeq;

				rowData.pairQty = parseFloat($('#popupTargetQty').val().replace(/,/g,'')) - sum;
				rowData.faultyQty = sum;
				rowData.judgment = sum > 0 ? "002" : "001";	//불합격이 있을 경우 : 불합격/ 없을 경우 : 합격

				
				rowData.faultyTypeCd = $(this).find("td input[name=faultyTypeCd]").val();
				rowData.faultyTypeQty = $(this).find("td input[name=faultyTypeQty]").val();
				rowData.faultyTypeDate = $(this).find("td input[name=faultyTypeDate]").val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find("td input[name=faultyTypeDesc]").val();
		        dataArray.push(rowData);
			});
		}
	
		if(check){
			$.ajax({
				url : '<c:url value="io/itemCompleteFaultyTypeCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if (res.result == 'ok') {

						$('#pairQty').val(res.totalPairQty);
						$('#faultyQty').val(res.totalFaultyQty);
						
						$('#completeSubTable').DataTable().ajax.reload(function(){});
						$('#completeAdmTable').DataTable().ajax.reload(function(){});
						$('#faultyTypePopUpModal').modal('hide');
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
	
	//등록 버튼 클릭시
	$('#btnAdd').on('click', function() {  		
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("등록할 항목을 선택해 주세요.");
			return false;
		}
		uiProc(false);	
		sideView = 'add';
		btnView = 'add';

		$('#inspectCnt').val("0");
		$('#faultyQty').val("0");
		$('#pairQty').val(targetQty);
		$('#inspectChargrNm').val(userNm);
		$('#inspectChargr').val(userNumber);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		
		$('#btnAdd').attr('disabled',true);
		$('#btnInspPopup').attr('disabled',false);
		$('#qaEval').attr('disabled',true);
		$('#completeSubTable').addClass('tr_highlight_row');	//hover
		
	});

	//수정 버튼 클릭시
	$('#btnEdit').on('click',function(){

		if(completeAdmTable.row(tableIdx).data().completeStatusCd=="001"){
			toastr.warning("이미 승인된 항목입니다. 확인해주세요.");
			return false;
		}	 
		
		if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}
		
		uiProc(false);	
		sideView = 'edit';
		btnView = 'edit';
		
		$('#btnSave').removeClass('d-none');
		$('#btnTypeAdd').attr('disabled',false);
		$('#qaEval').attr('disabled',true);
		$('#completeSubTable').addClass('tr_highlight_row');	//hover
	});
	
	//저장버튼 클릭시
	$('#btnSave').on('click', function() {
		if($('#inspectDate').val()==""){
			toastr.warning("검사일을 선택해주세요.");
			$('#inspectDateCalendar').focus();
			return false;
		}
		if($('#inspectChargr').val()==""){
			toastr.warning("검사자를 선택해주세요.");
			$('#btnAdmChargr').focus();
			return false;
		}
		if ( $('#inspectCnt').val()*1 <= 0 ) {
			toastr.warning("검사수량을 입력해주세요.");
			$('#inspectCnt').focus();
			return false;
		}
		if ( $('#targetQty').val()*1 < $('#inspectCnt').val()*1 ) {
			toastr.warning("검사수량이 요청수량을 초과하였습니다.");
			$('#inspectCnt').focus();
			return false;
		}
		if ( $('#cavityCnt').val() == "" ) {
			toastr.warning("초.중.종 시료수를 선택해주세요.");
			$('#cavityCnt').focus();
			return false;
		}

		let url= "";
		if ( btnView == "add" ) {
			url = '<c:url value="qm/itemCompleteMasterCreate"/>';
		} else {
			url = '<c:url value="qm/itemCompleteMasterUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'doNo' 				: function(){ return doNo; },
				'doNoSub' 			: function(){ return doNoSub; },
				'inspectCnt' 		: function(){ return $('#inspectCnt').val().replace(/,/g,''); },
				'inspectDate' 		: function(){ return $('#inspectDate').val().replace(/-/g,''); },
				'inspectChargr' 	: function(){ return $('#inspectChargr').val(); },
				'qaEval' 			: function(){ return $('#qaEval').val(); },
				'approvalYn' 		: function(){ return "002"; },	//미승인
				'cavityCnt' 		: function(){ return $('#cavityCnt option:selected').val(); },
				'inspectDesc' 		: function(){ return $('#inspectDesc').val(); },
			},
			success : function(res){
				if ( res.result == "ok" ) {
					toastr.success("저장 되었습니다.");
					uiProc(true);

					$('#btnAdd').attr('disabled', false);
			    	$('#btnEdit').attr('disabled', false);	
			    	$('#btnSave').addClass('d-none');
					$('#btnApprove').attr('disabled', false);

					$('#completeAdmTable').DataTable().ajax.reload(function(){});
					$('#completeSubTable').removeClass('tr_highlight_row');	//hover
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//승인버튼 클릭시
	$('#btnApprove').on('click', function() {
		if($(this).text()=="승인"){
			
			if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
				toastr.warning("목록을 선택해 주세요.");
				return false;
			}
			if ($('#inspectDate').val() == "") {
				toastr.warning("우선 등록을 먼저 해주세요.");
				return false;
			}
			if ( $('#inspectCnt').val()*1 <= 0 ) {
				toastr.warning("검사수량을 입력해주세요.");
				$('#inspectCnt').focus();
				return false;
			}
			
			$.ajax({
				url : '<c:url value="/qm/itemCompleteStatusUpdate"/>',
				type : 'POST',
				data : {
					'doNo' 			: function(){ return doNo; },
					'doNoSub' 		: function(){ return doNoSub; },
					'approvalYn' 	: function(){ return '001'; },
				},
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						var dataArray = new Array();
						$('#completeSubTable tbody tr').each(function(index, item){
							var rowData = new Object();
	
							rowData.doNo = doNo;
							rowData.doNoSub = doNoSub;
							rowData.doSeq = completeSubTable.row(this).data().doSeq;
							rowData.outputQty = completeSubTable.row(this).data().pairQty;
							rowData.barcodeNo = completeSubTable.row(this).data().lotNo;
							rowData.outputDate = outputDate; //출하일자
							rowData.itemSeq = itemSeq;
							rowData.itemGubun = itemGubun;
							
					        dataArray.push(rowData);
						});
						console.log(dataArray);
					 
						$.ajax({
							url : '<c:url value="qm/itemOutCreate"/>',
							type : 'POST',
							datatype: 'json',
							data: JSON.stringify(dataArray),
							contentType : "application/json; charset=UTF-8",
							success : function(res) {
								if (res.result == 'ok') {
									$('#completeAdmTable').DataTable().ajax.reload(function(){});
									$('#btnApprove').attr('disabled', true);	//승인버튼 비활성화
									$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
									$('#btnEdit').attr('disabled', true);		//수정버튼 비활성화
	
									$('#btnInspPopup').attr('disabled', false);	//검사항목 활성화
									$('#btnInspAdd').addClass('d-none');		//수정버튼 숨김처리
									$('#btnInspSave').addClass('d-none');		//저장버튼 숨김처리

									$('#btnApprove').text('승인취소');
									
									toastr.success('출하등록 되었습니다.');
								} else {
									toastr.error(res.message);
								}
							},
							complete : function(){
								$('#my-spinner').hide();
							}
						});
					} else if (res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				},
			});
		}else{
			if (!$('#completeAdmTable tbody tr').hasClass('selected')) {
				toastr.warning("목록을 선택해 주세요.");
				return false;
			}

			if ($('#inspectDate').val() == "") {
				toastr.warning("우선 등록 먼저 해주세요.");
				return false;
			}
			$.ajax({
				url : '<c:url value="/qm/itemCompleteStatusUpdate"/>',
				type : 'POST',
				data : {
					'doNo' : function() {return doNo;},
					'doNoSub' : function() {return doNoSub;},
					'approvalYn' : '002',	
				},
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success('승인취소되었습니다.');		
						$('#completeAdmTable').DataTable().ajax.reload(function(){});	

						if(qaEval!=null && qaEval!=""){
							$('#btnApprove').attr('disabled',false);//승인버튼 비활성화
							$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
						}else{
							$('#btnApprove').attr('disabled',true);	//승인버튼 비활성화
							$('#btnCancel').attr('disabled', true);	//승인취소버튼 활성화
						}	
						
						$('#btnOutAdd').attr('disabled', true);	//출하등록 활성화
						$('#btnAdd').attr('disabled', true);		//등록버튼 비활성화
						$('#btnEdit').attr('disabled', false);		//수정버튼 비활성화

						$('#btnInspPopup').attr('disabled', false);	//검사항목 활성화
						$('#btnInspAdd').removeClass('d-none');		//수정버튼 숨김처리
						$('#btnInspSave').removeClass('d-none');		//저장버튼 숨김처리
						
						/* $('#btnApprove').attr('disabled',false);
						$('#btnCancel').attr('disabled',true); */

						$('#btnApprove').text('승인');
						
					} else if (res.result == 'fail') {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}

					$('#my-spinner').hide();
				}
			});
		}
	});

	let cavityCnt2Code = new Array();
	
	//검사항목등록
	$('#btnInspPopup').on('click',function(){

		if(!$('#completeAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			return false;
		}
		
		inspTypeVal = '외관';
		
		$('#inspPopupModal').modal('show');

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');

		if(approvalYn!=null && approvalYn=="001"){
			$('#btnInspAdd').addClass('d-none');
			$('#btnInspSave').addClass('d-none');
		}
		
		extTbColumnVisible($('#cavityCnt').val()*1);
	});
	

	var inspTypeVal="외관";
	//외관 버튼 클릭시
	$('#btnExt').on('click',function(){
		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#cavityCnt').val()*1);
	});
	
	//치수 버튼 클릭시
	$('#btnSize').on('click',function(){
		inspTypeVal = '치수';
		
		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		
		sizeTbColumnVisible($('#cavityCnt').val()*1);
		
	});

	//외관 테이블 컬럼 화면 변경
	function extTbColumnVisible(sampleCntVal){
		extAdmTable.column(4).visible(true);
	 	extAdmTable.column(5).visible(true);
	 	extAdmTable.column(6).visible(true);
	 	extAdmTable.column(7).visible(true);
	 	extAdmTable.column(8).visible(true);
	 	extAdmTable.column(9).visible(true);
	 	extAdmTable.column(10).visible(true);
	 	extAdmTable.column(11).visible(true);
	 	extAdmTable.column(12).visible(true);
	 	
		switch ( sampleCntVal ) {
		 	case 1:
		 		extAdmTable.column(4).visible(false);
		 	case 2:
			 	extAdmTable.column(5).visible(false);
		 	case 3:
			 	extAdmTable.column(6).visible(false);
		 	case 4:
			 	extAdmTable.column(7).visible(false);
		 	case 5:
			 	extAdmTable.column(8).visible(false);
		 	case 6:
			 	extAdmTable.column(9).visible(false);
		 	case 7:
			 	extAdmTable.column(10).visible(false);
		 	case 8:
			 	extAdmTable.column(11).visible(false);
		 	case 9:
			 	extAdmTable.column(12).visible(false);
	 	}
		let minWidth = (sampleCntVal * 90) + "px";
		$('#extBlueTh').css("min-width", minWidth);
		
		setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		}, 300);
	}
	
	//치수 테이블 컬럼 화면 변경
	function sizeTbColumnVisible(sampleCntVal){
	 	sizeAdmTable.column(6).visible(true);
	 	sizeAdmTable.column(7).visible(true);
	 	sizeAdmTable.column(8).visible(true);
	 	sizeAdmTable.column(9).visible(true);
	 	sizeAdmTable.column(10).visible(true);
	 	sizeAdmTable.column(11).visible(true);
	 	sizeAdmTable.column(12).visible(true);
	 	sizeAdmTable.column(13).visible(true);
	 	sizeAdmTable.column(14).visible(true);
	 	
		switch ( sampleCntVal ) {
		 	case 1:
			 	sizeAdmTable.column(6).visible(false);
		 	case 2:
			 	sizeAdmTable.column(7).visible(false);
		 	case 3:
			 	sizeAdmTable.column(8).visible(false);
		 	case 4:
			 	sizeAdmTable.column(9).visible(false);
		 	case 5:
			 	sizeAdmTable.column(10).visible(false);
		 	case 6:
			 	sizeAdmTable.column(11).visible(false);
		 	case 7:
			 	sizeAdmTable.column(12).visible(false);
		 	case 8:
			 	sizeAdmTable.column(13).visible(false);
		 	case 9:
			 	sizeAdmTable.column(14).visible(false);
	 	}
		let minWidth = (sampleCntVal * 90) + "px";
		$('#sizeBlueTh').css("min-width", minWidth);
		
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable.draw();
		}, 300);
	}

	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){
		$('select[name=inspResult]').attr('disabled', false);

		$('input[name=inspX1]').attr('disabled', false);
		$('input[name=inspX2]').attr('disabled', false);
		$('input[name=inspX3]').attr('disabled', false);
		$('input[name=inspX4]').attr('disabled', false);
		$('input[name=inspX5]').attr('disabled', false);
		$('input[name=inspX6]').attr('disabled', false);
		$('input[name=inspX7]').attr('disabled', false);
		$('input[name=inspX8]').attr('disabled', false);
		$('input[name=inspX9]').attr('disabled', false);
		$('input[name=inspX10]').attr('disabled', false);
		
		$('select[name=inspResult1]').attr('disabled', false);
		$('select[name=inspResult2]').attr('disabled', false);
		$('select[name=inspResult3]').attr('disabled', false);
		$('select[name=inspResult4]').attr('disabled', false);
		$('select[name=inspResult5]').attr('disabled', false);
		$('select[name=inspResult6]').attr('disabled', false);
		$('select[name=inspResult7]').attr('disabled', false);
		$('select[name=inspResult8]').attr('disabled', false);
		$('select[name=inspResult9]').attr('disabled', false);
		$('select[name=inspResult10]').attr('disabled', false);

		//focus&select
		$('#extAdmTable select[name=inspResult1').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
		$('#sizeAdmTable input[name=inspX1]').eq(0).select();
	});


	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array();
		
		if(inspTypeVal == "외관"){
			$('#extAdmTable tbody tr').each(function(index, item) {

				var rowData = new Object();

				rowData.inspResultGubun = "001";
				rowData.inspSourceNo = doNo;
				rowData.inspSourceSubNo = doNoSub;
				rowData.inspCd = extAdmTable.row(index).data().inspCd;
				rowData.inspType = extAdmTable.row(index).data().inspType;
				rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
				rowData.inspCavity = '001';
				rowData.inspectGubun = "";

				//inspResult 값 설정
				let resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val()*1;
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					if ( $(this).find('td select[name=inspResult'+i+']').val() == "001" ) {
						resultYCnt++;
					}
					if ( $(this).find('td select[name=inspResult'+i+']').val() == "" ) {
						resultYCnt = -1;
						break;
					}
				}
				if(resultYCnt == cavityCntVal){
					rowData.inspResult = "001";	//합격
				}else if(resultYCnt == -1){
					rowData.inspResult = "";	//미판정
				}else{
					rowData.inspResult = "002";	//불합격
				}
				
				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch (cavityCntVal) {
					case 10:
						rowData.inspX10 = $(this).find('td select[name=inspResult10]').val();
					case 9:
						rowData.inspX9 = $(this).find('td select[name=inspResult9]').val();
					case 8:
						rowData.inspX8 = $(this).find('td select[name=inspResult8]').val();
					case 7:
						rowData.inspX7 = $(this).find('td select[name=inspResult7]').val();
					case 6:
						rowData.inspX6 = $(this).find('td select[name=inspResult6]').val();
					case 5:
						rowData.inspX5 = $(this).find('td select[name=inspResult5]').val();
					case 4:
						rowData.inspX4 = $(this).find('td select[name=inspResult4]').val();
					case 3:
						rowData.inspX3 = $(this).find('td select[name=inspResult3]').val();
					case 2:
						rowData.inspX2 = $(this).find('td select[name=inspResult2]').val();
					case 1:
						rowData.inspX1 = $(this).find('td select[name=inspResult1]').val();
				}
				
				rowData.cavityNo1 = '';
				rowData.cavityNo2 = '';
				rowData.cavityNo3 = '';
				rowData.cavityNo4 = '';
				rowData.cavityNo5 = '';
				
				dataArray.push(rowData);
				console.log(rowData)
			});
		} else { //치수
			$('#sizeAdmTable tbody tr').each(function(index, item) {

				var rowData = new Object();
				
				rowData.inspResultGubun = "001";
				rowData.inspSourceNo = doNo;
				rowData.inspSourceSubNo = doNoSub;
				rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
				rowData.inspType = sizeAdmTable.row(index).data().inspType;
				rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
				rowData.inspCavity = '001';
				rowData.inspectGubun = "";

				let min = sizeAdmTable.row(index).data().inspStandLower;
				let max = sizeAdmTable.row(index).data().inspStandUpper;
				
				let resultYCnt = 0;
				let cavityCntVal = $('#cavityCnt').val()*1;
				
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					let inspData = $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

					if ( !((parseFloat(min) > parseFloat(inspData)) || (parseFloat(inspData) > parseFloat(max))) ) {
						resultYCnt++;
					}
					if ( inspData == null || inspData == "" ) {
						resultYCnt = -1;
						break;
					}
				}
				if (resultYCnt == cavityCntVal) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1) {
					rowData.inspResult = "";	//미판정
				} else {
					rowData.inspResult = "002";	//불합격
				}
				
				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';
				rowData.inspX6 = '';
				rowData.inspX7 = '';
				rowData.inspX8 = '';
				rowData.inspX9 = '';
				rowData.inspX10 = '';
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch (cavityCntVal) {
					case 10:
						rowData.inspX10 = $(this).find('td input[name=inspX10]').val();
					case 9:
						rowData.inspX9 = $(this).find('td input[name=inspX9]').val();
					case 8:
						rowData.inspX8 = $(this).find('td input[name=inspX8]').val();
					case 7:
						rowData.inspX7 = $(this).find('td input[name=inspX7]').val();
					case 6:
						rowData.inspX6 = $(this).find('td input[name=inspX6]').val();
					case 5:
						rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
					case 4:
						rowData.inspX4 = $(this).find('td input[name=inspX4]').val();
					case 3:
						rowData.inspX3 = $(this).find('td input[name=inspX3]').val();
					case 2:
						rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
					case 1:
						rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
				}
				
				rowData.cavityNo1 = '';
				rowData.cavityNo2 = '';
				rowData.cavityNo3 = '';
				rowData.cavityNo4 = '';
				rowData.cavityNo5 = '';
				
				dataArray.push(rowData);
				console.log(rowData)
			});
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspComResultAdmCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {

						$('select[name=inspResult]').attr('disabled', true);
						$('input[name=inspX1]').attr('disabled', true);
						$('input[name=inspX2]').attr('disabled', true);
						$('input[name=inspX3]').attr('disabled', true);
						$('input[name=inspX4]').attr('disabled', true);
						$('input[name=inspX5]').attr('disabled', true);
						$('input[name=inspX6]').attr('disabled', true);
						$('input[name=inspX7]').attr('disabled', true);
						$('input[name=inspX8]').attr('disabled', true);
						$('input[name=inspX9]').attr('disabled', true);
						$('input[name=inspX10]').attr('disabled', true);
						
						$('select[name=inspResult1]').attr('disabled', true);
						$('select[name=inspResult2]').attr('disabled', true);
						$('select[name=inspResult3]').attr('disabled', true);
						$('select[name=inspResult4]').attr('disabled', true);
						$('select[name=inspResult5]').attr('disabled', true);
						$('select[name=inspResult6]').attr('disabled', true);
						$('select[name=inspResult7]').attr('disabled', true);
						$('select[name=inspResult8]').attr('disabled', true);
						$('select[name=inspResult9]').attr('disabled', true);
						$('select[name=inspResult10]').attr('disabled', true);


						let inspTypeArr = ['001','002'];

						$.ajax({
							url : '<c:url value="bm/getInspResultByBongjae" />',
							type : 'GET',
							data : {
								'inspCd' 		  	: function(){ return inspCdVal; },
								'inspResultGubun' 	: function(){ return "001"; },
								'inspSourceNo' 		: function(){ return doNo; },
								'inspSourceSubNo' 	: function(){ return doNoSub; },
								'inspTypeArr' 		: function(){ return inspTypeArr; },
								'cavityCnt' 		: function(){ return parseInt(cavityCnt); },
							}, 
							success : function(res){
								var inspectResult = res.data;		//검사항목 결과
								if ( inspectResult == "Y" ) {
									$('#qaEval').val('001').attr('checked',true);
									$('#btnApprove').attr('disabled',false);
								} else if ( inspectResult == "N" ) {
									$('#qaEval').val('002').attr('checked',true);
									$('#btnApprove').attr('disabled',false);
								} else if ( inspectResult == "U" ) {
									$('#qaEval').val('').attr('checked',true);
								}

								$.ajax({
									url : '<c:url value="qm/itemCompleteMasterUpdate"/>',
									type : 'POST',
									async : false,
									data : {
										'doNo' 		: function(){return doNo;},
										'doNoSub' 	: function(){return doNoSub;},
										'qaEval' 	: function(){return $('#qaEval').val()},
									},
									success : function(res){
										if(res.result == "ok"){
									    	$('#completeAdmTable').DataTable().ajax.reload();
										}else{
											toastr.error(res.message);
										}
									}
								});

								console.log(inspectResult);
								if (inspectResult != "U") {
									var dataArray = new Array();
									$('#completeSubTable tbody tr').each(function(index, item){
										var rowData = new Object();
										rowData.doNo = doNo;
										rowData.doNoSub = doNoSub;
										rowData.icaSeq = completeSubTable.row(this).data().doSeq;
										rowData.inspectDate = $('#inspectDate').val().replace(/-/g,'');

										if(inspectResult=="Y"){
											rowData.pairQty = completeSubTable.row(this).data().targetQty.replace(/,/g,'');
											rowData.faultyQty = "0";
											rowData.judgment = "001";	//합격
										}else if(inspectResult=="N"){
											rowData.pairQty = "0";
											rowData.faultyQty = "0";
											rowData.judgment = "";		//미판정
										}

									    dataArray.push(rowData);
									});

									$.ajax({
										url : '<c:url value="qm/itemCompleteAllCreate"/>',
										type : 'POST',
										datatype: 'json',
										data: JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										success : function(res) {				
											if (res.result == 'ok') {
												$('#completeSubTable').DataTable().ajax.reload(function(){});
												$('#my-spinner').hide();
												toastr.success("등록되었습니다.");
											}else{
												toastr.error(res.message);
											}
										}
									});

									console.log(dataArray);
									
								} else {
									$.ajax({
										url : '<c:url value="qm/itemCompleteAllDelete"/>',
										type : 'POST',
										data: {
											'doNo' : function(){return doNo;},
											'doNoSub' : function(){return doNoSub;},
										},
										success : function(res) {				
											if (res.result == 'ok') {
												$('#completeSubTable').DataTable().ajax.reload(function(){});
												$('#my-spinner').hide();
												toastr.success("등록되었습니다.");
											}else{
												toastr.error(res.message);
											}
										}
									}); 
								}
							}
						});
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});
	
	//외관 목록
	let extAdmTable = $('#extAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : -1,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 3
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return doNoSub;},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "001";},
				'inspCavity' : function(){return inspCavityVal;},
				'itemSeq' : function(){return itemSeq;},
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{//기준
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 3rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//X1
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult1", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult1", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
			{//X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="002"){
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult2", row['inspX2'], row, meta, "2");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult2", row['inspX2'], row, meta, "2");
					}
				},
				'className' : 'text-center'
			},
			{//X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="003"){
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult3", row['inspX3'], row, meta, "3");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult3", row['inspX3'], row, meta, "3");
					}
				},
				'className' : 'text-center'
			},
			{//X4
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="004"){
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult4", row['inspX4'], row, meta, "4");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult4", row['inspX4'], row, meta, "4");
					}
				},
				'className' : 'text-center'
			},
			{//X5
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="005"){
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult5", row['inspX5'], row, meta, "5");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult5", row['inspX5'], row, meta, "5");
					}
				},
				'className' : 'text-center'
			},
			{//X6
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult6", row['inspX6'], row, meta, "6");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult6", row['inspX6'], row, meta, "6");
					}
				},
				'className' : 'text-center'
			},
			{//X7
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult7", row['inspX7'], row, meta, "7");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult7", row['inspX7'], row, meta, "7");
					}
				},
				'className' : 'text-center'
			},
			{//X8
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult8", row['inspX8'], row, meta, "8");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult8", row['inspX8'], row, meta, "8");
					}
				},
				'className' : 'text-center'
			},
			{//X9
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult9", row['inspX9'], row, meta, "9");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult9", row['inspX9'], row, meta, "9");
					}
				},
				'className' : 'text-center'
			},
			{//X10
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else if(data=="002"){
						return selectBoxHtml2(silhangCode,"inspResult10", row['inspX10'], row, meta, "10");
					}else{
						return selectBoxHtml2(judgeCode,"inspResult10", row['inspX10'], row, meta, "10");
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	//치수 목록 - 봉제
	let sizeAdmTable = $('#sizeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '35vh',
		pageLength : -1,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 5
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "001"},
				'inspSourceNo' : function(){return doNo;},
				'inspSourceSubNo' : function(){return doNoSub;},
				'inspGubun' : function(){return "001"},
				'inspType' : function(){return "002";},
				'inspCavity' : function(){return inspCavityVal;},
				'itemSeq' : function(){return itemSeq;},
			},
		},
		columns : [
			{//순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
        		},
				'className' : 'text-center'
			},
			{//목록
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//확인방법
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center'
			},
			{//기준 - 하한
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="003"){ //전체||하한
							return '<input type="text" class="form-control" name="inspStandLower" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" disabled />';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},  
			{//X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X4
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X5
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X6
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X7
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X8
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X9
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X10
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ],
		drawCallback : function() {
			var api = this.api();

			for ( var i=0; i < api.data().count(); i++ ) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				let cavityCntVal = $('#cavityCnt').val()*1;
				
				for (var r = 1; r <= cavityCntVal; r++) {
					let rString = "inspX"+r;
					let inspResult = "";
					
					switch(r){
						case 1:
							inspResult = api.row(i).data().inspX1;
							break;
						case 2:
							inspResult = api.row(i).data().inspX2;
							break;
						case 3:
							inspResult = api.row(i).data().inspX3;
							break;
						case 4:
							inspResult = api.row(i).data().inspX4;
							break;
						case 5:
							inspResult = api.row(i).data().inspX5;
							break;
						case 6:
							inspResult = api.row(i).data().inspX6;
							break;
						case 7:
							inspResult = api.row(i).data().inspX7;
							break;
						case 8:
							inspResult = api.row(i).data().inspX8;
							break;
						case 9:
							inspResult = api.row(i).data().inspX9;
							break;
						case 10:
							inspResult = api.row(i).data().inspX10;
							break;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#92d050');
					}else{
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#f6f7f9');
					}
				}
			} 
		}
	});

	//소숫점 2자리 제한
	$(document).on('keyup',"input[name=inspX1],input[name=inspX2],input[name=inspX3],input[name=inspX4],input[name=inspX5]", function(event){
		var _pattern3 = /^\d*[.]\d{3}$/;	//누르고있는 키는 예외처리 안됨
        if (_pattern3.test( $(this).val())) {
        	toastr.warning("소수점 둘째 자리까지 입력 가능합니다.");
        	$(this).val("0");
 			$(this).select();
            return false;
		}
	});

	//x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){
		let inspResult = "";
		if(inspTypeVal=="치수"){
			inspResult = $('#sizeAdmTable').find('input[name='+result+']').eq(row).val();
			console.log('inspResult:'+inspResult);

			if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
				$('#sizeAdmTable').find('input[name='+result+']').eq(row).css('background','#ff0000');
			}else{
				$('#sizeAdmTable').find('input[name='+result+']').eq(row).css('background','#92d050');
			}
			
		}
	} 
	
	function selectBoxAppend2(obj, id, sVal, flag) {
		$('select[name="' + id + '"]').empty();

		for (key in obj) {
			var option;
			if (obj[key].baseCd == sVal) {
				option = $("<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>");
			} else {
				option = $("<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>");
			}
			$('select[name="' + id + '"]').append(option);
		}

	}

	function fileDelete() {
		$.ajax({
			url : '<c:url value="/qm/itemCompleteImageDelete"/>',
			type : 'POST',
			async : false,
			data : {
				'workOrdNo' : function() {return ordLotNo;},
				'itemSeq' : function() {return itemSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					$('#fileNm').val('');
					$('#fpValue').text("파일을 선택해주세요");
				} else {
					toastr.error(res.message);
				}
			}
		});
	}
	


	//담당자조회 팝업 시작
	var userPopUpTable;
	function selectadmChargr() {
		if (userPopUpTable == null || userPopUpTable == undefined) {
			userPopUpTable = $('#userPopUpTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {
						'departmentCd' : '007'			
					}
				},
				rowId : 'userNumber',
				columns : [ 
				{
					data : 'userNm'
				}, 
				{
					data : 'departmentNm'
				}, 
				{
					data : 'postNm'
				}, 
				{
					data : 'chargeDutyNm'
				},
				{
					data : 'userDesc'
				}, 
				],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4],
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#inspectChargr').val(data.userNumber);
				$('#inspectChargrNm').val(data.userNm);
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {
			});
		}

		$('#userPopUpModal').modal('show');
	}


	function uiProc(flag){
		$('#inspectDateCalendar').attr('disabled',flag);
		$('#btnAdmChargr').attr('disabled',flag);		
		$('#inspectCnt').attr('disabled',flag);
		$('#qaEval').attr('disabled',flag);
		$('#judgment').attr('disabled',flag);
		$('#lineRes').attr('disabled',flag);
		$('#lineInd').attr('disabled',flag);
		$('#backEmf').attr('disabled',flag);
		$('#phaseCurr').attr('disabled',flag);
		$('#specialDesc').attr('disabled',flag);
		$('#completeDesc').attr('disabled',flag);
		$('#completeDesc2').attr('disabled',flag);
		$('#fileNm').attr('disabled',flag);
		$('#faultyType').attr('disabled',flag);
		$('#cavityCnt').attr('disabled',flag);
	}
	

	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta, idx) {

		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" id="e-'+id+'-'+meta.row+'" onkeydown="moveFocus(\'e\','+idx+','+meta.row+')" data-col="' + meta.col + '" disabled>';
		
		var option = "<option value=''>선택</option>";
		for (key in obj) {
			var tmp; 
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeq;},
			},
			type : 'GET',
			success : function(res) {
				var data = res.data;
				
				if (data.imageFile1 != null) {
					$('#imageFile1').attr("src", "data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
					
					imgSrc1 = data.imageFile1;
				} else {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
					
					imgSrc1 = '';
				}
				
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src", "data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
					
					imgSrc2 = data.imageFile2;
				} else {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
					
					imgSrc2 = '';
				}
				
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src", "data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
					
					imgSrc3 = data.imageFile3;
				} else {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
					
					imgSrc3 = '';
				}
				
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src", "data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
					
					imgSrc4 = data.imageFile4;
				} else {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
					
					imgSrc4 = '';
				}
				
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}
	
	var tempView = "";
	var attachSeq = "";
	
	//관련자료 목록
	let itemInspectAttachTable = $('#itemInspectAttachTable').DataTable({
		dom : "",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 1000000,
		scrollY : '60vh',
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return doNo;},
				'etc1' : function(){return doNoSub;},
				'attachGubun' : function(){return 'DO';},
			},
		},
		columns : [
				{
					render : function(data, type, row, meta) {
						tempNum = meta.row + meta.settings._iDisplayStart + 1;
						return tempNum;
					},
					'className' : 'text-center'
				},
				{
					data : 'contents',
					render : function(data, type, row, meta) {
						var html = "";
						html = selectBoxHtml2(contentsCode,"contents", data, row, meta, "100");
						return html;
					
						/* if (data != null) {
							var html = '<input type="hidden" class="form-control" style="text-align:center" name="attachSeq" value="'+row['attachSeq']+'" disabled />';
							html += '<input type="text" class="form-control" style="text-align:center" name="contents" value="'+data+'" disabled />';
							return html;
						} else {
							return '<input type="text" class="form-control" style="text-align:center" name="contents" value="" />';
						} */
					}
				},
				{
					data : 'attachFn',
					render : function(data, type, row, meta) {
						if (data != null) {
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+doNo+'&attachGubun=DO">'+data+'</a>';
							return html;
						} else {
							var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
							html += '<input type="file" class="custom-file-input" id="fileErNm'+tempNum+'" name="fileNm">';
							html += '<label class="custom-file-label" for="fileErNm'+tempNum+'"></label>';
							html += '</div></form>';
							return html;
						}
					}
				},
			],
		order : [ [ 0, 'asc' ], ],
		drawCallback: function(settings) {
        }, 
	});
	
	//관련자료 데이터 클릭 시
	$('#itemInspectAttachTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView = "";
		} else {
			$('#itemInspectAttachTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			tempView = "edit";
		}
		tableIdx = $('#itemInspectAttachTable').DataTable().row(this).index();
		attachSeq = itemInspectAttachTable.row(tableIdx).data().attachSeq;
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
 		$('#itemInspectAttachTable').DataTable().row.add({}).draw(false);
		$('#btnAttachSave').removeClass('d-none'); // 등록버튼
		$('#btnAttachAdd').attr('disabled', true);
 		$('#btnAttachDel').attr('disabled', true);

 		//추가한 행만 비활성화
 		$('select[name=contents]').eq(itemInspectAttachTable.data().count()-1).attr('disabled',false);

		tempView = '';
	});
	
	//관련자료 삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (tempView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(attachSeq != undefined && attachSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				async : false,
				data  : {
					'attachGubun' : function(){return 'DO';},
					'attachCd' : function(){return doNo;},
					'etc1' : function(){return doNoSub;},
					'attachSeq' : function(){return attachSeq;},
				},
				success  : function(res){
					$('#itemInspectAttachTable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
					
				}
			});
		} else {
			$('#itemInspectAttachTable').DataTable().rows(tableIdx).remove().draw();
			//toastr.success("삭제되었습니다.");
		}
		
		var attachSaveCheck = true;
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {
			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				attachSaveCheck = false;
			}
		});
		if(attachSaveCheck) {
			$('#btnAttachSave').addClass('d-none');
		} else {
			$('#btnAttachSave').removeClass('d-none');
		}
		
		tempView = '';

	});
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;
	
	// 관련자료 저장
	$('#btnAttachSave').on('click',function() {
		var check = true;
		var check2 = true;
		var dataArray = new Array();
	
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {

			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				toastr.warning('파일을 선택해 주세요.');
				$(this).find("td input[name=fileNm]").focus();
				check = false;
				return false;
			}
			
			index++;
			check2 = true;
			if ($(this).find("td input[name=fileNm]").val() == undefined) {
				check2 = false;
			}
			
			if(check && check2){
				var formData = new FormData(document.getElementById("formFile"+index));

				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					
					data : {
						'attachGubun' : 'DO',
						'attachCd' : function(){return doNo;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('path', fileDate);
				formData.append('attachCd', doNo);
				formData.append('etc1', doNoSub);
				formData.append('attachSeq', attachDataSeq);
				formData.append('attachGubun', 'DO');
				formData.append('idCheck', 'DO');
				formData.append('contents', $(this).find("td select[name=contents]").val());

				console.log($(this).find("td select[name=contents]").val());
				
				$.ajax({
					url : '<c:url value="/bm/attachDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							$('#btnAttachAdd').attr('disabled', false);
							$('#btnAttachDel').attr('disabled', false);
							$('#itemInspectAttachTable').DataTable().ajax.reload();
							
							tempView = "";
							$('#btnAttachSave').addClass('d-none');
							
						} else if (res.result == 'error') {
							toastr.error(res.message);
						}
					}
				});
			}
			
		});
		if(check && check2){
			toastr.success('등록되었습니다.');
		}
		
	});
	
	//셀렉트박스생성
// 	function selectBoxHtml2(obj, id, sVal, row, meta) {

// 		var shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		
// 		var option = "<option value=''>선택</option>";
// 		for (key in obj) {
// 			var tmp; 
// 			if (obj[key].baseCd == sVal) {
// 				tmp = "<option value="+ obj[key].baseCd+ " selected>"
// 						+ obj[key].baseNm + "</option>";
// 			} else {
// 				tmp = "<option value="+obj[key].baseCd+">"
// 						+ obj[key].baseNm + "</option>";
// 			}
// 			option += tmp;
// 		}
// 		var ehtml = '</select>';
// 		return shtml + option + ehtml;
// 	}
	
	//출하검사성적서&검사기준서 탭 클릭시
	$('#tab2Head').on('click', function() {
		$('#itemInspectAttachTable').DataTable().ajax.reload();
		var attachSaveCheck = true;
		$('#itemInspectAttachTable tbody tr').each(function(index, item) {
			if ($(this).find("td input[name=fileNm]").val() == "" && $(this).find("td input[name=fileNm]").val() != undefined) {
				attachSaveCheck = false;
			}
		});
		if(attachSaveCheck) {
			$('#btnAttachSave').addClass('d-none');
		} else {
			$('#btnAttachSave').removeClass('d-none');
		}
		
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		
	});
	
	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){
			console.log("커서이동입니다.");
			console.log("value:" + value);	//inspX1
			console.log("row:" + row);		//0

			if(type=="s"){//치수-봉제
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="e"){//외관
				rowCount = extAdmTable.data().count()-1;	//행수
			}

			console.log(rowCount >= row+1);
			console.log('#'+type+'-inspResult'+(value+1)+'-'+(row+1));
			
			if(type=="e"){
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspResult'+(value)+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspResult'+(value+1)+'-0').focus();
						$('#'+type+'-inspResult'+(value+1)+'-0').select();
					},10);
				}
			} else {
				if(rowCount >= row+1){
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').focus();
						$('#'+type+'-inspX'+(value)+'-'+(row+1)+'').select();
					},10);
				}else{
					setTimeout(function(){ 
						$('#'+type+'-inspX'+(value+1)+'-0').focus();
						$('#'+type+'-inspX'+(value+1)+'-0').select();
					},10);
				}
			}
			
			
		}
	}
	
	//이미지 모달 활성화
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
</script>

</body>
</html>
