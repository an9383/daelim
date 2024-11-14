<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	pageContext.setAttribute("newLineChar", "\n");
%>

<%@include file="../layout/body-top.jsp"%>

<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">반품등록</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 51%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive" style="height:450px">
						<table id="returnMasterTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>승인여부</th>
									<th>반품번호</th>
									<th class="text-center">반품수량</th>
									<th>반품등록일</th>
									<th>등록자</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
						
					<%-- <div class="table-responsive" style="height:200px">
						<table id="returnDetailTable" class="table table-bordered">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>발주번호</th>
									<th>CODE</th>
									<th>ITEM</th>
									<th>구분</th>
									<th>반품수량</th>
									<th>거래처</th>
								</tr>
							</thead>
						</table>
					</div> --%>
					<!-- /.table-responsive -->
				</div>
			</div>

			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar"
				id="myrSidenav" style="width: 48%;">
				<div class="card mb-2" id="formBox">
					<div class="rightsidebar-close">
						<a href="javascript:void(0)" id="left-expand"
							class="closebtn float-right" onclick="closerNav()"><i
							class="mdi mdi-close"></i></a>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<div id="myTabContent" class="tab-content">
						<!--하단 등록 부분 상단 버튼 영역-->
						<div class="card-body col-sm-12 p-2">
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnEdit">수정</button>
							<button class="btn btn-warning d-none" id="btnEditConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-right mr-1"
								id="btnAdd">등록</button>
							<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
								type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>

							<button type="button" class="btn btn-primary float-left mr-1"
								id="btnApprove">승인</button>
							<button class="btn btn-warning d-none"
								id="btnApproveConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
							<button type="button" class="btn btn-primary float-left mr-1"
								id="btnCancle">승인취소</button>
							<button class="btn btn-primary d-none"
								id="btnCancleConfirmLoading" type="button" disabled>
								<span class="spinner-border spinner-border-sm" role="status"
									aria-hidden="true"></span> 처리중
							</button>
						</div>
						<!--/오른쪽 등록 부분 상단 버튼 영역-->
						<form id="form" method="post" enctype="multipart/form-data">
							<div class="table-responsive">
								<table class="table table-lg table-bordered mb-2">
									<colgroup>
										<col width="20%">
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>반품번호</th>
											<td>
												<input type="text" class="form-control" id="retnNo" name="retnNo" disabled style="max-width: 100%" >
												<!-- <div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control"
														style="max-width: 100%" id="poSeq" name="poSeq" disabled>
													<input type="hidden" class="form-control"
														style="max-width: 100%" id="inSeq" name="inSeq" disabled>
													<input type="text" class="form-control"
														style="max-width: 100%" id="poNo" name="poNo" disabled>
													<button type="button"
														class="btn btn-primary input-sub-search" name="btnPoNo"
														id="btnPoNo" onClick="selectPoNo();" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div> -->
											</td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>반품등록일</th>
											<td>
												<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%"
														type="text" id="returnDate" name="returnDate" disabled />
													<button
														onclick="fnPopUpCalendar(returnDate,returnDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="returnDateCalendar" type="button" disabled>
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>담당자</th>
											<td>
												<div class="input-sub m-0" style="max-width: 100%">
													<input type="hidden" class="form-control" style="max-width: 100%" id="returnChargr" name="returnChargr" disabled> 
													<input type="text" class="form-control" style="max-width: 100%" id="returnChargrNm" name="returnChargrNm" disabled>
													<button type="button"
														class="btn btn-primary input-sub-search"
														name="btnRetrunChargr" id="btnReturnChargr"
														onClick="selectReturnChargr();" disabled>
														<span class="oi oi-magnifying-glass"></span>
													</button>
												</div>
											</td>
										</tr>
										<!-- <tr>
											<th>불량유형</th>
											<td><input type="text" class="form-control"
												id="returnTypeNm" name="returnTypeNm" style="max-width: 100%"
												disabled />
												<input type="hidden" id="returnType" name="returnType" />
												</td>
											<th>불량수량</th>
											<td>
												<input type="text" class="form-control"id="faultyCnt" name="faultyCnt" style="max-width: 100%; text-align: right;" disabled />
											</td>
										</tr> -->
										<!-- <tr>
											<th>거래처</th>
											<td><input type="text" class="form-control"
												id="dealCorpNm" name="dealCorpNm" style="max-width: 100%"
												disabled /></td>
											<th>연착처</th>
											<td><input type="text" class="form-control" id="telNo"
												name="telNo" style="max-width: 100%" disabled /></td>
										</tr>
										<tr>
											<th>기본 주소</th>
											<td colspan="3"><input type="text" class="form-control"
												id="addrBase" name="addrBase" style="max-width: 100%"
												disabled /></td>
										</tr>
										<tr>
											<th>상세 주소</th>
											<td colspan="3"><input type="text" class="form-control"
												id="addrDtl" name="addrDtl" style="max-width: 100%"
												disabled /></td>
										</tr>
										<tr>
											<th>반품등록일</th>
											<td>
												<div class="form-group input-sub m-0"
													style="max-width: 100%">
													<input class="form-control" style="max-width: 100%"
														type="text" id="returnDate" name="returnDate" disabled />
													<button
														onclick="fnPopUpCalendar(returnDate,returnDate,'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search"
														id="returnDateCalendar" type="button" disabled>
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
											<th>반품수량</th>
											<td><input type="text" class="form-control"
												id="returnQty" name="returnQty"
												style="max-width: 100%; text-align: right;" disabled/></td>
										</tr> -->
										<tr class="d-none">
											<th>수입검사성적서</th>
											<td colspan="3">
												<div class="row">
													<div class="custom-file d-none" id="fileSearch"
														style="width: 90%;">
														<input type="file" class="custom-file-input" id="fileNm"
															name="fileNm" value=""> <label
															class="custom-file-label" id="fpValue" for="fileNm">파일을 선택해주세요</label>
													</div>
													<div class="rightsidebar-close d-none" id="btnFpFileDel"
														style="width: 10%;">
														<button type="button" class="btn"
															onClick="inspectFileNmDel()">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div> <!--첨부파일1-->
												<div class="form-group m-0 mr-2 row p-0 " id="fileTag">
													<a href="/bm/downloadFile" id="fpHref"><span id="fpFn"></span></a>
												</div>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3"><input type="text" class="form-control"
												id="returnDesc" name="returnDesc" style="max-width: 100%"
												disabled /></td>
										</tr>
									</thead>
								</table>
							</div>
						</form>
					</div>
					<div class="card-body col-sm-12">
						<button type="button" class="btn btn-info float-left mb-2"
							id="btnGetReturnList" onClick="selectPoNo();" disabled>반품내역 불러오기</button>
						<button class="btn btn-primary d-none" id="btnGetReturnListConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
						<button type="button" class="btn btn-warning float-right mr-1"
							id="btnDel" disabled>삭제</button>
						<button class="btn btn-primary d-none" id="btnDelConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
						</button>
					</div>
					<table id="returnDetailTable" class="table table-bordered">
						<colgroup>
							<col width="10%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="20%">
							<col width="10%">
							<col width="20%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>발주번호</th>
								<th>품번</th>
								<th>품명</th>
								<th>차종</th>
								<th>구분</th>
								<th>반품수량</th>
								<th>거래처</th>
							</tr>
						</thead>
					</table>
					<div class="mt-2">
						<button type="button" class="btn btn-primary d-none float-right"
							id="btnSave">저장</button>
						<button class="btn btn-primary d-none" id="btnAddConfirmLoading"
							type="button" disabled>
							<span class="spinner-border spinner-border-sm" role="status"
								aria-hidden="true"></span> 처리중
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

	<!-- Modal Start-->
	<div class="modal fade" id="itemFaultyAdmPopupModal" tabindex="-1"
		role="dialog" aria-labelledby="itemFaultyAdmPopupLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="itemFaultyAdmPopupLabel">발주번호 조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="table-responsive" style="height: 650px">
						<table id="itemFaultyAdmPopupTable"
							class="table table-sm table-bordered">
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th><input type="checkbox" id="btnAllCheck"></th>
									<th>발주번호</th>
									<th>CODE</th>
									<th>ITEM</th>
									<th>구분</th>
									<th>검사자</th>
									<th>불량수량</th>
									<th>반품수량</th>
									<th>불량등록일</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="modal-footer">
						<input type="hidden" class="form-control" id="puFlag"
							name="puFlag">
						<button type="button" class="btn btn-primary"
							id="btnGetPartCntAll">가져오기</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
