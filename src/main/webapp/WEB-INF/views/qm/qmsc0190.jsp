<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %> 

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
<!-- 불량이력관리 모달 시작--> 
<div class="modal fade bd-example-modal-lg" id="badPopUpModal" tabindex="-1" role="dialog" aria-labelledby="printPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="margin-right: 40%;">
		<div class="modal-content" style="width: 150%;">
			<div class="modal-header">
				<h5 class="modal-title">불량이력관리 조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="badTable" class="table table-bordered" style="font-size: 15px; color: black;">
					<thead class="thead-light" style="font-size: 15px; color: black;">
						<tr>
							<th>승인여부</th>
							<th>판정</th>
							<th>구분</th>
							<th>입고일자</th>
							<th>협력사</th>
							<th>품목번호</th>
							<th>품명</th>
							<th>차종</th>
							<th>입고수량</th>
							<th>불량수량</th>
							<th>검사일</th>
						</tr>
					</thead>
					<tbody style="font-size: 15px; color: black;"></tbody>
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
<!-- 불량이력관리 모달 종료-->

<!-- 반품이력관리 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="returnPopUpModal" tabindex="-1" role="dialog" aria-labelledby="returnPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="margin-right: 40%;">
		<div class="modal-content" style="width: 150%;">
			<div class="modal-header">
				<h5 class="modal-title">반품이력관리 조회</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<hr class="text-secondary">
			<div class="table-responsive">
				<table id="returnTable" class="table table-bordered" style="font-size: 15px; color: black;">
					<thead class="thead-light" style="font-size: 15px; color: black;">
						<tr>
							<th>구분</th>
							<th>품목번호</th>
							<th>품명</th>
							<th>차종</th>
							<th>반품수량</th>
							<th>반품등록일</th>
							<th>담당자</th>
						</tr>
					</thead>
					<tbody style="font-size: 15px; color: black;"></tbody>
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
<!-- 반품이력관리 모달 종료-->

<!-- 수입검사성적서 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="filePopUpModal" tabindex="-1" role="dialog" aria-labelledby="filePopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
    	<div class="modal-content" style="width: 500px; position: absolute; left: 50%; transform: translateX(-50%);">
        	<div class="modal-header">
           		<h5 class="modal-title" id="filePopUpLabel">수입검사성적서 등록</h5>
           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
             		<span aria-hidden="true">&times;</span>
           		</button>
         	</div> 
         	<div class="modal-body">
         		<table id="filePopUpTable" class="table table-bordered">
					<colgroup>
						<col width="10%">
						<col width="90%">
					</colgroup>										
					<thead class="thead-light">
						<tr>
							<th>선택</th>
							<th>수입검사성적서</th>
						</tr>
					</thead>
		 		</table>
         	</div>
         	<div class="modal-footer">
	       		<button type="button" class="btn btn-primary float-right"
					id="btnFileSave">등록</button>
				<button class="btn btn-primary d-none" id="btnFileLoading" type="button" disabled>
					<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> 처리중
				</button>
	          	<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
         	</div>
    	</div>
	</div>
</div>
<!-- 수입검사성적서 모달 종료-->

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
						<th>BarcodeNo</th>
						<td ><input type="text" class="form-control" id="popupBarcodeNo" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
						<th >입고수량</th>
						<td><input type="text" class="form-control" id="popupPreInWhsQty" style="text-align:center; min-width:100%; background:white;border:none;" disabled></td>
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

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">품질관리</a></li>
				<li class="breadcrumb-item active">수입검사관리대장(봉제)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 65%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn2" onclick="openrNav2()" class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="purchaseOrderAdmTable" class="table table-bordered">
							<colgroup>
								<col width="8%">
								<col width="10%">
								<col width="5%">
								<col width="5%">
								<col width="8%">
								<col width="10%">
								<col width="20%">
								<col width="7%">
								<col width="4%">
								<col width="5%">
								<col width="5%">
								<col width="6%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>입고전표번호</th>
									<th>거래처</th>
									<th>승인여부</th>
									<th>판정</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">최근 입고일</th>
									<th>단위</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">합격수량</th>
									<th class="text-center">불합격수량</th>
									<th>검사일</th>
<!-- 									<th>부적합처리</th> -->
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- /.left-list -->
			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="rfSidenav" style="width: 34%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand2" class="closebtn float-right" onclick="closerNav2()">
						<i class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="tab1Head">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="tab2Head">성적서</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab3" id="tab3Head">자재사진</a>
						</li>
					</ul>
				</div>
				<!--====================TAB-UI=======================-->
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-success float-left mr-1" id="btnApprove">승인</button>
								<button type="button" class="btn btn-success float-left mr-1" id="btnInspPopup">검사항목</button>
								<button type="button" class="btn btn-primary float-right d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" 	 id="btnAdd">등록</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-sm table-bordered mb-1"
										id="itemInspectAdmTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>차종</th>
												<td><input type="text" class="form-control" id="itemModel" name="itemModel" style="text-align:center;" disabled /></td>
												<th>단위</th>
												<td><input type="text" class="form-control" id="itemUnit" name="itemUnit" style="text-align:center;" disabled /></td>
											</tr>
											
											<tr>
												<th>판정</th>
												<td>
													<select class="custom-select" id="qaEval" disabled>
														<option value="" selected>선택</option>
														<option value="001">합격</option>
														<option value="002">불합격</option>
													</select>
													
												</td>
												<th>발주구분</th>
												<td><input type="text" class="form-control" id="receiptGubun" name="receiptGubun" style="text-align:center;" disabled/></td>
											</tr>
											<tr>
												<th>검사일</th>
												<td>
													<div class="form-group input-sub m-0" style="max-width: 100%">
													<input class="form-control" style="max-width: 100%" type="text" id="inspectDate" name="inspectDate" maxlength="10" disabled />
													<button onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')" class="btn btn-secondary input-sub-search" id="inspectDateCalendar" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
												<th>검사자</th>
												<td>
													<div class="input-sub m-0" style="max-width: 100%">
														<input type="hidden" class="form-control"style="max-width: 100%" id="inspectChargr"name="inspectChargr" disabled> 
														<input type="text"class="form-control" style="max-width: 100%"id="inspectChargrNm" name="inspectChargrNm" disabled>
														<button type="button" class="btn btn-primary input-sub-search"name="btnInspectChargr" id="btnInspectChargr" onClick="selectInspectChargr();">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
												</td>
											</tr>
											<tr>
												<th>입고수량</th>
												<td><input type="text" class="form-control" id="preInWhsQty" name="preInWhsQty" style="text-align:right;" disabled /></td>
												<th>검사수량</th>
												<td><input type="text" class="form-control" id="inspectCnt" name="inspectCnt" style="text-align:right;" onkeyup="numberFormat(this, 'int')" disabled /></td>
											</tr>
											<tr>
												<th>합격수량</th>
												<td><input type="text" class="form-control" id="pairQty" name="pairQty" disabled style="text-align:right" /></td>
												<th>불량수량</th>
												<td><input type="text" class="form-control" id="faultyQty" name="faultyQty" disabled style="text-align:right" /></td>
											</tr>
											<tr>
												<th>LOT NO</th>
												<td>
													<input type="text" class="form-control" id="lotNo" name="lotNo" style="min-width : 100%;" disabled/>
												</td>
												<th>비고</th>
												<td>
													<input type="text" class="form-control" id="inspectDesc" name="inspectDesc" style="min-width : 100%;" maxlength="64" placeholder="64자 내외" disabled/>
												</td>
											</tr>
											<tr style="border-collapse: separate; border-spacing: 0 20px;">
											<th>성적서 접수</th>
											<td>
												<div class="container">	
													<div class="row">
														<div class="col-sm">
															<input class="custom-radio mt-1" type="radio" id="millSheetY" name="millSheet" value="001" disabled> 
															<label class="" for="millSheetY">유</label>
														</div>
														<div class="col-sm">
															<input class="custom-radio mt-1" type="radio" id="millSheetN" name="millSheet" value="002" disabled> 
															<label class="" for="millSheetN">무</label>
														</div>
													</div>
												</div>
											</td>											
											<th>시료수체크</th>
											<td><select class="custom-select" id="cavityCnt" style="max-width: 100%;" disabled></select></td>
										</tr>
										</thead>
									</table>
								</div>
							</form>
	
							<%-- <form id="form2">
								<div class="table-responsive">
									<table class="table table-sm table-bordered  mb-1"
										id="itemInspectDtlTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<thead>
											<tr>
												<th>판정</th>
												<td><select class="custom-select" id="qaEval"name="qaEval" disabled onchange="javascript:faultyCntChange();"></select></td>
												<th>검사수량</th>
												<td><input type="text" class="form-control"
													id="inspectCnt" name="inspectCnt" disabled style="text-align:right"/></td>
											</tr>
											<tr>
												<th>합격수량</th>
												<td><input type="text" class="form-control" id="pairCnt"
													name="pairCnt" disabled style="text-align:right"/></td>
												<th>불량수량</th>
												<td><input type="text" class="form-control"
													id="faultyCnt" name="faultyCnt" disabled style="text-align:right"/></td>
											</tr>
											<tr>
												<th>검사일</th>
												<td>
													<div class="form-group input-sub m-0 row">
														<input class="form-control" type="text" id="inspectDate"
															name="inspectDate" disabled />
														<button
															onclick="fnPopUpCalendar(inspectDate,inspectDate,'yyyy-mm-dd')"
															class="btn btn-secondary input-sub-search"
															id="inspectDateCalendar" type="button" disabled>
															<span class="oi oi-calendar"></span>
														</button>
													</div>
												</td>
												<th>검사자</th>
												<td>
													<div class="input-sub m-0">
														<input type="hidden" class="inspectChargr"
															id="inspectChargr" name="inspectChargr"> <input
															type="text" class="form-control" id="inspectChargrNm"
															name="inspectChargrNm" disabled>
														<button type="button"
															class="btn btn-primary input-sub-search"
															id="btnInspectChargr" onClick="selectInspectChargr()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
												</td>
											</tr>
											<tr>
												<th>비고</th>
												<td colspan="3"><input type="text" class="form-control" id="" style="min-width: 100%;" disabled></td>
											</tr>
											<tr class="d-none">
												<th colspan="4">수입검사성적서</th>
											</tr>
											<tr class="d-none">
												<th>재질성적서</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch1" style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm1" name="fileNm1" value=""> 
															<label class="custom-file-label" id="fpValue1" for="fileNm1">파일을 선택해주세요</label>
														</div>
														<div class="rightsidebar-close d-none" id="btnFpFileDel1" style="width: 10%;">
															<button type="button" class="btn" onClick="inspectFileNmDel(1)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag1">
														<a href="/bm/downloadFile" id="fpHref1"><span id="fpFn1"></span></a>
													</div>
												</td>
											</tr>
											<tr class="d-none">
												<th>표면처리성적서</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch2"
															style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm2"
																name="fileNm2" value=""> <label
																class="custom-file-label" id="fpValue2" for="fileNm2">파일을
																선택해주세요</label>
														</div>
	
														<div class="rightsidebar-close d-none" id="btnFpFileDel2"
															style="width: 10%;">
															<button type="button" class="btn"
																onClick="inspectFileNmDel(2)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag2">
														<a href="/bm/downloadFile" id="fpHref2"><span id="fpFn2"></span></a>
													</div>
												</td>
											</tr>
											<tr class="d-none">
												<th>열처리성적서</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch3"
															style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm3"
																name="fileNm3" value=""> <label
																class="custom-file-label" id="fpValue3" for="fileNm3">파일을
																선택해주세요</label>
														</div>
	
														<div class="rightsidebar-close d-none" id="btnFpFileDel3"
															style="width: 10%;">
															<button type="button" class="btn"
																onClick="inspectFileNmDel(3)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag3">
														<a href="/bm/downloadFile" id="fpHref3"><span id="fpFn3"></span></a>
													</div>
												</td>
											</tr>
											<tr class="d-none">
												<th>품질보증서(COC)</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch4"
															style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm4"
																name="fileNm4" value=""> <label
																class="custom-file-label" id="fpValue4" for="fileNm4">파일을
																선택해주세요</label>
														</div>
	
														<div class="rightsidebar-close d-none" id="btnFpFileDel4"
															style="width: 10%;">
															<button type="button" class="btn"
																onClick="inspectFileNmDel(4)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag4">
														<a href="/bm/downloadFile" id="fpHref4"><span id="fpFn4"></span></a>
													</div>
												</td>
											</tr>
											<tr class="d-none">
												<th>수입검사성적서</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch5"
															style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm5"
																name="fileNm5" value=""> <label
																class="custom-file-label" id="fpValue5" for="fileNm5">파일을 선택해주세요</label>
														</div>
	
														<div class="rightsidebar-close d-none" id="btnFpFileDel5"
															style="width: 10%;">
															<button type="button" class="btn"
																onClick="inspectFileNmDel(5)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag5">
														<a href="/bm/downloadFile" id="fpHref5"><span id="fpFn5"></span></a>
													</div>
												</td>
											</tr>
											<tr class="d-none">
												<th>수입검사기준서</th>
												<td colspan="3">
													<div class="row">
														<div class="custom-file d-none" id="fileSearch6"
															style="width: 90%;">
															<input type="file" class="custom-file-input" id="fileNm6"
																name="fileNm6" value=""> <label
																class="custom-file-label" id="fpValue6" for="fileNm6">파일을 선택해주세요</label>
														</div>
	
														<div class="rightsidebar-close d-none" id="btnFpFileDel6"
															style="width: 10%;">
															<button type="button" class="btn"
																onClick="inspectFileNmDel(6)">
																<i class="mdi mdi-close"></i>
															</button>
														</div>
													</div> <!--첨부파일1-->
													<div class="form-group m-0 mr-2 row p-0 " id="fileTag6">
														<a href="/bm/downloadFile" id="fpHref6"><span id="fpFn6"></span></a>
													</div>
												</td>
											</tr>
										</thead>
									</table>
								</div>
							</form> --%>
							<!-- <button type="button" class="btn btn-info float-right m-1" id="btnTypeAdd" onclick="selectFaultyType()" disabled>불량유형</button> -->
							<button type="button" class="btn btn-info float-left m-1" id="btnJrbr" disabled>전량불량</button>
							<form id="form3">
								<div class="table-responsive">
									<table id="itemFaultyTypeTable" class="table table-bordered">
										<colgroup>
											<col width="5%">
											<col width="21%">
											<col width="16%">
											<col width="16%">
											<col width="10%">
											<col width="16%">
											<col width="16%">
										</colgroup>					
										<thead class="thead-light">
											<tr>
												<th>No.</th>
												<th>BarcodeNo</th>
												<th class="text-center">입고수량</th>
												<th class="text-center">합격수량</th>
												<th>판정</th>
												<th class="text-center">불량수량</th>
												<th class="text-center">부적합처리</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
							<div class="table-responsive">
								<table class="table table-bordered">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tr>
										<th colspan="2">수입검사</th>
									</tr>
									<tr>
										<th>제품사진</th>
										<th>수입검사기준서</th>
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
										<th>검사주요항목</th>
										<th>Q-POINT</th>
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
						</div>
						<!--========tab1 part=====-->
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
												<th>성적서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab2 part=====-->
						<!--========tab3part=====-->
						<div class="tab-pane fade" id="tab3">
