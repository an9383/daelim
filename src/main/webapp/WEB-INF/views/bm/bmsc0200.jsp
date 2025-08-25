<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp"%>

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
	<!-- 품목정보관리 - 작업장 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemWorkplacePopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemWorkplacePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemWorkplacePopUpLabel">작업장 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="itemWorkplacePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공정코드</th>
									<th style="width : 80%">공정명</th>
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
	<!-- 품목정보관리 - 작업장 모달 종료-->
	
	<!-- 품목정보관리 - 작업장 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemWorkplacePopUpModal2" tabindex="-1" role="dialog" aria-labelledby="itemWorkplacePopUpModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemWorkplacePopUpLabel2">공정 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="itemWorkplacePopUpTable2" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공정코드</th>
									<th style="width : 80%">공정명</th>
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
	<!-- 품목정보관리 - 작업장 모달 종료-->

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">제품정보관리(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 53%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive">
						<table id="itemPartAdmTable" class="table table-bordered">
							<colgroup>
								<col width="12%">
								<col width="11%">
								<col width="23%">
								<col width="30%">
								<col width="10%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<!--==========table thead 추가==========-->
								<tr>
									<th id="itemCusLeftTh">고객사</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th class="text-center">단가</th>
									<th>상태</th>
									<th>품목구분</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 46%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12 p-1">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<div class="card-header card-tab p-0 mb-2">
							<!-- .nav-tabs tablist -->
							<ul class="nav nav-tabs card-header-tabs m-0">
								<li class="nav-item">
									<a class="nav-link active show" id="tab1Nav" data-toggle="tab" href="#tab1">기본정보</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab8Nav" data-toggle="tab" href="#tab8">공정등록</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2">제품사진</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab3Nav" data-toggle="tab" href="#tab3">관련자료</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab4Nav" data-toggle="tab" href="#tab4">출고단가이력</a>
								</li>
								<li class="nav-item">
									<a class="nav-link d-none" id="tab5Nav" data-toggle="tab" href="#tab5">입고단가이력</a>
								</li>
								<li class="nav-item">
									<a class="nav-link d-none" id="tab6Nav" data-toggle="tab" href="#tab6">작업조건</a>
								</li>
								<li class="nav-item">
									<a class="nav-link disabled" id="tab7Nav" data-toggle="tab" href="#tab7" >작업표준서</a>
								</li>
							</ul>
							<!-- /.nav-tabs -->
						</div>
					</div>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnSave">저장</button>	
								<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnRevAdd">Rev등록</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">신규등록</button>
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnCall">불러오기</button>
							</div>
							<form id="form">
								<div class="table-responsive">
									<table class="table table-bordered">
				                    	<colgroup>
				                           <col width="20%"> 
				                           <col width="30%">
				                           <col width="20%">
				                           <col width="30%">
				                        </colgroup>
				                    </table>
									<table class="table table-bordered" id="itemPartInfoTable">
										<colgroup>
											<col width="20%">
											<col width="30%">
											<col width="20%">
											<col width="30%">
										</colgroup>
										<tr>
											<th>*품목구분</th>
											<td><select class="custom-select" id="itemGubun" onChange="itemGubunOnChange()" style="min-width : 100%;"></select></td>
											<th id="itemCusTh">*고객사</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="max-width: 80%;">
														<input type="hidden" class="form-control" id="itemRealCus" name="itemRealCus"> 
														<input type="text" class="form-control" id="itemCus" name="itemCus" disabled>
														<button type="button" id="btnItemCus" class="btn btn-primary input-sub-search" onClick="itemCusSelectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="max-width: 5%;">
														<button type="button" id="itemCusDelete" class="btn closeBtn" 
															onclick="$('#itemRealCus').val(''); $('#itemCus').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td> 
										</tr>
										<tr id="prodGubunDiv" class="d-none">
											<th id="prodGubunTh" class="d-none">*생산구분</th>
											<td><select class="custom-select d-none" id="prodGubun" style="min-width : 100%;" onChange="prodGubunOnChange();" disabled></select></td>
											<th></th>
											<td></td>
										</tr>
										<tr>
											<th>*MAKER</th>
											<td><input type="text" class="form-control" id="itemMaker" name="itemMaker" maxlength="50" style="min-width : 100%;"></td>
											<th>*차종</th>
											<td><select class="custom-select" id="itemModel" style="min-width : 100%;"></select></td>
										</tr>
										<tr>
											<th>*품번</th>
											<td><input type="text" class="form-control" id="itemCd" name="itemCd" maxlength="20" style="min-width : 100%;"/></td>
											<th>*품명</th>
											<td><input type="text" class="form-control" id="itemNm" name="itemNm" maxlength="50" style="min-width : 100%;"></td>
										</tr>
										<tr>
											<th>*단위</th>
											<td><select class="custom-select" id="itemUnit" style="min-width : 100%;"></select></td>
											<th>상태</th>
											<td><select class="custom-select" id="stateCd" style="min-width : 100%;"></select></td>
										</tr>
										<tr class="d-none">
											<th>색상</th>
											<td><input type="text" class="form-control" id="itemColor" name="itemColor" maxlength="50" style="min-width : 100%;"></td>
											<th>*내수/수출</th>
											<td><select class="custom-select" id="exportCd" style="min-width : 100%;"></select></td>
										</tr>
										<tr>
											<th>박스포장수</th>
											<td>
												<input type="text" class="form-control text-right" id="boxCount" name="boxCount" maxlength="30" value="0" style="min-width : 100%;" onkeyup="numberFormat(this, 'int')">
											</td>
											<th id="importYnTh">*출하검사여부</th>
											<td><select class="custom-select" id="importYn" style="min-width : 100%;"></select></td>
										</tr>
										<tr class="d-none">
											<th id="smallPackageTh" class="d-none">소포장수</th>
											<td>
												<input type="text" class="form-control d-none" id="smallPackage" name="smallPackage" maxlength="30" value="0" style="min-width : 100%;" disabled="disabled">
											</td>
										</tr>
										<tr>
											<th>*선입선출</th>
											<td><select class="custom-select" id="itemFifoGubun" style="min-width : 100%;"></select></td>
											<th>품목사용여부</th>
											<td><select class="custom-select" id="useYn" style="min-width : 100%;"></select></td>
										</tr>
										
										<tr id="supplyTypeDiv" class="d-none">
											<th>사급유무</th>
											<td><select class="custom-select" id="supplyType" style="min-width : 100%;"></select></td>
											<th>LH/RH</th>
											<td><select class="custom-select" id="lhrhCd" style="min-width : 100%;"></select></td>
										</tr>
										<tr>
											<th id="exportCostTh">*출고단가</th>
											<td>
												<input type="text" class="form-control text-right" id="exportCost" name="exportCost" maxlength="30" onkeyup="numberFormat(this, 'float')" value="0" style="min-width : 100%;">
												<input type="hidden" class="form-control" id="exportBeforeCost" name="exportBeforeCost" value="0">
											</td>
											<th id="exportDateTh">*출고단가적용일</th>
											<td>
												<div class="form-group input-sub m-0" style="min-width : 100%;">
													<input class="form-control" type="text" id="exportDate" name="exportDate" maxlength="10" disabled />
													<button
														onclick="fnPopUpCalendar(exportDate, exportDate, 'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search" id="mfcDateCalendar3" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr class="d-none" id="importCostTr">
											<th>입고단가</th>
											<td>
												<input type="text" class="form-control" id="importCost" name="importCost" maxlength="30" dir="rtl" value="0" style="min-width : 100%;">
												<input type="hidden" class="form-control" id="importBeforeCost" name="importBeforeCost" value="0">
											</td>
											<th>입고단가적용일</th>
											<td>
												<div class="form-group input-sub m-0" style="min-width : 100%;">
													<input class="form-control" type="text" id="importDate" name="importDate" maxlength="10" disabled />
													<button
														onclick="fnPopUpCalendar(importDate, importDate, 'yyyy-mm-dd')"
														class="btn btn-secondary input-sub-search" id="mfcDateCalendar2" type="button">
														<span class="oi oi-calendar"></span>
													</button>
												</div>
											</td>
										</tr>
										<tr class="d-none">
											<th>제품 중량(g)</th>
											<td><input type="text" class="form-control" id="prodWt" name="prodWt" maxlength="10" value="0" style="min-width: 100%;text-align:right;"></td>
											<th>S&R 중량(g)</th>
											<td><input type="text" class="form-control" id="srWt" name="srWt" maxlength="10" value="0" style="min-width: 100%;text-align:right;"></td>
										</tr>
										<tr class="d-none">
											<th>SHOT 중량(g)</th>
											<td><input type="text" class="form-control" id="shotWt" name="shotWt" maxlength="10" value="0" style="min-width: 100%;text-align:right;"></td>
										</tr>
										<tr>
											<th>작업장</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="itemWorkplace" name="itemWorkplace" disabled>
														<input type="text" class="form-control" id="itemWorkplaceNm" name="itemWorkplaceNm" disabled>
														<button type="button" id="btnItemWorkplace" class="btn btn-primary input-sub-search"
															onClick="itemWorkplaceSelectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="itemWorkplaceDelete" class="btn closeBtn" onclick="$('#itemWorkplace').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>생산위치</th>
											<td><select class="custom-select" id="makeLocCd" style="min-width : 100%"></select></td>
										</tr>										
										<tr>
											<th>저장위치</th>
											<td><select class="custom-select" id="savelocCd" style="min-width : 100%;"></select></td>
											<th id="areaFloorTr1">구역 / 위치</th>
											<td id="areaFloorTr2">
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="locNo" name="locNo"> 
														<input type="text" class="form-control" id="areaFloor" name="areaFloor" disabled>
														<button type="button" class="btn btn-primary input-sub-search" id="btnAreaFloor" onClick="selectAreaFloor()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="areaFloorDelete" class="btn closeBtn" onclick="$('#locNo').val(''); $('#areaFloor').val('');">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
										<tr>
											<th>비고</th>
											<td colspan="3">
												<input type="text" class="form-control" id="itemDesc" name="itemDesc" maxlength="128" style="min-width: 100%;">
											</td>
										</tr>
										<tr class="d-none">
											<th>금형번호1</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldOne1"
															name="moldOne1"> <input type="text"
															class="form-control" id="moldOne" name="moldOne"
															disabled>
														<button type="button"
															class="btn btn-primary input-sub-search" id="btnMoldCd1"
															onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne1Delete" class="btn closeBtn" onclick="$('#moldOne1').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형1 사용여부</th>
											<td><select class="custom-select" id="useYnOne"></select></td>
										</tr>
										<tr class="d-none">
											<th>금형번호2</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldTwo2"
															name="moldTwo2"> <input type="text"
															class="form-control" id="moldTwo" name="moldTwo"
															disabled>
														<button type="button"
															class="btn btn-primary input-sub-search" id="btnMoldCd2"
															onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne2Delete" class="btn closeBtn" onclick="$('#moldOne2').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형2 사용여부</th>
											<td><select class="custom-select" id="useYnTwo"></select></td>
										</tr>
										<tr class="d-none">
											<th>금형번호3</th>
											<td>
												<div class="row">
													<div class="input-sub m-0" style="width: 80%;">
														<input type="hidden" class="form-control" id="moldThree3"
															name="moldThree3"> <input type="text"
															class="form-control" id="moldThree" name="moldThree"
															disabled>
														<button type="button"
															class="btn btn-primary input-sub-search" id="btnMoldCd3"
															onClick="selectInCorpCd()">
															<span class="oi oi-magnifying-glass"></span>
														</button>
													</div>
													<div class="ml-1" style="width: 5%;">
														<button type="button" id="moldOne3Delete" class="btn closeBtn" onclick="$('#moldOne3').val('')">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<th>금형3 사용여부</th>
											<td><select class="custom-select" id="useYnThree"></select></td>
										</tr>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
							<div class="d-none" id="outTableDiv">
								<div class="card-body p-0">
									<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnOutSave">저장</button>	
									<button type="button" class="btn btn-danger float-right mr-1" id="btnOutDel" disabled>삭제</button>
									<button type="button" class="btn btn-warning float-right mr-1" id="btnOutEdit" disabled>수정</button>
									<button type="button" class="btn btn-primary float-right mr-1" id="btnOutAdd" disabled>추가</button>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered" id="outAdmTable" style="width:100%">
										<colgroup>
											<col width="10%">
											<col width="55%">
											<col width="15%">
											<col width="20%">
										</colgroup>
										<thead>
											<tr>
												<th class="text-center">No.</th>
												<th class="text-center">외주처</th>
												<th class="text-center">단가</th>
												<th class="text-center">단가적용일</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
							<table class="table table-bordered mt-1 d-none" id="changeHisTable">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>변경내역</th>
									<td colspan='3'><input type="text" class="form-control" style="max-width: 100%" id="changeHis" maxlength="20"></td>
								</tr>
							</table>
						</div>
						<!--====end====tab1 part=====-->
						<!--====start====tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
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
													<img alt="등록된 사진이 없습니다." id="imageFile1" src=""
														name="imageFile1" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile2" src=""
														name="imageFile2" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd1"
															name="imgAdd1" onchange="imageUpload(1)"> <label
															id="imgName1" class="custom-file-label" for="imgAdd1"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(1);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd2"
															name="imgAdd2" onchange="imageUpload(2)"> <label
															id="imgName2" class="custom-file-label" for="imgAdd2"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(2);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
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
													<img alt="등록된 사진이 없습니다." id="imageFile3" src="" 
														name="imageFile3" style="width: 100%; height: 100%">
												</div>
											</td>

											<td>
												<div class="custom-file" style="height: 150px;">
													<img alt="등록된 사진이 없습니다." id="imageFile4" src=""
														name="imageFile4" style="width: 100%; height: 100%">
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd3"
															name="imgAdd3" onchange="imageUpload(3)"> <label
															id="imgName3" class="custom-file-label" for="imgAdd3"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(3);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
											<td>
												<div class="form-group">
													<div class="custom-file" style="width: 90%;">
														<input type="file" class="custom-file-input" id="imgAdd4"
															name="imgAdd4" onchange="imageUpload(4)"> <label
															id="imgName4" class="custom-file-label" for="imgAdd4"></label>
													</div>
													<div class="rightsidebar-close"
														style="width: 10%; padding-top: 4px;">
														<button type="button" class="btn" name="closeBtn"
															onclick="deleteImg(4);">
															<i class="mdi mdi-close"></i>
														</button>
													</div>
												</div>
											</td>
										</tr>
									</table>
								</div>
							</form>					
						</div>
						<!--====end====tab2 part=====-->
						<!--====start====tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnAttachSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnAttachDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnAttachAdd">추가</button>
							</div>
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="itemPartAttachDataTable">
										<colgroup>
											<col width="7%">
											<col width="10%">
											<col width="33%">
											<col width="50%">
										</colgroup>
										<thead>
											<tr>
												<th>No.</th>
												<th>등록자</th>
												<th>내용</th>
												<th>첨부파일</th>
											</tr>
										</thead>
										<!--==========/table 내용 추가==========-->
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--====start====tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<div>
								<button type="button" class="btn btn-danger float-right mr-1 mb-1" id="btnExportDel">출고단가삭제</button>
							</div>
							<div class="table-responsive">								
								<table class="table table-bordered" id="itemInformationTable">
									<colgroup>
										<col width="5%">
										<col width="11%">
										<col width="12%">
										<col width="12%">
										<col width="10%">
										<col width="20%">
									</colgroup>				
									<thead>
										<tr>
											<th>No</th>
											<th class="text-center">출고단가</th>
											<th>적용일자</th>
											<th>변경일자</th>
											<th>작성자</th>
											<th>변경사유</th>
										</tr>
									</thead>
									<!--==========/table 내용 추가==========-->
								</table>
							</div>
						</div>
						<!--====end====tab4 part=====-->
						<!--====start====tab5 part=====-->
						<div class="tab-pane fade" id="tab5">
							<div class="table-responsive">
								<table class="table table-bordered" id="itemImportTable">
									<colgroup>
										<col width="5%">
										<col width="11%">
										<col width="12%">
										<col width="12%">
										<col width="10%">
										<col width="20%">
									</colgroup>				
									<thead>
										<tr>
											<th>No</th>
											<th class="text-center">입고단가</th>
											<th>적용일자</th>
											<th>변경일자</th>
											<th>작성자</th>
											<th>변경사유</th>
										</tr>
									</thead>
									<!--==========/table 내용 추가==========-->
								</table>
							</div>
							<div class="" id="outTableDiv5">
								<div class="card-body p-0">
									<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnOutSave5">저장</button>
									<button type="button" class="btn btn-danger float-left ml-2 mt-3" id="btnOutDel5" disabled>외주단가삭제</button>
								</div>
								<div class="table-responsive">
									<table class="table table-bordered" id="outAdmTable5" style="width:100%">
										<colgroup>
											<col width="8%">
											<col width="23%">
											<col width="23%">
											<col width="23%">
											<col width="23%">
										</colgroup>
										<thead>
											<tr>
												<th>No</th>
												<th>외주처</th>
												<th class="text-center">입고단가</th>
												<th>적용일자</th>
												<th>작성자</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<!--====end====tab5 part=====-->
						<!--========tab6 part=====-->
						<div class="tab-pane fade" id="tab6">
							<div class="card-body p-0 ">
								<button type="button" class="btn btn-primary float-right d-none" id="btnWorkSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnWorkDel">삭제</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnWorkEdit">수정</button>
							</div>
							<form id="form6" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>NZ 온도</th>
											<th>H1 온도</th>
											<th>H2 온도</th>
											<th>H3 온도</th>
											<th>H4 온도</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="nzTemperature" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="h1Temperature" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="h2Temperature" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="h3Temperature" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="h4Temperature" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<td><input type="text" class="form-control" id="cond_nzTemperature" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_h1Temperature" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_h2Temperature" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_h3Temperature" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_h4Temperature" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>계량위치 1차</th>
											<th>계량위치 2차</th>
											<th>계량위치 3차</th>
											<th>계량위치 4차</th>
											<th>계량완료</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="chgPosition1" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="chgPosition2" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="chgPosition3" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="chgPosition4" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="suckBack" 	  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<td><input type="text" class="form-control" id="cond_chgPosition1" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_chgPosition2" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_chgPosition3" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_chgPosition4" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_suckBack" 	   name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>사출압력 1차</th>
											<th>사출압력 2차</th>
											<th>사출압력 3차</th>
											<th>사출속도 1차</th>
											<th>사출속도 2차</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="injPressure1" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="injPressure2" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injPressure3" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injVelocity1" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injVelocity2" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<td><input type="text" class="form-control" id="cond_injPressure1" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_injPressure2" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_injPressure3" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_injVelocity1" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_injVelocity2" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>사출속도 3차</th>
											<th>사출위치 1차</th>
											<th>사출위치 2차</th>
											<th>사출위치 3차</th>
											<th>배압 1차</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="injVelocity3"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injPosition1"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injPosition2"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="injPosition3"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="backPressure1" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<td><input type="text" class="form-control" id="cond_injVelocity3"  name="tab5Input" maxlength="50" style="text-align : center;"   disabled></td>
											<td><input type="text" class="form-control" id="cond_injPosition1"  name="tab5Input" maxlength="50" style="text-align : center;"   disabled></td>
											<td><input type="text" class="form-control" id="cond_injPosition2"  name="tab5Input" maxlength="50" style="text-align : center;"   disabled></td>
											<td><input type="text" class="form-control" id="cond_injPosition3"  name="tab5Input" maxlength="50" style="text-align : center;"   disabled></td>
											<td><input type="text" class="form-control" id="cond_backPressure1" name="tab5Input" maxlength="50" style="text-align : center;"   disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>배압 2차</th>
											<th>배압 3차</th>
											<th>배압 4차</th>
											<th>보압 1차</th>
											<th>보압 2차</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="backPressure2" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="backPressure3" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="backPressure4" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="hldPressure1"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
											<td><input type="text" class="form-control" id="hldPressure2"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한" disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<td><input type="text" class="form-control" id="cond_backPressure2" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_backPressure3" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_backPressure4" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_hldPressure1"  name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_hldPressure2"  name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="22%">
											<col width="22%">
											<col width="23%">
											<col width="23%">
										</colgroup>
										<tr>
											<th>목록</th>
											<!-- <th>보압 3차</th> -->
											<th>보압속도 1차</th>
											<th>보압속도 2차</th>
											<th>쿠션량</th>
											<th>온도조절기</th>
										</tr>
										<tr>
											<th>표준</th>
											<!-- <td><input type="text" class="form-control" id="hldPressure3" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td> -->
											<td><input type="text" class="form-control" id="hldVel1" 	  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="hldVel2" 	  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="hldVel3" 	  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="thermostat"   name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
										</tr>
										<tr class="d-none">
											<th>조건</th>
											<!-- <td><input type="text" class="form-control" id="cond_hldPressure3" name="tab5Input" maxlength="50" style="text-align : center;" disabled></td> -->
											<td><input type="text" class="form-control" id="cond_hldVel1" 	   name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_hldVel2" 	   name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_hldVel3" 	   name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
											<td><input type="text" class="form-control" id="cond_thermostat"   name="tab5Input" maxlength="50" style="text-align : center;" disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="10%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
											<col width="18%">
										</colgroup>
										<tr>
											<th>목록</th>
											<th>작동유</th>
											<th>냉각수 IN</th>
											<th>냉각수 OUT</th>
											<th>고정측 온도</th>
											<th>이동측 온도</th>
										</tr>
										<tr>
											<th>표준</th>
											<td><input type="text" class="form-control" id="hydraulicOil" name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td>
												<div class="row ml-2">
													<label class="input-label-sm">±</label>
													<input type="text" class="form-control mr-2" id="coolwaterIn" name="tab5Input" maxlength="50" style="text-align : center; width: 50%;" disabled>
													<label class="input-label-sm">℃</label>
												</div>
											</td>
											<td>
												<div class="row ml-2">
													<label class="input-label-sm">±</label>
													<input type="text" class="form-control mr-2" id="coolwaterOut" name="tab5Input" maxlength="50" style="text-align : center; width: 50%;" disabled>
													<label class="input-label-sm">℃</label>
												</div>
											</td>
											<td><input type="text" class="form-control" id="moldFixed"    name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="moldMoving"   name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
										</tr>
									</table>
									<table class="table table-bordered">
										<colgroup>
											<col width="16%">
											<col width="17%">
											<col width="17%">
											<col width="16%">
											<col width="17%">
											<col width="17%">
										</colgroup>
										<tr>
											<th>내측 고정측 온도 1</th>
											<th>내측 고정측 온도 2</th>
											<th>내측 고정측 온도 3</th>
											<th>내측 이동측 온도 1</th>
											<th>내측 이동측 온도 2</th>
											<th>내측 이동측 온도 3</th>
										</tr>
										<tr>
											<td><input type="text" class="form-control" id="inFixedOne" 	name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="inFixedTwo" 	name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="inFixedThree"  	name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="inMovingOne" 	name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="inMovingTwo"   	name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
											<td><input type="text" class="form-control" id="inMovingThree"  name="tab5Input" maxlength="50" style="text-align : center;" placeholder="하한~상한"  disabled></td>
										</tr>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab6 part=====-->
						<!--====start====tab7 part=====-->
						<div class="tab-pane fade" id="tab7">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnWorkStandardSave">저장</button>
								<button type="button" class="btn btn-danger float-right mr-1" id="btnWorkStandardDel">삭제</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnWorkStandardAdd">추가</button>
							</div>
							<form id="form7" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="workStandTable">
										<colgroup>
											<col width="20%">
											<col width="80%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>작업표준서</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>							
						</div>
						<div class="tab-pane fade" id="tab8">
							<div class="card-body p-0">
								<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnPrcssSave">저장</button>	
								<button type="button" class="btn btn-danger float-right mr-1" id="btnPrcssDel">삭제</button>
								<button type="button" class="btn btn-warning float-right mr-1" id="btnPrcssEdit">수정</button>
								<button type="button" class="btn btn-primary float-right mr-1" id="btnPrcssAdd">추가</button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered" id="itemPrcssAdmTable" style="width:100%">
									<colgroup>
										<col width="25%">
										<col width="25%">
										<col width="25%">
										<col width="25%">
									</colgroup>
									<thead>
										<tr>
											<th>공정코드</th>
											<th>공정명</th>
											<th>외주처</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--====end====tab1 part=====-->
						<!--====end====tab7 part=====-->
					</div>
				</div>
				<!-- ===/.right-sidebar 등록,수정===  -->
			</div>
			<!-- /.row -->
		</div>
		<!-- / #main  -->
	</div>
	<!-- /.page-wrapper -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">품목정보관리 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<div class="table-responsive" style="height: 700px;">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>CODE</th>
								<th>ITEM</th>
								<th>구분</th>
								<th>Type</th>
								<th>REV</th>
								<th>SPEC</th>
								<th>입고처</th>
								<th>단위</th>
								<th>기본납기일</th>
								<th>자재단가</th>
								<th>사용여부</th>
								<th>수입검사여부</th>
								<th>비고</th>
							</tr>
						</thead>
					</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!--=======모달영역====================================================-->