</div>
<%@include file="../layout/bottom.jsp"%>
<script>
	let currentHref = "iosc0100";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","반품등록"); 
	
	let viewIdx;
	let sideView = 'add';
	let btnView = 'add';

	var tableIdx = null;
	var poNo;
	var poSeq;

	var poNoVal;
	var poSeqVal;
	var inSeqVal;
	var retnNo;

	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	
	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로

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
			
			console.log(data.length);
			console.log(data);
			if (data.length != 0) {
				console.log('hi');
				$('#btnApprove').removeClass('d-none');
				$('#btnCancle').removeClass('d-none');
			}else if(data.length == 0){
				$('#btnApprove').addClass('d-none');
				$('#btnCancle').addClass('d-none');
			}
		},
	});

	uiProc(true);
	$('#returnDate').val(serverDateTo);

	   
    $('#saveBtnModalY').on('click',function() {
    	uiProc(true);
    	$('#btnSave').addClass('d-none');
    	$('#btnEdit').attr('disabled',false);
    	 $('#btnGetReturnList').attr('disabled',true);
         $('#btnDel').attr('disabled',true);
    });

	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "51%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});
 
    
	//발주관리 목록조회
	let returnMasterTable = $('#returnMasterTable').DataTable({
	    dom: "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>" +
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
			url : '<c:url value="io/purchaseOrderReturnMasterList"/>',
			type : 'GET',
			data : {				
				'startDate': function() { return serverDateFrom.replace(/-/g, ''); },
	           	'endDate': function() { return serverDateTo.replace(/-/g, ''); }
			}	
		},	
		rowId : 'poNo',
		columns : [ 
				{data :'approvalNm',
					render: function(data, type, row, meta) {
						if(data!=null){
							return data;
						}else{
							return '-';
						}
						
					}
				},
				{data :'retnNo'}, 
				{data :'returnQty'},
				{data :'returnDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{data :'returnChargrNm'},
				{data :'returnDesc'},
		],
		columnDefs: [
			{ "targets": [2] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
        	
        ],
	    order: [
	        [ 3, 'desc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

	// 보기
    $('#returnMasterTable tbody').on('click', 'tr', function () {
    	
    	if($('#btnSave').attr('class') == 'btn btn-primary float-right') {
    		$('#saveBtnModal').modal('show');
    		console.log("등록중입니다.");
    		return false;
    	}

        if ( $(this).hasClass('selected') ) {
            //$(this).removeClass('selected');
        }
        else {
        	$('#returnMasterTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

        sideView = 'edit';
    	retnNo = returnMasterTable.row( this ).data().retnNo;
    	
    	$('#retnNo').val(returnMasterTable.row(this).data().retnNo);
        $('#returnDate').val(moment(returnMasterTable.row(this).data().returnDate).format('YYYY-MM-DD'));
        $('#returnChargrNm').val(returnMasterTable.row(this).data().returnChargrNm);
        $('#returnChargr').val(returnMasterTable.row(this).data().returnChargr);
        $('#returnDesc').val(returnMasterTable.row(this).data().returnDesc);
    	
    	$('#returnDetailTable').DataTable().ajax.reload(function(){});
    	$('#btnGetReturnList').attr('disabled',true);

		console.log(returnMasterTable.row(this).data().fileName)
    	
    	if (returnMasterTable.row(this).data().fileName != null) {
			$('#fpHref').text(returnMasterTable.row(this).data().fileName + "." + returnMasterTable.row(this).data().fileType);
			$('#fpHref').attr('href','io/purchaseOrderReturnFileDownload?retnNo='+returnMasterTable.row(this).data().retnNo+'&fileType='+returnMasterTable.row(this).data().fileType+'&fileName='+returnMasterTable.row(this).data().fileName);
	
	    } else {
    		$('#fpHref').text(null);
        }
    	//화면처리
		$('#fileSearch').addClass('d-none');
		$('#btnFpFileDel').addClass('d-none');
		$('#fpValue').addClass('d-none');
		$('#fileTag').removeClass('d-none');
    });

	//발주관리 목록조회
	let returnDetailTable = $('#returnDetailTable').DataTable({
		dom: "",
		language : lang_kor,	
		destroy : true,	
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="io/purchaseOrderReturnDetailList"/>',
			type : 'GET',
			data : {				
				'retnNo': function() { return retnNo;},
			}	
		},	
		rowId : 'poNo',
		columns : [ 
			{data :'poNo',
				render : function(data, type, row, meta){
					var html="";
					if(poNoVal==null || poNoVal==""){
						html += '<input type="text" class="form-contorl" name="poNo" value="'+data+'" style="border:none; text-align:center" readonly/>';
						html += '<input type="hidden" class="form-contorl" name="poSeq" value="'+row['poSeq']+'" style="border:none;" />';
						html += '<input type="hidden" class="form-contorl" name="inSeq" value="'+row['inSeq']+'" style="border:none;" />';
					}else{
						html += '<input type="text" class="form-contorl" name="poNo" value="'+poNoVal+'" style="border:none; text-align:center" readonly/>';
						html += '<input type="hidden" class="form-contorl" name="poSeq" value="'+poSeqVal+'" style="border:none;" />';
						html += '<input type="hidden" class="form-contorl" name="inSeq" value="'+inSeqVal+'" style="border:none;" />';
					}
					
					
					
					return html;						
				}
			}, 
			{data :'partCd'},
			{data :'partNm'},
			{data :'partRev'},
			{data :'partGubunNm'},
			{data :'returnQty'},
			{data :'dealCorpNm'},
		],
		columnDefs: [
			{ "targets": [5] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
			{ "targets": '_all' , "className" : "text-center" },
        ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});


	// 보기
    $('#returnDetailTable tbody').on('click', 'tr', function () {
    	if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
        }
        else {
        	$('#returnDetailTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

        btnView = 'edit';
     	tableIdx = $('#returnMasterTable').DataTable().row(this).index();
     	
    });
  

 	// 이동버튼
	$('#btnGetPartCntAll').on('click', function() {
		
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("이동할 항목을 선택해주세요.");
			return false;
		}

		$('#itemFaultyAdmPopupTable tbody tr').each(function(index, item) {		
			var data = itemFaultyAdmPopupTable.row(this).data();
			if ($(this).find('td input[name=check]').is(":checked") == true) {

				poNoVal = data.poNo;
				poSeqVal = data.poSeq;
				inSeqVal = data.inSeq;
				
				$('#returnDetailTable').DataTable().row.add(
				{
					"partCd" : data.partCd,
					"partNm" : data.partNm,
					"partRev" : data.partRev,
					"partGubunNm" : data.partGubunNm,
					"returnQty" : data.returnQty,
					"dealCorpNm" : data.dealCorpNm,
					"regId" : data.regId,
				}).draw(true);				
			}
 		}); 

 		$('#btnAllCheck').prop("checked",false);
 		$('input[name=check]').prop("checked",false);

 		$('#itemFaultyAdmPopupModal').modal('hide');
	}); 
    

	//등록폼
	$('#btnAdd').on('click',function(){
		sideView = "add";

		$('#form').each(function(){
        	this.reset();
    	});

		//반품번호 가져오기
    	$.ajax({
			url  : '<c:url value="io/getRetnNo" />',
			type : 'GET',
			data : {}, 
			success : function(res){
				$('#retnNo').val(res.data);
			}
        });

		$('#returnDetailTable').DataTable().clear().draw(function(){});
        
		//화면처리
		uiProc(false);
		$('#returnDate').val(serverDateTo);
		$('#btnGetReturnList').attr('disabled',false);
		$('#btnSave').removeClass('d-none');
		$('#btnEdit').attr('disabled',true);
		$('#btnDel').attr('disabled',false);
		$('#fileSearch').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#fpValue').removeClass('d-none');
		$('#fileTag').addClass('d-none');
		$('#fpValue').text("파일을 선택해주세요")
		$('#fileNm').val(null);
	});


	//수정폼
	$('#btnEdit').on('click',function(){

		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);
		$('#btnSave').removeClass('d-none');
		$('#btnDel').attr('disabled',false);
		$('#btnGetReturnList').attr('disabled',false);
		$('#fileSearch').removeClass('d-none');
		$('#btnFpFileDel').removeClass('d-none');
		$('#fpValue').removeClass('d-none');
		$('#fpValue').text($('#fpHref').text());
		if ($('#fpHref').text() == "")
			$('#fpValue').text("파일을 선택해주세요");
		$('#fileTag').addClass('d-none');
	});


	//삭제
	$('#btnDel').on('click',function(){

		if(btnView != "edit"){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$('#returnDetailTable').DataTable().row('.selected').remove().draw();
		
		/* $.ajax({
			url : '<c:url value="io/purchaseOrderReturnDelete" />',
			type : 'GET',
			data : {
				'poNo': function(){return poNo;},
                'poSeq' : function(){return poSeq;},
                'inSeq' : function(){return inSeq;},
                'returnType' : function(){return returnType;}
               
			},
			success : function(res){
				if(res.result == "ok"){
					
					$('#form').each(function(){
			        	this.reset();
			    	});
			    	
					toastr.success("반품 삭제되었습니다.");
					$('#purchaseOrderReturnTable').DataTable().ajax.reload( function () {});
			
				}else {
                    toastr.error(res.message);
                }
			}
		});
		 */
	});

	//승인버튼
	$('#btnApprove').on('click',function(){

		if(sideView != "edit"){
			toastr.warning("승인할 항목을 선택해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="io/updateApprovalCd" />',
			type : 'GET',
			data : {
				'retnNo': function(){return retnNo;},
              /*   'poSeq' : function(){return poSeq;},
                'inSeq' : function(){return inSeq;},
                'returnType' : function(){return returnType;},
                'returnQty' : $('#returnQty').val(), */
                'value' : '1',
                
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("승인되었습니다.");
					$('#returnMasterTable').DataTable().ajax.reload( function () {});
					/* $('#btnEdit').attr('disabled',true);
					$('#btnDel').attr('disabled',true); */
				}else if(res.result == "aready"){
					toastr.warning("이미 승인된 항목입니다. 확인해주세요.");
				} else {
                    toastr.error(res.message);
                }
			}
		});
		
	});

	//승인취소버튼
	$('#btnCancle').on('click',function(){

		if(sideView != "edit"){
			toastr.warning("승인취소할 항목을 선택해주세요.");
			return false;
		}

		$.ajax({
			url : '<c:url value="io/updateApprovalCd" />',
			type : 'GET',
			data : {
				'retnNo': function(){return retnNo;},
				/* 'poNo': function(){return poNo;},
                'poSeq' : function(){return poSeq;},
                'inSeq' : function(){return inSeq;},
                'returnType' : function(){return returnType;},
                'returnQty' : $('#returnQty').val(), */
                'value' : '2',
                
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("승인취소 되었습니다.");
					$('#returnMasterTable').DataTable().ajax.reload( function () {});
					/* $('#btnEdit').attr('disabled',false);
					$('#btnDel').attr('disabled',false); */
				}else if(res.result == "aready"){
					toastr.warning("이미 승인취소된 항목입니다. 확인해주세요.");
				} else {
                    toastr.error(res.message);
                }
			}
		});
	});

	//파일 삭제버튼
   	function inspectFileNmDel() {
		$('#fileNm').val('');
		$('#fpValue').text("파일을 선택해주세요");
	}
	
	// 저장 처리
    $('#btnSave').on('click', function() {

    	var check=true;
		var dataArray = new Array();
		
    	if ( !$.trim($('#returnChargrNm').val()) ) {
            toastr.warning('담당자를 선택해주세요.');
            $('#btnReturnChargr').focus();
            return false;
        }
        
        if (returnDetailTable.data().count()==0) {
            toastr.warning('반품내역을 불러와주세요.');
            $('#btnGetReturnList').focus();
            return false;
        }

		$('#returnDetailTable tbody tr').each(function(index,item){
			
			var rowData = new Object();
			
			rowData.retnNo = $('#retnNo').val();
			rowData.returnDate =  $('#returnDate').val().replace(/-/g,'');
			rowData.returnChargr = $('#returnChargr').val();
			rowData.returnDesc =  $('#returnDesc').val();
			
			rowData.poNo = $(this).find('td input[name="poNo"]').val();
			rowData.poSeq = $(this).find('td input[name="poSeq"]').val();
			rowData.inSeq = $(this).find('td input[name="inSeq"]').val();
			rowData.partCd =  returnDetailTable.row(index).data().partCd;
			rowData.partRev = returnDetailTable.row(index).data().partRev;
			rowData.regId = returnDetailTable.row(index).data().regId;
			rowData.returnQty =  returnDetailTable.row(index).data().returnQty;
			rowData.fpValue =  $("#fpValue").text();
		    
	        dataArray.push(rowData);
	        console.log(rowData);
			
		});

        console.log("dataArray -> " + JSON.stringify(dataArray));

        let url;
        if(sideView == 'add'){
        	url = '<c:url value="io/purchaseOrderReturnCreate"/>'; 
         }else{
        	 url =  '<c:url value="io/purchaseOrderReturnUpdate"/>';   
         }
       /*  
        var url = '<c:url value="io/purchaseOrderReturnCreate"/>';        
        if( sideView == "edit" ) {
            url =  '<c:url value="io/purchaseOrderReturnUpdate"/>';      
        } */
        
    	var formData = new FormData(document.getElementById("form"));
		formData.append('retnNo', $('#retnNo').val());

        $.ajax({
            url: url,
            type: 'POST',
            datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
            beforeSend: function() {
               // $('#btnAddConfirm').addClass('d-none');
               // $('#btnAddConfirmLoading').removeClass('d-none');
            },
            success: function (res) {
                let data = res.data;
                if (res.result == 'ok') {
                	/* if ($('#fpValue').text() != "파일을 선택해주세요") {
	                	$.ajax({
	            			url : '<c:url value="io/purchaseOrderReturnFileUpload"/>',
	            			type : 'POST',
	            			data : formData,
	            			processData : false,
	            			contentType : false,
	                	});
                	} */
                    // 보기
                    uiProc(true);
                    $('#returnMasterTable').DataTable().ajax.reload( function () {});

                    $('#btnGetReturnList').attr('disabled',true);
                    $('#btnDel').attr('disabled',true);
                    $('#btnSave').addClass('d-none');
                    $('#btnEdit').attr('disabled' , false);
                    
            		$('#fileSearch').addClass('d-none');
            		$('#btnFpFileDel').addClass('d-none');
            		$('#fpValue').addClass('d-none');
            		$('#fpValue').text("파일을 선택해주세요");
            		$('#fileTag').removeClass('d-none');
            		$('#fileNm').val(null);
            		$("#fpHref").text(null);
                    
                    if( sideView == "edit" ) {
                	   toastr.success('수정되었습니다.');
                    } else if( sideView == "add"){
                        toastr.success('등록되었습니다.');
                    }
                   	sideView = 'edit';
                } else if(res.result == "overlap") {
                    toastr.warning("이미 반품등록된 발주번호입니다. 확인해주세요.");
                    $('#btnGetReturnList').attr('disabled',true);
                    $('#btnDel').attr('disabled',true);
                    $('#btnSave').addClass('d-none');
                    
                } else if(res.result == "already") {
                    toastr.warning("이미 승인된 내역이라 수정이 불가합니다. 확인해주세요.");

                    
                } else {
                    toastr.error(res.message);
                }
            },
            complete:function(){
                $('#btnAddConfirm').removeClass('d-none');
                $('#btnAddConfirmLoading').addClass('d-none');
            }
        });
   	
    });
    


	//발주번호 팝업 시작
	var itemFaultyAdmPopupTable;
	function selectPoNo() {
		if (itemFaultyAdmPopupTable == null || itemFaultyAdmPopupTable == undefined) {
			itemFaultyAdmPopupTable = $('#itemFaultyAdmPopupTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : '/io/itemFaultyAdmPopupList',
					type : 'GET',
					data : {

					}
				},
				rowId : 'poNo',
				columns : [ {
					render : function(data, type, row, meta){
						return '<input type="checkbox" name="check" />';
					}
				}, {
					data : 'poNo'
				}, {
					data : 'partCd'
				}, {
					data : 'partNm'
				}, {
					data : 'partGubun'
				}, {
					data : 'faultyChargrNm'
				}, {
					data : 'faultyCnt'
				}, {
					data : 'returnQty'
				}, {
					data : 'returnDate',
					render : function(data, type, row, meta){
						return moment(data).format('YYYY-MM-DD');
					}
				}, ],
				columnDefs : [ 
					{ "targets": [6] , render: $.fn.dataTable.render.number( ',' ) , "className" : "text-right" },
					{"targets" : '_all',"className" : "text-center"}, 
					
				],
				order : [ [ 0, 'asc' ] ],
			});
			
			/* $('#itemFaultyAdmPopupTable tbody').on('click', 'tr', function() {
				var data = itemFaultyAdmPopupTable.row(this).data();
				
				$('#poNo').val(data.poNo);
				$('#poSeq').val(data.poSeq);
				$('#inSeq').val(data.inSeq);
				$('#partGubun').val(data.partGubun);
				$('#partGubunNm').val(data.partGubunNm);
				$('#partCd').val(data.partCd);
				$('#partRev').val(data.partRev);
				$('#partNm').val(data.partNm);
				$('#returnQty').val(data.returnQty);
				$('#faultyCnt').val(data.faultyCnt);
				$('#dealCorpNm').val(data.dealCorpNm);
				$('#telNo').val(data.telNo==null?"-":data.telNo);
				$('#addrBase').val(data.addrBase==null?"-":data.addrBase);
				$('#addrDtl').val(data.addrDtl==null?"-":data.addrDtl);
				
				$('#itemFaultyAdmPopupModal').modal('hide');
			}); */
		} else {
			$('#itemFaultyAdmPopupTable').DataTable().ajax.reload(function() {});
		}

		$('#itemFaultyAdmPopupModal').modal('show');
	}


	 //담당자 팝업 시작
	var userPopUpTable;
	function selectReturnChargr() {
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
					data : 'workplaceNm'
				}, {
					data : 'workplaceNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
			$('#userPopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#returnChargr').val(data.userNumber);
				$('#returnChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}

		$('#userPopUpModal').modal('show');
	}

	var html1 = '<div class="row">';
	html1 += '&nbsp;&nbsp;<label class="input-label-sm">일자</label><div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="inWhsDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>';
	html1 += '&nbsp; <button type="button"  class="btn btn-primary" id="btnRetv">조회</button>'
	html1 += '&nbsp;&nbsp;&nbsp; <button type="button"  class="btn btn-primary" id="btnAllList">전체조회</button>'
	html1 += '</div>';

	$('#returnMasterTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	$('#btnRetv').on('click', function() {
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		$('#returnMasterTable').DataTable().ajax.reload(function() {
		});
	});
	
	$('#btnAllList').on('click', function() {
		serverDateFrom =  "";
		serverDateTo =  "";
		approvalCd ='';
		$('#returnMasterTable').DataTable().ajax.reload(function() {});
    });
	
	function uiProc(flag) {
		$('#btnPoNo').attr('disabled', flag);
		$('#returnDateCalendar').attr('disabled', flag);
		//$('#returnQty').attr('disabled', flag);
		$('#returnDesc').attr('disabled', flag);
		$('#btnReturnChargr').attr('disabled', flag);
	}

	//모든 체크박스 선택
	$('#btnAllCheck').on('click',function(){
		if($('#btnAllCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
		}
	})
	

	//콤마(,) 생성
	function addCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

	//콤마(,) 삭제
	function uncomma(x) {
		x = String(x);
		return x.replace(/[^\d]+/g, '');
	}
</script>



	</body>
	</html>