<!-- 								사진 탭 v2 -->
<!-- 							<div class="table-responsive"> -->
<!-- 									<table class="table table-bordered"> -->
<%-- 										<colgroup> --%>
<%-- 											<col width="50%"> --%>
<%-- 											<col width="50%"> --%>
<%-- 										</colgroup> --%>
<!-- 										<tr> -->
<!-- 											<th colspan="2">자재사진</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th>자재1</th> -->
<!-- 											<th>자재2</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile1" src="" -->
<!-- 														name="imageFile1" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->

<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile2" src="" -->
<!-- 														name="imageFile2" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<th>Q-POINT1</th> -->
<!-- 											<th>Q-POINT2</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile3" src=""  -->
<!-- 														name="imageFile3" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->

<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile4" src="" -->
<!-- 														name="imageFile4" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->

<!-- 								사진 탭 v1 -->
<!-- 							<form id="form21" enctype="multipart/form-data"> -->
<!-- 								<div class="table-responsive"> -->
<!-- 									<table class="table table-bordered"> -->
<%-- 										<colgroup> --%>
<%-- 											<col width="50%"> --%>
<%-- 											<col width="50%"> --%>
<%-- 										</colgroup> --%>
<!-- 										<tr> -->
<!-- 											<th>제품사진1</th> -->
<!-- 											<th>제품사진2</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile1" src="" -->
<!-- 														name="imageFile1" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->

<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile2" src="" -->
<!-- 														name="imageFile2" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="form-group"> -->
<!-- 													<div class="custom-file" style="width: 90%;"> -->
<!-- 														<input type="file" class="custom-file-input" id="imgAdd1" -->
<!-- 															name="imgAdd1" onchange="imageUpload(1)"> <label -->
<!-- 															id="imgName1" class="custom-file-label" for="imgAdd1"></label> -->
<!-- 													</div> -->
<!-- 													<div class="rightsidebar-close" -->
<!-- 														style="width: 10%; padding-top: 4px;"> -->
<!-- 														<button type="button" class="btn" name="closeBtn" -->
<!-- 															onclick="deleteImg(1);"> -->
<!-- 															<i class="mdi mdi-close"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 											<td> -->
<!-- 												<div class="form-group"> -->
<!-- 													<div class="custom-file" style="width: 90%;"> -->
<!-- 														<input type="file" class="custom-file-input" id="imgAdd2" -->
<!-- 															name="imgAdd2" onchange="imageUpload(2)"> <label -->
<!-- 															id="imgName2" class="custom-file-label" for="imgAdd2"></label> -->
<!-- 													</div> -->
<!-- 													<div class="rightsidebar-close" -->
<!-- 														style="width: 10%; padding-top: 4px;"> -->
<!-- 														<button type="button" class="btn" name="closeBtn" -->
<!-- 															onclick="deleteImg(2);"> -->
<!-- 															<i class="mdi mdi-close"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 									<table class="table table-bordered"> -->
<%-- 										<colgroup> --%>
<%-- 											<col width="50%"> --%>
<%-- 											<col width="50%"> --%>
<%-- 										</colgroup> --%>
<!-- 										<tr> -->
<!-- 											<th>Q-POINT1</th> -->
<!-- 											<th>Q-POINT2</th> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile3" src=""  -->
<!-- 														name="imageFile3" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->

<!-- 											<td> -->
<!-- 												<div class="custom-file" style="height: 150px;"> -->
<!-- 													<img alt="등록된 사진이 없습니다." id="imageFile4" src="" -->
<!-- 														name="imageFile4" style="width: 100%; height: 100%"> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 										<tr> -->
<!-- 											<td> -->
<!-- 												<div class="form-group"> -->
<!-- 													<div class="custom-file" style="width: 90%;"> -->
<!-- 														<input type="file" class="custom-file-input" id="imgAdd3" -->
<!-- 															name="imgAdd3" onchange="imageUpload(3)"> <label -->
<!-- 															id="imgName3" class="custom-file-label" for="imgAdd3"></label> -->
<!-- 													</div> -->
<!-- 													<div class="rightsidebar-close" -->
<!-- 														style="width: 10%; padding-top: 4px;"> -->
<!-- 														<button type="button" class="btn" name="closeBtn" -->
<!-- 															onclick="deleteImg(3);"> -->
<!-- 															<i class="mdi mdi-close"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 											<td> -->
<!-- 												<div class="form-group"> -->
<!-- 													<div class="custom-file" style="width: 90%;"> -->
<!-- 														<input type="file" class="custom-file-input" id="imgAdd4" -->
<!-- 															name="imgAdd4" onchange="imageUpload(4)"> <label -->
<!-- 															id="imgName4" class="custom-file-label" for="imgAdd4"></label> -->
<!-- 													</div> -->
<!-- 													<div class="rightsidebar-close" -->
<!-- 														style="width: 10%; padding-top: 4px;"> -->
<!-- 														<button type="button" class="btn" name="closeBtn" -->
<!-- 															onclick="deleteImg(4);"> -->
<!-- 															<i class="mdi mdi-close"></i> -->
<!-- 														</button> -->
<!-- 													</div> -->
<!-- 												</div> -->
<!-- 											</td> -->
<!-- 										</tr> -->
<!-- 									</table> -->
<!-- 								</div> -->
<!-- 							</form> -->
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<!-- 구축 예정 -->
							<table class="table table-bordered mt-3">
								<colgroup>
									<col width="30%">
								</colgroup>
								<tr>
									<th>구현중입니다.</th>
								</tr>
							</table>
						</div>
						<!--====end====tab4 part=====-->
					</div>
				</div>
			</div>
		</div>
	</div>
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
						<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd">등록/수정</button>
					</div>
					<hr>
					<div class="card-body p-0">
						<div class="table-responsive" id="extAdmTableDiv">
							<table class="table table-bordered" id="extAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th style="min-width:30px;">순번</th>
										<th style="min-width:370px;">규격</th>
										<th style="min-width:60px;">확인방법</th>
										<th style="min-width:90px;">X1</th>
										<th style="min-width:90px;">X2</th>
										<th style="min-width:90px;">X3</th>
										<th style="min-width:90px;">X4</th>
										<th style="min-width:90px;">X5</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv2">
							<table class="table table-bordered" id="sizeAdmTable2" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2">순번</th>
										<th rowspan="2">목록</th>
										<th rowspan="2">확인방법</th>
										<th colspan="2">규격</th>
										<th rowspan="2">확인값</th>
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="table-responsive d-none" id="sizeAdmTableDiv">
							<table class="table table-bordered" id="sizeAdmTable" style="width:100%;">
								<thead>
									<tr>
										<th rowspan="2" style="min-width:25px;">순번</th>
										<th rowspan="2" style="min-width:50px;">특별특성</th>
										<th rowspan="2" style="min-width:100px;">규격</th>
										<th rowspan="2" style="min-width:80px;">기준</th>
										<th colspan="2" style="min-width:230px;">SPEC</th>
										<th rowspan="2" style="min-width:70px;">X1</th>
										<th rowspan="2" style="min-width:70px;">X2</th>
										<th rowspan="2" style="min-width:70px;">X3</th> 
										<th rowspan="2" style="min-width:70px;">X4</th>
										<th rowspan="2" style="min-width:70px;">X5</th>
										<!-- <th colspan="3" style="min-width:250px; background: #6bbcfb;">CVT.1</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne2">CVT.2</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne3">CVT.3</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne4">CVT.4</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne5">CVT.5</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne6">CVT.6</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne7">CVT.7</th>
										<th colspan="3" style="min-width:250px; background: #6bbcfb;" id="blueThOne8">CVT.8</th> -->
									</tr>
									<tr>
										<th>하한</th>
										<th>상한</th>
										<!-- <th id="thOne21">X1</th>
										<th id="thOne22">X2</th>
										<th id="thOne23">X3</th> CVT.2
										<th id="thOne31">X1</th>
										<th id="thOne32">X2</th>
										<th id="thOne33">X3</th> CVT.3
										<th id="thOne41">X1</th>
										<th id="thOne42">X2</th>
										<th id="thOne43">X3</th> CVT.4
										<th id="thOne51">X1</th>
										<th id="thOne52">X2</th>
										<th id="thOne53">X3</th> CVT.5
										<th id="thOne61">X1</th>
										<th id="thOne62">X2</th>
										<th id="thOne63">X3</th> CVT.6
										<th id="thOne71">X1</th>
										<th id="thOne72">X2</th>
										<th id="thOne73">X3</th> CVT.7
										<th id="thOne81">X1</th>
										<th id="thOne82">X2</th>
										<th id="thOne83">X3</th> CVT.8 -->
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!--  Modal End-->
	</div> 