</div>

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "53%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "bmsc0200";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "제품정보관리(봉제)");

	uiProc(true);
	let sideView = 'add';
	let btnView = '';
	const serverDate = "${serverDate}";
	const userNm = "${userNm}";
	let activeTab = '기본정보';
	let itemCd;
	let itemAttachSeq;
	let itemPcSeq;
	let itemDelSeq;
	let itemRev = '00';
	let urlData = null;
	let itemSeq = null;
	let itemGubunList = ['001','002','003'];
	let stateCdList = '';
	let workStandardSeq = '';
	let status = '';
	let itemPrcssTableIdx = null;
	let exportCheck = "";
	let itemCostSeq = "";
	let importCheck = "";
	let saveNEdit = '';
	let itemGubunVal = '';

	let itemWorkplacePopUpTable;
	let dealCorpPopUpTable4;
	
	//서버 시간 입력
	$('#importDate').val(serverDate);
	$('#exportDate').val(serverDate);
	
	//공통코드 처리 시작
	let useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	let itemGubun = new Array();
	<c:forEach items="${itemGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemGubun.push(json);
	</c:forEach>
	
	let importYn = new Array();
	<c:forEach items="${importYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	importYn.push(json);
	</c:forEach>
	
	let itemType = new Array();
	<c:forEach items="${itemType}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemType.push(json);
	</c:forEach>
	
	let itemJustGubun = new Array();
	<c:forEach items="${itemJustGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemJustGubun.push(json);
	</c:forEach>
	
	let exportCd = new Array();
	<c:forEach items="${exportCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	exportCd.push(json);
	</c:forEach>
	
	let stateCd = new Array();
	<c:forEach items="${stateCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	stateCd.push(json);
	</c:forEach>
	
	let payMethodCd = new Array();
	<c:forEach items="${payMethodCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	payMethodCd.push(json);
	</c:forEach>
	
	let lhrhCd = new Array();
	<c:forEach items="${lhrhCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	lhrhCd.push(json);
	</c:forEach>
	
	let accCd = new Array();
	<c:forEach items="${accCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	accCd.push(json);
	</c:forEach>
	
	let itemModel = new Array();
	<c:forEach items="${itemModel}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemModel.push(json);
	</c:forEach>
	
	let locationCd = new Array();
	<c:forEach items="${locationCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	locationCd.push(json);
	</c:forEach>

	let makeLocCd = new Array();
	<c:forEach items="${makeLocCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	makeLocCd.push(json);
	</c:forEach>
	
	let savelocCd = new Array();
	<c:forEach items="${savelocCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	savelocCd.push(json);
	</c:forEach>
	
	let itemFifoGubun = new Array();
	<c:forEach items="${itemFifoGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemFifoGubun.push(json);
	</c:forEach>
	
	let itemUnit = new Array();
	<c:forEach items="${itemUnit}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemUnit.push(json);
	</c:forEach>
	
	let mainGubun = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubun.push(json);
	</c:forEach>

	let stateCdCode = new Array();
	<c:forEach items="${stateCd}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	stateCdCode.push(json);
	</c:forEach>

	let prodGubunCode = new Array();
	<c:forEach items="${prodGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	prodGubunCode.push(json);
	</c:forEach>

	var supplyTypeCode = new Array();	//유상/무상
	<c:forEach items="${supplyType}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	supplyTypeCode.push(json);
	</c:forEach>
	////공통코드 처리 끝

	//선택박스 처리 시작
	selectBoxAppend(itemGubun, "itemGubun", "", "");
	selectBoxAppend(itemModel, "itemModel", "", "");
	selectBoxAppend(stateCd, "stateCd", "004", "");
	selectBoxAppend(lhrhCd, "lhrhCd", "", "2");
	selectBoxAppend(exportCd, "exportCd", "", "2");
	selectBoxAppend(importYn, "importYn", "", "");
	selectBoxAppend(locationCd, "locationCd", "", "");
	selectBoxAppend(makeLocCd, "makeLocCd", "", "2");
	selectBoxAppend(savelocCd, "savelocCd", "007", "");
	selectBoxAppend(payMethodCd, "payMethodCd", "", "");
	selectBoxAppend(useYnCode, "useYnOne", "", "");
	selectBoxAppend(useYnCode, "useYnTwo", "", "");
	selectBoxAppend(useYnCode, "useYnThree", "", "");
	selectBoxAppend(useYnCode, "useYn", "", "2");
	selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
	selectBoxAppend(itemUnit, "itemUnit", "", "");
	selectBoxAppend(stateCdCode, "stateCdOption", "", "1");
	selectBoxAppend(prodGubunCode, "prodGubun", "002", "2");
	selectBoxAppend(supplyTypeCode, "supplyType", "001", "");
	////선택박스 처리 끝

	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
		activeTab = $(e.target).text();
	});

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#tab1Nav').tab('show');
		$('#btnSave').addClass('d-none');
		$('#btnOutSave').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnWorkSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnRevAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		$('#mainGubun2').attr('disabled', false);
		$('#itemGubun2').attr('disabled', false);
		$('#stateCdOption').attr('disabled', false);
		$('#outTableDiv').addClass('d-none');
		
		$('#equipRealCd').val('');
		$('#equipCd').val('');
		$('#equipNm').val('');
		$('#mfcCorpCd').val('');
		$('#mfcDate').val('');
	});
	
	//메인 테이블
	let itemPartAdmTable = $('#itemPartAdmTable').DataTable({
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
		pageLength : 20,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'itemGubunList' : function(){ return itemGubunList; },
				'mainGubun' : function(){ return '002'; },
				'stateCd' 	: function(){ return stateCdList; },
			},
		},
		rowId : 'itemCd',
		columns : [
			{//고객사
				data : 'itemCusNm',
				'className' : 'text-center'
			}, 
			{//차종
				data : 'itemModelNm',
				'className' : 'text-center'
			}, 
			{//품번
				data : 'itemCd',
				'className' : 'text-center'
			}, 
			{//품명
				data : 'itemNm',
				'className' : 'text-center'
			}, 
			{//단가
				data : 'exportCost',
				render : function(data, type, row, meta) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
					
				},
				'className' : 'text-right'
			}, 
			{//상태
				data : 'stateCdNm',
				'className' : 'text-center'
			}, 
			{//품목구분
				data : 'itemGubunNm',
				'className' : 'text-center'
			}
		],
		order : [ [ 2, 'asc' ] ],
		buttons : [ 'copy', {
			"extend": 'excel',
	        "text": '<button class="btn"><i class="fa fa-file-excel-o" style="color: green;"></i>  Excel</button>',
	        "titleAttr": 'Excel',
	        "action" : newexportaction
		}, 'print' ],
	});
	
	//DataTable button click
	function newexportaction(e, dt, button, config) {
        var self = this;
        var oldStart = dt.settings()[0]._iDisplayStart;
        dt.one('preXhr', function (e, s, data) {
            // Just this once, load all data from the server...
            data.start = 0;
            data.length = 2147483647;
            dt.one('preDraw', function (e, settings) {
                // Call the original action function
                if (button[0].className.indexOf('buttons-copy') >= 0) {
                    $.fn.dataTable.ext.buttons.copyHtml5.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-excel') >= 0) {
                    $.fn.dataTable.ext.buttons.excelHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.excelHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.excelFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-csv') >= 0) {
                    $.fn.dataTable.ext.buttons.csvHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.csvHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.csvFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-pdf') >= 0) {
                    $.fn.dataTable.ext.buttons.pdfHtml5.available(dt, config) ?
                        $.fn.dataTable.ext.buttons.pdfHtml5.action.call(self, e, dt, button, config) :
                        $.fn.dataTable.ext.buttons.pdfFlash.action.call(self, e, dt, button, config);
                } else if (button[0].className.indexOf('buttons-print') >= 0) {
                    $.fn.dataTable.ext.buttons.print.action(e, dt, button, config);
                }
                dt.one('preXhr', function (e, s, data) {
                    // DataTables thinks the first item displayed is index 0, but we're not drawing that.
                    // Set the property to what it was before exporting.
                    settings._iDisplayStart = oldStart;
                    data.start = oldStart;
                });
                // Reload the grid with the original page. Otherwise, API functions like table.cell(this) don't work properly.
                setTimeout(dt.ajax.reload, 0);
                // Prevent rendering of the full data to the DOM
                return false;
            });
        });
        // Requery the server with the new one-time export settings
        dt.ajax.reload();
    }
	
	//메인 테이블 행 클릭 시
	$('#itemPartAdmTable tbody').on('click', 'tr', function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right mr-1'
				|| $('#btnAttachSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnWorkSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		$('#tab1Nav').tab('show');
		if ($(this).hasClass('selected')) {
// 			$(this).removeClass('selected');
		} else {
			$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		//중요 키 값 가져오기
		itemSeq = itemPartAdmTable.row(this).data().itemSeq;
		itemCd = itemPartAdmTable.row(this).data().itemCd;
		itemRev = itemPartAdmTable.row(this).data().itemRev;
		itemGubunVal = itemPartAdmTable.row(this).data().itemGubun;

		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
		
		$('#tab2Nav').removeClass('disabled');
		$('#tab3Nav').removeClass('disabled');
		$('#tab4Nav').removeClass('disabled');
		$('#tab5Nav').removeClass('disabled');
		$('#tab7Nav').removeClass('disabled');
		$('#tab8Nav').removeClass('disabled');

		$.ajax({
			url : '<c:url value="/bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){ return itemSeq; },
			},
			success : function(res) {
				let data = res.data;
				let statusYn = res.statusYn;

				if (res.result == 'ok') {
					sideView = 'edit';

					//상세보기
					$('#itemRev').val(data.itemRev);
					$('#itemMaker').val(data.itemMaker);
					$('#itemRealCus').val(data.itemCus);
					$('#itemCus').val(data.itemCusNm);
					$('#itemCd').val(data.itemCd);
					$('#itemNm').val(data.itemNm);
					$('#accCd').val(data.accCd);
					$('#itemGenre').val(data.itemGenre);
					$('#itemColor').val(data.itemColor);
					$('#boxCount').val(data.boxCount != null ? rmDecimal(data.boxCount) : '0');
					$('#smallPackage').val(data.smallPackage != null ? rmDecimal(data.smallPackage) : '0');
					$('#itemSpec').val(data.itemSpec);
					$('#itemWorkplace').val(data.itemWorkplace);
					$('#itemWorkplaceNm').val(data.itemWorkplaceNm);
					$('#safetyStock').val(data.safetyStock != null && data.safetyStock != '0' ? rmDecimal(data.safetyStock) : '0');
					$('#exportCost').val(data.exportCost != null ? rmDecimal(data.exportCost) : '0');
					$('#exportBeforeCost').val(data.exportCost != null ? rmDecimal(data.exportCost) : '0');
					$('#exportDate').val(data.exportDate != null && data.exportDate != '' ? moment(data.exportDate).format('YYYY-MM-DD') : '');
					$('#importCost').val(data.importCost != null ? rmDecimal(data.importCost) : '0');
					$('#importBeforeCost').val(data.importCost != null ? rmDecimal(data.importCost) : '0');
					$('#importDate').val(data.importDate != null && data.importDate != '' ? moment(data.importDate).format('YYYY-MM-DD') : '');
					$('#moldOne').val(data.moldOne);
					$('#moldTwo').val(data.moldTwo);
					$('#moldThree').val(data.moldThree);
					$('#itemDesc').val(data.itemDesc);
					$('#locNo').val(data.locNo);
					$('#areaFloor').val(data.areaNm != null ? data.areaNm + ' / ' + data.floorNm : '');
					$('#equipCd').val(data.moldCd);
					$('#equipNm').val(data.equipNm);
					$('#mfcCorpCd').val(data.mfcCorpCd);
					$('#mfcDate').val(data.mfcDate != null ? moment(data.mfcDate).format('YYYY-MM-DD') : '');
					$('#prodWt').val(data.prodWt != null && data.prodWt != '' ? rmDecimal(data.prodWt) :'0');
					$('#srWt').val(data.srWt != null && data.srWt != '' ? rmDecimal(data.srWt) :'0');
					$('#shotWt').val(data.shotWt != null && data.shotWt != '' ? rmDecimal(data.shotWt) :'0');
					
					if (data.itemGubun == '003') { //반제품
						$('#areaFloorTr1').text('*구역 / 위치');
						$('#itemCusTh').text('공급사');
						$('#importCostTr').removeClass('d-none');
						$('#tab5Nav').removeClass('d-none');

						$('#prodGubun').removeClass('d-none');
						$('#prodGubunTh').removeClass('d-none');
						$('#prodGubunDiv').removeClass('d-none');
						$('#supplyTypeDiv').removeClass('d-none');
						
						
						//생산구분에 '외주'가 포함된 경우
						let prodGubunCheck = false;
						prodGubunCode.forEach(function(array){
						    if(array.baseCd == data.prodGubun){ //데이터 확인
						        let tempVal = array.baseNm;
					            if(tempVal.includes('외주')){ //외주가 포함되어 있는지 확인
					            	prodGubunCheck = true;
					            }
						    }
						})
						if (prodGubunCheck) { //생산구분에 '외주'가 포함되어 있는 지 확인
							$('#btnOutAdd').attr('disabled', true);
							$('#btnOutEdit').attr('disabled', true);
							$('#btnOutDel').attr('disabled', true);
							$('#outTableDiv').removeClass('d-none');
							$('#outAdmTable').DataTable().ajax.reload();
							setTimeout(function(){
								outAdmTable.draw();
								outAdmTable.draw();
							}, 300);
						} else {
							$('#outTableDiv').addClass('d-none');
						}
					} else { // 그 외
						$('#areaFloorTr1').text('구역 / 위치');
						$('#itemCusTh').text('*고객사');
						$('#importCostTr').addClass('d-none');
						$('#tab5Nav').addClass('d-none');
						$('#prodGubun').addClass('d-none');
						$('#prodGubunTh').addClass('d-none');
						$('#prodGubunDiv').addClass('d-none');
						$('#supplyTypeDiv').addClass('d-none');
						$('#outTableDiv').addClass('d-none');
					}
					
					//셀렉트박스 설정
					selectBoxAppend(itemGubun, "itemGubun", data.itemGubun, "");
					selectBoxAppend(prodGubunCode, "prodGubun", data.prodGubun, "2");
					selectBoxAppend(itemModel, "itemModel", data.itemModel, "");
					selectBoxAppend(stateCd, "stateCd", data.stateCd, "");
					selectBoxAppend(lhrhCd, "lhrhCd", data.lhrhCd, "2");
					selectBoxAppend(exportCd, "exportCd", data.exportCd, "2");
					selectBoxAppend(importYn, "importYn", data.importYn, "");
					selectBoxAppend(locationCd, "locationCd", data.locationCd, "");
					selectBoxAppend(makeLocCd, "makeLocCd", data.makeLocCd, "2");
					selectBoxAppend(savelocCd, "savelocCd", data.savelocCd, "");
					selectBoxAppend(payMethodCd, "payMethodCd", data.payMethodCd, "");
					selectBoxAppend(useYnCode, "useYnOne", data.useYnOne, "");
					selectBoxAppend(useYnCode, "useYnTwo", data.useYnTwo, "");
					selectBoxAppend(useYnCode, "useYnThree", data.useYnThree, "");
					selectBoxAppend(useYnCode, "useYn", data.useYn, "2");
					selectBoxAppend(itemFifoGubun, "itemFifoGubun", data.itemFifoGubun, "");
					selectBoxAppend(itemUnit, "itemUnit", data.itemUnit, "");
					selectBoxAppend(supplyTypeCode, "supplyType", data.supplyType, "");
					
					uiProc(true);

				} else {
					toastr.error(res.message);
				}
			}
		});
	});

	let html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="itemGubun2" onChange="itemOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">상태</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="stateCdOption" onChange="stateOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="" class="col-sm-12 col-md">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info mr-1 d-none">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" />';
	html1 += '<a href="/bm/itemPartBasicForm"><button type="button" class="btn btn-secondary d-none" id="btnFileDownload">기본양식다운로드</button></a></form>';
	html1 += '</div>';

	$('#itemPartAdmTable_length').html(html1);
	
	selectBoxAppend(itemGubun, "itemGubun2", "", "1");
	selectBoxAppend(stateCdCode, "stateCdOption", "", "1");

	function itemOnchange(){
		itemGubunList = $("#itemGubun2 option:selected").val();
		$("#itemGubun").val(itemGubunList).prop("selected", true);

		//저장위치 및 구역/위치
		selectBoxAppend(savelocCd, "savelocCd", "007", "");

		if (itemGubunList == '003') { //반제품
			$('#itemCusLeftTh').text('공급사');
			$('#prodGubun').removeClass('d-none');
			$('#prodGubunTh').removeClass('d-none');
			$('#prodGubunDiv').removeClass('d-none');
			$('#supplyTypeDiv').removeClass('d-none');
			
			//저장위치 및 구역/위치
			selectBoxAppend(savelocCd, "savelocCd", "006", "");
		} else { //그 외
			$('#itemCusLeftTh').text('고객사');
			$('#prodGubun').addClass('d-none');
			$('#prodGubunTh').addClass('d-none');
			$('#prodGubunDiv').addClass('d-none');
			$('#supplyTypeDiv').addClass('d-none');
		}

		if(itemGubunList == ""){
			itemGubunList = ['001','002','003'];
		}

		$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
	}
	
	function stateOnchange(){
		stateCdList = $('#stateCdOption option:selected').val();
		$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
	}

	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#itemPartAdmTable').DataTable().$('tr.selected').removeClass('selected'); //행 선택 취소
		
		//상세정보 초기화
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		$('#tab5Nav').addClass('disabled d-none');
		$('#tab6Nav').addClass('d-none');
		$('#tab7Nav').addClass('disabled');
		$('#tab8Nav').addClass('disabled');
		
		//서버시간 넣기
		$('#importDate').val(serverDate);
		$('#exportDate').val(serverDate);
		
		//seq 찾기
		$.ajax({
			url : '<c:url value="/bm/getItemCdSeq"/>',
			type : 'POST',
			async : false,
			data : {},
			success : function(res) {
				data = res.itemCdSeq;
				itemSeq = data;
			}
		});
		
		//선택박스 처리
		selectBoxAppend(itemGubun, "itemGubun", "", "");
		selectBoxAppend(itemModel, "itemModel", "", "");
		selectBoxAppend(stateCd, "stateCd", "004", "");
		selectBoxAppend(lhrhCd, "lhrhCd", "", "2");
		selectBoxAppend(exportCd, "exportCd", "", "2");
		selectBoxAppend(importYn, "importYn", "", "");
		selectBoxAppend(locationCd, "locationCd", "", "");
		selectBoxAppend(makeLocCd, "makeLocCd", "", "2");
		selectBoxAppend(savelocCd, "savelocCd", "007", "");
		selectBoxAppend(payMethodCd, "payMethodCd", "", "");
		selectBoxAppend(useYnCode, "useYnOne", "", "");
		selectBoxAppend(useYnCode, "useYnTwo", "", "");
		selectBoxAppend(useYnCode, "useYnThree", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
		selectBoxAppend(supplyTypeCode, "supplyType", "", "");
		selectBoxAppend(itemUnit, "itemUnit", "", "");

		uiProc(false);
		$('#itemRev').val('00');
		$('#btnSave').removeClass('d-none');
		$('#btnRevAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$("#itemGubun").val(itemGubunList).prop("selected", true);
		$('#mainGubun2').attr('disabled', true);
		$('#itemGubun2').attr('disabled', true);
		$('#stateCdOption').attr('disabled', true);
		
		$('#equipRealCd').val('');
		$('#equipCd').val('');
		$('#equipNm').val('');
		$('#mfcCorpCd').val('');
		$('#mfcDate').val('');
		
		if ($("#itemGubun").val() == '003') { //반제품
			$('#areaFloorTr1').text('*구역 / 위치');
			$('#itemCusTh').text('공급사');
			$('#importCostTr').removeClass('d-none');
		} else { //그 외
			$('#areaFloorTr1').text('구역 / 위치');
			$('#itemCusTh').text('*고객사');
			$('#importCostTr').addClass('d-none');
		}

		$.ajax({
			url : '<c:url value="bm/locationAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'mainGubun' : '002',
				'locCd' : function(){return $('#savelocCd').val();}
			},
			success : function(res){
				if(res.result=="ok"){
					let data = res.data[0];
					if(data!=null){
						$('#areaFloor').val(data.areaNm + ' / ' + data.floorNm);
						$('#locNo').val(data.locNo);
					}else{
						$('#areaFloor').val('');
						$('#locNo').val('');
					}
				}else{
					toastr.error(res.message);
				}
			}
		})
	});

	// 리비전 등록폼
	$('#btnRevAdd').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("Revision등록할 항목을 선택해주세요.");
			return false;
		}
		
		sideView = 'rev';

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		$('#tab5Nav').addClass('d-none');
		$('#tab6Nav').addClass('d-none');
		$('#tab7Nav').addClass('disabled');
		$('#tab8Nav').addClass('disabled');
		
		//Revision값 가져오기
		$.ajax({
			url : '<c:url value="bm/getPartRev"/>',
			type : 'GET',
			async : false,
			data : {
				'itemSeq' : function(){ return itemSeq; },
				'itemRev' : function(){ return itemRev; },
			},
			success : function(res) {
				let data = res.data;
				$('#itemCd').val(itemCd);
				$('#itemRev').val(data.itemRev);
			}
		});
		
		//seq 찾기
		$.ajax({
			url : '<c:url value="/bm/getItemCdSeq"/>',
			type : 'POST',
			async : false,
			data : {},
			success : function(res) {
				data = res.itemCdSeq;
				itemSeq = data;
			}
		});

		uiProc(false);
		
		$("#mg1").attr("disabled", true);
		$("#mg2").attr("disabled", true);
		$('#itemCd').attr('disabled', true);

		$('#btnAdd').attr('disabled', true);
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		
		//셀렉트박스 새로고침
		selectBoxAppend(lhrhCd, "lhrhCd", "", "");
		selectBoxAppend(exportCd, "exportCd", "", "");
		selectBoxAppend(importYn, "importYn", "", "");
		selectBoxAppend(itemFifoGubun, "itemFifoGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "", "");
	
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

		$('#tab2Nav').addClass('disabled');
		$('#tab3Nav').addClass('disabled');
		$('#tab4Nav').addClass('disabled');
		$('#tab5Nav').addClass('disabled'); if (itemGubunVal != '003') { $('#tab5Nav').addClass('d-none'); }
		$('#tab6Nav').addClass('d-none');
		$('#tab7Nav').addClass('disabled');
		$('#tab8Nav').addClass('disabled');
		
		uiProc(false);
		
		$('#btnAdd').attr('disabled', true);
		$('#btnRevAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
		$('#mainGubun2').attr('disabled', true);
		$('#itemGubun2').attr('disabled', true);
		$('#stateCdOption').attr('disabled', true);

		$('#btnOutAdd').attr('disabled', false);
		$('#btnOutEdit').attr('disabled', false);
		$('#btnOutDel').attr('disabled', false);

	});

	//저장위치 변경시 구역/위치 변경
	$('#savelocCd').on('change',function(){
		$.ajax({
			url : '<c:url value="bm/locationAdmRead"/>',
			type : 'GET',
			data : {
				'mainGubun' : '002',
				'locCd' : function(){return $('#savelocCd').val();}
			},
			success : function(res){
				if(res.result=="ok"){
					let data = res.data[0];
					if(data!=null){
						$('#areaFloor').val(data.areaNm + ' / ' + data.floorNm);
						$('#locNo').val(data.locNo);
					}else{
						$('#areaFloor').val('');
						$('#locNo').val('');
					}
				}else{
					toastr.error(res.message);
				}
			}
		})
	});

	//기본정보 저장 처리
	$('#btnSave').on('click', function() {
		if (activeTab == "기본정보") {
			let itemGubunSaveData = $("#itemGubun").val();
			
			if (!$('#itemRealCus').val() && ($('#itemGubun').val() != '003')) {
				toastr.warning('고객사를 입력해 주세요.');
				$('#btnItemCus').focus();
				return false;
			}
			if (!$('#prodGubun').val() && ($('#itemGubun').val() == '003')) {
				toastr.warning('생산구분을 선택해주세요.');
				$('#prodGubun').focus();
				return false;
			}
			if (!$('#itemMaker').val()) {
				toastr.warning('Maker를 입력해 주세요.');
				$('#itemMaker').focus();
				return false;
			}
			if (!$('#itemCd').val()) {
				toastr.warning('품번을 입력해 주세요.');
				$('#itemCd').focus();
				return false;
			}
			
			let itemCdCheck = false;
			if ( sideView == 'add' || sideView == 'edit' ) {
				$.ajax({
					url : '<c:url value="bm/itemPartDtlList"/>',
					type : 'GET',
					async : false,
					data : {
						'itemCd' 	: function(){return $('#itemCd').val(); },
						'mainGubun' : function(){return '002'; },
					},
					success : function(res) {
						let data = res.data;
						
						if ( data != null && itemSeq != data.itemSeq ) {
							itemCdCheck = true;
						}
					}
					
				});
			}
			if (itemCdCheck) {
				toastr.warning('중복된 품번 입니다.');
				$('#itemCd').focus();
				return false;
			}
			
			if (!$('#itemNm').val()) {
				toastr.warning('품명을 입력해 주세요.');
				$('#itemNm').focus();
				return false;
			}
			if (itemGubunSaveData=="002" && !$('#lhrhCd').val()) {
				toastr.warning('LH/RH를 선택해 주세요.');
				$('#lhrhCd').focus();
				return false;
			}
			if (itemGubunSaveData=="002" && !$('#exportCd').val()) {
				toastr.warning('내수/수출을 선택해 주세요.');
				$('#exportCd').focus();
				return false;
			}
			if (itemGubunSaveData!="003" && !$('#importYn').val()) {
				toastr.warning('출하검사여부를 선택해 주세요.');
				$('#importYn').focus();
				return false;
			}
			if (!$('#itemFifoGubun').val()) {
				toastr.warning('선입선출을 선택해 주세요.');
				$('#itemFifoGubun').focus();
				return false;
			}
			
			let tempExportCost = $('#exportCost').val();
			if(tempExportCost.indexOf('.') == -1){
				tempExportCost = tempExportCost + '.00';
			}
			if (itemGubunSaveData!="003" &&tempExportCost == '0') {
				toastr.warning('출고단가를 입력해 주세요.');
				$('#exportCost').focus();
				return false;
			}
			if (itemGubunSaveData!="003" && tempExportCost.substring(tempExportCost.lastIndexOf("."), 0).replace(/,/g, '').length > 8) {
				toastr.warning('출고단가가 너무 큽니다. (일 억 미만으로 입력해 주세요.)');
				$('#exportCost').val('0');
				$('#exportCost').focus();
				return false;
			}
			if (itemGubunSaveData!="003" && !(/^(\d*)[\.]?(\d{1,2})?$/g.test($('#exportCost').val().replace(/,/g, '')))) {
				toastr.warning('소수점 둘째 자리까지만 입력해 주세요.');
				$('#exportCost').val('0');
				$('#exportCost').focus();
				return false;
			}
			
			//출고단가 등록
			if($('#exportCost').val() != $('#exportBeforeCost').val()){
				$.ajax({
					url : '<c:url value="bm/itemCostListCreate"/>',
					type : 'POST',
					async : false,
					data : {
						'itemSeq' 		: 	function(){ return itemSeq; },
						'exportCost' 	: 	function(){ return $('#exportCost').val().replace(/,/g,''); },
						'exportDate' 	: 	function(){ return $('#exportDate').val().replace(/-/g,''); },
						'changeDate' 	: 	function(){ return serverDate.replace(/-/g,''); },
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							//toastr.success('출고단가이력이 등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnAddConfirm').removeClass('d-none');
						$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}
			
			let tempImportCost = $('#importCost').val();
			if(tempImportCost.indexOf('.') == -1){
				tempImportCost = tempImportCost + '.00';
			}
			if (tempImportCost.substring(tempImportCost.lastIndexOf("."), 0).replace(/,/g, '').length > 8) {
				toastr.warning('입고단가가 너무 큽니다. (일 억 미만으로 입력해 주세요.)');
				$('#importCost').val('0');
				$('#importCost').focus();
				return false;
			}
			if (!(/^(\d*)[\.]?(\d{1,2})?$/g.test($('#importCost').val().replace(/,/g, '')))) {
				toastr.warning('소수점 둘째 자리까지만 입력해 주세요.');
				$('#importCost').val('0');
				$('#importCost').focus();
				return false;
			}
			
			//입고단가 등록
			if ( $('#importCost').val() != $('#importBeforeCost').val() ) {
				$.ajax({
					url : '<c:url value="bm/itemCostListCreate"/>',
					type : 'POST',
					async : false,
					data : {
						'itemSeq' 		: 	function(){ return itemSeq; },
						'importCost' 	: 	function(){ return $('#importCost').val().replace(/,/g,''); },
						'importDate' 	: 	function(){ return $('#importDate').val().replace(/-/g,''); },
						'changeDate' 	: 	function(){ return serverDate.replace(/-/g,''); },
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							//toastr.success('입고단가이력이 등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnAddConfirm').removeClass('d-none');
						$('#btnAddConfirmLoading').addClass('d-none');
					}
				});
			}
			
			let url = '/bm/itemPartAdmCreate';
			if (sideView == "edit") {
				url = '/bm/itemPartAdmUpdate';
			} else if (sideView == "rev") {
				url = '/bm/itemPartRevCreate';
			}

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'itemSeq' 		: function(){ return itemSeq; },
					'mainGubun'   	: function(){ return '002'; },
					'itemGubun' 	: function(){ return $("#itemGubun option:selected").val(); },
					'prodGubun' 	: function(){ return $("#prodGubun option:selected").val(); },
					'itemCd' 		: function(){ return $('#itemCd').val(); },
					'itemRev' 		: function(){ return "00"; },
					'itemType' 		: function(){ return $("#itemType option:selected").val(); },
					'itemCus' 		: function(){ return $('#itemRealCus').val(); },
					'itemMaker' 	: function(){ return $('#itemMaker').val(); },
					'accCd' 		: function(){ return $("#accCd option:selected").val(); },
					'itemNm' 		: function(){ return $('#itemNm').val(); },
					'itemJustGubun' : function(){ return $("#itemJustGubun option:selected").val(); },
					'itemModel' 	: function(){ return $('#itemModel').val(); },
					'itemSpec' 		: function(){ return $('#itemSpec').val(); },
					'exportCd' 		: function(){ return $("#exportCd option:selected").val(); },
					'itemGenre' 	: function(){ return $('#itemGenre').val(); },
					'importYn' 		: function(){ return $("#importYn option:selected").val(); },
					'stateCd' 		: function(){ return $("#stateCd option:selected").val(); },
					'itemColor' 	: function(){ return $('#itemColor').val(); },
					'locationCd' 	: function(){ return $("#locationCd option:selected").val(); },
					'makeLocCd' 	: function(){ return $("#makeLocCd option:selected").val(); },
					'itemWorkplace' : function(){ return $('#itemWorkplace').val(); },
					'savelocCd' 	: function(){ return $("#savelocCd option:selected").val(); },
					'safetyStock' 	: function(){ return '0'; },
					'payMethodCd' 	: function(){ return $("#payMethodCd option:selected").val(); },
					'lhrhCd' 		: function(){ return $("#lhrhCd option:selected").val(); },
					'importCost' 	: function(){ return $('#importCost').val().replace(/,/g, ''); },
					'importDate' 	: function(){ return $('#importDate').val().replace(/-/g, ''); },
					'exportCost' 	: function(){ return $('#exportCost').val().replace(/,/g, ''); },
					'exportDate' 	: function(){ return $('#exportDate').val().replace(/-/g, ''); },
					'boxCount' 		: function(){ return $('#boxCount').val().replace(/,/g, ''); },
					'smallPackage' 	: function(){ return $('#smallPackage').val().replace(/,/g, ''); },
					'useYn' 		: function(){ return $("#useYn option:selected").val(); },
					'moldOne' 		: function(){ return $('#moldOne').val(); },
					'useYnOne' 		: function(){ return $('#useYnOne').val(); },
					'moldTwo' 		: function(){ return $('#moldTwo').val(); },
					'useYnTwo' 		: function(){ return $('#useYnTwo').val(); },
					'moldThree' 	: function(){ return $('#moldThree').val(); },
					'useYnThree' 	: function(){ return $('#useYnThree').val(); },
					'itemDesc' 		: function(){ return $('#itemDesc').val(); },
					'itemFifoGubun' : function(){ return $('#itemFifoGubun').val(); },
					'supplyType' 	: function(){ return $('#supplyType').val(); },
					'itemDesc' 		: function(){ return $('#itemDesc').val(); },
					'itemUnit' 		: function(){ return $('#itemUnit').val(); },
					'moldCd' 		: function(){ return $('#equipRealCd').val(); },
					'locNo' 		: function(){ return $('#locNo').val(); },
					'prodWt' 		: function(){ return $('#prodWt').val().replace(/,/g, ''); },
					'srWt' 			: function(){ return $('#srWt').val().replace(/,/g, ''); },
					'shotWt' 		: function(){ return $('#shotWt').val().replace(/,/g, ''); },
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
// 						$('#itemInformationTable').DataTable().ajax.reload(function() {});
						uiProc(true);
						$('#btnSave').addClass('d-none');
						$('#btnAdd').attr('disabled', false);
						$('#btnRevAdd').attr('disabled', false);
						$('#btnEdit').attr('disabled', false);
						$('#btnDel').attr('disabled', false);
						$('#mainGubun2').attr('disabled', false);
						$('#itemGubun2').attr('disabled', false);
						$('#stateCdOption').attr('disabled', false);
						$('#btnOutAdd').attr('disabled', true);
						$('#btnOutEdit').attr('disabled', true);
						$('#btnOutDel').attr('disabled', true);
						
						$('#tab2Nav').removeClass('disabled');
						$('#tab3Nav').removeClass('disabled');
						$('#tab4Nav').removeClass('disabled');
						$('#tab5Nav').removeClass('disabled');
						$('#tab6Nav').removeClass('disabled');
						$('#tab7Nav').removeClass('disabled');
						$('#tab8Nav').removeClass('disabled');
						
						if ( sideView == "edit" ) {
							toastr.success('수정되었습니다.');
						} else if ( sideView == "add" ) {
							toastr.success('신규 등록되었습니다.');
						} else if ( sideView == "rev" ) {
							toastr.success('리비전 등록되었습니다.');
						} else {
							console.log("예상치 못한 오류가 발생했습니다. - btnSave onclick");
						}

						itemCd = $('#itemCd').val();
						itemRev = $('#itemRev').val();
						
					} else if (res.result == "exist") {
						toastr.error("이미 등록된 코드입니다. 확인해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
			
			if ( sideView == "edit" && !(!$.trim($('#changeHis').val())) ) {
				$.ajax({
					url : '/sm/systemChangeLogCreate',
					type : 'POST',
					async : false,
					data : {
						'changeHis'	: function(){return $('#changeHis').val(); },
						'menuPath'	: function(){return currentHref; },
					},
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success('변경내역이 등록되었습니다.');
							$('#changeHisTable').addClass('d-none');
							$('#changeHis').val('');
						} else {
							toastr.error(res.message);
						}
					},
				});
			} else {
				$('#changeHisTable').addClass('d-none');
			}
			
			sideView = 'add';
			
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnSave onclick");
		}
		
	});

	//기본정보 탭 버튼 클릭 시
	$('#tab1Nav').on('click', function() {
		uiProc(true);
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnSave').addClass('d-none');
		
		$('#mainGubun2').attr('disabled', false);
		$('#itemGubun2').attr('disabled', false);
		$('#stateCdOption').attr('disabled', false);

		$('#outAdmTable').DataTable().ajax.reload(function(){
			setTimeout(function(){
				outAdmTable.draw();
			},150)
		});
	});
	
	//사진 탭 클릭시
	$('#tab2Nav').on('click', function() {
		imgPrint();

	});

	//관련자료 탭 버튼 클릭 시
	$('#tab3Nav').on('click', function() {
		$('#btnAttachAdd').removeClass('d-none');
		$('#btnAttachDel').removeClass('d-none');
		$('#btnAttachSave').addClass('d-none');
		$('#btnAttachAdd').attr('disabled', false);
		$('#btnAttachDel').attr('disabled', false);
		$('#itemPartAttachDataTable').DataTable().ajax.reload();
	});

	//출고단가이력 탭 버튼 클릭 시
	$('#tab4Nav').on('click', function() {
		$('#itemInformationTable').DataTable().ajax.reload();
	});
	
	//입고단가이력 탭 버튼 클릭 시
	$('#tab5Nav').on('click', function() {
		$('#itemImportTable').DataTable().ajax.reload();
		$('#outAdmTable5').DataTable().ajax.reload(function() {});
		$('#btnOutDel5').attr('disabled', false);
		$('#btnOutSave5').addClass('d-none');
		setTimeout(function(){
			outAdmTable5.draw();
		}, 175);
	});
	
	//작업조건 탭 클릭시
	$('#tab6Nav').on('click', function() {
		$('#btnWorkSave').addClass('d-none');
		$('#btnWorkEdit').attr('disabled', false);
		$('#btnWorkDel').attr('disabled', false);
		$('input[name=tab5Input]').attr('disabled', true);
		
		//표준 조회
		$.ajax({
			url : '<c:url value="bm/eqWorkStandAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'itemSeq' 			: function(){ return itemSeq; },
				'workcondiCheck'	: function(){ return 'stand'; },
			},
			success : function(res) {
				let data = res.data;
				
				if(data != null){
					$('#nzTemperature').val(data.nzTemperature);
					$('#h1Temperature').val(data.h1Temperature);
					$('#h2Temperature').val(data.h2Temperature);
					$('#h3Temperature').val(data.h3Temperature);
					$('#h4Temperature').val(data.h4Temperature);
					$('#chgPosition1').val(data.chgPosition1);
					$('#chgPosition2').val(data.chgPosition2);
					$('#chgPosition3').val(data.chgPosition3);
					$('#chgPosition4').val(data.chgPosition4);
					$('#suckBack').val(data.suckBack);
					$('#injPressure1').val(data.injPressure1);
					$('#injPressure2').val(data.injPressure2);
					$('#injPressure3').val(data.injPressure3);
					$('#injVelocity1').val(data.injVelocity1);
					$('#injVelocity2').val(data.injVelocity2);
					$('#injVelocity3').val(data.injVelocity3);
					$('#injPosition1').val(data.injPosition1);
					$('#injPosition2').val(data.injPosition2);
					$('#injPosition3').val(data.injPosition3);
					$('#backPressure1').val(data.backPressure1);
					$('#backPressure2').val(data.backPressure2);
					$('#backPressure3').val(data.backPressure3);
					$('#backPressure4').val(data.backPressure4);
					$('#hldPressure1').val(data.hldPressure1);
					$('#hldPressure2').val(data.hldPressure2);
					//$('#hldPressure3').val(data.hldPressure3);	//보압3차
					$('#hldVel1').val(data.hldVel1);
					$('#hldVel2').val(data.hldVel2);
					$('#hldVel3').val(data.hldVel3);
					$('#thermostat').val(data.thermostat);
					$('#hydraulicOil').val(data.hydraulicOil);
					$('#coolwaterIn').val(data.coolwaterIn);
					$('#coolwaterOut').val(data.coolwaterOut);
					$('#moldFixed').val(data.moldFixed);
					$('#moldMoving').val(data.moldMoving);
					$('#inFixedOne').val(data.inFixedOne);
					$('#inFixedTwo').val(data.inFixedTwo);
					$('#inFixedThree').val(data.inFixedThree);
					$('#inMovingOne').val(data.inMovingOne);
					$('#inMovingTwo').val(data.inMovingTwo);
					$('#inMovingThree').val(data.inMovingThree);
				} else {
					$('#nzTemperature').val('');
					$('#h1Temperature').val('');
					$('#h2Temperature').val('');
					$('#h3Temperature').val('');
					$('#h4Temperature').val('');
					$('#chgPosition1').val('');
					$('#chgPosition2').val('');
					$('#chgPosition3').val('');
					$('#chgPosition4').val('');
					$('#suckBack').val('');
					$('#injPressure1').val('');
					$('#injPressure2').val('');
					$('#injPressure3').val('');
					$('#injVelocity1').val('');
					$('#injVelocity2').val('');
					$('#injVelocity3').val('');
					$('#injPosition1').val('');
					$('#injPosition2').val('');
					$('#injPosition3').val('');
					$('#backPressure1').val('');
					$('#backPressure2').val('');
					$('#backPressure3').val('');
					$('#backPressure4').val('');
					$('#hldPressure1').val('');
					$('#hldPressure2').val('');
					//$('#hldPressure3').val('');	//보압3차
					$('#hldVel1').val('');
					$('#hldVel2').val('');
					$('#hldVel3').val('');
					$('#thermostat').val('');
					$('#hydraulicOil').val('');
					$('#coolwaterIn').val('');
					$('#coolwaterOut').val('');
					$('#moldFixed').val('');
					$('#moldMoving').val('');
					$('#inFixedOne').val('');
					$('#inFixedTwo').val('');
					$('#inFixedThree').val('');
					$('#inMovingOne').val('');
					$('#inMovingTwo').val('');
					$('#inMovingThree').val('');
				}
				
				
			}
		});
		
		//조건 조회
		$.ajax({
			url : '<c:url value="bm/eqWorkStandAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'itemSeq' 			: function(){ return itemSeq; },
				'workcondiCheck'	: function(){ return 'cond'; },
			},
			success : function(res) {
				let data = res.data;
				
				if(data != null){
					$('#cond_nzTemperature').val(data.nzTemperature);
					$('#cond_h1Temperature').val(data.h1Temperature);
					$('#cond_h2Temperature').val(data.h2Temperature);
					$('#cond_h3Temperature').val(data.h3Temperature);
					$('#cond_h4Temperature').val(data.h4Temperature);
					$('#cond_chgPosition1').val(data.chgPosition1);
					$('#cond_chgPosition2').val(data.chgPosition2);
					$('#cond_chgPosition3').val(data.chgPosition3);
					$('#cond_chgPosition4').val(data.chgPosition4);
					$('#cond_suckBack').val(data.suckBack);
					$('#cond_injPressure1').val(data.injPressure1);
					$('#cond_injPressure2').val(data.injPressure2);
					$('#cond_injPressure3').val(data.injPressure3);
					$('#cond_injVelocity1').val(data.injVelocity1);
					$('#cond_injVelocity2').val(data.injVelocity2);
					$('#cond_injVelocity3').val(data.injVelocity3);
					$('#cond_injPosition1').val(data.injPosition1);
					$('#cond_injPosition2').val(data.injPosition2);
					$('#cond_injPosition3').val(data.injPosition3);
					$('#cond_backPressure1').val(data.backPressure1);
					$('#cond_backPressure2').val(data.backPressure2);
					$('#cond_backPressure3').val(data.backPressure3);
					$('#cond_backPressure4').val(data.backPressure4);
					$('#cond_hldPressure1').val(data.hldPressure1);
					$('#cond_hldPressure2').val(data.hldPressure2);
					//$('#cond_hldPressure3').val(data.hldPressure3);	//보압3차 조건
					$('#cond_hldVel1').val(data.hldVel1);
					$('#cond_hldVel2').val(data.hldVel2);
					$('#cond_hldVel3').val(data.hldVel3);
					$('#cond_thermostat').val(data.thermostat);
				} else {
					$('#cond_nzTemperature').val('');
					$('#cond_h1Temperature').val('');
					$('#cond_h2Temperature').val('');
					$('#cond_h3Temperature').val('');
					$('#cond_h4Temperature').val('');
					$('#cond_chgPosition1').val('');
					$('#cond_chgPosition2').val('');
					$('#cond_chgPosition3').val('');
					$('#cond_chgPosition4').val('');
					$('#cond_suckBack').val('');
					$('#cond_injPressure1').val('');
					$('#cond_injPressure2').val('');
					$('#cond_injPressure3').val('');
					$('#cond_injVelocity1').val('');
					$('#cond_injVelocity2').val('');
					$('#cond_injVelocity3').val('');
					$('#cond_injPosition1').val('');
					$('#cond_injPosition2').val('');
					$('#cond_injPosition3').val('');
					$('#cond_backPressure1').val('');
					$('#cond_backPressure2').val('');
					$('#cond_backPressure3').val('');
					$('#cond_backPressure4').val('');
					$('#cond_hldPressure1').val('');
					$('#cond_hldPressure2').val('');
					//$('#cond_hldPressure3').val('');		//보압3차 조건
					$('#cond_hldVel1').val('');
					$('#cond_hldVel2').val('');
					$('#cond_hldVel3').val('');
					$('#cond_thermostat').val('');
				}
				
				
			}
		});
	});
	
	//작업표준서 탭 클릭시
	$('#tab7Nav').on('click', function() {
		$('#btnAttachAdd').addClass('d-none');
		$('#btnAttachDel').addClass('d-none');
		$('#btnAttachSave').addClass('d-none');	

		$('#btnWorkStandardAdd').removeClass('d-none');
		$('#btnWorkStandardDel').removeClass('d-none');
		$('#btnWorkStandardSave').addClass('d-none');	
		
		$('#btnWorkStandardAdd').attr('disabled', false);
		$('#btnWorkStandardDel').attr('disabled', false);
	
		$('#workStandTable').DataTable().ajax.reload(function() {});
		$('#itemPartAttachDataTable').DataTable().ajax.reload(function() {});
	});

	//공정등록 탭 버튼 클릭 시
	$('#tab8Nav').on('click', function() {
		$('#itemPrcssAdmTable').DataTable().ajax.reload();
		setTimeout(function(){
			itemPrcssAdmTable.draw();
			$('#itemPrcssAdmTable').DataTable().rowReorder.disable();
		}, 300);

		$('#btnPrcssSave').addClass('d-none');	
	});
	
	//출고단가이력 테이블
	let itemInformationTable = $('#itemInformationTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
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
			url : '<c:url value="bm/itemInformationList"/>',
			type : 'GET',
			data : {
				'itemSeq'		: function(){ return itemSeq; },
				'exportCost'	: function(){ return 'exportCost'; },
			},
		},
		rowId : 'itemCostSeq',
		columns : [
				{
					render : function(data, type, row, meta) {
						return meta.row
								+ meta.settings._iDisplayStart
								+ 1;
					},
					'className' : 'text-center'
				},
				{
					data : 'exportCost',
					render : function(data, type, row) {
						if(data != null){
							return rmDecimal(data);
						}
					},
					'className' : 'text-right'
				},
				{
					data : 'exportDate',
					render : function(data, type, row) {
						if(data != null){
							return moment(data).format('YYYY-MM-DD');
						}
					},
					'className' : 'text-center'
				},
				{
					data : 'changeDate',
					render : function(data, type, row) {
						if(data != null){
							return moment(data).format('YYYY-MM-DD');
						}
					},
					'className' : 'text-center'
				},
				{
					data : 'regNm',
					'className' : 'text-center'	
				},
				{ 	data : 'itemReason',	
					render : function(data, type, row, meta) {
						var str = data;
						if (data == null)
							str = '';
						return '<input class="form-control" type="text" id="itemReason'+ row['itemCostSeq']+ '" style="min-width : 100%" value="'+str+'" onchange="itemReasonCreate('
								+ row['itemCostSeq']+')"/>';
					}
				}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});
	
	let html_export = '<div class="row">';
	/* html_export += '<button type="button" class="btn btn-warning float-left ml-2" id="btnExportDel">출고단가삭제</button>'; */
	html_export += '</div>';

	$('#itemInformationTable_length').html(html_export);
	
	//출고단가이력 테이블 클릭
	$('#itemInformationTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			exportCheck = "";
			return false;
		} else {
			$('#itemInformationTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemCostSeq = itemInformationTable.row(this).data().itemCostSeq;
		console.log("itemCostSeq = " + itemCostSeq);
	
		exportCheck = "edit";
	});
	
	//출고단가이력 삭제
	$('#btnExportDel').on('click', function() {
		if (exportCheck != "edit") {
			toastr.warning("삭제할 출고단가이력을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/itemCostDtlDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemCostSeq' : function() {return itemCostSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('출고단가이력이 삭제되었습니다.');
					exportCheck = '';
				} else {
					toastr.error(res.message);
				}
				
				$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
				$('#itemInformationTable').DataTable().ajax.reload();
			}
		});

	});
	
	//입고단가이력 조회
	let itemImportTable = $('#itemImportTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
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
		//ordering: false,		
		ajax : {
			url : '<c:url value="bm/itemInformationList"/>',
			type : 'GET',
			data : {
				'itemSeq'		: function(){ return itemSeq; },
				'importCost'	: function(){ return 'importCost'; },
			},
		},
		rowId : 'itemCostSeq',
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'importCost',
				render : function(data, type, row) {
					if(data != null){
						return rmDecimal(data);
					}
				},
				'className' : 'text-right'
			},
			{
				data : 'importDate',
				render : function(data, type, row) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'changeDate',
				render : function(data, type, row) {
					if(data != null){
						return moment(data).format('YYYY-MM-DD');
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'regNm',
				'className' : 'text-center'	
			},
			{ 	data : 'itemReason',	
				render : function(data, type, row, meta) {
					var str = data;
					if (data == null) {
						str = '';
					}
					return '<input class="form-control" type="text" id="itemReason'+ row['itemCostSeq']+ '" style="min-width : 100%" value="'+str+'" onchange="itemReasonCreate('
							+ row['itemCostSeq']+')"/>';
				}
			}
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', 'excel', 'print' ],
	});
	
	let html_import = '<div class="row">';
	html_import += '<button type="button" class="btn btn-danger float-left ml-2" id="btnImportDel">입고단가삭제</button>';
	html_import += '</div>';

	$('#itemImportTable_length').html(html_import);
	
	//입고단가이력 테이블 클릭
	$('#itemImportTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			importCheck = "";
			return false;
		} else {
			$('#itemImportTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemCostSeq = itemImportTable.row(this).data().itemCostSeq;
		console.log("itemCostSeq = " + itemCostSeq);
	
		importCheck = "edit";
	});
	
	//입고단가이력 삭제
	$('#btnImportDel').on('click', function() {
		if (importCheck != "edit") {
			toastr.warning("삭제할 입고단가이력을 선택해주세요.");
			return false;
		}
		
		$.ajax({
			url : '<c:url value="bm/itemCostDtlDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemCostSeq' : function() {return itemCostSeq;},
			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('입고단가이력이 삭제되었습니다.');
					importCheck = '';
				} else {
					toastr.error(res.message);
				}
				$('#itemImportTable').DataTable().ajax.reload();
				$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
			}
		});

	});
	
	function itemReasonCreate(itemCostSeq){
		$.ajax({
			url : '<c:url value="/bm/itemReasonCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemCostSeq' : function() {return itemCostSeq;},
				'itemReason' : $('#itemReason' + itemCostSeq).val()
			},
			beforeSend : function() {
				// $('#btnAddConfirm').addClass('d-none');
				// $('#btnAddConfirmLoading').removeClass('d-none');
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('변경사유가 수정되었습니다.');
					
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
			}
		});
	}

	//관련자료 테이블
	let itemPartAttachDataTable = $('#itemPartAttachDataTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="/bm/itemPartAttachDataList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){ return itemSeq; },
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							+ 1;
				}
			},
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return userNm;
					}
				}
			},
			{
				data : 'contents',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '<input class="form-control" type="text" id="contents" name="contents" style="min-width : 100%;"/>';
					}
				}
			},
			{
				data : 'fileNm',
				render : function(data, type, row, meta) {
	
					var html;
	
					if (data != null) {
						html = '<a href="/bm/itemPartAttachFileDownload?itemSeq='
								+ row['itemSeq']
								+ '&itemAttachSeq='
								+ row['itemAttachSeq']
								+ '">'
								+ data + '</a>';
					} else {
						html = '<div class="custom-file" disabled>'
						html += '<input type="file" class="custom-file-input" id="fileNm_'
								+ meta.row
								+ '" name="file" onchange=uploadWorkStandard("'
								+ meta.row + '"); />'
						html += '<label class="custom-file-label" for="fileNm_'+meta.row+'">파일을 선택해주세요.</label></div>'
					}
	
					return html;
				}
			}
		],
		columnDefs : [ {
			"targets" : [ 0, 1 ],
			"className" : "text-center"
		},
		],
		buttons : []
	});

	// 작업표준서 목록조회
	let workStandTable = $('#workStandTable').DataTable({
		language : lang_kor,
		destroy : true,
		paging : false,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemWorkStandardList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function() {return itemSeq;},	
			},
		},
		rowId : 'workStandardSeq',
		columns : [
			{
				data : 'workStandardSeq',
				'className' : 'text-center',				
					render : function(data, type, row, meta) {
						if (data != null) {
							return data;
						} else {
							return meta.row + 1 ;
						}
					}
			}, 
			{
				data : 'workStandardNm',
				render : function(data, type, row, meta) {
	
					var html;
	
					if (data != null) {
						html = '<a href="/bm/itemWorkStandardDownload?itemSeq='+ row['itemSeq']+ '&workStandardSeq='+ row['workStandardSeq']+ '">'+ data + '</a>';
					} else {
						html = '<div class="custom-file" disabled>'
						html += '<input type="file" class="custom-file-input" id="fileNm_'
								+ (meta.row + 1)
								+ '" name="fileNm_' + (meta.row + 1) + '"/>'
						html += '<label class="custom-file-label" for="fileNm_'+(meta.row+1)+'">파일을 선택해주세요.</label></div>'
					}
	
					return html;
				}
			}
		],
		order : [ [ 0, 'asc' ] ],
		drawCallback : function(settings) {

		},
	});

	//데이터 클릭 시
	$('#itemPartAttachDataTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#itemPartAttachDataTable').DataTable().$('tr.selected')
					.removeClass('selected');
			$(this).addClass('selected');
		}
	
		itemAttachSeq = itemPartAttachDataTable.row(this).data().itemAttachSeq;
		console.log("itemAttachSeq = " + itemAttachSeq);
	
		status = "choice";
	});

	//추가버튼
	$('#btnAttachAdd').on('click', function() {
		/* if(status != "choice"){
			toastr.warning("관련자료 항목을 선택해주세요.");
		} */
		$('#itemPartAttachDataTable').DataTable().row.add({}).draw(false);

		$('#btnAttachAdd').attr('disabled', true);
		$('#btnAttachDel').attr('disabled', true);

		$('#btnAttachSave').removeClass('d-none');

	});

	//삭제버튼
	$('#btnAttachDel').on('click', function() {
		if (status != "choice") {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$.ajax({
			url : '<c:url value="bm/itemPartAttachDataDelete" />',
			type : 'POST',
			data : {
				'itemSeq' : function() {return itemSeq;},
				'itemAttachSeq' : function() {return itemAttachSeq;},

			},
			success : function(res) {
				if (res.result == 'ok') {
					// 보기
					toastr.success('삭제되었습니다.');
					status = '';
				} else {
					toastr.error(res.message);
				}
				$('#itemPartAttachDataTable').DataTable().ajax.reload();
			}
		});

	});

	//저장 버튼 클릭
	$('#btnAttachSave').on('click', function() {
		if (activeTab == "관련자료") {

			if (!$.trim($('input[name=file]').val())) {
				toastr.warning('파일을 선택해주세요.');
				$('#file').focus();
				return false;
			}

			var formData = new FormData(document.getElementById("form3"));
			formData.append('itemSeq', itemSeq);

			$.ajax({
				url : '<c:url value="bm/itemPartAttachDataCreate" />',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(res) {
					if (res.result == 'ok') {
						// 보기
						toastr.success('등록되었습니다.');
						status = '';
					} else {
						toastr.error(res.message);
					}

					$('#itemPartAttachDataTable').DataTable().ajax.reload();
					$('#btnAttachSave').addClass('d-none');
					$('#btnAttachAdd').attr('disabled', false);
					$('#btnAttachDel').attr('disabled', false);
				}
			});

		}
	});

	//작업표준서 데이터 클릭 시
	$('#workStandTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#workStandTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	
		workStandardSeq = workStandTable.row(this).data().workStandardSeq;		
	});

	//작업표준서 추가버튼
	$('#btnWorkStandardAdd').on('click', function() {

		$('#workStandTable').DataTable().row.add({}).draw(false);

		$('#btnWorkStandardAdd').attr('disabled', true);
		$('#btnWorkStandardDel').attr('disabled', true);

		$('#btnWorkStandardSave').removeClass('d-none');

	});

	//작업표준서 삭제버튼
	$('#btnWorkStandardDel').on('click', function() {

		$.ajax({
			url : '<c:url value="bm/itemWorkStandardDelete" />',
			type : 'POST',
			data : {
				'itemSeq' 			: function(){ return itemSeq; },
				'workStandardSeq' 	: function(){ return workStandardSeq; },

			},
			success : function(res) {
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
				} else {
					toastr.error(res.message);
				}
				$('#workStandTable').DataTable().ajax.reload();
			}
		});

	});

	//작업표준서 저장 버튼 클릭
	$('#btnWorkStandardSave').on('click', function() {
		if (activeTab == "작업표준서") {

			if (!$.trim($('input[type=file]')[1])) {
				toastr.warning('파일을 선택해주세요.');				
				return false;
			}

			var formData = new FormData(document.getElementById("form7"));
			formData.append('itemSeq', itemSeq);

			$.ajax({
				url : '<c:url value="bm/itemWorkStandardUpload" />',
				type : 'POST',
				data : formData,
				processData : false,
				contentType : false,
				success : function(res) {
					if (res.result == 'ok') {
						// 보기
						toastr.success('등록되었습니다.');
						status = '';
					} else {
						toastr.error(res.message);
					}

					$('#workStandTable').DataTable().ajax.reload();
					$('#btnWorkStandardSave').addClass('d-none');
					$('#btnWorkStandardAdd').attr('disabled', false);
					$('#btnWorkStandardDel').attr('disabled', false);
				}
			});

		}
	});

	//고객사 팝업 시작
	let popUpCheck = null;
	function itemCusSelectInCorpCd() {
		popUpCheck = '고객사';
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		
		var dealArr = ['001','002','003'];
		if ( $('#itemGubun').val() == '003' ) {
			dealArr = ['001','002'];
		}
		
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
					'dealArr' : function(){ return dealArr; },
				},
			},
			rowId : 'dealCorpSeq',
			columns : [
				{//거래처
					data : 'dealCorpNm'
				},
				{//거래처코드
					data : 'dealCorpCd'
				},
				{//대표자
					data : 'presidentNm'
				},
				{//대표품목
					data : 'repreItem'
				},
				{//사업자번호
					data : 'corpNo'
				}
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			if(popUpCheck == '고객사'){
				let data = dealCorpPopUpTable4.row(this).data();
				$('#itemRealCus').val(data.dealCorpCd);
				$('#itemCus').val(data.dealCorpNm);
				$('#dealCorpPopUpModal4').modal('hide');
			}
		});
		
		$('#dealCorpPopUpModal4').modal('show');
		
	}
	
	//입고처 팝업 시작
	function accCdSelectInCorpCd() {
		popUpCheck = '입고처';
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
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/dealCorpDataJustList"/>',
				type : 'GET',
				data : {},
			},
			rowId : 'dealCorpSeq',
			columns : [ {
				data : 'dealCorpNm'
			}, {
				data : 'dealCorpCd'
			}, {
				data : 'presidentNm'
			}, {
				data : 'repreItem'
			}, {
				data : 'corpNo'
			} ],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			if(popUpCheck == '입고처'){
				var data = dealCorpPopUpTable4.row(this).data();
				$('#accCd').val(data.dealCorpNm);
				$('#dealCorpPopUpModal4').modal('hide');
			}
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	//작업장 팝업 시작
	function itemWorkplaceSelectInCorpCd() {
		popUpCheck = '작업장';
		if (itemWorkplacePopUpTable == null || itemWorkplacePopUpTable == undefined) {
			itemWorkplacePopUpTable = $('#itemWorkplacePopUpTable').DataTable({
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
					url : '<c:url value="/bm/prcssItemWorkplace"/>',
					type : 'GET',
					data : {
						'prcssGubun' : '002',
						'prcssType' : '001'
					},
				},
				rowId : 'prcssCd',
				columns : [ 
				{
					data : 'prcssCd'
				}, 
				{
					data : 'prcssNm'
				}  
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
	
			
			$('#itemWorkplacePopUpTable tbody').on('click', 'tr', function() {
				if(popUpCheck == '작업장'){
					var data = itemWorkplacePopUpTable.row(this).data();
					$('#itemWorkplace').val(data.prcssCd);
					$('#itemWorkplaceNm').val(data.prcssNm);
					$('#itemWorkplacePopUpModal').modal('hide');
				}
			});
		}
		$('#itemWorkplacePopUpModal').modal('show');
	}
	
	//금형코드 팝업 시작
	let equipCdPopUpTable = null;
	function equipCdSelectInCorpCd(){
		equipCdPopUpTable = $('#equipCdPopUpTable').DataTable({
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
			bDestroy : true,
			pageLength : 10,
			ajax : {
				url : '<c:url value="/bm/equipCodeAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun'    : function(){ return '003'; },
					'itemSeqCheck' : function(){ return 'itemSeqCheck'; },
				},
			},
			columns : [ 
				{
					data : 'equipNo'
				}, 
				{
					data : 'equipNm'
				},
				{
					data : 'mfcCorpCd'
				},
				{
					data : 'mfcDate',
					render : function (data, type, row, meta) {
						if ( data != null && data != '' ) {
							return moment(data).format('YYYY-MM-DD');
						} else {
							return '';
						}
					}
				}  
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});

		$('#equipCdPopUpModal').modal('show');
	}
	
	//금형코드 팝업 테이블 행 클릭시
	$(document).on('click', '#equipCdPopUpTable tbody tr', function() {
		var data = equipCdPopUpTable.row(this).data();
		
		$('#equipRealCd').val(data.equipCd);
		$('#equipCd').val(data.equipNo);
		$('#equipNm').val(data.equipNm);
		$('#mfcCorpCd').val(data.mfcCorpCd);
		$('#mfcDate').val(moment(data.mfcDate).format('YYYY-MM-DD'));
		
		$('#equipCdPopUpModal').modal('hide');
	});
	
	
	//숫자 콤마생성
	$(document).on('keyup', "input[name=tab5Input]", function(evt) { //입력시 콤마 추가
		var costSum = 0;
		if ($(this).val() == "") {
// 			$(this).val("0");
			$(this).select();
		}
		//입력 정규식 0~9 .
		reg = /[^0-9.~]/gi;
		let poQty = $(this).val().replace(/,/g, '');
		if (reg.test(poQty)) {
			poQty = poQty.replace(reg, '');
			$(this).val(poQty);
			toastr.warning("숫자와 ~(물결)만 사용해서 입력해 주세요.");
			return false;
		}
		$(this).val(poQty);

	});
	
	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : false,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		ajax : {
			url : '<c:url value="bm/itemPartExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		rowId : 'itemCd',
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row
							+ meta.settings._iDisplayStart
							
							+ 1;
				}
			},
			{data : 'itemCd'},
			{data : 'partNm'},
			{data : 'partGubun'},
			{data : 'partType'},
			{data : 'itemRev'},
			{data : 'partSpec'},
			{data : 'inCorpCd'},
			{data : 'partUnit'},
			{data : 'basicDlvDate'},
			{data : 'unitCost'},
			{data : 'useYn',
				render : function(data, type, row, meta){
					if(data!=null){
						return data;
					}else{
						return "001";
					}
				}
			},
			{data : 'inspectYn',
				render : function(data, type, row, meta){
					if(data!=null){
						return data;
					}else{
						return "001";
					}
				}
			},
			{data : 'partDesc'}, 
		],
		columnDefs: [
			{ targets: [9] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"targets": "_all" , "className": "text-center"},
        	
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		var formData = new FormData($('#fileUploadForm')[0]);

		var str = $('#btnExcelUpload').val();
		index = 0;

		
		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/itemPartExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				beforeSend : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
					
					//처리완료..
					$('#my-spinner').hide();
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}
	});
	
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	

		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.itemSeq= inTable.row(index).data().itemSeq==null?"":inTable.row(index).data().itemSeq;
			rowData.itemCd= inTable.row(index).data().itemCd==null?"":inTable.row(index).data().itemCd;
			rowData.partNm= inTable.row(index).data().partNm==null?"":inTable.row(index).data().partNm;
			rowData.partGubun= inTable.row(index).data().partGubun==null?"":inTable.row(index).data().partGubun;
			rowData.partType= inTable.row(index).data().partType==null?"":inTable.row(index).data().partType;
			rowData.itemRev= inTable.row(index).data().itemRev==null?"":inTable.row(index).data().itemRev;
			rowData.partSpec= inTable.row(index).data().partSpec==null?"":inTable.row(index).data().partSpec;
			rowData.inCorpCd= inTable.row(index).data().inCorpCd==null?"":inTable.row(index).data().inCorpCd;
			rowData.partUnit= inTable.row(index).data().partUnit==null?"":inTable.row(index).data().partUnit;
			rowData.basicDlvDate= inTable.row(index).data().basicDlvDate==null?"":inTable.row(index).data().basicDlvDate;
			rowData.unitCost= inTable.row(index).data().unitCost==null?"":inTable.row(index).data().unitCost;
			rowData.useYn= inTable.row(index).data().useYn==null?"001":inTable.row(index).data().useYn;
			rowData.inspectYn= inTable.row(index).data().inspectYn==null?"001":inTable.row(index).data().inspectYn;
			rowData.partDesc= inTable.row(index).data().partDesc==null?"":inTable.row(index).data().partDesc;
			
	        dataArray.push(rowData);
		});
			
		if(check){
			$.ajax({
				url : '<c:url value="bm/itemPartAdmExcelCreate"/>',
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
						$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						console.log(res.itemCdList);
						
						setTimeout(function() {
							toastr.warning("동일한 부품코드("+res.itemCdList+")가 존재합니다.");
						},1000);
						
					}else {
						toastr.error(res.message);
					}
					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
					
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	function uiProc(flag) {
		$("#itemGubun").attr("disabled", flag);
		$("#prodGubun").attr("disabled", flag);
		$("#itemType").attr("disabled", flag);
		$("#itemMaker").attr("disabled", flag);
		$("#btnItemCus").attr("disabled", flag);
		$("#itemCd").attr("disabled", flag);
		$("#itemCusDelete").attr("disabled", flag);
		$("#btnAccCd").attr("disabled", flag);
		$("#accCdDelete").attr("disabled", flag);
		$("#itemNm").attr("disabled", flag);
		$("#itemJustGubun").attr("disabled", flag);
		$("#itemModel").attr("disabled", flag);
		$("#itemSpec").attr("disabled", flag);
		$("#exportCd").attr("disabled", flag);
		$("#itemGenre").attr("disabled", flag);
		$("#importYn").attr("disabled", flag);
		$("#stateCd").attr("disabled", flag);
		$("#itemColor").attr("disabled", flag);
		$("#locationCd").attr("disabled", flag);
		$("#makeLocCd").attr("disabled", flag);
		$("#btnItemWorkplace").attr("disabled", flag);
		$("#itemWorkplaceDelete").attr("disabled", flag);
		$("#savelocCd").attr("disabled", flag);
		$("#safetyStock").attr("disabled", flag);
		$("#itemFifoGubun").attr("disabled", flag);
		$("#payMethodCd").attr("disabled", flag);
		$("#lhrhCd").attr("disabled", flag);
		$("#importCost").attr("disabled", flag);
		$("#exportCost").attr("disabled", flag);
		$("#boxCount").attr("disabled", flag);
		$("#smallPackage").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#useYnOne").attr("disabled", flag);
		$("#useYnTwo").attr("disabled", flag);
		$("#useYnThree").attr("disabled", flag);
		$("#itemDesc").attr("disabled", flag);
		$("#btnMoldCd1").attr("disabled", flag);
		$("#btnMoldCd2").attr("disabled", flag);
		$("#btnMoldCd3").attr("disabled", flag);
		$("#moldOne1Delete").attr("disabled", flag);
		$("#moldOne2Delete").attr("disabled", flag);
		$("#moldOne3Delete").attr("disabled", flag);
		$("#mfcDateCalendar1").attr("disabled", flag);
		$("#mfcDateCalendar2").attr("disabled", flag);
		$("#mfcDateCalendar3").attr("disabled", flag);
		$("#itemUnit").attr("disabled", flag);
		$("#mg1").attr("disabled", flag);
		$("#mg2").attr("disabled", flag);
		$("#equipCdCus").attr("disabled", flag);
		$("#equipCdDelete").attr("disabled", flag);
		$("#btnAreaFloor").attr("disabled", flag);
		$("#areaFloorDelete").attr("disabled", flag);
		$("#supplyType").attr("disabled", flag);
		$("#prodWt").attr("disabled", flag);
		$("#srWt").attr("disabled", flag);
		$("#shotWt").attr("disabled", flag);
	}
	
	//불러오기 버튼을 클릭 시
	$('#btnCall').on('click', function(){
		$('#partPopUpModal').modal('show');

		$('#itemPartAdmPopUpTable').DataTable().ajax.reload(function(){});

		//팝업테이블 클릭 시
		$('#itemPartAdmPopUpTable tbody').on('click', 'tr', function () {

			//event
			if ($(this).hasClass('selected')) {
				//$(this).removeClass('selected');
			} else {
				$('#itemMotorTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}

// 			$('#itemMotorTable').DataTable().$('tr.selected').removeClass('selected');
			$('#form').each(function(){
	        	this.reset();
	    	});
	    	
			sideView = 'add';

		  	var data = itemPartAdmPopUpTable.row( this ).data();
		  	console.log(data);

			//화면처리
			$('#form').each(function() {
				this.reset();
			});

			$('#tab2Nav').addClass('disabled');
			$('#tab3Nav').addClass('disabled');
			$('#tab4Nav').addClass('disabled');
			$('#tab5Nav').addClass('d-none');
			
			uiProc(false);
			$('#itemRev').val('00');
			$('#btnSave').removeClass('d-none'); // 저장버튼
			$('#btnEdit').attr('disabled', true);
			$('#btnDel').attr('disabled', true);
		  	
			$('#partNm').val(data.partNm);					//ITEM
			$('#itemRev').val(data.itemRev);				//Revision
			$('#partUnit').val(data.partUnit);				//단위
			$('#partSpec').val(data.partSpec);				//SPEC
			$('#partGubun').val(data.partGubun);			//구분
			$('#partType').val(data.partType);				//Type

			$('#inCorpCd').val(data.inCorpCd);				//입고처**
			$('#inCorpNm').val(data.inCorpNm);				//입고처**
			
			$('#basicDlvDate').val(data.basicDlvDate);		//기본납기일
			$('#unitCost').val(data.unitCost);				//자재단가
			$('#standCost').val(data.standCost != null ? rmDecimal(data.standCost):'');	//표준단가
			$('#inspectYn').val(data.inspectYn);			//수입검사여부
			$('#partDesc').val(data.partDesc);				//비고
			
		     $('#partPopUpModal').modal('hide');
		});
	});

	// 불러오기 목록
	let itemPartAdmPopUpTable = $('#itemPartAdmPopUpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6l><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : false,
		destroy : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		serverSide : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {},
		},
		rowId : 'itemCd',
		columns : [
			{ render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{ data : 'itemCd'		},
			{ data : 'partNm'		},
			{ data : 'partGubunNm'	},
			{ data : 'itemRev'		},
			{ data : 'partSpec' 	}
		],
		columnDefs : [ {
			"defaultContent": "-", "targets": "_all",	"className": "text-center"
		}],
		order : [ [ 1, 'asc' ] ],
	});

	//삭제
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		
		$('#deleteSmallModal').modal('show');
	});
	
	//삭제
	$('#btnDeleteY').on('click', function() {
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		
		$.ajax({
			url : '<c:url value="bm/itemInfoAdmDelete"/>',
			type : 'POST',
			data :{
				'itemSeq' : function() {return itemSeq;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#itemPartAdmTable').DataTable().ajax.reload(null, false);
				}else {
					toastr.error(res.message);
				}

				$('#deleteSmallModal').modal('hide');
			}
		});
		
	});
	
	let radioCheck;
	function radioOnclick(){
		radioCheck = $('input[name=mainGubun]:checked').val();
		if (radioCheck == '001') {
			
			$('#itemWorkplace').val('S-M');
			$("#btnItemWorkplace").attr("disabled", true);
			$("#itemWorkplaceDelete").attr("disabled", true);
		} else if (radioCheck == '002') {
			$('#equipRealCd').val('');
			$('#equipCd').val('');
			$('#equipNm').val('');
			$('#mfcCorpCd').val('');
			$('#mfcDate').val('');
			
			$('#itemWorkplace').val('');
			$("#btnItemWorkplace").attr("disabled", false);
			$("#itemWorkplaceDelete").attr("disabled", false);
		}
	}

	//작업조건 수정버튼
	$('#btnWorkEdit').on('click', function() {
		$('input[name=tab5Input]').attr('disabled', false);
		$('#btnWorkSave').removeClass('d-none');
		$('#btnWorkDel').attr('disabled', true);
	});
	
	//작업조건 삭제버튼
	$('#btnWorkDel').on('click', function() {

		//작업조건 표준 삭제
		$.ajax({
			url : '<c:url value="bm/eqWorkStandAdmDelete" />',
			type : 'GET',
			data  : {
				'itemSeq' 			: function(){ return itemSeq; },
				'workcondiCheck' 	: function(){ return 'stand'; },
			},
			success  : function(res){
				
			}
		})
		
		//작업조건 조건 삭제
		$.ajax({
			url : '<c:url value="bm/eqWorkStandAdmDelete" />',
			type : 'GET',
			data  : {
				'itemSeq' 			: function(){ return itemSeq; },
				'workcondiCheck' 	: function(){ return 'cond'; },
			},
			success  : function(res){
				$('#form6').each(function() { this.reset(); });
				toastr.success("삭제되었습니다.");
			}
		})

	});
	
	//작업조건 저장
	$('#btnWorkSave').on('click', function() {

		//표준 저장
		$.ajax({
			url : '<c:url value="/bm/eqWorkStandAdmController"/>',
			type : 'POST',
			async : false,
			data : {
				'workcondiCheck' 	: function(){ return 'stand'; },
				'itemSeq' 			: function(){ return itemSeq; },
				'nzTemperature' 	: function(){ return $('#nzTemperature').val().replace(/,/g, ''); },
				'h1Temperature' 	: function(){ return $('#h1Temperature').val().replace(/,/g, ''); },
				'h2Temperature' 	: function(){ return $('#h2Temperature').val().replace(/,/g, ''); },
				'h3Temperature' 	: function(){ return $('#h3Temperature').val().replace(/,/g, ''); },
				'h4Temperature' 	: function(){ return $('#h4Temperature').val().replace(/,/g, ''); },
				'chgPosition1' 		: function(){ return $('#chgPosition1').val().replace(/,/g, ''); },
				'chgPosition2' 		: function(){ return $('#chgPosition2').val().replace(/,/g, ''); },
				'chgPosition3' 		: function(){ return $('#chgPosition3').val().replace(/,/g, ''); },
				'chgPosition4' 		: function(){ return $('#chgPosition4').val().replace(/,/g, ''); },
				'suckBack' 			: function(){ return $('#suckBack').val().replace(/,/g, ''); },
				'injPressure1' 		: function(){ return $('#injPressure1').val().replace(/,/g, ''); },
				'injPressure2' 		: function(){ return $('#injPressure2').val().replace(/,/g, ''); },
				'injPressure3' 		: function(){ return $('#injPressure3').val().replace(/,/g, ''); },
				'injVelocity1' 		: function(){ return $('#injVelocity1').val().replace(/,/g, ''); },
				'injVelocity2' 		: function(){ return $('#injVelocity2').val().replace(/,/g, ''); },
				'injVelocity3' 		: function(){ return $('#injVelocity3').val().replace(/,/g, ''); },
				'injPosition1' 		: function(){ return $('#injPosition1').val().replace(/,/g, ''); },
				'injPosition2' 		: function(){ return $('#injPosition2').val().replace(/,/g, ''); },
				'injPosition3' 		: function(){ return $('#injPosition3').val().replace(/,/g, ''); },
				'backPressure1' 	: function(){ return $('#backPressure1').val().replace(/,/g, ''); },
				'backPressure2' 	: function(){ return $('#backPressure2').val().replace(/,/g, ''); },
				'backPressure3' 	: function(){ return $('#backPressure3').val().replace(/,/g, ''); },
				'backPressure4' 	: function(){ return $('#backPressure4').val().replace(/,/g, ''); },
				'hldPressure1' 		: function(){ return $('#hldPressure1').val().replace(/,/g, ''); },
				'hldPressure2' 		: function(){ return $('#hldPressure2').val().replace(/,/g, ''); },
				'hldVel1' 			: function(){ return $('#hldVel1').val().replace(/,/g, ''); },
				'hldVel2' 			: function(){ return $('#hldVel2').val().replace(/,/g, ''); },
				'hldVel3' 			: function(){ return $('#hldVel3').val().replace(/,/g, ''); },
				'thermostat' 		: function(){ return $('#thermostat').val().replace(/,/g, ''); },
				'hydraulicOil' 		: function(){ return $('#hydraulicOil').val().replace(/,/g, ''); },
				'coolwaterIn' 		: function(){ return $('#coolwaterIn').val().replace(/,/g, ''); },
				'coolwaterOut' 		: function(){ return $('#coolwaterOut').val().replace(/,/g, ''); },
				'moldFixed' 		: function(){ return $('#moldFixed').val().replace(/,/g, ''); },
				'moldMoving' 		: function(){ return $('#moldMoving').val().replace(/,/g, ''); },
				'inFixedOne' 		: function(){ return $('#inFixedOne').val().replace(/,/g, ''); },
				'inFixedTwo' 		: function(){ return $('#inFixedTwo').val().replace(/,/g, ''); },
				'inFixedThree' 		: function(){ return $('#inFixedThree').val().replace(/,/g, ''); },
				'inMovingOne' 		: function(){ return $('#inMovingOne').val().replace(/,/g, ''); },
				'inMovingTwo' 		: function(){ return $('#inMovingTwo').val().replace(/,/g, ''); },
				'inMovingThree' 	: function(){ return $('#inMovingThree').val().replace(/,/g, ''); },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
		
		//조건 저장
		$.ajax({
			url : '<c:url value="/bm/eqWorkStandAdmController"/>',
			type : 'POST',
			async : false,
			data : {
				'workcondiCheck' 	: function(){ return 'cond'; },
				'itemSeq' 			: function(){ return itemSeq; },
				'nzTemperature' 	: function(){ return $('#cond_nzTemperature').val().replace(/,/g, ''); },
				'h1Temperature' 	: function(){ return $('#cond_h1Temperature').val().replace(/,/g, ''); },
				'h2Temperature' 	: function(){ return $('#cond_h2Temperature').val().replace(/,/g, ''); },
				'h3Temperature' 	: function(){ return $('#cond_h3Temperature').val().replace(/,/g, ''); },
				'h4Temperature' 	: function(){ return $('#cond_h4Temperature').val().replace(/,/g, ''); },
				'chgPosition1' 		: function(){ return $('#cond_chgPosition1').val().replace(/,/g, ''); },
				'chgPosition2' 		: function(){ return $('#cond_chgPosition2').val().replace(/,/g, ''); },
				'chgPosition3' 		: function(){ return $('#cond_chgPosition3').val().replace(/,/g, ''); },
				'chgPosition4' 		: function(){ return $('#cond_chgPosition4').val().replace(/,/g, ''); },
				'suckBack' 			: function(){ return $('#cond_suckBack').val().replace(/,/g, ''); },
				'injPressure1' 		: function(){ return $('#cond_injPressure1').val().replace(/,/g, ''); },
				'injPressure2' 		: function(){ return $('#cond_injPressure2').val().replace(/,/g, ''); },
				'injPressure3' 		: function(){ return $('#cond_injPressure3').val().replace(/,/g, ''); },
				'injVelocity1' 		: function(){ return $('#cond_injVelocity1').val().replace(/,/g, ''); },
				'injVelocity2' 		: function(){ return $('#cond_injVelocity2').val().replace(/,/g, ''); },
				'injVelocity3' 		: function(){ return $('#cond_injVelocity3').val().replace(/,/g, ''); },
				'injPosition1' 		: function(){ return $('#cond_injPosition1').val().replace(/,/g, ''); },
				'injPosition2' 		: function(){ return $('#cond_injPosition2').val().replace(/,/g, ''); },
				'injPosition3' 		: function(){ return $('#cond_injPosition3').val().replace(/,/g, ''); },
				'backPressure1' 	: function(){ return $('#cond_backPressure1').val().replace(/,/g, ''); },
				'backPressure2' 	: function(){ return $('#cond_backPressure2').val().replace(/,/g, ''); },
				'backPressure3' 	: function(){ return $('#cond_backPressure3').val().replace(/,/g, ''); },
				'backPressure4' 	: function(){ return $('#cond_backPressure4').val().replace(/,/g, ''); },
				'hldPressure1' 		: function(){ return $('#cond_hldPressure1').val().replace(/,/g, ''); },
				'hldPressure2' 		: function(){ return $('#cond_hldPressure2').val().replace(/,/g, ''); },
				'hldVel1' 			: function(){ return $('#cond_hldVel1').val().replace(/,/g, ''); },
				'hldVel2' 			: function(){ return $('#cond_hldVel2').val().replace(/,/g, ''); },
				'hldVel3' 			: function(){ return $('#cond_hldVel3').val().replace(/,/g, ''); },
				'thermostat' 		: function(){ return $('#cond_thermostat').val().replace(/,/g, ''); },
				'hydraulicOil' 		: function(){ return ''; },
				'coolwaterIn' 		: function(){ return ''; },
				'coolwaterOut' 		: function(){ return ''; },
				'moldFixed' 		: function(){ return ''; },
				'moldMoving' 		: function(){ return ''; },
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success("수정되었습니다.");
					$('#btnWorkSave').addClass('d-none');
					$('#btnWorkEdit').attr('disabled', false);
					$('#btnWorkDel').attr('disabled', false);
					$('input[name=tab5Input]').attr('disabled', true);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {

			}
		});
		
	});
	
	// 구역/위치 팝업 시작
	let locationPopupTable;
	function selectAreaFloor() {
		
		if (!$('#savelocCd').val()) {
			toastr.warning('저장위치를 선택해 주세요.');
			$('#savelocCd').focus();
			return false;
		}
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
					'locCd' : function(){return $('#savelocCd').val();},
					'mainGubun' : function(){return '002';}
				},
			},
			columns : [ 
				{
					data : 'locNo' , 
						render : function(data, type, row, meta){
							if(data!=null){
								return data;
							} else{
								return '-';
							}
						}
				}, 
				{
					data : 'locNm'
				}, 
				{
					data : 'areaNm'
				}, 
				{
					data : 'floorNm'
				}, 
				{
					data : 'useYnNm'
				}, 
				{
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
			var data = locationPopupTable.row(this).data();
			$('#locNo').val(data.locNo);
			$('#areaFloor').val(data.areaNm + ' / ' + data.floorNm);
			$('#locationPopupModal').modal('hide');
		});
		$('#locationPopupModal').modal('show');
	}
	
	function itemGubunOnChange() {
		let itemGubunVal = $("#itemGubun").val();
		let prodGubunVal = $("#prodGubun").val();

		//저장위치 및 구역/위치
		selectBoxAppend(savelocCd, "savelocCd", "007", "");
		
		if (itemGubunVal == '003') { //반제품일 경우

			selectBoxAppend(savelocCd, "savelocCd", "006", "");
			
			$('#areaFloorTr1').text('*구역 / 위치');
			$('#itemCusTh').text('공급사');
			$('#importYnTh').text('수입검사여부');
			$('#exportCostTh').text('출고단가');
			$('#exportDateTh').text('출고단가적용일');
			$('#prodGubun').removeClass('d-none');
			$('#prodGubunTh').removeClass('d-none');
			$('#prodGubunDiv').removeClass('d-none');
			$('#supplyTypeDiv').removeClass('d-none');
			$('#smallPackage').removeClass('d-none');
			$('#smallPackageTh').removeClass('d-none');
			$('#itemPartInfoTable tr').eq(4).addClass('d-none');
			$('#itemPartInfoTable tr').eq(5).addClass('d-none');
			$('#itemPartInfoTable tr').eq(11).removeClass('d-none');
			$('#itemPartInfoTable tr').eq(12).addClass('d-none');
			$('#itemPartInfoTable tr').eq(13).addClass('d-none');
			
			$('#tab5Nav').removeClass('d-none'); //입고단가이력 탭 표시
			
			//생산구분에 '외주'가 포함된 경우
			let prodGubunCheck = false;
			prodGubunCode.forEach(function(array){
			    if(array.baseCd == prodGubunVal){ //데이터 확인
			        let tempVal = array.baseNm;
		            if(tempVal.includes('외주')){ //외주가 포함되어 있는지 확인
		            	prodGubunCheck = true;
		            }
			    }
			})
			if (prodGubunCheck) { //생산구분에 '외주'가 포함되어 있는 지 확인
				$('#btnOutAdd').attr('disabled', false);
				$('#btnOutEdit').attr('disabled', false);
				$('#btnOutDel').attr('disabled', false);
				$('#outTableDiv').removeClass('d-none');
				$('#outAdmTable').DataTable().ajax.reload();
				setTimeout(function(){
					outAdmTable.draw();
					outAdmTable.draw();
				}, 300);
			} else {
				$('#outTableDiv').addClass('d-none');
			}
		} else if ( itemGubunVal == '001' ) { //제품일 경우
			$('#areaFloorTr1').text('구역 / 위치');
			$('#itemCusTh').text('*고객사');
			$('#importYnTh').text('*출하검사여부');
			$('#exportCostTh').text('*출고단가');
			$('#exportDateTh').text('*출고단가적용일');
			$('#prodGubun').addClass('d-none');
			$('#prodGubunTh').addClass('d-none');
			$('#prodGubunDiv').addClass('d-none');
			$('#supplyTypeDiv').addClass('d-none');
			$('#smallPackage').addClass('d-none');
			$('#smallPackageTh').addClass('d-none');
			$('#itemPartInfoTable tr').eq(4).addClass('d-none');
			$('#itemPartInfoTable tr').eq(5).addClass('d-none');
			$('#itemPartInfoTable tr').eq(11).addClass('d-none');
			$('#itemPartInfoTable tr').eq(12).addClass('d-none');
			$('#itemPartInfoTable tr').eq(13).addClass('d-none');
			$('#outTableDiv').addClass('d-none');
			
			$('#tab5Nav').addClass('d-none'); //입고단가이력 탭 숨김
		} else { //상품일 경우
			$('#areaFloorTr1').text('구역 / 위치');
			$('#itemCusTh').text('*고객사');
			$('#importYnTh').text('*출하검사여부');
			$('#exportCostTh').text('*출고단가');
			$('#exportDateTh').text('*출고단가적용일');
			$('#prodGubun').addClass('d-none');
			$('#prodGubunTh').addClass('d-none');
			$('#prodGubunDiv').addClass('d-none');
			$('#supplyTypeDiv').addClass('d-none');
			$('#smallPackage').removeClass('d-none');
			$('#smallPackageTh').removeClass('d-none');
			$('#itemPartInfoTable tr').eq(4).removeClass('d-none');
			$('#itemPartInfoTable tr').eq(5).removeClass('d-none');
			$('#itemPartInfoTable tr').eq(11).addClass('d-none');
			$('#itemPartInfoTable tr').eq(12).removeClass('d-none');
			$('#itemPartInfoTable tr').eq(13).removeClass('d-none');
			$('#outTableDiv').addClass('d-none');
			
			$('#tab5Nav').addClass('d-none'); //입고단가이력 탭 숨김
		}

		//저장위치 및 구역/위치
		$.ajax({
			url : '<c:url value="bm/locationAdmRead"/>',
			type : 'GET',
			async : false,
			data : {
				'mainGubun' : '002',
				'locCd' : function(){return $('#savelocCd').val();}
			},
			success : function(res){
				if(res.result=="ok"){
					let data = res.data[0];
					if(data!=null){
						$('#areaFloor').val(data.areaNm + ' / ' + data.floorNm);
						$('#locNo').val(data.locNo);
					}else{
						$('#areaFloor').val('');
						$('#locNo').val('');
					}
				}else{
					toastr.error(res.message);
				}
			}
		})
	}
	
	function prodGubunOnChange() {
		let itemGubunVal = $("#itemGubun").val();
		let prodGubunVal = $("#prodGubun").val();
		
		if (itemGubunVal == '003') { //반제품일 경우
			//생산구분에 '외주'가 포함된 경우
			let prodGubunCheck = false;
			prodGubunCode.forEach(function(array){
			    if(array.baseCd == prodGubunVal){ //데이터 확인
			        let tempVal = array.baseNm;
		            if(tempVal.includes('외주')){ //외주가 포함되어 있는지 확인
		            	prodGubunCheck = true;
		            }
			    }
			})
			if (prodGubunCheck) { //생산구분에 '외주'가 포함되어 있는 지 확인
				$('#btnOutAdd').attr('disabled', false);
				$('#btnOutEdit').attr('disabled', false);
				$('#btnOutDel').attr('disabled', false);
				$('#outTableDiv').removeClass('d-none');
				$('#outAdmTable').DataTable().ajax.reload();
				setTimeout(function(){
					outAdmTable.draw();
					outAdmTable.draw();
				}, 300);
			} else {
				$('#outTableDiv').addClass('d-none');
			}
		} else { //그 외
			$('#outTableDiv').addClass('d-none');
		}
		
	}

	
	//이미지 등록
	function imageUpload(value) {

		var fileListView = "";

		var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("itemSeq", itemSeq);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageUpload"/>',
			data : formData,
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('등록되었습니다.');
					imgPrint();
				} else if (data.result == "extensionError") {
					toastr.error('파일형식 또는 확장명이 잘못되었습니다.');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				} else if (data.result == "sizeError") {
					toastr.error('사진 용량이 너무 큽니다. (1메가 이하로 올려 주세요.)');
					$('#imgAdd' + value).val("");
					$('#imgName' + value).val("");
					$('#imgName' + value).text("");
					$('#imgName' + value).attr("src", "");
				}
				
			}
		});

	}
	
	//이미지 삭제
	function deleteImg(number) {
		var value = null;
		value = number;

		if ($('#imgName' + number).text() == "") {
			toastr.warning('삭제할 항목이 없습니다.');
			return false;
		}
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageDelete"/>',
			type : 'POST',
			data : {
				'itemSeq' : function(){return itemSeq;},
				//'imageFile'			:		function(){a=null; a=$('#imgName'+number).text(); return a;},
				'value' : function(){return value;},

			},
			success : function(data) {
				if (data.result == "ok") { //응답결과
					toastr.success('삭제되었습니다.');
					imgPrint();
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
					$('#imageFile1').attr("src",
							"data:image/jpg;base64," + data.imageFile1);
					$('#imgName1').text(data.imageFile1Nm);
				}
				if (data.imageFile1 == null) {
					$('#imageFile1').attr("src", " ");
					$('#imgName1').text("");
				}
				if (data.imageFile2 != null) {
					$('#imageFile2').attr("src",
							"data:image/jpg;base64," + data.imageFile2);
					$('#imgName2').text(data.imageFile2Nm);
				}
				if (data.imageFile2 == null) {
					$('#imageFile2').attr("src", " ");
					$('#imgName2').text("");
				}
				if (data.imageFile3 != null) {
					$('#imageFile3').attr("src",
							"data:image/jpg;base64," + data.imageFile3);
					$('#imgName3').text(data.imageFile3Nm);
				}
				if (data.imageFile3 == null) {
					$('#imageFile3').attr("src", " ");
					$('#imgName3').text("");
				}
				if (data.imageFile4 != null) {
					$('#imageFile4').attr("src",
							"data:image/jpg;base64," + data.imageFile4);
					$('#imgName4').text(data.imageFile4Nm);
				}
				if (data.imageFile4 == null) {
					$('#imageFile4').attr("src", " ");
					$('#imgName4').text("");
				}
			},
			error : function(xhr, textStatus, error) {
				alert("예상치 못한 오류가 발생했습니다.");
			}
		});
	}

	//공정등록 탭******************************************************************************************
	//공정등록 목록조회
	let itemPrcssAdmTable = $('#itemPrcssAdmTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language : lang_kor,
		paging: true,
		info : true,
		ordering: true,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : '60vh',
		ajax : {
			url : '<c:url value="/bm/itemPrcssAdmList"/>',
			type : 'GET',
			data : {
				'itemSeq' 	: function(){ return itemSeq; },
				'outGubun' 	: function(){ return '001'; },
			},
		},
		columns : [ 
			{//공정코드
				data : 'itemPrcssCd',
				render : function ( data, type, row, meta ) {
					let startHtml = '<div class="row">';
					let html = '';
					let delHtml = '';
					let endHtml = '</div>';
						
					if ( data != null ) {
						delHtml += '<div class="ml-1" style="width: 5%;">';
						delHtml += '<button type="button" name="btnItemPrcssCdDel" class="btn closeBtn p-1" onclick="removeData(\'itemPrcssCd\',\'itemPrcssNm\','+meta.row+')" disabled>';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
						
						html += '<div class="input-sub m-0" style="width: 80%;">';
						html += '<input type="text" class="form-control" name="itemPrcssCd" value="'+data+'" disabled>';
						html += '<button type="button" name="btnItemPrcssCd" class="btn btn-primary input-sub-search" onClick="itemPrcssCdClick('+meta.row+')" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
					} else {
						delHtml += '<div class="ml-1" style="width: 5%;">';
						delHtml += '<button type="button" name="itemWorkplaceDelete" class="btn closeBtn p-1" onclick="removeData(\'itemPrcssCd\',\'itemPrcssNm\','+meta.row+')" >';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
						
						html += '<div class="input-sub m-0" style="width: 80%;">';
						html += '<input type="text" class="form-control" name="itemPrcssCd" value="" disabled>';
						html += '<button type="button" name="btnItemPrcssCd" class="btn btn-primary input-sub-search" onClick="itemPrcssCdClick('+meta.row+')">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
					}

					return startHtml + html + delHtml + endHtml;	
				}
			},
			{//공정명
				data : 'itemPrcssNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" name="itemPrcssNm" value="'+data+'" style="min-width : 100%;" disabled>';
					} else {
						return '<input type="text" class="form-control" name="itemPrcssNm" value="" style="min-width : 100%;" disabled>';
					}	
				}
			},
			{//외주처
				data : 'dealCorpCd',
				render : function ( data, type, row, meta ) {
					let startHtml = '<div class="row">';
					let html = '';
					let delHtml = '';
					let endHtml = '</div>';
				
					if ( data != null ) {
						delHtml += '<div class="ml-2" style="width: 5%;">';
						delHtml += '<button type="button" name="btnDealCorpCdDel" class="btn closeBtn p-1" onclick="removeData(\'dealCorpCd\',\'dealCorpNm\','+meta.row+')" disabled>';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
						
						html += '<div class="input-sub m-0" style="width: 80%;">';
						html += '<input type="hidden" class="form-control" name="dealCorpCd" value="'+data+'" disabled>';
						html += '<input type="text" class="form-control" name="dealCorpNm" value="'+(row['dealCorpNm']==null?'':row['dealCorpNm'])+'" disabled>';
						html += '<button type="button" name="btnDealCorpNm" class="btn btn-primary input-sub-search" onClick="dealCorpNmClick('+meta.row+')" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
					} else {
						delHtml += '<div class="ml-2" style="width: 5%;">';
						delHtml += '<button type="button" name="itemWorkplaceDelete" class="btn closeBtn p-1" onclick="removeData(\'dealCorpCd\',\'dealCorpNm\','+meta.row+')" >';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
						
						html += '<div class="input-sub m-0" style="width: 80%;">';
						html += '<input type="hidden" class="form-control" name="dealCorpCd" value="" disabled>';
						html += '<input type="text" class="form-control" name="dealCorpNm" value="" disabled>';
						html += '<button type="button" name="btnDealCorpNm" class="btn btn-primary input-sub-search" onClick="dealCorpNmClick('+meta.row+')" >';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
					}	

					return startHtml + html + delHtml + endHtml;	
				}
			},  
			{//비고
				data : 'itemPrcssDesc',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" name="itemPrcssDesc" value="'+data+'" style="min-width : 100%;" disabled>';
					} else {
						return '<input type="text" class="form-control" name="itemPrcssDesc" value="" style="min-width : 100%;">';
					}	
				}
			}  
		],
		columnDefs : [
			
		],
		order : [ [ 0, 'asc' ] ],
		buttons : ['copy','excel','print'],
	});

	// 공정등록 행 선택시
	$('#itemPrcssAdmTable tbody').on('click', 'tr', function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right' 
				|| $('#btnAttachSave').attr('class') == 'btn btn-primary float-right'
				|| $('#btnWorkSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			return false;
		}

		if ($(this).hasClass('selected')) {
			
		} else {
			$('#itemPrcssAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		itemPrcssTableIdx = $(this).index();
	});

	//공정코드 팝업창
	let itemWorkplacePopUpTable2;
	function itemPrcssCdClick(){
		if (itemWorkplacePopUpTable2 == null || itemWorkplacePopUpTable2 == undefined) {
			itemWorkplacePopUpTable2 = $('#itemWorkplacePopUpTable2').DataTable({
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
					url : '<c:url value="/bm/prcssItemWorkplace"/>',
					type : 'GET',
					data : {
						'prcssGubun'	: function(){ return '002'; },
						'prcssType'		: function(){ return '002'; },
					},
				},
				rowId : 'prcssCd',
				columns : [ 
					{//공정코드
						data : 'prcssCd'
					},
					{//공정명
						data : 'prcssNm'
					}
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
	
			$('#itemWorkplacePopUpTable2 tbody').on('click', 'tr', function() {
				let data = itemWorkplacePopUpTable2.row(this).data();
				$('input[name=itemPrcssCd]').eq(itemPrcssTableIdx).val(data.prcssCd);
				$('input[name=itemPrcssNm]').eq(itemPrcssTableIdx).val(data.prcssNm);
				$('#itemWorkplacePopUpModal2').modal('hide');
			});
		} else {
			$('#itemWorkplacePopUpTable2').DataTable().ajax.reload();
		}
		$('#itemWorkplacePopUpModal2').modal('show');
	}
	
	//외주처 팝업 시작 - 공정등록
	function dealCorpNmClick() {
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		let dealArr = ['003'];
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
					'dealArr' :  function(){ return dealArr; },
				},
			},
			rowId : 'dealCorpSeq',
			columns : [
				{
					data : 'dealCorpNm'
				},
				{
					data : 'dealCorpCd'
				},
				{
					data : 'presidentNm'
				},
				{
					data : 'repreItem'
				},
				{
					data : 'corpNo'
				}
			],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			} ],
			order : [ [ 0, 'asc' ] ],
			buttons : [],
		});
		
		$('#dealCorpPopUpTable4 tbody').on('click', 'tr', function() {
			var data = dealCorpPopUpTable4.row(this).data();
			$('input[name=dealCorpCd]').eq(itemPrcssTableIdx).val(data.dealCorpCd);
			$('input[name=dealCorpNm]').eq(itemPrcssTableIdx).val(data.dealCorpNm);
			$('#dealCorpPopUpModal4').modal('hide');
		});
		$('#dealCorpPopUpModal4').modal('show');
	}
	
	//공정추가 버튼 클릭시
	$('#btnPrcssAdd').on('click',function(){
		var rowIdx = itemPrcssAdmTable.data().count();
		$('#itemPrcssAdmTable').DataTable().row.add({}).draw(true);	
		$('#btnPrcssSave').removeClass('d-none');	
	});

	//공정수정 버튼 클릭시
	$('#btnPrcssEdit').on('click',function(){
		$('button[name=btnItemPrcssCd]').attr('disabled',false);
		$('button[name=btnDealCorpNm]').attr('disabled',false);
		$('input[name=itemPrcssDesc]').attr('disabled',false);
		$('button[name=btnItemPrcssCdDel]').attr('disabled',false);
		$('button[name=btnDealCorpCdDel]').attr('disabled',false);
		
		$('#itemPrcssAdmTable').DataTable().rowReorder.enable();
		$('#btnPrcssSave').removeClass('d-none');	
	});

	//공정삭제 버튼 클릭시
	$('#btnPrcssDel').on('click',function(){

		if(itemPrcssTableIdx==null){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$('#itemPrcssAdmTable').DataTable().row(itemPrcssTableIdx).remove().draw();	
		$('#btnPrcssSave').removeClass('d-none');	
	})
	
	// x버튼 클릭시
	function removeData(data1,data2,row){
		$('input[name='+data1+']').eq(row).val('');
		$('input[name='+data2+']').eq(row).val('');
	}
	
	//공정저장 버튼 클릭시
	$('#btnPrcssSave').on('click', function() {
		let dataArray = new Array();		
		let check = true;  	

		if ( itemPrcssAdmTable.data().count() > 0 ) {
			$('#itemPrcssAdmTable tbody tr').each(function(index, item) {
				if ( $('input[name=itemPrcssCd]').eq(index).val() == "" ) {
					toastr.warning('공정코드를 선택해주세요.');
					$('button[name=btnItemPrcssCd]').eq(index).focus();
					check = false;
					return false;
				}
				let rowData = new Object();
				rowData.itemSeq = itemSeq;
				rowData.outGubun = '001';
				rowData.itemPrcssOrd = (index+1);
				rowData.itemPrcssCd = $(this).find('td input[name=itemPrcssCd]').val();
				rowData.dealCorpCd = $(this).find('td input[name=dealCorpCd]').val();
				rowData.dealCost = "0"; //NullPointerException 오류 해결을 위한 기본값 입력 (2023.09.21)
				rowData.dealDate = ""; //NullPointerException 오류 해결을 위한 기본값 입력 (2023.09.21)
				rowData.itemPrcssDesc = $(this).find('td input[name=itemPrcssDesc]').val();
		        dataArray.push(rowData);
			});
		} else {
			var rowData = new Object();
			rowData.itemSeq = itemSeq;
			rowData.outGubun = '001';
			rowData.itemPrcssOrd = '';
			dataArray.push(rowData);
		}
		
		if(check){
			$.ajax({
				url : '<c:url value="bm/itemPrcssAdmIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {		
					if (res.result == 'ok') {
						toastr.success('저장되었습니다.');
						$('#itemPrcssAdmTable').DataTable().ajax.reload(function() {});
						$('#btnPrcssSave').addClass('d-none');	
						$('#itemPrcssAdmTable').DataTable().rowReorder.disable();
						itemPrcssTableIdx="";
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
	});
	
	//외주처 등록 테이블
	let outAdmTable = $('#outAdmTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language : lang_kor,
		paging: true,
		info : true,
		ordering: false,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : '20vh',
		ajax : {
			url : '<c:url value="/bm/itemPrcssAdmList"/>',
			type : 'GET',
			data : {
				'itemSeq' 	: function(){ return itemSeq; },
				'outGubun' 	: function(){ return '002'; },
			},
		},
		columns : [ 
			{//No.
				render : function ( data, type, row, meta ) {
					return meta.row + 1;
				},
				'className' : 'text-center'
			},
			{//외주처
				data : 'dealCorpCd',
				render : function ( data, type, row, meta ) {
					let startHtml = '<div class="row">';
					let html = '';
					let delHtml = '';
					let endHtml = '</div>';
				
					if ( data != null ) {
						html += '<div class="input-sub m-0" style="min-width: 90%;">';
						html += '<input type="hidden" class="form-control" name="dealCorpOutCd" value="'+data+'" disabled>';
						html += '<input type="text" class="form-control" name="dealCorpOutNm" value="'+(row['dealCorpNm']==null?'':row['dealCorpNm'])+'" style="min-width: 100%;" disabled>';
						html += '<button type="button" name="btnDealCorpOutNm" class="btn btn-primary input-sub-search" onClick="dealCorpNmOutClick('+meta.row+')" style="min-width: 5%;" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						
						delHtml += '<div class="ml-2" style="min-width: 5%;">';
						delHtml += '<button type="button" name="btnDealCorpCdOutDel" class="btn closeBtn p-1" onclick="removeData(\'dealCorpOutCd\',\'dealCorpOutNm\','+meta.row+')" disabled>';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
					} else {
						html += '<div class="input-sub m-0" style="min-width: 90%;">';
						html += '<input type="hidden" class="form-control" name="dealCorpOutCd" value="" disabled>';
						html += '<input type="text" class="form-control" name="dealCorpOutNm" value="" style="min-width: 100%;" disabled>';
						html += '<button type="button" name="btnDealCorpOutNm" class="btn btn-primary input-sub-search" onClick="dealCorpNmOutClick('+meta.row+')" style="min-width: 5%;" >';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						
						delHtml += '<div class="ml-2" style="min-width: 5%;">';
						delHtml += '<button type="button" class="btn closeBtn p-1" onclick="removeData(\'dealCorpOutCd\',\'dealCorpOutNm\','+meta.row+')" >';
						delHtml += '<i class="mdi mdi-close"></i></button></div>';
					}	

					return startHtml + html + delHtml + endHtml;	
				}
			},
			{
				data : 'dealCost',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="text" class="form-control text-right" name="dealOutCost" value="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\')"  disabled>';
					}else{
						return '<input type="text" class="form-control text-right" name="dealOutCost" value="0" onkeyup="numberFormat(this, \'int\')" >';
					}
				},
			},
			{
				data: 'dealDate',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="date" class="form-control text-center" name="dealOutDate" value="'+moment(data).format("YYYY-MM-DD")+'" disabled>';
					}else{
						return '<input type="date" class="form-control text-center" name="dealOutDate" value="'+moment(serverDate).format("YYYY-MM-DD")+'">';
					}
				}
			},
		],
		columnDefs : [
			
		],
		order : [ [ 0, 'asc' ] ],
		buttons : ['copy','excel','print'],
	});

	let outAdmTable5 = $('#outAdmTable5').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'><'col-sm-12 col-md-4'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language : lang_kor,
		paging: true,
		info : true,
		ordering: false,
		processing : true,
		autoWidth : false,
		pageLength : -1,
		scrollY : '45vh',
		ajax : {
			url : '<c:url value="/bm/itemPrcssAdmnopList"/>',
			type : 'GET',
			data : {
				'itemSeq' 	: function(){ return itemSeq; },
				'outGubun' 	: function(){ return '002'; },
			},
		},
		columns : [ 
			{//No.
				render : function ( data, type, row, meta ) {
					return meta.row + 1;
				},
				'className' : 'text-center'
			},
			{//외주처
				data : 'dealCorpCd',
				render : function ( data, type, row, meta ) {
					let startHtml = '<div class="row">';
					let html = '';
					let delHtml = '';
					let endHtml = '</div>';
				
					if ( data != null ) {
						html += '<div class="input-sub m-0" style="min-width: 90%;">';
						html += '<input type="hidden" class="form-control" name="dealCorpOutCd" value="'+data+'" disabled>';
						html += '<input type="text" class="form-control" name="dealCorpOutNm" value="'+(row['dealCorpNm']==null?'':row['dealCorpNm'])+'" style="min-width: 100%;" disabled>';
						html += '<button type="button" name="btnDealCorpOutNm" class="btn btn-primary input-sub-search" style="min-width: 5%;" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						
					}
					return startHtml + html + endHtml;	
				}
			},
			{
				data : 'dealCost',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="text" class="form-control text-right" name="dealOutCost" value="'+rmDecimal(data)+'" disabled>';
					}else{
						return '';
					}
				},
			},
			{
				data: 'dealDate',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="date" class="form-control text-center" name="dealOutDate" value="'+moment(data).format("YYYY-MM-DD")+'" disabled>';
					}else{
						return '';
					}
				}
			},
			{
				data: 'regNm', 'className' : 'text-center',
			},
		],
		columnDefs : [
			
		],
		order : [ [ 0, 'asc' ] ],
		buttons : ['copy','excel','print'],
	});

	let outAdmTableIdx5 = null;
	//외주처 테이블 행 클릭시
	$('#outAdmTable5 tbody').on('click', 'tr', function() {
		
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#outAdmTable5').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		outAdmTableIdx5 = $(this).index();
	});

	//외주처 삭제 버튼 클릭시
	$('#btnOutDel5').on('click',function(){
		let dataArray = new Array();		
		let check = true;
		
		if ( outAdmTableIdx5 == null ) {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		
		let rowData = new Object();
		rowData.itemSeq = itemSeq;
		rowData.outGubun = '002';
		rowData.itemPrcssOrd = '';
		rowData.itemPrcssSeq = outAdmTable5.row('.selected').data().itemPrcssSeq;
		dataArray.push(rowData);
		
		if(check){
			$.ajax({
				url : '<c:url value="bm/itemPrcssAdmIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success('외주단가 이력이 삭제되었습니다.');
						$('#outAdmTable5').DataTable().ajax.reload(function(){});
						$('#btnOutSave5').addClass('d-none');
						$('#btnOutDel5').attr('disabled', false);
						$('#outAdmTable5').DataTable().rowReorder.disable();
						outAdmTableIdx5 = "";
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
		
		//$('#btnOutDel5').attr('disabled', true);
		//$('#outAdmTable5').DataTable().row(outAdmTableIdx5).remove().draw();	
		//$('#btnOutSave5').removeClass('d-none');
	})
	
	$('#btnOutSave5').on('click', function() {
		let dataArray = new Array();		
		let check = true;
		let rowData = new Object();
		rowData.itemSeq = itemSeq;
		rowData.outGubun = '002';
		rowData.itemPrcssOrd = '';
		rowData.itemPrcssSeq = itemDelSeq;
		dataArray.push(rowData);
		if(check){
			$.ajax({
				url : '<c:url value="bm/itemPrcssAdmIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success('저장되었습니다.');
						$('#outAdmTable5').DataTable().ajax.reload(function(){});
						$('#btnOutSave5').addClass('d-none');
						$('#btnOutDel5').attr('disabled', false);
						$('#outAdmTable5').DataTable().rowReorder.disable();
						outAdmTableIdx5 = "";
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
	});
	
	//외주처 팝업 시작
	function dealCorpNmOutClick() {
		popUpCheck = '외주처';
		if (dealCorpPopUpTable4 != null && dealCorpPopUpTable4 != 'undefined') {
			dealCorpPopUpTable4.destroy();
		}
		let dealArr = ['003'];
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
					'dealArr' :  function(){ return dealArr; },
				},
			},
			rowId : 'dealCorpSeq',
			columns : [
				{
					data : 'dealCorpNm'
				},
				{
					data : 'dealCorpCd'
				},
				{
					data : 'presidentNm'
				},
				{
					data : 'repreItem'
				},
				{
					data : 'corpNo'
				}
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
		if (popUpCheck === '외주처') {
			let data = dealCorpPopUpTable4.row(this).data();
			let corpCd = data.dealCorpCd;
			let check = true;
			
			$('#outAdmTable tbody tr').each(function(index, item) {
				if($('input[name=dealCorpOutCd]').eq(index).val() == corpCd){
					toastr.warning(data.dealCorpNm + "는 이미 존재하는 외주처입니다.");
					check = false;
					return false;
				}
			});

			if(check){
				$('input[name=dealCorpOutCd]').eq(outAdmTableIdx).val(corpCd);
				$('input[name=dealCorpOutNm]').eq(outAdmTableIdx).val(data.dealCorpNm);
				$('#dealCorpPopUpModal4').modal('hide');
			}
		}
	});
	
	let outAdmTableIdx = null;
	//외주처 테이블 행 클릭시
	$('#outAdmTable tbody').on('click', 'tr', function() {
		
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#outAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		outAdmTableIdx = $(this).index();
	});
	
	//외주처 추가 버튼 클릭시
	$('#btnOutAdd').on('click',function(){
		saveNEdit = '';
		let rowIdx = outAdmTable.data().count();
		$('#outAdmTable').DataTable().row.add({}).draw(true);	
		$('#btnOutSave').removeClass('d-none');
	});

	//외주처 수정 버튼 클릭시
	$('#btnOutEdit').on('click',function(){
		if ( outAdmTableIdx == null ) {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		saveNEdit = 'edit';
		$('button[name=btnDealCorpOutNm]').attr('disabled', false);
		$('button[name=btnDealCorpCdOutDel]').attr('disabled', false);
		$('input[name=dealOutCost]').attr('disabled', false);
		$('input[name=dealOutDate]').attr('disabled', false);

		$('#outAdmTable').DataTable().rowReorder.enable();
		$('#btnOutSave').removeClass('d-none');	
	});

	//외주처 삭제 버튼 클릭시
	$('#btnOutDel').on('click',function(){
		if ( outAdmTableIdx == null ) {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		saveNEdit = 'del';
		itemDelSeq = outAdmTable.row('.selected').data().itemPrcssSeq;
		$('#btnOutSave').removeClass('d-none');
		$('#outAdmTable').DataTable().row(outAdmTableIdx).remove().draw();
	})
	
	//외주처 버튼 클릭시
	$('#btnOutSave').on('click', function() {
		$('#my-spinner').show();
		let dataArray = new Array();		
		let check = true;
		let url = '<c:url value="bm/itemPrcssAdmIns"/>';
		if(saveNEdit == 'edit'){
			url = '<c:url value="bm/itemPrcssAdmUpd"/>';
		}
		if ( outAdmTable.data().count() > 0 && saveNEdit != 'del') {
			$('#outAdmTable tbody tr').each(function(index, item) {
				itemPcSeq = outAdmTable.row(index).data().itemPrcssSeq;
				if(itemPcSeq == null){
					itemPcSeq = '';
				}
				
				if ( $('input[name=dealCorpOutCd]').eq(index).val() == "" ) {
					toastr.warning('외주처를 선택해주세요.');
					$('button[name=btnDealCorpOutNm]').eq(index).focus();
					$('#my-spinner').hide();
					check = false;
					return false;
				}
				let rowData = new Object();
				if(saveNEdit == 'edit'){
					rowData.saveNEdit = saveNEdit;
				}
				rowData.itemPrcssSeq = itemPcSeq;
				rowData.itemSeq = itemSeq;
				rowData.outGubun = '002';
				rowData.itemPrcssOrd = (index+1);
				rowData.itemPrcssCd = '';
				rowData.dealCorpCd = $(this).find('td input[name=dealCorpOutCd]').val();
				rowData.dealCost = $(this).find('td input[name=dealOutCost]').val().replace(/,/g,'');
				rowData.dealDate = $(this).find('td input[name=dealOutDate]').val().replace(/-/g, '');
				rowData.itemPrcssDesc = '';
				
		        dataArray.push(rowData);
		        console.log(dataArray);
			});
		} else {
			let rowData = new Object();
			rowData.itemSeq = itemSeq;
			rowData.outGubun = '002';
			rowData.itemPrcssOrd = '';
			rowData.itemPrcssSeq = itemDelSeq;
			dataArray.push(rowData);
		}
		
		if(check){
			$.ajax({
				url : url,
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {
						toastr.success('저장되었습니다.');
						$('#outAdmTable').DataTable().ajax.reload(function(){});
						$('#btnOutSave').addClass('d-none');
						$('#btnOutDel').attr('disabled', false);
						$('#outAdmTable').DataTable().rowReorder.disable();
						saveNEdit = '';
						outAdmTableIdx = "";
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
	});

</script>

</body>
</html>