</div>
<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<script>

	$("#left-width-btn2").click(function() {
		{
			$("#left-list").animate({
				width : "65%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
	
		state = !state;
	});

	let currentHref = "qmsc0190";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","수입검사관리대장(봉제)"); 
	let viewIdx;
	let sideView = 'add';
	let sideView2 = 'add';
	let btnView = '';

	let printArray = new Array();
	
	let serverDateFrom =  "${serverDateFrom}";
	let serverDateTo =  "${serverDateTo}";
	let serverDate = "${serverDate}";
	let userNm =  "${userNm}";
	let userNumber = "${userNumber}";
	let userId = "${userId}"; // 로그인 사용자 정보
	let menuUrl = "${menuUrl}"; // 메뉴 경로
	console.log(userId);
	console.log(menuUrl);

	let inSlipNo = null;
	let inSlipSeq = null;
	let poNo = '';
	let poSeq = '';
	let inSeq = '';
	var inspectDate;
	let preInWhsQty;
	let tableIdx = 0;
	let tempView = '';
	let attachSeq;
	let mainGubun = null;
	let itemGubun = null;
	let approvalYn = null;
	let itemSeq = ''; //외관,치수 테이블 초기화를 위한 itemSeq 초기화
	let barcodeNo;
	let approvalYnOption = "";
	let modalHide = true;
	let inspCdVal = null;
	let inspDesc1Html = "";
	let inspDesc2Html = "";
	let jrCheck = true;

	let poGubun='';
	let outLocNo='';
	let outLocCd='';
	
	//base64를 담는 변수
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;

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
	
	//공통코드 시작
	let qaEvalCode=new Array();
    <c:forEach items="${qaEval}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		qaEvalCode.push(json);
	</c:forEach>

	let inspectLvlCode=new Array();
    <c:forEach items="${inspectLvl}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inspectLvlCode.push(json);
	</c:forEach>

	let contentsCode=new Array();
    <c:forEach items="${contents}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		contentsCode.push(json);
	</c:forEach>

	let inputMethodCode=new Array();	//검사입력방식
    <c:forEach items="${inputMethod}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		inputMethodCode.push(json);
	</c:forEach>

	let judgeCode=new Array();	//판정
    <c:forEach items="${judge}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		judgeCode.push(json);
	</c:forEach>

	let silhangCode=new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm="${info.baseNm}";
		silhangCode.push(json);
	</c:forEach>

	let cavityCntCode=new Array();	//cavityCnt
    <c:forEach items="${cavityCnt}" var="info">
		var json=new Object();
		json.baseCd="${info.baseCd}";
		json.baseNm = "${info.baseNm}" + "개";
		cavityCntCode.push(json);
	</c:forEach>
	//공통코드 끝
	
	uiProc(true);

	//선택박스 처리
	//selectBoxAppend(qaEvalCode, "qaEval", "", "2");
	selectBoxAppend(inspectLvlCode, "inspectLvl", "", "2");
	selectBoxAppend(contentsCode, "contents", "", "2");
	selectBoxAppend(cavityCntCode, "cavityCnt", "005", "");

	$('#saveBtnModalY').on('click', function() {
		//$('#btnSave').trigger('click');
		$('#btnAdd').attr('disabled', false);		//등록 버튼
	    $('#btnEdit').attr('disabled', false);		//수정 버튼
	    $('#btnSave').addClass('d-none');
	    
	    uiProc(true);
	});

	
	//수입검사관리대장(봉제) 목록조회
	let purchaseOrderAdmTable = $('#purchaseOrderAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
				+ "<'row'<'col-sm-12 col-md-12'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>B>",
		language : lang_kor,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : true,
		fixedHeader: true,
		pageLength : 20, 
		ajax : {
			url : '<c:url value="io/itemInspectMasterAdmList"/>',
			type : 'GET',
			data : {
				'startDate' 	: function(){ return serverDateFrom.replace(/-/g, ''); },
				'endDate' 		: function(){ return serverDateTo.replace(/-/g, ''); },
				'approvalYn' 	: function(){ return approvalYnOption; },
				'mainGubun' 	: function(){ return '002'; },
			},
		}, 
		rowId : 'poNo',
		columns : [ 
			{//입고전표번호
				data : 'inSlipNo' 
			}, 
			{//거래처
				data : 'dealCorpNm' 
			}, 
			{//승인여부
				data : 'approvalYn',
				render : function(data, type, row, meta){
					if(data!=null){
						if(data=="001"){
							return "승인";
						}else{
							if(row['approvalStatus']=="Y"){
								return '자동승인';
							}else{
								return '<span style="color:red;">미승인</span>';
							}
						}
					}else{
						return '<span style="color:red;">미승인</span>';
					}
					
				} 
			}, 
			{//판정
				data : 'qaEval',
				render : function(data, type, row, meta){
					if(data!=null && data!=""){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}else{
							return '<span>미판정</span>';
						}
					}else{
						if(row['approvalStatus']=="Y"){
							return '자동판정';
						}else{
							return '<span>미판정</span>';
						}
					}
				} 
			}, 
			{//차종
				data : 'itemModel' 
			}, 
			{//품번
				data : 'itemCd' 
			}, 
			{//품명
				data : 'itemNm' 
			}, 
			{//최근 입고일
				data : 'preInWhsDate',
				render : function(data, type, row, meta){
					return moment(data).format('YYYY-MM-DD');
				},
			},
			{//단위
				data : 'itemUnitNm' 
			}, 
			{//입고수량
				data : 'preInWhsQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			}, 
			{//합격수량
				data : 'pairQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{//불합격수량
				data : 'faultyQty',
				render : function(data, type, row, meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{//검사일
				data : 'inspectDate',
				render : function(data, type, row, meta) {
					if(data!=null){
						return moment(data).format("YYYY-MM-DD");
					}else{
						return '-';
					}
				}
			},
			{//부적합처리 (숨김)
				data : 'faultyPcs',
				render : function(data, type, row, meta) {
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			}, 
		],
		columnDefs : [ {
			targets : [9,10,11],
			render : $.fn.dataTable.render.number(','),
			className : 'text-right'
		}, {//부적합처리 컬럼 숨김처리
			targets : [13], "visible": false
		}
		],
		buttons : [ 'copy', 'excel', 'print' ],
		order : []

	});

	var html1 = '<div class="row">';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<label class="input-label-sm">입고전표일자</label>';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateFrom" name="preInWhsDateFrom" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateFrom,preInWhsDateFrom,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preInWhsDateFromCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>';
	    html1 += '</div>';
	    html1 += '&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="text" id="preInWhsDateTo" name="preInWhsDateTo" disabled/>';
	    html1 += '<button onclick="fnPopUpCalendar(preInWhsDateTo,preInWhsDateTo,\'yyyy-mm-dd\')"  class="btn btn-secondary input-sub-search" id="preInWhsDateToCalendar" type="button">';
	    html1 += '<span class="oi oi-calendar"></span>';
	    html1 += '</button>'; 
	    html1 += '</div>';   
	    
	    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">승인여부</label>'; 
		html1 += '<select class="custom-select" id="approvalYnOption">';
		html1 += '<option value="" selected>전체</option>';
		html1 += '<option value="001">승인</option>';
		html1 += '<option value="002">미승인</option>';
		html1 += '</select>';
		
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	    html1 += '&nbsp;<button type="button" class="btn btn-primary" id="btnAllRetv">전체조회</button>'
	    html1 += '&nbsp;&nbsp;&nbsp;<input type="number" class="form-control text-right d-none" id="printCnt" placeholder="매수" style="width:40px;" value="1">';
		html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-info d-none" id="btnQAPrint">QA라벨발행</button>'
	    html1 += '</div>';
   
	$('#purchaseOrderAdmTable_length').html(html1);
	$('#preInWhsDateFrom').val(serverDateFrom);
	$('#preInWhsDateTo').val(serverDateTo);

	//조회버튼 클릭시
	$('#btnRetv').on('click',function(){
		serverDateFrom = $('#preInWhsDateFrom').val();
		serverDateTo = $('#preInWhsDateTo').val();
		approvalYnOption = $('#approvalYnOption option:selected').val();
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
	});

	//전체 조회버튼 클릭시
	$('#btnAllRetv').on('click',function(){
		serverDateFrom = "";
		serverDateTo = "";
		approvalYnOption = "";
		$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
	});


	//수입검사관리대장(봉제) 목록 선택시
	$('#purchaseOrderAdmTable tbody').on('click', 'tr', function(){
		sideView = "edit";
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}
		
		if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
        }
        else {
        	$('#purchaseOrderAdmTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
		
		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover

		tableIdx = $('#purchaseOrderAdmTable').DataTable().row(this).index();
		
		var data = purchaseOrderAdmTable.row(this).data();
		uiProc(true);
		
		inSlipNo = data.inSlipNo;	//입고전표번호
		poNo = data.poNo;
	    poSeq = data.poSeq;
	    itemSeq = data.itemSeq;
	    mainGubun = data.mainGubun;
	    itemGubun = data.itemGubun;
	    inspectDate = data.inspectDate;
	    preInWhsQty = data.preInWhsQty;
	    approvalYn = data.approvalYn;
	    poSeq = data.poSeq;
		inSeq = data.inSeq;
		inspCdVal = data.inspCd;

		poGubun = data.poGubun;
		outLocNo = data.outLocNo;
		outLocCd = data.outLocCd;
		
		sideView2 = "";
		
	    $('#itemModel').val(data.itemModel);
		$('#itemUnit').val(data.itemUnitNm); 
		$('#receiptGubun').val(data.receiptGubunNm);
		$('#preInWhsQty').val(data.preInWhsQty == null ? "0" : rmDecimal(data.preInWhsQty));//입고수량
		$('#inspectCnt').val(data.inspectQty == null ? "0" : rmDecimal(data.inspectQty));	//검사수량
		$('#pairQty').val(data.pairQty == null ? "0" : rmDecimal(data.pairQty));			//합격수량
		$('#faultyQty').val(data.faultyQty == null ? "0" : rmDecimal(data.faultyQty));	//불량수량
		$('#inspectChargr').val(data.inspectChargr == null ? "" : data.inspectChargr);		//검사자
		$('#inspectChargrNm').val(data.inspectChargrNm == null ? "" : data.inspectChargrNm);	//검사자명
		$('#inspectDesc').val(data.inspectDesc == null ? "" : data.inspectDesc);				//비고
		$('#qaEval').val(data.qaEval);
		$('#lotNo').val(data.lotNo);			
		data.inspectDate == null ? $('#inspectDate').val('') : $('#inspectDate').val(moment(data.inspectDate).format("YYYY-MM-DD"));
		if(data.cavityCnt != null){
			selectBoxAppend(cavityCntCode, "cavityCnt", data.cavityCnt, "");
		} else {
			selectBoxAppend(cavityCntCode, "cavityCnt", "005", "");
		}
		

		console.log('ddd');

		//승인 한 경우(등록,수정 비활성화, 검사항목 수정 x)
		if (approvalYn == "001") {         //자재상태:입고 -> 승인/승인취소 모두 불가
			$('#btnApprove').text('승인취소');
			$('#btnApprove').attr('disabled', false);
			$('#btnAdd').attr('disabled', true);		//등록 버튼
		    $('#btnEdit').attr('disabled', true);		//수정 버튼
		    
		    $('#tab2Head').removeClass('disabled');
			$('#tab3Head').removeClass('disabled');
			$('#tab4Head').removeClass('disabled');
			
			$('#btnInspPopup').attr('disabled', false);	//검사항목 버튼
			$('#btnInspAdd').addClass('d-none');		//검사항목 등록버튼
			$('#btnInspSave').addClass('d-none');		//검사항목 저장버튼

		//승인 안한 경우(등록,수정 비활성화, 검사항목 수정 x)
	    } else if(approvalYn == "002" || approvalYn==null) {
	    	if ( data.qaEval != null && data.qaEval != "" ) {
	    		$('#btnApprove').text('승인');
	    		$('#btnApprove').attr('disabled', false);
			} else {
				$('#btnApprove').text('승인');
				$('#btnApprove').attr('disabled', true);
			}	

	    	if(inspectDate != null){
		    	$('#btnAdd').attr('disabled', true);
		    	$('#btnEdit').attr('disabled', false);	
		    	$('#tab2Head').removeClass('disabled');
				$('#tab3Head').removeClass('disabled');
				$('#tab4Head').removeClass('disabled');
			}else{
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', true);
				$('#tab2Head').addClass('disabled');
				$('#tab3Head').addClass('disabled');
				$('#tab4Head').addClass('disabled');
			}
			
	    	$('#btnInspPopup').attr('disabled', false);	//검사항목 버튼
			$('#btnInspAdd').removeClass('d-none');		//검사항목 등록버튼
			$('#btnInspSave').removeClass('d-none');	//검사항목 저장버튼
	    }
		
	    $('#btnSave').addClass('d-none');

	  	//사진
		imgPrint();
		
		//탭 보여주기
		$('#tab1Head').tab('show');
		
		//탭 새로고침
		$('#itemInspectAttachTable').DataTable().ajax.reload(function(){
			if (itemInspectAttachTable.data().length == 0) {//성적서 접수 유/무 확인
				$('#millSheetY').prop('checked', false);
				$('#millSheetN').prop('checked', true);
			} else {
				$('#millSheetY').prop('checked', true);
				$('#millSheetN').prop('checked', false);
			}
		});
	    $('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});

		//검사항목 목록조회
	    $('#extAdmTable').DataTable().ajax.reload(function(){});
	    if(data.mainGubun == '001'){
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		}else if(data.mainGubun == '002'){
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		} 

		
	});
	
	//기본정보 탭 버튼
	$('#tab1Head').on('click', function() {
		if (itemInspectAttachTable.data().length == 0) {//성적서 접수 유/무 확인
			$('#millSheetY').prop('checked', false);
			$('#millSheetN').prop('checked', true);
		} else {
			$('#millSheetY').prop('checked', true);
			$('#millSheetN').prop('checked', false);
		}
	});

	//수입검사관리대장(봉제) 바코드별 목록조회
	let itemFaultyTypeTable = $('#itemFaultyTypeTable').DataTable({
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength :-1,
		scrollY : "30vh",
		ordering: false,
			ajax : {
			url : '<c:url value="io/preInOutWhsAdmList"/>',
			type : 'GET',
			data : {
				'inSlipNo' :  function(){return inSlipNo;},
			},
		},
		columns : [ 
			{
				render : function(data,type,row,meta){
					return meta.row+1;
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
				data : 'preInWhsQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{
				data : 'pairCnt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},
			{
				data : 'qaEval',
				render : function(data,type,row,meta){
					if(data!=null){
						if(data=="001"){
							return '<span style="color:blue;">합격</span>';
						}else if(data=="002"){
							return '<span style="color:red;">불합격</span>';
						}else{
							return '미판정';
						}
					}else{
						return '미판정';
					}
				}
			},
			{
				data : 'faultyCnt',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			},			
			{
				data : 'unfitProcNm',
				render : function(data, type, row, meta){
					if(data != null){
						return data;
					}else{
						return '-';
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

	//수입검사관리대장(봉제) 바코드별 목록 더블클릭시
    $('#itemFaultyTypeTable tbody').on( 'dblclick', 'tr', function () {

    	if($('#qaEval option:selected').val()==""){
			toastr.warning("우선 검사항목을 등록해주세요.");
			return false;
        }
        
       	if($(this).hasClass('selected')){
	        $(this).removeClass('selected');
        }else {
        	$('#itemFaultyTypeTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }

		tableIdx = $('#itemFaultyTypeTable').DataTable().row(this).index();
		 
		inSlipSeq =  itemFaultyTypeTable.row(this).data().inSlipSeq;	//입고전표시퀀스
		inSeq =  itemFaultyTypeTable.row(this).data().inSeq;
		barcodeNo =  itemFaultyTypeTable.row(this).data().barcodeNo;
		preInWhsQty =  itemFaultyTypeTable.row(this).data().preInWhsQty;

		selectFaultyType();


		$('#popupBarcodeNo').val(barcodeNo);
		$('#popupPreInWhsQty').val(rmDecimal(preInWhsQty));
		
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


	//수입검사관리대장(봉제) 바코드별 저장 처리
	$('#btnFaultyTypeSave').on('click',function() {
		var dataArray = new Array();		
		var check = true;  	
		jrCheck=true;	
		var sum = 0;
		
		
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

				rowData.inSlipNo= inSlipNo;
				rowData.inSlipSeq = inSlipSeq;
				rowData.itemSeq = itemSeq;
				rowData.pairCnt = parseFloat($('#popupPreInWhsQty').val().replace(/,/g,'')) - sum;
				rowData.faultyCnt = sum;
				rowData.qaEval = sum > 0 ? "002" : "001";	//불합격이 있을 경우 : 불합격/ 없을 경우 : 합격
				rowData.barcodeNo = barcodeNo;
				
				rowData.faultyTypeCd = $(this).find("td input[name=faultyTypeCd]").val();
				rowData.faultyTypeQty = $(this).find("td input[name=faultyTypeQty]").val()==""?'0':$(this).find("td input[name=faultyTypeQty]").val().replace(/,/g,'');
				rowData.faultyTypeDate = $(this).find("td input[name=faultyTypeDate]").val().replace(/-/g,'');
				rowData.faultyTypeDesc = $(this).find("td input[name=faultyTypeDesc]").val();
		        dataArray.push(rowData);
			});
		}
		if(check){
			$.ajax({
				url : '<c:url value="io/itemInspectFaultyTypeCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				async : false,
				success : function(res) {				
					if (res.result == 'ok') {
						$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
						$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});

						$('#pairQty').val(rmDecimal(res.totalPairQty));
						$('#faultyQty').val(rmDecimal(res.totalFaultyQty));
						
						$('#faultyTypePopUpModal').modal('hide');
					}else if(res.result == "fail"){
						toastr.error(res.message);
					}else{
						toastr.error(res.message);
					}
				}
			});
		}
	});

	  
	//등록버튼 클릭시
	$('#btnAdd').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("등록할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);
		uiProc2(false);

		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover
		
		$('#inspectChargr').val(userNumber);
		$('#inspectChargrNm').val(userNm);
		$('#inspectDate').val(serverDate);
		$('#btnSave').removeClass('d-none');
		$('#btnAdd').attr('disabled',true);
		$('#btnInspPopup').attr('disabled',false);
		$('#qaEval').attr('disabled',true);
		btnView = 'add';
	});
	
	//수정버튼 클릭시
	$('#btnEdit').on('click',function(){
		
		if(sideView != "edit"){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		//화면처리
		uiProc(false);
		uiProc2(false);
		//$('#qaEval').attr('disabled',true);
		$('#itemFaultyTypeTable').addClass('tr_highlight_row');	//hover
		$('#btnSave').removeClass('d-none');
		btnView = 'edit';
	});	
	
	
	let isClickInBtnApprove = false; //승인 버튼 중복클릭 방지 변수
	
	//승인 버튼 클릭시
	$('#btnApprove').on('click', function(){
		if (!isClickInBtnApprove) {
			isClickInBtnApprove = true;
			
			$('#my-spinner').show(function(){
				let check = true;
				let dataArray = new Array();
				
				if ( sideView != "edit" ) {
					toastr.warning("승인할 항목을 선택해주세요.");
					$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
					check = false;
					return false;
				}
				if ( inspectDate == null || inspectDate == "" ) {
					toastr.warning("우선 수입검사를 등록해주세요.");
					$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
					check = false;
					return false;
				}
				if ( $('#qaEval').val() == '' ) {
					toastr.warning("미판정된 수입검사입니다.");
					$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
					check = false;
					return false;
				}

				if (check) {
					$('#itemFaultyTypeTable tbody tr').each(function(index, item){
						let rowData = new Object();

						rowData.inSlipNo = inSlipNo;
						rowData.inSlipSeq = itemFaultyTypeTable.row(this).data().inSlipSeq;
						rowData.poNo = poNo==null?"":poNo;
						rowData.itemGubun = itemGubun;
						rowData.itemSeq = itemFaultyTypeTable.row(this).data().itemSeq;
						let preInWhsQty = parseFloat(itemFaultyTypeTable.row(this).data().preInWhsQty.replace(/,/g,''));
						let faultyCnt = parseFloat(itemFaultyTypeTable.row(this).data().faultyCnt.replace(/,/g,''));
						rowData.inWhsQty = preInWhsQty-faultyCnt;
						rowData.inWhsDate = itemFaultyTypeTable.row(this).data().preInWhsDate;
						rowData.qaEval = $('#qaEval option:selected').val();
						rowData.barcodeNo = itemFaultyTypeTable.row(this).data().barcodeNo;
						
						//창고 내용 입력
						let tempLocNo;
						let tempAreaCd;
						let tempFloorNm;
						let tempLocCd;
						
						$.ajax({
							url : '<c:url value="io/preInOutWhsAdmList"/>',
							type : 'GET',
							async : false,
							data : {
								'inSlipNo' : function() {return inSlipNo;},
								'inSlipSeq' : function() {return inSlipSeq;},
							},
							success : function(res) {
								let data = res.data;
								
								tempLocNo = data[0].locationNo;
								tempAreaCd = data[0].areaCd;
								tempFloorNm = data[0].floorCd;
								tempLocCd = data[0].locationCd;
							}
						});
						
						rowData.locationNo = tempLocNo;
						rowData.locationCd = tempLocCd;
						rowData.areaCd = tempAreaCd;
						rowData.floorNm = tempFloorNm;

						rowData.poGubun = poGubun;
						rowData.outLocNo = outLocNo;
						rowData.outLocCd = outLocCd;
				        dataArray.push(rowData);
					});
					console.log(dataArray);
					
					if ( $('#btnApprove').text() == '승인' ) {
						if(check){
							$.ajax({
								url : '<c:url value="qm/poStatusUpdate"/>',
								type : 'POST',
								async:false,
								datatype: 'json',
								data: JSON.stringify(dataArray),
								contentType : "application/json; charset=UTF-8",
								success : function(res) {				
									if ( res.result == "ok" ) {
										toastr.success("승인 되었습니다.");
										$('#btnApprove').text('승인취소');
										$('#btnInspPopup').attr('disabled', true);
										$('#btnEdit').attr('disabled', true);
										
										$('#purchaseOrderAdmTable').DataTable().ajax.reload(function() {});
									} else if ( res.result == "fail" ) {
										toastr.warning(res.message);
									} else {
										toastr.error(res.message);
									}
								},
								complete : function(){
									$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
								},
							});
						}
					} else if ( $('#btnApprove').text() == '승인취소' ){
						if(check){
							$.ajax({
								url : '<c:url value="qm/poApprovalCancel"/>',
								type : 'POST',
								async:false,
								datatype: 'json',
								data: JSON.stringify(dataArray),
								contentType : "application/json; charset=UTF-8",
								success : function(res) {
									if ( res.result == "ok" ) {
										toastr.success("승인취소 되었습니다.");
										$('#btnApprove').text('승인');
										$('#btnInspPopup').attr('disabled', true);
										$('#btnEdit').attr('disabled', false);
										
										$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});
									} else if ( res.result == "stockFail" ) {
										toastr.warning(res.message);
									} else if ( res.result == "fail" ) {
										toastr.warning(res.message);
									} else {
										toastr.error(res.message);
									}
								},
								complete : function(){
									$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
								},
							});
						}
					} else {
						$('#my-spinner').hide(function(){isClickInBtnApprove = false;});
						console.log("예상치 못한 오류가 발생했습니다. - btnApprove onclick");
					}
				}
			});
		}
	});
	
	//저장버튼 클릭시
	$('#btnSave').on('click',function(){

		//예외처리
		/* if($('#qaEval').val()==""){
			toastr.warning("판정을 선택해주세요.");
			return false;
		} */

		if($('#inspectDate').val()==""){
			toastr.warning("검사일자를 선택해주세요.");
			return false;
		}

		if($('#inspectChargr').val()==""){
			toastr.warning("검사자를 선택해주세요.");
			return false;
		}

		if($('#inspectCnt').val()=="0"){
			toastr.warning("검사수량을 선택해주세요.");
			return false;
		}

		var url= "";
		if(btnView=="add"){
			url = '<c:url value="qm/itemInspectMasterCreate"/>';
		}else{
			url = '<c:url value="qm/itemInspectMasterUpdate"/>';
		}
		
		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'inSlipNo' : function(){return inSlipNo;},
				'itemSeq' : function(){return itemSeq;},
				'inspectCnt' : function(){return $('#inspectCnt').val().replace(/,/g,'')},
				'inspectDate' : function(){return $('#inspectDate').val().replace(/-/g,'')},
				'inspectChargr' : function(){return $('#inspectChargr').val()},
				'qaEval' : function(){return $('#qaEval').val()},
				'cavityCnt' : function(){return $('#cavityCnt').val()},
				'approvalYn' : "002",	//미승인
				'inspectDesc' : function(){return $('#inspectDesc').val()}
				},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("저장 되었습니다.");
					uiProc(true);

					$('#btnAdd').attr('disabled', true);
			    	$('#btnEdit').attr('disabled', false);	
			    	$('#btnQAPrint').attr('disabled', false);
			    	$('#btnSave').addClass('d-none');
			    	$('#tab2Head').removeClass('disabled');
					$('#tab3Head').removeClass('disabled');
					$('#tab4Head').removeClass('disabled');
					$('#btnApprove').text('승인');
					$('#btnApprove').attr('disabled', false);

					$('#purchaseOrderAdmTable').DataTable().ajax.reload(function(){});

					$('#itemFaultyTypeTable').removeClass('tr_highlight_row');	//hover
				}else{
					toastr.error(res.message);
				}
			}
		});
		
	}) 
	

	//담당자 팝업 시작
	var userPopUpTable;
	function selectInspectChargr() {
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
						//'departmentCd' : '007'			
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
					data : 'chargeDutyNm'
				}, {
					data : 'userDesc'
				}, ],
				columnDefs : [ {
					"targets" : [ 0, 1, 2, 3, 4 ],
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
					url : '<c:url value="qm/itemInspectFaultyTypeList"/>',
					type : 'GET',
					async : false,
					data : {
						'inSlipNo' : function(){return inSlipNo;},
						'inSlipSeq' : function(){return inSlipSeq;},
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
								return '<input type="date" class="form-control"  name="faultyTypeDate" value="'+moment(data).format("YYYY-MM-DD")+'" />'  
								
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
			/* $('#faultyTypePopUpTable tbody').on('click', 'tr', function() {
				var data = userPopUpTable.row(this).data();
				$('#inspectChargr').val(data.userNumber);
				$('#inspectChargrNm').val(data.userNm);
				
				$('#userPopUpModal').modal('hide');
			}); */
		} else {
			$('#faultyTypePopUpTable').DataTable().ajax.reload(function() {});
		}

		if(modalHide){
			$('#faultyTypePopUpModal').modal('show');
		}
	}


	function uiProc(flag) {
		$('#inspectDateCalendar').attr('disabled', flag);
		$('#btnInspectChargr').attr('disabled', flag);
		$('#qaEval').attr('disabled', flag);
		$('#inspectCnt').attr('disabled', flag);
		$('#inspectDesc').attr('disabled', flag); // 비고 input
		$('#btnJrbr').attr('disabled', flag); // 전량불량 버튼
		//$('#cavityCnt').attr('disabled', flag);
	}

	function uiProc2(flag) {
		$('input[name=faultyTypeQty]').attr('disabled', flag);
		$('button[name=faultyTypeDateFromCalendar]').attr('disabled', flag);
		$('input[name=faultyTypeDesc]').attr('disabled', flag);
	}
	

	//파일 삭제버튼
   	function inspectFileNmDel(value) {
	
		$.ajax({
			url : '<c:url  value="qm/inspectFileDelete"/>',
			type : 'GET',
			data : {
				'poNo' : poNo,
				'poSeq' : poSeq,
				'inSeq' : inSeq,
				'value' : value
			},
			success : function(res){
				if(res.result == "ok"){
					toastr.success("파일이 삭제되었습니다.");
				}
			}
		});
		
		$('#fileNm' + value).val('');
		$('#fpValue' + value).text("파일을 선택해주세요");
	}


	//QA라벨발행 버튼 클릭시
	$(document).on('click','#btnQAPrint',function(){
		var count=0;

		$('#purchaseOrderAdmTable tbody tr').each(function(index, item) {
			if($('input[name=checkbox]').eq(index).is(':checked')) {

				count++;
			}
		});
		
		if(count == 0) {
			toastr.warning('인쇄할 제품을 체크하고 인쇄해주세요.');
			count=0;
			return false;
		}

		var cnt = $('#printCnt').val();

    	for(var i=0;i<printArray.length;i++) {
        	for(var j=0;j<cnt;j++) {
        		labelPrint(	printArray[i].qaEval,
	    				printArray[i].preInWhsDate,
	    				printArray[i].preInWhsQty,
	    				printArray[i].poNo,
	    				printArray[i].inspectDate,
	    				printArray[i].inspectChargrNm,
	    				printArray[i].partCd);
            }
        }

    	printArray =[];	//프린트 배열 초기화
    	$('input[name=checkbox]').prop('checked',false);
    	count=0;
    });
	
	
</script>
<script>

//Do printing...
function labelPrint(qaEval,
					preInWhsDate,
					preInWhsQty,
					poNo,
					inspectDate,
					inspectChargrNm,
					partCd) {

		var cmds="";
		
		var cmds =  "1";
	 		cmds += "34#$";
	 		cmds += "^XA";
	 		cmds += "^PRD";
	 		cmds += "^SEE:UHANGUL.DAT^FS";
	 		cmds += "^CW1,E:KFONT3.FNT^CI26^FS";
	 		cmds += "^FO60,10^GB210,352,2^FS";
	 		cmds += "^FO268,10^GB170,352,2^FS";
	 		cmds += "^FO268,10^GB500,72,2^FS";
	 		cmds += "^FO268,80^GB500,72,2^FS";
	 		cmds += "^FO268,150^GB500,72,2^FS";
	 		cmds += "^FO268,220^GB500,72,2^FS";
	 		cmds += "^FO268,290^GB500,72,2^FS";
	 		if(qaEval == '합격') {
	 			cmds += "^FO95,140^A1N,65,65^FD"+qaEval+"^FS";
		 	} else if(qaEval == '불합격') {
		 		cmds += "^FO70,40^A1N,70,70^FDNOK^FS";
		 		cmds += "^FO70,140^A1N,65,65^FD"+qaEval+"^FS";
			}
	 		cmds += "^FO90,270^A1N,30,30^FD  "+inspectChargrNm+"^FS";
	 		cmds += "^FO90,320^A1N,30,30^FD품질보증팀^FS";
	 	    cmds += "^FO280,30^A1N,33,33^FD입고일자^FS";
	 	   	cmds += "^FO450,30^A1N,33,33^FD"+preInWhsDate+"^FS";
	 	    cmds += "^FO280,100^A1N,33,33^FD입고수량^FS";
	 	   	cmds += "^FO450,100^A1N,33,33^FD"+preInWhsQty+"^FS";
	 	    cmds += "^FO280,170^A1N,33,33^FDPO.NO^FS";
	 	   	cmds += "^FO450,170^A1N,33,33^FD"+poNo+"^FS";
	 	    cmds += "^FO280,240^A1N,33,33^FD검사일자^FS";
	 	   	cmds += "^FO450,240^A1N,33,33^FD"+inspectDate+"^FS";
	 	    cmds += "^FO280,310^A1N,33,33^FDCODE^FS";
	 	   	cmds += "^FO450,310^A1N,33,33^FD"+partCd+"^FS";

	 	    
	 		//cmds += "^FO70,80^GB200,73,3^FS";
	 	    //cmds += "^FO110,105^A1N,30,30^FDI T E M^FS";		    
	 		//cmds += "^FO70,150^GB200,73,3^FS";
	 	    //cmds += "^FO110,175^A1N,30,30^FDS P E C^FS";		    
	 		//cmds += "^FO70,220^GB200,73,3^FS";
	 	    //cmds += "^FO85,245^A1N,25,25^FD입고일자/수량^FS";		    
	 		//cmds += "^FO70,290^GB700,73,3^FS";	
	 		cmds += "^XZ";
			sendMessage(cmds);
}

	//불량이력관리팝업
	var partCd= '';
	var partRev= '';
	var inspectDate= '';
	
	function selectBad(idx) {
		itemSeq = itemInspectTable.row(idx).data().itemSeq;
		inspectDate = itemInspectTable.row(idx).data().inspectDate;
		
		//목록
		let badTable = $('#badTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
			language : lang_kor,		
			paging : true,
			searching : true,
			info : true,
			destroy: true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 15,
			//ordering: false,
			ajax : {
				url : '<c:url value="qm/itemInspectAdmPopUpList"/>',
				type : 'GET',
				data : {
					'itemSeq'	: function(){return itemSeq;},
					'inspectDate' : function(){return inspectDate;}
					
				},
			},
			rowId : 'soNb',
			columns : [
				{data : 'statusCd',
					render: function(data, type, row, meta){
						if(data == "A" || data == "L"){
							return '승인';
						}else{
							return '미승인';
						}
					}
				},
				{data : 'qaEval',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return data;
						}
					}
				},
				{data : 'itemGubun',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return data;
						}
					}
				},	
				{data : 'preInWhsDate',
					render: function(data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{data : 'dealCorpNm' ,
					render : function(data, type, row, meta){
						if(data!=null){
							return data;
						}else{
							return row['spplyCorpNm'];
						}
					}
				}, 
				{data : 'itemCd'},
				{data : 'itemNm'},
				{data : 'itemModel'},
				{data : 'preInWhsQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'faultyCnt',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'inspectDate',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return moment(data).format("YYYY-MM-DD");
						}
					}
				},
			],
			drawCallback: function(settings) {
	        }, 
	        columnDefs : [ {
				"defaultContent": "-", "targets": "_all",	"className": "text-center"
			}],
		    order : [
				[10, 'desc']
			]
		});
		$('#badPopUpModal').modal('show');
	}

	
	//반품이력관리
	function selectReturn(idx) {
		itemSeq = itemInspectTable.row(idx).data().itemSeq;
		inspectDate = itemInspectTable.row(idx).data().inspectDate;

		//반품 목록
		let returnTable = $('#returnTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
			language : lang_kor,		
			paging : true,
			searching : true,
			info : true,
			destroy: true,
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : true,
			pageLength : 15,
			//ordering: false,
			ajax : {
				url : '<c:url value="qm/itemInspectReturnPopUpList"/>',
				type : 'GET',
				data : {
					'itemSeq'		: function(){return itemSeq;},
					'inspectDate' 	: function(){return inspectDate;}
				},
			},
			rowId : 'soNb',
			columns : [
				{ data : 'itemGubun' 		},
				{ data : 'itemCd'  			},
				{ data : 'itemNm'  			},
				{ data : 'itemModel'  		},
				{data : 'returnQty',
					className : 'text-right',
					render : function(data, type, row, meta){
						if(data!=null){
							return rmDecimal(data);
						}else{
							return '-';
						}
					}
				},
				{data : 'returnDate',
					render: function(data, type, row, meta){
						if(data == null){
							return '-';
						}else{
							return moment(data).format("YYYY-MM-DD");
						}
					}
				},
				
				{ data : 'faultyChargrNm' 	},
			],
			drawCallback: function(settings) {
	        }, 
	        columnDefs : [ {
				"defaultContent": "-", "targets": "_all",	"className": "text-center"
			}],
		    order : [
				[5, 'desc']
			]
		});
		$('#returnPopUpModal').modal('show');
	}
	
	//성적서 탭 클릭시
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
	
	//이미지 등록
	function imageUpload(number) {
		var value = null;

		value = number;

		var fileListView = "";

		var formData = new FormData(document.getElementById("form21")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.
		
		formData.append("inSlipNo", inSlipNo);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.

		$.ajax({
			url : '<c:url value="/qm/itemInspectImageUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgName' + value).text("");
				}
// 				imgPrint();
			}
		});

	}
	
	//이미지 조회
// 	function imgPrint() {
// 		$.ajax({
// 			url : '<c:url value="/qm/itemInspectImgRead"/>',
// 			data : {
// 				'inSlipNo' : function(){return inSlipNo;},
// 			},
// 			type : 'GET',
// 			success : function(res) {
// 				var data = res.data;
// 				if (data.imageFile1 != null) {
// 					$('#imageFile1').attr("src", "data:image/jpg;base64," + data.imageFile1);
// 					$('#imgName1').text(data.imageFile1Nm);
// 				} else {
// 					$('#imageFile1').attr("src", " ");
// 					$('#imgName1').text("");
// 				}
				
// 				if (data.imageFile2 != null) {
// 					$('#imageFile2').attr("src", "data:image/jpg;base64," + data.imageFile2);
// 					$('#imgName2').text(data.imageFile2Nm);
// 				} else {
// 					$('#imageFile2').attr("src", " ");
// 					$('#imgName2').text("");
// 				}
				
// 				if (data.imageFile3 != null) {
// 					$('#imageFile3').attr("src", "data:image/jpg;base64," + data.imageFile3);
// 					$('#imgName3').text(data.imageFile3Nm);
// 				} else {
// 					$('#imageFile3').attr("src", " ");
// 					$('#imgName3').text("");
// 				}
				
// 				if (data.imageFile4 != null) {
// 					$('#imageFile4').attr("src", "data:image/jpg;base64," + data.imageFile4);
// 					$('#imgName4').text(data.imageFile4Nm);
// 				} else {
// 					$('#imageFile4').attr("src", " ");
// 					$('#imgName4').text("");
// 				}
// 			},
// 			error : function(xhr, textStatus, error) {
// 				alert("예상치 못한 오류가 발생했습니다.");
// 			}
// 		});
// 	}
	
	//이미지 삭제
	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/qm/itemInspectImageDelete"/>',
			type : 'POST',
			data : {
				'poNo' : function(){return poNo;},
				'poSeq' : function(){return poSeq;},
				'inSeq' : function(){return inSeq;},
				'value' : function(){return value;},
			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
// 					imgPrint();
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
		$('#imgAdd' + value).val("");
		$('#imgName' + number).val("");
		$('#imgName' + number).text("");
		$('#imgName' + number).attr("src", "");
	}
	
	//관련자료 탭 클릭시
	$('#tab3Head').on('click', function() {
		$('#btnSave').addClass('d-none');
		
		imgPrint();
// 		$('#itemInspectAttachTable').DataTable().ajax.reload();
		
	});
	
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
		pageLength : 10,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return inSlipNo;},
				'attachGubun' : function(){return 'II';},
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
							var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+inSlipNo+'&attachGubun=II">'+data+'</a>';
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
		}
		tableIdx = $('#itemInspectAttachTable').DataTable().row(this).index();
		attachSeq = itemInspectAttachTable.row(tableIdx).data().attachSeq;
		tempView = "edit";
	});
	
	//관련자료 추가버튼
	$('#btnAttachAdd').on('click', function() {
 		sideView2 = 'add';

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
					'attachGubun' : function(){return 'II';},
					'attachCd' : function(){return inSlipNo;},
					'etc1' : function(){return inSlipSeq;},
					'etc2' : function(){return inSeq;},
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
	
	// 관련자료 저장
	$('#btnAttachSave').on('click', function() {
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
						'attachGubun' : 'II',
						'attachCd' : function(){return inSlipNo;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('path', fileDate);
				formData.append('attachCd', inSlipNo);
				formData.append('attachSeq', attachDataSeq);
				formData.append('attachGubun', 'II');
				formData.append('idCheck', 'II');
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
							sideView2 = "";
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
	

/*
	//수입검사성적서 등록
	let filePopUpTable;
	let checkBoxArray;
	
	function fileOnclick() {
		if (filePopUpTable == null || filePopUpTable == undefined) {
			filePopUpTable = $('#filePopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
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
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/commonCodeList"/>',
					type : 'GET',
					data : {
						'baseGroupCd' : function() { return '116'; }
					}
				},
				columns : [ 
				{
					render : function(data, type, row, meta) {
						return '<input type="checkbox" class="form-control" name="checkBox1" value="" style="min-width : 100%"/>';
					}
				},
				{
					data : 'baseNm',
					render : function(data, type, row, meta) {
						if (data != null) {
							return '<input type="text" class="form-control" style="text-align:center; min-width:100%" name="baseNm" value="'+data+'" disabled />';
						} else {
							return '<input type="text" class="form-control" style="text-align:center; min-width:100%" name="baseNm" value="" />';
						}
					}
				}
				],
				columnDefs : [ {} ],
		        buttons: [ ],
				order : [ [ 0, 'asc' ] ],
			});
			
			$('#btnFileSave').on('click', function() {
				checkBoxArray = [];
				var baseNm;
				var checkBoxCheck = true;
				var fileCheck = false;
				$('#filePopUpTable tbody tr').each(function(index, item) {
					if($(this).find('td input[name="checkBox1"]').prop('checked')){
						var data = filePopUpTable.row(this).data();
						var baseNm = data.baseNm;
						checkBoxCheck = false;
						
						$('#itemInspectAttachTable tbody tr').each(function(index, item) {
							
							if ($(this).find("td input[name=contents]").val() == baseNm) {
								toastr.warning($(this).find("td input[name=contents]").val() + ' 파일은 이미 등록되어 있습니다.');
								fileCheck = true;
								return false;
							}
							if(fileCheck){return false;}
							
						});
						
						checkBoxArray.push(baseNm);
						
					}
					
					
				});
				
				if(checkBoxCheck){
					toastr.warning('등록할 수입검사성적서를 선택해주세요.');
					return false;
				}
				
				if(fileCheck){
					return false;
				}
				
				var tempCheck = true;
				$('#filePopUpTable tbody tr').each(function(index, item) {
				
					if($(this).find('td input[name="checkBox1"]').prop('checked')){
						
						var dataArray = new Array();
						var formData = new FormData();
						
						$.ajax({
							url : '<c:url value="/bm/attachDataSeq"/>',
							type : 'GET',
							async : false,
							data : {
								'attachGubun' : 'II',
								'attachCd' : function(){return poNo;},
								'etc1' : function(){return poSeq;},
								'etc2' : function(){return inSeq;},
							},
							success : function(res) {
								attachSeq = res.seq;
							}
						});
	
						formData.append('path', fileDate);
						formData.append('attachCd', poNo);
						formData.append('attachSeq', attachSeq);
						formData.append('contents', $(this).find("td input[name=baseNm]").val());
						formData.append('attachGubun', 'II');
						formData.append('idCheck', 'II');
						formData.append('etc1', poSeq);
						formData.append('etc2', inSeq);
						
						
						$.ajax({
							url : '<c:url value="/bm/attachDataCreate"/>',
							type : 'POST',
							data : formData,
						    processData: false,
					        contentType: false,
					        async : false,
							success : function(res) {
								let data = res.data;
								if (res.result == 'ok' && tempCheck) {
									toastr.success('등록되었습니다.');
									tempCheck = false;
								} else if (res.result == 'error') {
									toastr.error(res.message);
								}
							},
							complete : function() {
								$('#itemInspectAttachTable').DataTable().ajax.reload();
								$('#btnAttachSave').removeClass('d-none');
								$('#btnAttachAdd').attr('disabled', false);
								$('#btnAttachDel').attr('disabled', false);
								$('#filePopUpModal').modal('hide');
								tempView = "";
							}
						});
						
						
					}
				
				});
				
				
			});
			
		} else {
			$('#filePopUpTable').DataTable().ajax.reload(function() {});
			checkBoxArray = [];
		}

		$('#filePopUpModal').modal('show');
	} */

	// 선택 event
  	$(document).on('change','input:checkbox[name=checkbox]',function() {

		if($(this).is(':checked')) {
			var data = itemInspectTable.row($(this).parents().parents()).data();
	    	var obj = new Object();
	    	obj.qaEval = data.qaEval;
	    	obj.preInWhsDate = moment(data.preInWhsDate).format('YYYY.MM.DD');
	    	obj.preInWhsQty = rmDecimal(data);
	    	obj.poNo = data.poNo;
	    	obj.inspectDate = moment(data.inspectDate).format('YYYY.MM.DD');
	    	obj.inspectChargrNm = data.inspectChargrNm == null ? "-" : data.inspectChargrNm;
	    	obj.partCd = data.partCd;
	    	obj.barcodeNo = data.barcodeNo;
    		printArray.push(obj);
    		
	    } else if($(this).is(':checked')==false) {
		    
		    var data = itemInspectTable.row($(this).parents().parents()).data();
		    var barcodeNo = data.barcodeNo;

		    if(printArray.findIndex(i => i.barcodeNo == barcodeNo) != -1) { // 프린트할 배열에 존재할 경우
		    	printArray.splice(printArray.findIndex(i => i.barcodeNo == barcodeNo),1);
			}
		}
	}); 


 	//검사항목등록
	$('#btnInspPopup').on('click', function() {
		if(!$('#purchaseOrderAdmTable tbody tr').hasClass('selected')){
			toastr.warning("검사항목 등록할 목록을 선택해 주세요");
			return false;
		}
		inspTypeVal = '외관';
		$('#inspPopupModal').modal('show');

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');

		//수분기준 조회
		$.ajax({
			url : '<c:url value="/bm/inspAdmRead"/>',
			type : 'GET',
			data : {
				'inspCd' : function(){return inspCdVal},
			},
			success : function(res){
				let data = res.data;
				inspDesc1Html = data.inspDesc1 == null ? "" : data.inspDesc1;
				inspDesc2Html = data.inspDesc2 == null ? "" : data.inspDesc2;

				var html = '<p class="m-0" style="text-align: right; color: #0073ff;">'+inspDesc1Html+'</p>';
				html += '<p class="m-0" style="text-align: right;">'+inspDesc2Html+'</p>';
				
				$('#sizeAdmTable_length').html(html);
				$('#sizeAdmTable2_length').html(html);
			}
		});

		setTimeout(function(){
			extAdmTable.draw();
		}, 200);
		
	});


	var inspTypeVal="외관";
	//외관 버튼 클릭시
	$('#btnExt').on('click',function(){
		console.log('외관 버튼 클릭');

		inspTypeVal = '외관';

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv2').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#cavityCnt').val()*1);
		
	});
	
	//치수 버튼 클릭시
	$('#btnSize').on('click',function(){

		console.log('치수 버튼 클릭');

		inspTypeVal = '치수';
		if ( mainGubun == '001' ) {//사출
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').removeClass('d-none');
			$('#sizeAdmTableDiv').addClass('d-none');
			$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		} else if ( mainGubun == '002' ) {//봉제
			$('#extAdmTableDiv').addClass('d-none');
			$('#sizeAdmTableDiv2').addClass('d-none');
			$('#sizeAdmTableDiv').removeClass('d-none');
			$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		}
		
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable2.draw();
			sizeAdmTable2.draw();
			sizeAdmTable.draw();
		}, 300);
		
		//cavity 수에 따라 보여지는 컬럼 설정
	 	//columnDnone();
	 	
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
		
		setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		}, 300);
	}
	
	//치수 - 봉제 컬럼 d-none 처리
	function columnDnone() {
		//처음엔 다 d-none 해제
		$('#blueThOne2').removeClass('d-none');
		$('#blueThOne3').removeClass('d-none');
		$('#blueThOne4').removeClass('d-none');
		$('#blueThOne5').removeClass('d-none');
		$('#blueThOne6').removeClass('d-none');
		$('#blueThOne7').removeClass('d-none');
		$('#blueThOne8').removeClass('d-none');
		$('#thOne21').removeClass('d-none');
		$('#thOne22').removeClass('d-none');
		$('#thOne23').removeClass('d-none');
		$('#thOne31').removeClass('d-none');
		$('#thOne32').removeClass('d-none');
		$('#thOne33').removeClass('d-none');
		$('#thOne41').removeClass('d-none');
		$('#thOne42').removeClass('d-none');
		$('#thOne43').removeClass('d-none');
		$('#thOne51').removeClass('d-none');
		$('#thOne52').removeClass('d-none');
		$('#thOne53').removeClass('d-none');
		$('#thOne61').removeClass('d-none');
		$('#thOne62').removeClass('d-none');
		$('#thOne63').removeClass('d-none');
		$('#thOne71').removeClass('d-none');
		$('#thOne72').removeClass('d-none');
		$('#thOne73').removeClass('d-none');
		$('#thOne81').removeClass('d-none');
		$('#thOne82').removeClass('d-none');
		$('#thOne83').removeClass('d-none');
		sizeAdmTable.column(9).visible(true);
		sizeAdmTable.column(10).visible(true);
		sizeAdmTable.column(11).visible(true);
		sizeAdmTable.column(12).visible(true);
		sizeAdmTable.column(13).visible(true);
		sizeAdmTable.column(14).visible(true);
		sizeAdmTable.column(15).visible(true);
		sizeAdmTable.column(16).visible(true);
		sizeAdmTable.column(17).visible(true);
		sizeAdmTable.column(18).visible(true);
		sizeAdmTable.column(19).visible(true);
		sizeAdmTable.column(20).visible(true);
		sizeAdmTable.column(21).visible(true);
		sizeAdmTable.column(22).visible(true);
		sizeAdmTable.column(23).visible(true);
		sizeAdmTable.column(24).visible(true);
		sizeAdmTable.column(25).visible(true);
		sizeAdmTable.column(26).visible(true);
		sizeAdmTable.column(27).visible(true);
		sizeAdmTable.column(28).visible(true);
		sizeAdmTable.column(29).visible(true);
		
		//그다음 cavity 수에 따라 d-none 부여
		let cavityCntVal = $('#cavityCnt').val();
	 	cavityCntVal *= 1;
	 	
	 	switch(cavityCntVal){
		 	case 1:
	 			$('#blueThOne2').addClass('d-none');
	 			$('#thOne21').addClass('d-none');
	 			$('#thOne22').addClass('d-none');
	 			$('#thOne23').addClass('d-none');
	 			sizeAdmTable.column(9).visible(false);
	 			sizeAdmTable.column(10).visible(false);
	 			sizeAdmTable.column(11).visible(false);
	 		case 2:
	 			$('#blueThOne3').addClass('d-none');
	 			$('#thOne31').addClass('d-none');
	 			$('#thOne32').addClass('d-none');
	 			$('#thOne33').addClass('d-none');
	 			sizeAdmTable.column(12).visible(false);
	 			sizeAdmTable.column(13).visible(false);
	 			sizeAdmTable.column(14).visible(false);
	 		case 3:
	 			$('#blueThOne4').addClass('d-none');
	 			$('#thOne41').addClass('d-none');
	 			$('#thOne42').addClass('d-none');
	 			$('#thOne43').addClass('d-none');
	 			sizeAdmTable.column(15).visible(false);
	 			sizeAdmTable.column(16).visible(false);
	 			sizeAdmTable.column(17).visible(false);
	 		case 4:
	 			$('#blueThOne5').addClass('d-none');
	 			$('#thOne51').addClass('d-none');
	 			$('#thOne52').addClass('d-none');
	 			$('#thOne53').addClass('d-none');
	 			sizeAdmTable.column(18).visible(false);
	 			sizeAdmTable.column(19).visible(false);
	 			sizeAdmTable.column(20).visible(false);
	 		case 5:
	 			$('#blueThOne6').addClass('d-none');
	 			$('#thOne61').addClass('d-none');
	 			$('#thOne62').addClass('d-none');
	 			$('#thOne63').addClass('d-none');
	 			sizeAdmTable.column(21).visible(false);
	 			sizeAdmTable.column(22).visible(false);
	 			sizeAdmTable.column(23).visible(false);
	 		case 6:
	 			$('#blueThOne7').addClass('d-none');
	 			$('#thOne71').addClass('d-none');
	 			$('#thOne72').addClass('d-none');
	 			$('#thOne73').addClass('d-none');
	 			sizeAdmTable.column(24).visible(false);
	 			sizeAdmTable.column(25).visible(false);
	 			sizeAdmTable.column(26).visible(false);
	 		case 7:
	 			$('#blueThOne8').addClass('d-none');
	 			$('#thOne81').addClass('d-none');
	 			$('#thOne82').addClass('d-none');
	 			$('#thOne83').addClass('d-none');
	 			sizeAdmTable.column(27).visible(false);
	 			sizeAdmTable.column(28).visible(false);
	 			sizeAdmTable.column(29).visible(false);
	 	}
	 	
	}


	//등록버튼 클릭시
	$('#btnInspAdd').on('click',function(){
		if ( inspTypeVal=="외관" ) {
			$('select[name=inspResult1]').attr('disabled', false);
			$('select[name=inspResult2]').attr('disabled', false);
			$('select[name=inspResult3]').attr('disabled', false);
			$('select[name=inspResult4]').attr('disabled', false);
			$('select[name=inspResult5]').attr('disabled', false);
			
			$('#extAdmTable select[name=inspResult1]').eq(0).focus();
			
		} else {//치수
			let inspTypeArr = ['001'];
			
			$.ajax({
				url : '<c:url value="bm/getInspResult" />',
				type : 'GET',
				data : {
					'inspCd' 		  : function(){return inspCdVal},
					'inspResultGubun' : "003",
					'inspSourceNo' : function(){return inSlipNo},
					'inspTypeArr' : function(){return inspTypeArr},
					'inspType' : function(){return "001"}
				}, 
				success : function(res){
					if ( res.data != "U" ) {
						$('input[name=inspX1]').attr('disabled', false);
						$('input[name=inspX2]').attr('disabled', false);
						$('input[name=inspX3]').attr('disabled', false);
						$('input[name=inspX4]').attr('disabled', false);
						$('input[name=inspX5]').attr('disabled', false);
						
						$('#sizeAdmTable input[name=inspX1]').eq(0).focus();
						$('#sizeAdmTable input[name=inspX1]').eq(0).select();
						$('#sizeAdmTable2 input[name=inspX1]').eq(0).focus();
						$('#sizeAdmTable2 input[name=inspX1]').eq(0).select();
						
					} else {
						toastr.warning("외관을 우선 검사해주세요.");
					}
				}
			});
		}
		
	});


	//저장버튼 클릭시
	$('#btnInspSave').on('click',function(){
		var check = true;
		var dataArray = new Array(); 
		
		if ( inspTypeVal == "외관" ) {
			$('#extAdmTable tbody tr').each(function(index, item) {

				var rowData = new Object();

				rowData.inspResultGubun = "003";
				rowData.inspSourceNo = inSlipNo;
				rowData.inspSourceSubNo = "";
				rowData.inspCd = extAdmTable.row(index).data().inspCd;
				rowData.inspType = extAdmTable.row(index).data().inspType;
				rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
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
				
				//그 후 cavity 값에 따라 값을 찾아서 입력
				switch (cavityCntVal) {
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
				dataArray.push(rowData);
			});
		} else {//치수
			$('#sizeAdmTable tbody tr').each(function(index, item) {
				var rowData = new Object();
				rowData.inspResultGubun = "003";
				rowData.inspSourceNo = inSlipNo;
				rowData.inspSourceSubNo = "";
				rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
				rowData.inspType = sizeAdmTable.row(index).data().inspType;
				rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
				rowData.inspectGubun = "";
				
				//최종판정
				let min = sizeAdmTable.row(index).data().inspStandLower;
				let max = sizeAdmTable.row(index).data().inspStandUpper;
				
				//inspResult 판정
				let resultYCnt = 0;
				for (var i = 1; i <= 5; i++) {
					let inspData = $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

					if ( (parseFloat(min) <= parseFloat(inspData)) && (parseFloat(inspData) <= parseFloat(max)) ) {
						resultYCnt++;
					}
					
					if ( inspData == null || inspData == "" ) {
						resultYCnt = -1;
						break;
					}
					
				}
				if (resultYCnt == 5) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1) {
					rowData.inspResult = "";	//미판정
				} else {
					rowData.inspResult = "002";	//불합격
				}
				
				//cavity 값 입력
				//먼저 초기화
				rowData.inspX1 = '';
				rowData.inspX2 = '';
				rowData.inspX3 = '';
				rowData.inspX4 = '';
				rowData.inspX5 = '';

				rowData.inspX1 = $(this).find('td input[name=inspX1]').val();
				rowData.inspX2 = $(this).find('td input[name=inspX2]').val();
				rowData.inspX3 = $(this).find('td input[name=inspX3]').val();	
				rowData.inspX4 = $(this).find('td input[name=inspX4]').val();	
				rowData.inspX5 = $(this).find('td input[name=inspX5]').val();
						
				dataArray.push(rowData);
				console.log(rowData);
			});
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspResultAdmCreate"/>',
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
						$('select[name=inspResult1]').attr('disabled', true);
						$('select[name=inspResult2]').attr('disabled', true);
						$('select[name=inspResult3]').attr('disabled', true);
						$('select[name=inspResult4]').attr('disabled', true);
						$('select[name=inspResult5]').attr('disabled', true);
						
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
						$('input[name=inspX11]').attr('disabled', true);
						$('input[name=inspX12]').attr('disabled', true);
						$('input[name=inspX13]').attr('disabled', true);
						$('input[name=inspX14]').attr('disabled', true);
						$('input[name=inspX15]').attr('disabled', true);
						$('input[name=inspX16]').attr('disabled', true);
						$('input[name=inspX17]').attr('disabled', true);
						$('input[name=inspX18]').attr('disabled', true);
						$('input[name=inspX19]').attr('disabled', true);
						$('input[name=inspX20]').attr('disabled', true);
						$('input[name=inspX21]').attr('disabled', true);
						$('input[name=inspX22]').attr('disabled', true);
						$('input[name=inspX23]').attr('disabled', true);
						$('input[name=inspX24]').attr('disabled', true);

						let inspTypeArr = ['001','002'];

						$.ajax({
							url : '<c:url value="bm/getInspResult" />',
							type : 'GET',
							data : {
								'inspCd' 		  : function(){return inspCdVal},
								'inspResultGubun' : "003",
								'inspSourceNo' : function(){return inSlipNo},
								'inspTypeArr' : function(){return inspTypeArr},
							}, 
							beforeSend : function(res){
								$('#my-spinner').show();
							},
							success : function(res){

								var inspectResult = res.data; //검사항목 결과
								if ( inspectResult == "Y" ) {
									$('#qaEval').val('001').attr('checked',true);
									$('#btnApprove').text('승인');
									$('#btnApprove').attr('disabled', false);
								} else if ( inspectResult == "N" ) {
									$('#qaEval').val('002').attr('checked',true);
									$('#btnApprove').text('승인');
									$('#btnApprove').attr('disabled', false);
								} else if ( inspectResult == "U" ) {
									$('#qaEval').val('').attr('checked',true);
								} else {
									console.log("예상치 못한 오류가 발생했습니다.");
								}

								$.ajax({
									url : '<c:url value="qm/itemInspectMasterUpdate"/>',
									type : 'POST',
									data : {
										'inSlipNo' : function(){ return inSlipNo; },
										'qaEval' : function(){ return $('#qaEval').val() },
									},
									success : function(res){
										if ( res.result == "ok" ) {
									    	$('#purchaseOrderAdmTable').DataTable().ajax.reload();
										} else {
											toastr.error(res.message);
										}
									},
									complete : function() {
										
									}
								});

								if ( inspectResult != "U" ) {
									var dataArray = new Array();
									$('#itemFaultyTypeTable tbody tr').each(function(index, item){
										var rowData = new Object();
										rowData.inSlipNo = inSlipNo;
										rowData.inSlipSeq = itemFaultyTypeTable.row(this).data().inSlipSeq;
										rowData.itemSeq = itemFaultyTypeTable.row(this).data().itemSeq;

										if ( inspectResult == "Y" ) {
											rowData.pairCnt = itemFaultyTypeTable.row(this).data().preInWhsQty.replace(/,/g,'');
											rowData.faultyCnt = "0";
											rowData.qaEval = "001";	//합격
										} else if ( inspectResult == "N" ) {
											rowData.pairCnt = "0";
											rowData.faultyCnt = "0";
											rowData.qaEval = "";	//미판정
										} else {
											console.log("예상치 못한 오류가 발생했습니다.");
										}
								        dataArray.push(rowData);
									});

									$.ajax({
										url : '<c:url value="qm/itemInspectAllCreate"/>',
										type : 'POST',
										datatype: 'json',
										data: JSON.stringify(dataArray),
										contentType : "application/json; charset=UTF-8",
										success : function(res) {
											if (res.result == 'ok') {
												$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});
											} else {
												toastr.error(res.message);
											}
											$('#my-spinner').hide();
											toastr.success("등록되었습니다.");
										}
									});

									console.log(dataArray);
									
								} else {
									$.ajax({
										url : '<c:url value="qm/itemInspectAdmDelete"/>',
										type : 'POST',
										data: {
											'inSlipNo' : function(){return inSlipNo;},
										},
										success : function(res) {				
											if ( res.result == 'ok' ) {
												$('#itemFaultyTypeTable').DataTable().ajax.reload(function(){});
											} else {
												toastr.error(res.message);
											}
											$('#my-spinner').hide();
											toastr.success("등록되었습니다.");
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
				'inspResultGubun' : function(){return "003"},
				'inspSourceNo' : function(){return inSlipNo;},
				'inspGubun' : function(){return "003"},
				'inspType' : function(){return "001";},
				'itemSeq' : function(){return itemSeq;},
				
			},
		},
		columns : [
			{ //순번
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        	}, 'className' : 'text-center'
			},
			{ //규격
				data : 'inspList', className : 'text-center',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" disabled/>';
					}
				}
			},
			{ //확인방법
				data : 'inspCheckNm', className : 'text-center', name: 'rowspanW',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				}
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
		],
		order : [],
		buttons : [],
		columnDefs : [
		]
	});
	
	//치수 목록 - 사출
	let sizeAdmTable2 = $('#sizeAdmTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-9'><'col-sm-12 col-md-3'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '35vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "003"},
				'inspSourceNo' : function(){return inSlipNo;},
				
				'inspGubun' : function(){return "003"},
				'inspType' : function(){return "002";},
				'itemSeq' : function(){return itemSeq;},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					return meta.row + meta.settings._iDisplayStart + 1 ;
	        		},
					'className' : 'text-center'
			},
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{
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
			{
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
			{
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+rmDecimal(data)+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX1" id="s2-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s2\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
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
			}, 
		],
		drawCallback : function() {
			var api = this.api();

			for(var i=0;i<api.data().count();i++) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				for(var r=1; r<=1; r++){
					let rString = "inspX"+r;
					let inspResult = "";
					if(r==1){
						inspResult = api.row(i).data().inspX1;
					}else if(r==2){
						inspResult = api.row(i).data().inspX2;
					}else if(r==3){
						inspResult = api.row(i).data().inspX3;
					}else if(r==4){
						inspResult = api.row(i).data().inspX4;
					}else if(r==5){
						inspResult = api.row(i).data().inspX5;
					}
					
					if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))){
						$('input[name='+rString+']').eq(i).css('background','#ff0000');
					}else if((parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max))){
						$('input[name='+rString+']').eq(i).css('background','#92d050');
					}else{
						$('input[name='+rString+']').eq(i).css('background','#f6f7f9');
					}
				}
			} 
		}
	});
	
	//치수 목록 - 봉제
	let sizeAdmTable = $('#sizeAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-9'><'col-sm-12 col-md-3'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '30vh',
		pageLength : -1,
		scrollX: true,
		fixedColumns: {
			 leftColumns: 6
	    },
		ajax : {
			url : '<c:url value="bm/inspResultAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspResultGubun' : function(){return "003"},
				'inspSourceNo' : function(){return inSlipNo;},
				'inspGubun' : function(){return "003"},
				'inspType' : function(){return "002";},
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
			{//특별특성
				data : 'inspSpc',
				render : function(data, type, row, meta) {
					if (data == null) {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="min-width : 100%" />';
					} else if (data == '001') {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" checked disabled/>';
					} else {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%" disabled/>';
					}
				}
			}, 
			{//확인방법
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%" />';
					}
				}
			},
			{//기준
				data : 'inspCheckNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				className : 'text-center',
				name: 'rowspanW'
			},
			{//하한
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
			{//상한
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
			{//CVT.1 - X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT.1 - X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//CVT.1 - X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X1
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//CVT2. - X2
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			/*
			{//CVT. - X3
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X1
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X2
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.3 - X3
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X1
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X2
				data : 'inspX11',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX11" id="s-inspX11-'+meta.row+'" onkeydown="moveFocus(\'s\',11,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX11\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.4 - X3
				data : 'inspX12',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX12" id="s-inspX12-'+meta.row+'" onkeydown="moveFocus(\'s\',12,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX12\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X1
				data : 'inspX13',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX13" id="s-inspX13-'+meta.row+'" onkeydown="moveFocus(\'s\',13,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX13\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X2
				data : 'inspX14',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX14" id="s-inspX14-'+meta.row+'" onkeydown="moveFocus(\'s\',14,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX14\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.5 - X3
				data : 'inspX15',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX15" id="s-inspX15-'+meta.row+'" onkeydown="moveFocus(\'s\',15,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX15\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X1
				data : 'inspX16',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX16" id="s-inspX16-'+meta.row+'" onkeydown="moveFocus(\'s\',16,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX16\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X2
				data : 'inspX17',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX17" id="s-inspX17-'+meta.row+'" onkeydown="moveFocus(\'s\',17,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX17\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.6 - X3
				data : 'inspX18',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX18" id="s-inspX18-'+meta.row+'" onkeydown="moveFocus(\'s\',18,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX18\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X1
				data : 'inspX19',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX19" id="s-inspX19-'+meta.row+'" onkeydown="moveFocus(\'s\',19,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX19\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X2
				data : 'inspX20',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX20" id="s-inspX20-'+meta.row+'" onkeydown="moveFocus(\'s\',20,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX20\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.7 - X3
				data : 'inspX21',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX21" id="s-inspX21-'+meta.row+'" onkeydown="moveFocus(\'s\',21,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX21\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X1
				data : 'inspX22',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX22" id="s-inspX22-'+meta.row+'" onkeydown="moveFocus(\'s\',22,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX22\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X2
				data : 'inspX23',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX23" id="s-inspX23-'+meta.row+'" onkeydown="moveFocus(\'s\',23,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX23\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//CVT.8 - X3
				data : 'inspX24',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="'+data+'" style="min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX24" id="s-inspX24-'+meta.row+'" onkeydown="moveFocus(\'s\',24,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX24\',\''+meta.row+'\')"; value="" style="min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			},
			*/
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

			for ( var i = 0; i < api.data().count(); i++ ) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;

				//let cavityCntVal = $('#cavityCnt').val();
				//cavityCntVal *= 3;
				
				for ( var r = 1; r <= 5; r++ ) {
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
						/*
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
						case 11:
							inspResult = api.row(i).data().inspX11;
							break;
						case 12:
							inspResult = api.row(i).data().inspX12;
							break;
						case 13:
							inspResult = api.row(i).data().inspX13;
							break;
						case 14:
							inspResult = api.row(i).data().inspX14;
							break;
						case 15:
							inspResult = api.row(i).data().inspX15;
							break;
						case 16:
							inspResult = api.row(i).data().inspX16;
							break;
						case 17:
							inspResult = api.row(i).data().inspX17;
							break;
						case 18:
							inspResult = api.row(i).data().inspX18;
							break;
						case 19:
							inspResult = api.row(i).data().inspX19;
							break;
						case 20:
							inspResult = api.row(i).data().inspX20;
							break;
						case 21:
							inspResult = api.row(i).data().inspX21;
							break;
						case 22:
							inspResult = api.row(i).data().inspX22;
							break;
						case 23:
							inspResult = api.row(i).data().inspX23;
							break;
						case 24:
							inspResult = api.row(i).data().inspX24;
							break;
						*/
					}
					
					if ( (parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max)) ) {
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#ff0000');
					} else if ( (parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max)) ) {
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#92d050');
					} else {
						$('#sizeAdmTable tbody tr').eq(i).find('input[name='+rString+']').css('background','#f6f7f9');
					}
					
				}
			} 
		}
	});


	var html = '<p class="m-0" style="text-align: right; color: #0073ff;">    · ISO 수분 관리 기준 : 0.08% ↓</p>';
	html += '<p class="m-0" style="text-align: right;">최종 사내 수분 관리 기준 : 0.07% ↓ </p>';
	$('#sizeAdmTable_length').html(html);
	$('#sizeAdmTable2_length').html(html);

	
	//x1~x5 결과값 onchage시
	function sizeCheck(min,max,result,row){

		let inspResult = $('input[name='+result+']').eq(row).val();
		
		if((parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max))  ){
			$('input[name='+result+']').eq(row).css('background','#ff0000');
		}else{
			$('input[name='+result+']').eq(row).css('background','#92d050');
		}
	}  
	
	$('#btnJrbr').on('click', function() {
		modalHide = false;
		jrCheck = false;
		$('#my-spinner').show();
		
		setTimeout(function(){
			$('#itemFaultyTypeTable tbody tr').each(function(index, item) {
				tableIdx = $('#itemFaultyTypeTable').DataTable().row(this).index();
				inSlipSeq =  itemFaultyTypeTable.row(this).data().inSlipSeq;
				barcodeNo =  itemFaultyTypeTable.row(this).data().barcodeNo;
				preInWhsQty =  itemFaultyTypeTable.row(this).data().preInWhsQty;
				selectFaultyType();
				$('#popupBarcodeNo').val(barcodeNo);
				$('#popupPreInWhsQty').val(rmDecimal(preInWhsQty));
				$('input[name=faultyTypeQty]').val('0');
				$('input[name=faultyTypeQty]').eq(0).val(preInWhsQty);
				$('#btnFaultyTypeSave').trigger('click');
			});

			console.log("jrCheck:"+jrCheck);
			
			if(jrCheck){
				$('#my-spinner').hide();
				$('#inspectDesc').val("전량불량");
				toastr.success('전량불량이 적용되었습니다.');
				modalHide = true;
			}
		},200);
	});

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
	
	//커서이동
	var rowCount;
	function moveFocus(type, value, row){
		if(event.keyCode == 13){
			console.log("커서이동입니다.");
			console.log("value:" + value);	//inspX1
			console.log("row:" + row);		//0

			if(type=="w"){//중량
				rowCount = weightTable.data().count()-1;	//행수
			}else if(type=="s"){//치수-봉제
				rowCount = sizeAdmTable.data().count()-1;	//행수
			}else if(type=="s2"){//치수-사출
				rowCount = sizeAdmTable2.data().count()-1;	//행수
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
	
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
</script>

</body>
</html>