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
	<!-- 통합자료실 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="fileReferencePopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipRestartPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="width: 1200px; height: 800px; position: absolute; left: 50%; transform: translateX(-50%);">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipRestartPopUpLabel">철형 일상점검 기준서 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="fileReferencePopUpTable" class="table table-bordered">
	                   		<colgroup>
								<col width="1%">
								<col width="3%">
								<col width="3%">
								<col width="2%">
								<col width="10%">
								<col width="2%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th style="padding:0.35rem !important;">담당자</th>
									<th>부서명</th>
									<th style="padding:0.35rem !important;">첨부일자</th>
									<th>파일명</th>
									<th>파일종류</th>
									<th style="padding:0.35rem !important;">비고</th>
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
	<!-- 통합자료실 모달 종료-->
	<!------------모달full 사진 screen------------>
	<div class="modal fade" id="imageModal" tabindex="-1" role="dialog">
	    <div class="modal-dialog modal-full">
	      <div class="modal-content modal-content-full">
	
	        <!--닫기버튼-->
	        <div class="modal-close">
	          <button class="close md-close" type="button" data-dismiss="modal" aria-hidden="true"><span class="mdi mdi-close">       </span></button>
	        </div>
	        <!------------->
	
	        <!--이미지영역-->
	        <img class="modal-img-full" id="fileReferenceImg" src="">
	        <!------------->
	
	      </div>  
	    </div>
	</div>
	<!------------/사진 모달------------>
	<!-- 설비 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="equipPopUpLabel">사용장비 조회</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div> 
		      <div class="modal-body">
		      	<hr class="text-secondary">	         
	                <table id="equipPopUpTable" class="table table-bordered">
	                	<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="25%">
							<col width="20%">
							<col width="25%">
						</colgroup>
	                    <thead class="thead-light">
	                    <tr>
		                    <th>구분</th>	                          
		                    <th>설비관리번호</th>
		                    <th>설비명</th>	  
		                    <th>설비규격</th>
		                    <th>설비크기 (W*L*H)<br>단위:미터</th>
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
	<!-- 설비 모달 종료-->
	<!-- 철형점검등록 모달 시작-->
	<div class="modal fade bd-example-modal-sm" id="insertCorrPopUpModal" tabindex="-1" role="dialog" aria-labelledby="insertCorrPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
	    	<div class="modal-content" style="width: 45vh; position: absolute; left: 50%; transform: translateX(-50%);">
	        	<div class="modal-header">
		           	<h5 class="modal-title" id="insertCorrPopUpLabel">설비점검등록</h5>
		           	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		            	<span aria-hidden="true">&times;</span>
		           	</button>
		        </div> 
		        <div class="modal-body">
		        	<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="corrSaveBox">등록</button>
		        	<div class="table-responsive">
		            	<table id="" class="table table-bordered">
							<tbody class="thead-light">
								<tr>	
									<th>시작년도</th>
									<td><select name="startYear" id="startYear" title="년도" class="select custom-select" style="min-width: 100%;"></select></td>
								</tr>
								<tr>
									<th>종료년도</th>
									<td><select name="endYear" id="endYear" title="년도" class="select custom-select" style="min-width: 100%;"></select></td>
								</tr>
							</tbody>
						</table>
					</div>
					<button type="button" class="btn btn-warning float-right mb-2 mr-1" id="corrCancelBox">취소</button>
					<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="corrAddBox">추가</button>
		            <div class="table-responsive">	
		            	<table id="insertCorrPopUpTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>	
									<th>점검일자</th>
								</tr>
							</thead>
						</table>
					</div>
	         	</div>
	    	</div>
		</div>
	</div>
	<!-- 철형점검등록 모달 종료-->
	
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">철형정보관리</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 60%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="equipCodeTable" class="table table-bordered">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="22%">
								<col width="13%">
								<col width="13%">
								<col width="11%">
								<col width="11%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center" style="vertical-align: middle;">
										<input type="checkbox" id="equipCheckAll" style="width: 1.2rem; height: 1.2rem;">
									</th>
									<th class="text-center" style="vertical-align: middle;">철형관리번호</th>
									<th class="text-center" style="vertical-align: middle;">철형명</th>
									<th class="text-center" style="vertical-align: middle;">제작처</th>
									<th class="text-center" style="vertical-align: middle;">고객사</th>
									<th class="text-center" style="vertical-align: middle;">보증수명</th>
									<th class="text-center" style="vertical-align: middle;">칼날점검주기(타수)</th>
									<th class="text-center" style="vertical-align: middle;">철형등급</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 39%;">
				<!--상단 버튼 part-->
				<div class="rightsidebar-close">
					<a href="javascript:void(0)" id="left-expand"
						class="closebtn float-right" onclick="closerNav()"> <i
						class="mdi mdi-close"></i>
					</a>
				</div>
				<!--end----상단 버튼 part-->
				<!--====================TAB-UI=======================-->
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="headTab1">기본정보</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="headTab2">사진</a>
						</li>
						<!-- <li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab3" id="headTab3">제품내역</a>
						</li> -->
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab4" id="headTab4">관련자료</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab5" id="headTab5">점검이력사항</a>
						</li>
						<li class="nav-item">
							<a class="nav-link d-none" data-toggle="tab" href="#tab6" id="headTab6">일상점검</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab7" id="headTab7">타수점검</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div id="myTabContent" class="tab-content">
						<!--========tab1 part=====-->
						<div class="tab-pane fade active show" id="tab1">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-right ml-1 d-none" id="btnSave">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnDel">삭제</button>
								<button type="button" class="btn btn-warning float-right ml-1" id="btnEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnAdd">등록</button>
							</div>
							<form id="form">
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>	
										<th>*구분</th>
										<td colspan="3">
											<div class="row">
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" disabled> 
													<label class="custom-control-label input-label-sm" for="mg1">설비</label>
												</div>
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" disabled> 
													<label class="custom-control-label input-label-sm" for="mg2">금형</label>
												</div>
												<div class="custom-control custom-radio row">
													<input type="radio" class="custom-control-input" name="mainGubun" id="mg3" value="003" checked disabled> 
													<label class="custom-control-label input-label-sm" for="mg3">철형</label>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>*공정명</th>
										<td><select class="custom-select" id="prcNm" style="min-width : 100%"></select></td>
										<th>*철형관리번호</th>
										<td><input type="text" class="form-control" id="equipNo" name="equipNo" placeholder="50자리 내외" maxlength="50"   style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>*철형명</th>
										<td><input type="text" class="form-control" id="equipNm" name="equipNm" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
										<th class="d-none">*이니셜</th>
										<td class="d-none"><input type="text" class="form-control" id="equipInitial" name="equipInitial" placeholder="숫자,영문 포함 3자리 내외" maxlength="3" style="min-width : 100%"></td>
										<th>*제작처</th>
										<td><input type="text" class="form-control" id="mfcCorpCd" name="mfcCorpCd" placeholder="64자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>*제작일자</th>
										<td>
											<input class="form-control" type="date" id="mfcDate" name="mfcDate" disabled/>
										</td>
										<th>보증수명</th>
										<td>
											<input class="form-control" type="text" id="endDate" name="endDate" disabled value="0" style="text-align: right; min-width:100%;"/>
										</td>
									</tr>
									<tr>
										<th>칼날점검주기(타수)</th>
										<td>
											<input class="form-control" type="text" id="disposeDate" name="disposeDate" disabled value="0" style="text-align: right; min-width:100%;"/>
										</td>
										<th>사용여부</th>
										<td><select class="custom-select" id="useYn" style="min-width : 100%" disabled></select></td>
									</tr>
									<tr>
										<th>관리부서</th>
										<td><input type="text" class="form-control" id="equipStandard" style="min-width : 100%" disabled></td>
										<th>고객사</th>
										<td><input type="text" class="form-control" id="equipCompany" style="min-width : 100%" disabled></td>
									</tr>
									<tr>
										<th>점검주기</th><!-- 좌표1 -->
										<td><select class="custom-select" id="checkCycle" style="min-width:100%"></select></td>
										<th>점검횟수</th><!-- 좌표2 -->
										<td style="position: relative;">
											<input type="text" class="form-control" id="checkCount" name="checkCount" value="0" 
												style="text-align: right; padding-right: 2rem; min-width:100%;">
											<span style="display: block; position: absolute; top: 5px; right: 10px; height: 1.5rem; line-height: 1.5rem;">회</span>
										</td>
									</tr>
									<tr>
										<th>비고</th>
										<td colspan="3"><input type="text" class="form-control" id="equipDesc" style="min-width : 100%" disabled></td>
									</tr>
								</table>
								<!-- .table-responsive -->	
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>설비조건</th>
										<td colspan='3'>
											<input type="text" class="form-control" id="equipCond" name="equipCond" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
									</tr>
									<tr>
										<th>상한</th>
										<td>
											<input type="text" class="form-control" id="upperAmt" name="upperAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
										<th>하한</th>
										<td>
											<input type="text" class="form-control" id="lowerAmt" name="lowerAmt" placeholder="50자리 내외" maxlength="50" style="min-width : 100%">
										</td>
									</tr>
								</table>
								<table class="table table-bordered">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>철형등급</th>
										<td><select class="custom-select" id="moldGrade" style="min-width : 100%"></select></td>
										<th>철형타발수</th>
										<td>
											<input type="text" class="form-control" id="earlyPunchNum" name="earlyPunchNum" value="0" style="min-width : 100%; text-align:right;">
										</td>
									</tr>
									<tr>
										<th>적용일자</th>
										<td>
											<input class="form-control" type="date" id="effectiveDate" name="effectiveDate" disabled />
										</td>
									</tr>
								</table>
								<div class="card-body p-0">
									<button type="button" class="btn btn-danger float-right ml-1" id="ironBtnDel" disabled>삭제</button>
									<button type="button" class="btn btn-primary float-right ml-1" id="ironBtnAdd" disabled>추가</button>
								</div>
								<table id="ironItemTable" class="table table-bordered">
									<colgroup>
										<col width="45%">
										<col width="55%">
									</colgroup>
									<thead class="thead-light">
										
										<tr>
										<th>품번</th>
										<th>품명</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered d-none" id="corrDataListTable">
									<colgroup>
										<col width="21%">
										<col width="11%">
										<col width="16%">
										<col width="31%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>점검일자</th>
											<th>차기 예정</th>
											<th>작성자</th>
											<th>점검 자료</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered d-none">
									<colgroup>
										<col width="20%"> 
										<col width="30%">
										<col width="20%">
										<col width="30%">
									</colgroup>
									<tr>
										<th>부대설비</th>
										<td>
											<input type="text" class="form-control" id="ancEquipNm" name="ancEquipNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>제작일자</th>
										<td>
											<div class="form-group input-sub m-0">
												<input class="form-control" type="text" id="ancDate" name="ancDate" maxlength="10" disabled />
												<button
													onclick="fnPopUpCalendar(ancDate, ancDate, 'yyyy-mm-dd')"
													class="btn btn-secondary input-sub-search" id="ancDateCalendar" type="button">
													<span class="oi oi-calendar"></span>
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<th>제작처</th>
										<td>
											<input type="text" class="form-control" id="ancCorpCd" name="ancCorpCd" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>소모품</th>
										<td>
											<input type="text" class="form-control" id="expNm" name="expNm" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
									</tr>
									<tr>
										<th>규격</th>
										<td>
											<input type="text" class="form-control" id="ancEquipType" name="ancEquipType" placeholder="64자리 내외" maxlength="64" style="min-width : 100%"></td>
										<th>구입처</th>
										<td>
											<input type="text" class="form-control" id="buyCorpNm" name="buyCorpNm" placeholder="50자리 내외" maxlength="50" style="min-width : 100%"></td>
									</tr>
								</table>
							</form>
						</div>
						<!--====end====tab1 part=====-->

						<!--========tab2 part=====-->
						<div class="tab-pane fade" id="tab2">
							<form id="form2" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered">
										<colgroup>
											<col width="50%">
											<col width="50%">
										</colgroup>
										<tr>
											<th colspan="2">철형사진</th>
										</tr>
										<tr>
											<td><input type="text" class="form-control" placeholder="사진1" onchange="textSave(1)"
												id="imageFile1Con" name="imageFile1Con" style="min-width: 100%"></td>
											<td><input type="text" class="form-control" placeholder="사진2" onchange="textSave(2)"
												id="imageFile2Con" name="imageFile2Con" style="min-width: 100%"></td>
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
											<td><input type="text" class="form-control" placeholder="사진3" onchange="textSave(3)"
												id="imageFile3Con" name="imageFile3Con" style="min-width: 100%"></td>
											<td><input type="text" class="form-control" placeholder="사진4" onchange="textSave(4)"
												id="imageFile4Con" name="imageFile4Con" style="min-width: 100%"></td>
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
						<!--========tab3 part=====-->
						<div class="tab-pane fade" id="tab3">
							<form id="form3" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="productListTable">
										<colgroup>
											<col width="12%">
											<col width="15%">
											<col width="30%">
											<col width="30%">
											<col width="13%">
										</colgroup>
										<thead>
											<tr>
												<th>품목구분</th>
												<th>차종</th>
												<th>품번</th>
												<th>품명</th>
												<th>색상</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab3 part=====-->
						<!--========tab4 part=====-->
						<div class="tab-pane fade" id="tab4">
							<form id="form4" enctype="multipart/form-data">
								<div class="card-body col-sm-12 p-1">
									<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnCheckSave">저장</button>
									<button type="button" class="btn btn-danger float-right ml-1" id="btnCheckDel">삭제</button>
									<button type="button" class="btn btn-primary float-right ml-1" id="btnCheckAdd">추가</button>
								</div>
								<table class="table table-bordered" id="equipFtInfo">
									<colgroup>
										<col width="10%"> 
										<col width="40%">
										<col width="50%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>내용</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</form>
						</div>
						<!--====end====tab4 part=====-->
						<!--========tab5 part=====-->
						<div class="tab-pane fade" id="tab5">
							<div class="table-responsive">
								<table class="table table-bordered" id="corrDataListTabTable">
									<colgroup>
										<col width="20%">
										<col width="20%">
										<col width="10%">
										<col width="15%">
<%-- 										<col width="30%"> --%>
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>점검일자</th>
											<th>실행일자</th>
											<th>작성자</th>
											<th>점검 자료</th>
											<th>첨부파일</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered" id="corrDataFileTable">
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
									<thead>
										<tr>
											<th>순번</th>
											<th>*첨부파일</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						<!--====end====tab5 part=====-->
						<!--========tab6 part=====-->
						<div class="tab-pane fade" id="tab6">
							<div>
								<button type="button" class="btn btn-primary float-left ml-1" id="fileReferenceBtn" onclick="fileReferenceClick();">점검기준서</button>
								<button type="button" class="btn btn-primary float-left ml-1" id="btnDailyAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1" id="btnDailyEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1" id="btnDailyDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnDailySave">저장</button>
							</div>
							<form id="dailyForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="dailyAdmTable">
										<colgroup>
											<col width="10%">
											<col width="22.5%">
											<col width="22.5%">
											<col width="22.5%">
											<col width="22.5%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>점검항목</th>
												<th>점검방법</th>
												<th>SPEC</th>
												<th>입력방식</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<!--====end====tab6 part=====-->
						<!--==========tab7========== -->
						<div class="tab-pane fade" id="tab7">
							<div>
<!-- 								<button type="button" class="btn btn-primary float-left ml-1" id="fileReferenceBtn" onclick="fileReferenceClick();">점검기준서</button> -->
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnKeyChkSave">저장</button>
								<button type="button" class="btn btn-danger float-right ml-1" id="btnKeyChkDel">삭제</button>								
								<button type="button" class="btn btn-warning float-right ml-1" id="btnKeyChkEdit">수정</button>
								<button type="button" class="btn btn-primary float-right ml-1" id="btnKeyChkAdd">추가</button>
							</div>
							<form id="keyChkForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="keyChkAdmTable">
										<colgroup>
											<col width="10%">
											<col width="30%">
											<col width="30%">
											<col width="30%">
<%-- 											<col width="22.5%"> --%>
										</colgroup>
										<thead>
											<tr>
												<th>.NO</th>
												<th>점검일자</th>
												<th>수리이력</th>
												<th>작성자</th>
											</tr>
										</thead>
									</table>
								</div>
								</form>
<!-- 								<form id="keyChkForm" enctype="multipart/form-data"> -->
								<button type="button" class="btn btn-danger float-right mb-2" id="btnChkFileDel" disabled>첨부파일 삭제</button>
								<button type="button" class="btn btn-primary float-right mb-2 mr-1 d-none" id="btnChkFileSave">첨부파일 저장</button>
				        		<button type="button" class="btn btn-primary float-right mb-2 mr-1" id="btnChkFileAdd" disabled>첨부파일 추가</button>
				        		
								<div class="table-responsive">
					            	<table class="table table-bordered" id="attachFileTable">
										<colgroup>
											<col width="20%">
											<col width="80%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>*첨부파일</th>
											</tr>
										</thead>
									</table>
								</div>
<!-- 								</form> -->
				         	</div>
						<!--===end====tab7 part======-->
					</div>
				</div>
			</div>
			<!-- /.right-sidebar -->
			<!--===========================================-->
			<!-- /.card -->
			<!--===========================================-->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	<div class="modal fade bd-example-modal-lg" id="inModal" tabindex="-1"
		role="dialog" aria-labelledby="inModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="inLabel">철형정보관리 엑셀조회</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<hr class="text-secondary">
					<table id="inTable" class="table table-bordered">
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>자산코드</th>
								<th>자산구분</th>
								<th>매입가</th>
								<th>설비코드</th>
								<th>설비명</th>
								<th>공정코드</th>
								<th>규격</th>
								<th>제작일자</th>
								<th>제작처</th>
								<th>설비조건</th>
								<th>상한</th>
								<th>하한</th>
								<th>부대설비</th>
								<th>제작일자</th>
								<th>제작처</th>
								<th>소모품</th>
								<th>규격</th>
								<th>구입처</th>
							</tr>
						</thead>
					</table>
					<hr class="text-secondary">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnApply">적용</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp"%>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "60%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}
		state = !state;
	});

	let menuAuth = 'mlsc0100';
	let currentHref = "mlsc0100";
	let currentPage = $('.' + currentHref).attr('id');
	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","철형정보관리"); 
	
	const SERVER_DATE = "${serverDateTo}";
	
	uiProc(true);
	let sideView = 'add';
	let btnView = '';
	let mainGubun = '003';
	let equipCd = null;
	let equipNo = '';
	let userNm = "${userNm}";
	let userNumber = "${userNumber}";
	let tempCorrWillDate = SERVER_DATE;
	var index = 0;
	let urlData = null;
	let editCheck = false;
	let tempView1 = 'add';
	let baseInfoSeq = '';
	let btnDailyCheck = '';
	let checkSeq = '';
	let itemPartPopUpTable3;
	let itemCd;
	let itemNm;
	let attachSeq;
	
	let idx=0;
	
	//파일 저장 시간 가져오기
	var now = new Date();
	var year = now.getFullYear();
	var mon = now.getMonth()+1;
	if (mon < 10) { mon = "0" + mon; }
	var fileDate = year + "" + mon;

	//공통코드 처리 시작
	var prcNm = new Array();
	<c:forEach items = "${prcNm}" var="info">
	if("${info.baseCd}" == '001'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		prcNm.push(json);
	}
	</c:forEach>
	
	var assetGubun = new Array();
	<c:forEach items = "${assetGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	assetGubun.push(json);
	</c:forEach>

	var useYnCode = new Array();
	<c:forEach items = "${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var moldGradeCode = new Array();
	<c:forEach items = "${moldGrade}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	moldGradeCode.push(json);
	</c:forEach>
	
	var checkCycleCode = new Array(); //점검주기
	<c:forEach items="${checkCycle}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	checkCycleCode.push(json);
	</c:forEach>
	
	var inspInputMethodCode = new Array(); //점검주기
	<c:forEach items="${inspInputMethod}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspInputMethodCode.push(json);
	</c:forEach>
	//공통코드 처리 끝
	
	//선택박스 처리
	selectBoxAppend(prcNm, "prcNm", "", "");
	selectBoxAppend(assetGubun, "assetGubun", "", "");
	selectBoxAppend(useYnCode, "useYn", "", "001");
	selectBoxAppend(moldGradeCode, "moldGrade", "", "2");
	selectBoxAppend(checkCycleCode, "checkCycle", "", "2");

	$('#saveBtnModalY').on('click', function() {
		$('#form').each(function() {
			this.reset();
		});
		uiProc(true);
		$('#btnSave').addClass('d-none');
		
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
		$('#corrDataListTable').addClass('d-none');
		$('#ironItemTable').DataTable().ajax.reload(function () {});
		
	});

	$('#mfcDate').val(SERVER_DATE);
	$('#ancDate').val(SERVER_DATE);

	//설비정보 목록
	let equipCodeTable = $('#equipCodeTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : '65vh',
		ajax : {
			url : '<c:url value="/bm/equipCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return mainGubun;},
				'listGubun' : function(){return '003';},
			},
		},
		columns : [
			{ //체크박스
				data: 'corrInsertYn',
				render : function(data,type, row, meta){
					if ( data === '등록' ) {
						return '<input type="checkbox" name="equipCheck" style="width: 1.2rem; height: 1.2rem;" disabled>';
					} else {
						return '<input type="checkbox" name="equipCheck" style="width: 1.2rem; height: 1.2rem;">';
					}
				}, 'className' : 'text-center', orderable: false
			},
			{ data : 'equipNo', 'className' : 'text-center' }, //철형관리번호
			{ data : 'equipNm', 'className' : 'text-center' }, //철형명
			{ data : 'mfcCorpCd', 'className' : 'text-center' }, //제작사
			{ data : 'equipCompany', 'className' : 'text-center' }, //고객사
			{//보증수명
				data : 'endDate', 'className' : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{//칼날점검주기(타수)
				data : 'disposeDate', 'className' : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ data : 'moldGradeNm', 'className' : 'text-center' }, //철형등급
		],
		order : [],
		buttons : [ {
			extend : 'copy',
			title : '철형정보관리',
		}, {
			extend : 'excel',
			title : '철형정보관리',
		}, {
			extend : 'print',
			title : '철형정보관리',
		}, ],
	});

	let html1 = '<div class="row">';
	html1 += '<button type="button" class="btn btn-primary" id="corrPopUpBox">철형점검등록</button>';
	html1 += '</div>';

	$('#equipCodeTable_length').html(html1);

	//구분 선택시
	$('#mainGubun').on('change', function() {
		mainGubun = $('#mainGubun option:selected').val();
		$('#equipCodeTable').DataTable().ajax.reload(function () {});
    });
	
	//설비정보 상세정보 보기
	$('#equipCodeTable tbody').on('click', 'tr', function() {
		if ( $(event.target).is(':checkbox') ) {
			$('#equipCodeTable tbody input:checkbox[name=equipCheck]').click(function(event){
				event.stopPropagation(); //체크박스를 클릭 한 경우 넘어가기
			});
		} else {
			if ( $('#btnSave').attr('class') == 'btn btn-primary float-right ml-1' ) {
				$('#saveBtnModal').modal('show');
				return false;
			}

			$('#headTab1').tab('show');
			if ($(this).hasClass('selected')) {
//	 			$(this).removeClass('selected');
			} else {
				$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}

			equipCd = equipCodeTable.row(this).data().equipCd;
			equipNo = equipCodeTable.row(this).data().equipNo;

			$.ajax({
				url : '<c:url value="bm/equipCodeAdmRead"/>',
				type : 'GET',
				data : {
					'equipCd' : function() {
						return equipCd;
					},
				},
				success : function(res) {
					let data = res.data;
					$('input:radio[name=mainGubun]:radio[value='+data.mainGubun+']').prop('checked',true);
					$('#equipNo').val(data.equipNo);
					$('#equipNm').val(data.equipNm);
					$('#equipInitial').val(data.equipInitial);
					$('#equipType').val(data.equipType);
					$('#moldLocation').val(data.moldLocation);
					$('#equipCavity').val(data.equipCavity);
					$('#mfcDate').val(data.mfcDate == null || data.mfcDate == "Invalid date" || data.mfcDate == "" ? "" : moment(data.mfcDate).format('YYYY-MM-DD'));
					$('#endDate').val(data.endDate == null ? "0" : rmDecimal(data.endDate));
					$('#mfcCorpCd').val(data.mfcCorpCd);
					$('#assetCd').val(data.assetCd);
					$('#buyAmt').val(data.buyAmt == null ? "" : rmDecimal(data.buyAmt));
					$('#equipCond').val(data.equipCond);
					$('#upperAmt').val(data.upperAmt);
					$('#lowerAmt').val(data.lowerAmt);
					$('#disposeDate').val(data.disposeDate == null ? "0" : rmDecimal(data.disposeDate));
					$('#moldGrade').val(data.moldGrade);
					$('#warrantyLife').val(data.warrantyLife != null ? rmDecimal(data.warrantyLife) : '0');
					$('#earlyPunchNum').val(data.earlyPunchNum != null ? rmDecimal(data.earlyPunchNum) : '0');
					$('#effectiveDate').val(data.effectiveDate == null || data.effectiveDate == "Invalid date" || data.effectiveDate == "" ? "" : moment(data.effectiveDate).format('YYYY-MM-DD'));
					$('#ancEquipNm').val(data.ancEquipNm);
					$('#ancDate').val(data.ancDate == null || data.ancDate == "Invalid date" || data.ancDate == "" ? "" : moment(data.ancDate).format('YYYY-MM-DD'));
					$('#ancCorpCd').val(data.ancCorpCd);
					$('#expNm').val(data.expNm);
					$('#ancEquipType').val(data.ancEquipType);
					$('#buyCorpNm').val(data.buyCorpNm);
					$('#equipDesc').val(data.equipDesc);
					$('#purchasePrice').val(data.purchasePrice);
					$('#equipStandard').val(data.equipStandard);
					$('#equipWeight').val(data.equipWeight);
					$('#equipUsedCd').val(data.equipUsed);
					$('#equipUsed').val(data.equipUsedNm);
					$('#equipStorage').val(data.equipStorage);
					$('#equipYangsan').val(data.equipYangsan);
					$('#equipCompany').val(data.equipCompany);
					$('#equipCore').val(data.equipCore);
					$('#checkCount').val(data.checkCount == null ? "0" : rmDecimal(data.checkCount));
					$('#moldLocation').val(data.moldLocation);
					$('#equipCavity').val(data.equipCavity);
					$('#imageFile1Con').val(data.imageFile1Con);
					$('#imageFile2Con').val(data.imageFile2Con);
					$('#imageFile3Con').val(data.imageFile3Con);
					$('#imageFile4Con').val(data.imageFile4Con);
					
					
					//선택박스 처리
					selectBoxAppend(prcNm, "prcNm", data.prcNm, "");
					selectBoxAppend(assetGubun, "assetGubun", data.assetGubun, "");
					selectBoxAppend(useYnCode, "useYn", data.useYn , "");
					selectBoxAppend(moldGradeCode, "moldGrade", data.moldGrade , "2");
					selectBoxAppend(checkCycleCode, "checkCycle", data.checkCycle, "");
					
					//화면처리
					sideView = 'edit';
					uiProc(true);
					$('#btnSave').addClass('d-none'); // 저장버튼
					$('#btnAdd').attr('disabled', false); //생성버튼
					$('#btnEdit').attr('disabled', false); //수정버튼
					$('#headTab2').removeClass('disabled');
					//$('#headTab3').removeClass('disabled');
					$('#headTab4').removeClass('disabled');
					$('#headTab5').removeClass('disabled');
//	 				$('#headTab6').removeClass('disabled');
					$('#headTab7').removeClass('disabled');
					
					$('#ironItemTable').DataTable().ajax.reload();
				}
			});
		}
	});

	//사진 탭 클릭
	$('#headTab2').on('click', function() {
		imgPrint();
	});

	/* //제품내역 탭 클릭
	$('#headTab3').on('click', function() {
		$('#productListTable').DataTable().ajax.reload();
	}); */
	
	//기본정보 등록 버튼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#equipCodeTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#form').each(function() {
			this.reset();
			$('input[type=hidden]').val('');
		});
		
		uiProc(false);
		
		$('#btnSave').removeClass('d-none');
		$('#btnEdit').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#ancDate').attr('disabled', true);
		$('#mfcDate').val(SERVER_DATE);
		$('#ancDate').val(SERVER_DATE);

		$('#headTab2').addClass('disabled');
		//$('#headTab3').addClass('disabled');
		$('#headTab4').addClass('disabled');
		$('#headTab5').addClass('disabled');
		$('#headTab7').addClass('disabled');
// 		$('#headTab6').addClass('disabled');
		$('#ironBtnAdd').attr('disabled', false);
		$('#ironBtnDel').attr('disabled',false);
		$('#ironSave').removeClass('d-none');
		$('#ironItemTable').DataTable().clear().draw();

		//선택박스 처리
		selectBoxAppend(prcNm, "prcNm", "", "");
		selectBoxAppend(assetGubun, "assetGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "" , "");
		selectBoxAppend(moldGradeCode, "moldGrade", "" , "2");
		selectBoxAppend(checkCycleCode, "checkCycle", "005", "");
		
		$.ajax({
			url : '<c:url value="/bm/readEquipSeq"/>',
			type : 'GET',
			async : false,
			data : {},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					equipCd = data;
				} else {
					toastr.error(res.message);
				}
			},
		});
		
		$('#corrDataListTable').DataTable().ajax.reload();
		$('#corrDataListTable').DataTable().row.add({}).draw(false);
		$('#corrDataListTable').removeClass('d-none');
		
	});

	//기본정보 수정 버튼
	$('#btnEdit').on('click', function() {

		if (sideView != 'edit') {
			toastr.warning("수정할 항목을 선택해 주세요.");
			return false;
		}

		uiProc(false);
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		
		$('#ancDate').attr('disabled', true);
		$('#headTab2').addClass('disabled');
		//$('#headTab3').addClass('disabled');
		$('#headTab4').addClass('disabled');
		$('#headTab5').addClass('disabled');
// 		$('#headTab6').addClass('disabled');
		$('#headTab7').addClass('disabled');
		
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
		$('#ironBtnAdd').attr('disabled', false);
		$('#ironBtnDel').attr('disabled',false);
		$('#ironSave').removeClass('d-none');
		$('#ironItemTable').DataTable().ajax.reload(function(){});
		
		
		//교정내역 check
		var nextCorrCheck = false;
		$.ajax({
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
 				'mitCd' : function() {return equipCd;},
 				'corrGubun' : function() {return '003';},
			},
			success : function(res) {
				let data = res.data;
				
				if(data.length == 0){
					nextCorrCheck = true;
				}
			}
			
		});
		
		if(nextCorrCheck){
			$('#corrDataListTable').DataTable().ajax.reload();
			$('#corrDataListTable').DataTable().row.add({}).draw(false);
			$('#corrDataListTable').removeClass('d-none');
			editCheck = true;
		} else {
			$('#corrDataListTable').addClass('d-none');
			editCheck = false;
		}
		
	});
	
	//기본정보 삭제 버튼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		
		$('#deleteSmallModal').modal('show');
	});

	$('#btnDeleteY').on('click',function(){
		sideView = 'add';
		
		$.ajax({
			url : '<c:url value="bm/equipDataDelete"/>',
			type : 'POST',
			data :{
				'equipCd' : function(){return equipCd;},
				'mitCd' : function(){return equipCd;},
				'attachGubun' : 'CD',
				'attachCd' : function(){return equipCd;},
				'corrGubun' : function(){return '003';},
				'attachType' : function(){return '003';},
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#equipCodeTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}

				$('#my-spinner').hide();
				$('#deleteSmallModal').modal('hide');
			}
		});
		
		$('#form').each(function(){this.reset();});
		selectBoxAppend(prcNm, "prcNm", "", "");
		selectBoxAppend(assetGubun, "assetGubun", "", "");
		selectBoxAppend(useYnCode, "useYn", "" , "");
		selectBoxAppend(moldGradeCode, "moldGrade", "" , "2");
		
	});

	//기본정보 저장
	$('#btnSave').on('click', function() {
		
		if ($('input[name=mainGubun]:checked').val() == '' || $('input[name=mainGubun]:checked').val() == undefined) {
			toastr.warning('구분을 선택해 주세요.');
			$('#mg1').focus();
			return false;
		}
		
		if (!$.trim($('#equipNo').val())) {
			toastr.warning('철형관리번호를 입력해 주세요.');
			$('#equipNo').focus();
			return false;
		}
		if (!$.trim($('#equipNm').val())) {
			toastr.warning('철형명을 입력해 주세요.');
			$('#equipNm').focus();
			return false;
		}
		
// 		if (!$.trim($('#equipInitial').val())) {
// 			toastr.warning('이니셜을 입력해 주세요.');
// 			$('#equipInitial').focus();
// 			return false;
// 		}

// 		if ($('#equipInitial').val().length!=3) {
// 			toastr.warning('이니셜을 3자리까지 입력해 주세요.');
// 			$('#equipInitial').focus();
// 			return false;
// 		}

		/* if (!$.trim($('#equipCavity').val())) {
			toastr.warning('Cavity를 입력해 주세요.');
			$('#equipCavity').focus();
			return false;
		}
		
		if (!$.trim($('#equipType').val())) {
			toastr.warning('제품재질을 입력해 주세요.');
			$('#equipType').focus();
			return false;
		} */
		if (!$.trim($('#mfcCorpCd').val())) {
			toastr.warning('제작처를 입력해 주세요.');
			$('#mfcCorpCd').focus();
			return false;
		}
		if (!$.trim($('#mfcDate').val())) {
			toastr.warning('제작일자를 선택해 주세요.');
			$('#mfcDateCalendar').focus();
			return false;
		}
		/* if (!$.trim($('#equipUsedCd').val())) {
			toastr.warning('사용장비를 선택해 주세요.');
			$('#btnEquipUsed').focus();
			return false;
		} */
// 		if (!$.trim($('#checkCycle').val())) {
// 			toastr.warning('점검주기를 선택해주세요.');
// 			$('#checkCycle').focus();
// 			return false;
// 		}
// 		if ($.trim($('#checkCount').val()) == '0') {
// 			toastr.warning('점검횟수를 입력해주세요.');
// 			$('#checkCount').focus();
// 			return false;
// 		}
		
		var tempcheckCount = $('#checkCount').val();
		
		if (tempcheckCount.replace(/,/g, '').length > 5) {
			toastr.warning('점검횟수가 너무 큽니다. (십 만 미만으로 입력해 주세요.)');
			$('#checkCount').val('0');
			$('#checkCount').focus();
			return false;
		}
		
		/*  var tempWarrantyLife = $('#warrantyLife').val(); */
		/* if(tempWarrantyLife.indexOf('.') == -1){
			tempWarrantyLife = tempWarrantyLife + '.00';
		} */
		
		
		
		var tempEarlyPunchNum = $('#earlyPunchNum').val();
		/* if(tempEarlyPunchNum.indexOf('.') == -1){
			tempEarlyPunchNum = tempEarlyPunchNum + '.00';
		} */
		 
		if (tempEarlyPunchNum.substring().length > 10) {
			toastr.warning('철형타발수가 너무 큽니다. (백 억 미만으로 입력해 주세요.)');
			$('#earlyPunchNum').val('0');
			$('#earlyPunchNum').focus();
			return false;
		}
		
		if (sideView == "add") {
			url = '<c:url value="/bm/equipCodeCreate"/>';
		} else if (sideView == "edit") {
			url = '<c:url value="/bm/equipCodeUpdate"/>';
		}

		let ancFacTableCheck = false;
		
		if (sideView == "add") {
			//등록시 철형관리번호 중복체크
			$.ajax({
				url : '<c:url value="bm/equipNoCheck" />',
				type : 'POST',
				async : false,
				data  : {
					'equipNo' : $('#equipNo').val(),
					'mainGubun': '002',
				},
				success  : function(res){
					if(res.result=="exist") {
						toastr.warning("같은 이름의 철형관리번호가 존재합니다.");
						$('#equipNo').focus();
						ancFacTableCheck = true;
					}
				}
			})
		} else {
			//수정시 철형관리번호를 수정했다면 중복체크
			if(equipNo != $('#equipNo').val()) {
				$.ajax({
					url : '<c:url value="bm/equipNoCheck" />',
					type : 'POST',
					async : false,
					data  : {
						'equipNo' : $('#equipNo').val(),
						'mainGubun': '002',
					},
					success  : function(res){
						if(res.result=="exist") {
							toastr.warning("같은 이름의 철형관리번호가 존재합니다.");
							$('#equipNo').focus();
							ancFacTableCheck = true;
						}
					}
				})
			}
		}

		if(ancFacTableCheck){
			console.log("걸림 1")
			create1 = false;
			create2 = false;
			return false;
		}

		//점검이력 필터링
		var nowCheck = false;
		var check11 = true;
		var check22 = true;
		var dataArray11 = new Array();
	
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				if ($(this).find("td input[name=corrNo]").val() != "" || $("#fileCdNm1").val() != "") {
					if ($(this).find("td input[name=corrDate]").val() == "") {
						toastr.warning('교정일자를 입력해 주세요.');
						$(this).find("td input[name=corrDate]").focus();
						check11 = false;
						nowCheck = true;
						return false;
					}
				}
				if ($(this).find("td input[name=corrDate]").val() == "") {
// 					toastr.warning('교정일자를 입력해 주세요.');
// 					$(this).find("td input[name=corrDate]").focus();
					check11 = false;
					return false;
				}
				
			});
		}
		if(nowCheck){
			return false;
		}
		////
		
		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'mainGubun' : $('input:radio[name=mainGubun]:checked').val(),
				'equipCd' : equipCd,
				'assetCd' : $('#assetCd').val(),
				'assetGubun' : $('#assetGubun option:selected').val(),
				'buyAmt' : $('#buyAmt').val(),
				'equipNo' : $('#equipNo').val(),
				'equipNm' : $('#equipNm').val(),
				'equipInitial' : $('#equipInitial').val(),
				'prcNm' : $('#prcNm option:selected').val(),
				'equipType' : $('#equipType').val(),
				'moldLocation' : $('#moldLocation').val(),
				'equipCavity' : $('#equipCavity').val(),
				'mfcDate' : $('#mfcDate').val().replace(/-/g,''),
				'endDate' : $('#endDate').val().replace(/,/g, ''),
				'useYn' : $('#useYn option:selected').val(),
				'mfcCorpCd' : $('#mfcCorpCd').val(),
				'equipCond' : $('#equipCond').val(),
				'upperAmt' : $('#upperAmt').val(),
				'lowerAmt' : $('#lowerAmt').val(),
				'disposeDate' : $('#disposeDate').val().replace(/,/g, ''),
				'moldGrade' : $('#moldGrade').val(),
				//'warrantyLife' : $('#warrantyLife').val().replace(/,/g,''),
				'earlyPunchNum' : $('#earlyPunchNum').val().replace(/,/g,''),
				'effectiveDate' : $('#effectiveDate').val().replace(/-/g,''),
				'ancEquipNm' : $('#ancEquipNm').val(),
				'ancDate' : $('#ancDate').val().replace(/-/g,''),
				'ancCorpCd' : $('#ancCorpCd').val(),
				'expNm' : $('#expNm').val(),
				'ancEquipType' : $('#ancEquipType').val(),
				'buyCorpNm' : $('#buyCorpNm').val(),
				'equipDesc' : $('#equipDesc').val(),
				'purchasePrice' : $('#purchasePrice').val(),
				'equipStandard' : $('#equipStandard').val(),
				'equipWeight' : $('#equipWeight').val(),
				'equipUsed' : $('#equipUsedCd').val(),
				'equipStorage' : $('#equipStorage').val(),
				'equipYangsan' : $('#equipYangsan').val(),
				'equipCompany' : $('#equipCompany').val(),
				'equipCore' : $('#equipCore').val(),
				'checkCycle' : $('#checkCycle').val(),
				'checkCount'	: $('#checkCount').val().replace(/,/g, ''),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success('저장되었습니다.');					
					$('#equipCodeTable').DataTable().ajax.reload();

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					
					$('#headTab2').removeClass('disabled');
					//$('#headTab3').removeClass('disabled');
					$('#headTab4').removeClass('disabled');
					$('#headTab5').removeClass('disabled');
// 					$('#headTab6').removeClass('disabled');
					$('#headTab7').removeClass('disabled');
					
					$('#ironBtnAdd').attr('disabled', true);
					$('#ironBtnDel').attr('disabled',true);
					$('#ironSave').addClass('d-none');
					
					uiProc(true);
					$('#btnEdit').attr('disabled', false);
					$('#btnSave').addClass('d-none');
				} else {
					toastr.error("오류가 발생하였습니다.");
				}
			},
		});
		
		//점검일자 등록
		if (sideView == "add" || editCheck) {
			$('#corrDataListTable tbody tr').each(function(index, item) {
				
// 				check22 = true;
// 				if ($(this).find("td div[name=fileDiv]").attr('class') == 'custom-file d-none') {
// 					check22 = false;
// 				}
				
				if(check11 && check22){
// 					var formData = new FormData(document.getElementById("formFile_" + index));
					
// 					formData.append('mitCd', equipCd);
// 					formData.append('attachFn', $('#fileLabel'+index).text());
// 					formData.append('corrSeq', $(this).find("td input[name=corrSeq]").val());
// 					formData.append('corrNo', $(this).find("td input[name=corrNo]").val());
// 					formData.append('corrGubun', '003');
// 					formData.append('corrDate', $(this).find("td input[name=corrDate]").val().replace(/-/g, ''));
// 					formData.append('corrWillDate', "");
					
					$.ajax({
						url : '<c:url value="/bm/corrDataListCreate"/>',
						type : 'POST',
				        async : false,
				        data : {
							'mitCd' : equipCd,
							'corrSeq' : $("#corrSeq").val(),
							'corrGubun' : '003',
							'corrDate' : $("#corrDate").val().replace(/-/g, ''),
							'corrWillDate' : "",
							'corrNo' : $("#corrNo").val(),
							'attachFn' : $('#fileLabel').text(),
						},
// 						data : formData,
// 					    processData: false,
// 				        contentType: false,
						success : function(res) {
							let data = res.data;
							if (res.result == 'ok') {
// 								$('#btnCorrSave').addClass('d-none');
// 								$('#corrDataListTable').DataTable().ajax.reload(function(){});
// 								$('input[name=fileNm]').attr('disabled', true);
// 								$('#corrDate').attr('disabled', true);
// 								$('#corrWillDate').attr('disabled', true);
// 								tableIdx = null;
								
								toastr.success('점검이력이 등록되었습니다.');
							} else {
								toastr.error(res.message);
							}
						}
					});
					
				}
				
			});
		}
		
		$('#corrDataListTable tbody tr').each(function(index, item) {
			index++;
			if($("#fileCdNm"+index).val() != null && $("#fileCdNm"+index).val() != 'undefined' && $("#fileCdNm"+index).val() != ''){
				//값 있나없나 검사
				if (corrDataListTable.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				formData.append('attachGubun', 'CD');
				formData.append('attachCd', equipCd);
				formData.append('attachSeq', '');
				formData.append('attachType', '003');
				formData.append('contents', "");
				formData.append('attchPath', fileDate);
				formData.append('attachRegDate', '');
				formData.append('etc1', '0');
				
				index--;
				
				$.ajax({
					url : '<c:url value="/bm/attachCdDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
// 							toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnFileAdd').attr('disabled', false);
						$('#btnFileDel').attr('disabled', false);
// 						btnView = "";
					}
				});
			}
			
		});
		
		$('#btnCorrSave').addClass('d-none');
		$('#corrDataListTable').DataTable().ajax.reload(function(){});
		$('input[name=fileNm]').attr('disabled', true);
		$('#corrDate').attr('disabled', true);
		$('#corrWillDate').attr('disabled', true);
		tableIdx = null;
		$('#corrDataListTable').addClass('d-none');
		////
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			var url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
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
				complete : function() {
//						$('#btnAddConfirm').removeClass('d-none');
//						$('#btnAddConfirmLoading').addClass('d-none');
				}
			});
		} else {
			$('#changeHisTable').addClass('d-none');
		}


		//차종 테이블 저장 
		btnDailyCheck = "";
		if(ironItemTable.data().count()>0){
			let dataArray = new Array();
			$('#ironItemTable tbody tr').each(function(index, item) {
				var rowData = new Object();
				rowData.equipCd = equipCd;
				rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();

				dataArray.push(rowData);
				console.log(rowData)
			});

			$.ajax({
				url : '<c:url value="bm/ironItemCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success  : function(res){
					let data = res.data;
					if (res.result == 'ok') {
						//새로고침
						btnDailyCheck="";
						$('#ironItemTable').DataTable().ajax.reload();

					} else {
						toastr.error(res.message);
					}
				}
			})
		}
	});

	//이미지 조회
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/equipCodeImgRead"/>',
			data : {
				'equipCd' : equipCd
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

	//이미지 등록
	function imageUpload(value) {

		var fileListView = "";

		var formData = new FormData(document.getElementById("form2")); //ajax로 넘길 data

		//var fileInput = document.getElementById("imgAdd1"); //id로 파일 태그를 호출

		//var files = fileInput.files; //업로드한 파일들의 정보를 넣는다.

		formData.append("equipCd", equipCd);
		formData.append("value", value);
		//formData.append('imgAdd1', files); //업로드한 파일을 하나하나 읽어서 FormData 안에 넣는다.
		
		$.ajax({
			url : '<c:url value="/bm/equipCodeImageUpload"/>',
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
			url : '<c:url value="/bm/equipCodeImageDelete"/>',
			type : 'POST',
			data : {
				'equipCd' : equipCd,
				//'imageFile'			:		function(){a=null; a=$('#imgName'+number).text(); return a;},
				'value' : value,

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

	//엑셀업로드 모달
	let inTable = $('#inTable').DataTable({
		language : lang_kor,
		paging : true,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/equipExcelDataList" />',
			type : 'GET',
			data : {
				'url' : function(){return urlData;}
			}
		},
		columns : [
			{  
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}
			},
			{data : 'assetCd'},
			{data : 'assetGubun'},
			{data : 'buyAmt'},
			{data : 'equipNo'},
			{data : 'equipNm'},
			{data : 'prcNm'},
			{data : 'equipType'},
			{data : 'mfcDate'},
			{data : 'mfcCorpCd'},
			{data : 'equipCond'},
			{data : 'upperAmt'},
			{data : 'lowerAmt'},
			{data : 'ancEquipNm'},
			{data : 'ancDate'},
			{data : 'ancCorpCd'}, 
			{data : 'expNm'}, 
			{data : 'ancEquipType'}, 
			{data : 'buyCorpNm'}, 
		],
		columnDefs: [
			{ targets: [12] , render: $.fn.dataTable.render.number( ',' ), className : 'text-right' },
        	{"targets": "_all" , "className": "text-center"},
        	
        ],
	});

	//파일 선택
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);

		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bm/equipExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;
					$('#inTable').DataTable().ajax.reload(function(){});
					$('#inModal').modal('show');

					$('#btnExcelUpload').val("");
				},
				error : function(e) {
				}
			});

		} else {
			//toastr.warning("excel파일을 선택해 주세요.");
			return false;
		}

	});

	//엑셀 파일 적용
	$('#btnApply').on('click',function(){
		console.log("적용버튼 클릭함");
		var dataArray = new Array();		
		var check=true;  	
		
		
		$('#inTable tbody tr').each(function(index, item){
			 
			var rowData = new Object();
			rowData.assetCd= inTable.row(index).data().assetCd;
			rowData.assetGubun= inTable.row(index).data().assetGubun;
			rowData.buyAmt= inTable.row(index).data().buyAmt;
			
			rowData.equipNo= inTable.row(index).data().equipNo;
			rowData.equipNm= inTable.row(index).data().equipNm;
			rowData.prcNm= inTable.row(index).data().prcNm;
			rowData.equipType= inTable.row(index).data().equipType;
			rowData.mfcDate= inTable.row(index).data().mfcDate;
			rowData.mfcCorpCd= inTable.row(index).data().mfcCorpCd;
			
			rowData.equipCond= inTable.row(index).data().equipCond;
			rowData.upperAmt= inTable.row(index).data().upperAmt;
			rowData.lowerAmt= inTable.row(index).data().lowerAmt;
			
			rowData.ancEquipNm= inTable.row(index).data().ancEquipNm;
			rowData.ancDate= inTable.row(index).data().ancDate;
			rowData.ancCorpCd= inTable.row(index).data().ancCorpCd;
			rowData.expNm= inTable.row(index).data().expNm;
			rowData.ancEquipType= inTable.row(index).data().ancEquipType;
			rowData.buyCorpNm= inTable.row(index).data().buyCorpNm;
			
	        dataArray.push(rowData);
		});
			
		if(check){
			$.ajax({
				url : '<c:url value="bm/equipExcelCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					// $('#btnAddConfirm').addClass('d-none');
				},
				success : function(res) {				
					if (res.result == 'ok') {
						$('#equipCodeTable').DataTable().ajax.reload(function(){});
						$('#inModal').modal('hide');
						
						toastr.success('저장되었습니다.');
					}else if(res.result == 'exist') {
						toastr.warning("동일한 부품코드가 존재합니다.");
					}else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#inOutWhsTable').DataTable().ajax.reload();
					$('#btnAddConfirm').removeClass('d-none');
					$('#btnAddConfirmLoading').addClass('d-none');				
				}
			});
		}
	});

	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnView == "") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnView == "edit") {
			shtml = '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm
						+ "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}
	
	//숫자 콤마생성
	$(document).on('keyup', "#buyAmt, #warrantyLife, #earlyPunchNum, #equipCavity",  function(evt) { //입력시 콤마 추가
		var costSum = 0;
		if ($(this).val() == "") {
			$(this).val("0");
			$(this).select();
		}
		//입력 정규식 0~9 .
		reg = /[^0-9.]/gi;
		let poQty = $(this).val().replace(/,/g, '');
		if (reg.test(poQty)) {
			poQty = poQty.replace(reg, '');
			$(this).val(rmDecimal(poQty));
			return false;
		}
		$(this).val(rmDecimal(poQty));

	});
	
	//기본정보 화면 설정
	function uiProc(flag) {
		$('input[name=mainGubun]').attr('disabled',flag);
		$("#equipNo").attr("disabled", flag);
		$("#equipNm").attr("disabled", flag);
		$("#equipInitial").attr("disabled", flag);
		$("#prcNm").attr("disabled", flag);
		$("#equipType").attr("disabled", flag);
		$("#moldLocation").attr("disabled", flag);
		$("#equipCavity").attr("disabled", flag);
		$("#mfcDate").attr("disabled", flag);
		$("#mfcCorpCd").attr("disabled", flag);
		$("#assetCd").attr("disabled", flag);
		$("#buyAmt").attr("disabled", flag);
		$("#assetGubun").attr("disabled", flag);
		$("#equipCond").attr("disabled", flag);
		$("#upperAmt").attr("disabled", flag);
		$("#lowerAmt").attr("disabled", flag);
		$("#disposeDateCalendar").attr("disabled", flag);
		$("#moldGrade").attr("disabled", flag);
		$("#warrantyLife").attr("disabled", flag);
		$("#earlyPunchNum").attr("disabled", flag);
		$("#effectiveDate").attr("disabled", flag);
		$("#ancEquipNm").attr("disabled", flag);
		$("#ancDate").attr("disabled", flag);
		$("#ancEquipNm").attr("disabled", flag);
		$("#ancDate").attr("disabled", flag);
		$("#ancCorpCd").attr("disabled", flag);
		$("#expNm").attr("disabled", flag);
		$("#ancEquipType").attr("disabled", flag);
		$("#buyCorpNm").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#equipDesc").attr("disabled", flag);
		$('#mfcDateCalendar').attr("disabled", flag);
		$('#ancDateCalendar').attr("disabled", flag);
		$('#endDateCalendar').attr("disabled", flag);
		$('#purchasePrice').attr("disabled", flag);
		$('#equipStandard').attr("disabled", flag);
		$('#equipWeight').attr("disabled", flag);
		$('#equipStorage').attr("disabled", flag);
		$('#equipYangsan').attr("disabled", flag);
		$('#equipCompany').attr("disabled", flag);
		$('#equipCore').attr("disabled", flag);
		$('#mfcDate').attr("disabled", flag);
		$('#endDate').attr("disabled", flag);
		$('#disposeDate').attr("disabled", flag);
		$('#btnEquipUsed').attr("disabled", flag);
		$('#equipUsedDelete').attr("disabled", flag);
		$("#checkCycle").attr("disabled", flag);
		$('#checkCount').attr('disabled', flag);
	}
	
	//숫자만 입력하게 처리
	$(document).on('keyup', "#checkCount, #disposeDate, #endDate", function(event){
		var preInWhsQtyData = $(this).val();	   
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		if($(this).val()==""){
			$(this).val("0");
		}
		
		$(this).val(rmDecimal($(this).val().replace(/,/g,'')));

	});
	
	//사진 비고 등록
	function textSave(x){
		url = '<c:url value="/bm/equipImgUpdate"/>';

		$.ajax({
			url : url,
			type : 'POST',
			data : {
				'equipCd' : equipCd,
				'imageFile1Con' : $('#imageFile1Con').val(),
				'imageFile2Con' : $('#imageFile2Con').val(),
				'imageFile3Con' : $('#imageFile3Con').val(),
				'imageFile4Con' : $('#imageFile4Con').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				uiProc(true);
			}
		});
	}

	//숫자 및 영문만 입력하게 처리
	$(document).on('keyup',"#equipInitial", function(event){
		$(this).val($(this).val().replace(/[^A-Z0-9]/gi,""));
	});
	

	//제품내역 목록
	let productListTable = $('#productListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : 20,
		ajax : {
			url : '<c:url value="/bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'moldCd' : function(){return equipCd;},
				'mainGubun' : function(){return '001';},
			},
		},
		columns : [ 
		{
			data : 'itemGubunNm',
			'className' : 'text-center'
		}, 
		{
			data : 'itemModelNm',
			'className' : 'text-center'
		}, 
		{
			data : 'itemCd',
			'className' : 'text-center'
		}, 
		{
			data : 'itemNm',
			'className' : 'text-center'
		},
		{
			data : 'itemColor',
			'className' : 'text-center'
		}
		],
		order : [ [ 0, 'asc' ], ],
		buttons : [ {
			extend : 'copy',
			title : '철형정보관리',
		}, {
			extend : 'excel',
			title : '철형정보관리',
		}, {
			extend : 'print',
			title : '철형정보관리',
		}, ],
	});
	
	//설비명 팝업 시작
   	var equipPopUpTable;
   	function equipUsedOnClick() {
		if(equipPopUpTable == null || equipPopUpTable == undefined)	{
			equipPopUpTable = $('#equipPopUpTable').DataTable({
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
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'equipGubun' : function(){return '001';},
						'mainGubun' : function(){return '001';},
					},
				},
				rowId : 'equipCd',
				columns : [
					{
						data : 'equipGubunNm'
					}, 
					{
						data : 'equipNo'
					}, 
					{
						data : 'equipNm'
					}, 
					{
						data : 'equipType'
					},
					{	data : 'equipWidth',
					},
				],
				columnDefs : [ {
					"defaultContent": "-", "targets": "_all",	"className": "text-center"
				}],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
		    });

		    $('#equipPopUpTable tbody').on('click', 'tr', function () {
		    	var data = equipPopUpTable.row( this ).data();
				
		    	$('#equipUsedCd').val(data.equipCd);
		    	$('#equipUsed').val(data.equipNm);

                $('#equipPopUpModal').modal('hide');

			});
		}else{
			$('#equipPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#equipPopUpModal').modal('show');
   	}
   	
	//관련자료 목록
	let equipFtInfo = $('#equipFtInfo').DataTable({
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
			data : {
				'attachCd' : function(){return equipCd;},
				'attachGubun' : function(){return 'EM';},
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
				render : function(data, type, row) {
					if(data!=null){
	    				return '<input type="text" class="form-control" name="contents" value="'+data+'" style="min-width : 100%;" disabled>' ;	
					} else{
						return '<input type="text" class="form-control" name="contents" value="" style="min-width : 100%;">';	
					}		
				}
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					if (data != null) {
						var html = '<a href="/bm/attachDataDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachGubun=EM">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileDrNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileDrNm'+tempNum+'"></label>';
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
	$('#equipFtInfo tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView1 = "add";
		} else {
			$('#equipFtInfo').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			tempView1 = "edit";
		}
		tableIdx = $('#equipFtInfo').DataTable().row(this).index();
		baseInfoSeq = equipFtInfo.row(tableIdx).data().attachSeq;
	});
	
	//관련자료 추가버튼
	$('#btnCheckAdd').on('click', function() {
		$('#equipFtInfo').DataTable().row.add({}).draw(false);
		
		if (equipFtInfo.data().count() > 0) {
			$('#btnCheckSave').removeClass('d-none'); // 등록버튼
		}
		
		$('#btnCheckAdd').attr('disabled', true);
		$('#btnCheckDel').attr('disabled', true);
	});
	
	//관련자료 삭제버튼
	$('#btnCheckDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 관련자료를 선택해주세요.');
			return false;
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'EM';},
					'attachCd' : function(){return equipCd;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#equipFtInfo').DataTable().ajax.reload();
					toastr.success("관련자료가 삭제되었습니다.");
				}
			})
		} else {
			$('#equipFtInfo').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});
	
	//관련자료 탭 버튼 클릭 시
	$('#headTab4').on('click', function() {
		$('#btnCheckSave').addClass('d-none');
		$('#btnCheckAdd').attr('disabled', false);
		$('#btnCheckDel').attr('disabled', false);
		
		$('#equipFtInfo').DataTable().ajax.reload();
	});
	
	//점검이력사항 버튼 Event
	$('#headTab5').on('click', function() {
		$('#corrDataFileTable').DataTable().clear().draw();
		$('#corrDataListTabTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataListTabTable.draw();
			corrDataFileTable.draw();
			corrDataFileTable.draw();
			corrDataListTabTable.draw();
		},300);
	});
	
	// 관련자료 저장
	$('#btnCheckSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
	
		$('#equipFtInfo tbody tr').each(function(index, item) {
			index++;
			if($("#fileDrNm"+index).val() != null && $("#fileDrNm"+index).val() != 'undefined' && $("#fileDrNm"+index).val() != ''){
				//값 있나없나 검사
				if (equipFtInfo.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						check = false;
						return false;
					}
				}
				
				//시작
				var formData = new FormData(document.getElementById("formFile"+index));
				
				$.ajax({
					url : '<c:url value="/bm/attachDataSeq"/>',
					type : 'GET',
					async : false,
					data : {
						'attachGubun' : 'EM',
						'attachCd' : function(){return equipCd;},
					},
					success : function(res) {
						attachDataSeq = res.seq;
					}
				});
				
				formData.append('attachSeq', attachDataSeq);
				attachRegDateValue = $('#attachDrDate' + index).val();
				formData.append('attachRegDate', attachRegDateValue);
	
				formData.append('attachCd', equipCd);
				formData.append('path', fileDate);
				formData.append('contents', $(this).find("td input[name=contents]").val());
				formData.append('attachGubun', 'EM');
				formData.append('idCheck', 'EM');
				
				index--;
				
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
							// 보기
							toastr.success('관련자료가 등록되었습니다.');
							tempView1 = 'add';
							$('#equipCodeTable').DataTable().ajax.reload();
							$('#equipFtInfo').DataTable().ajax.reload();
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnCheckSave').addClass('d-none');
						$('#btnCheckAdd').attr('disabled', false);
						$('#btnCheckDel').attr('disabled', false);
					}
				});
			}
			
		});
		
	});
	
	//통합자료실 모달
	var fileReferencePopUpTable;
	function fileReferenceClick() {
		if (fileReferencePopUpTable != null && fileReferencePopUpTable != 'undefined') {
			fileReferencePopUpTable.destroy();
		}
		fileReferencePopUpTable = $('#fileReferencePopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
			language : lang_kor,
			info : true,
			ordering : false,
			processing : true,
			autoWidth : false,
			paging : true,
			searching: true,
			pageLength : 100000000, 
			scrollY: "50vh",
			ajax : {
				url : '<c:url value="fr/fileReferenceList"/>',
				type : 'POST',
				data : {
					'gubun'	:	function(){return '001';},
					'fileGubun'	:	function(){return '006';},
				},
			},
			select: false,
			rowId: 'idx',
			columns : [
				{
					className : 'text-center',
					render : function(data, type, row, meta) {
						return meta.row+1;
					}
				},
				{
					data : 'fileManagerNm', 
					render : function(data, type, row, meta) {
						if(data != null){
							return data;
						} else {
							return '';
						}
					},
					className : 'text-center p-0'
				},
				{
					data : 'fileManagerDepartmentNm', 
					className : 'text-center' 
				},
				{
					data : 'fileInputDate', className : 'text-center p-0',
					render : function(data, type, row, meta) {
						if(data != null && data != ''){
							return moment(data).format('YYYY-MM-DD');
						} else {
							return '';
						}
						
					}
				},
				{ 
					data : 'fileName', 
					render : function(data, type, row, meta) {
						var length = data.split('.').length;
						let idx = row['idx'];
						if($.inArray(data.split('.')[length-1], ["tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"]) == -1){
							return '<a href="fr/fileReferenceRead?idx='+idx+'">'+data+'</a>';
						} else {
							return '<button type="button" class="btn btn-info" id="" onclick="imageModalClick('+idx+');">'+data+'</button>';
						}
						
					},
					className : 'text-center'
				},
				{ 
					data : 'fileName', className : 'text-center',
					render : function(data, type, row, meta) {
						var length = data.split('.').length;
						return data.split('.')[length-1];
					}
				},
				{ 
					data : 'fileDesc', className : 'text-center p-0',
					render : function(data, type, row, meta) {
						if(data != null){
							return data;
						} else {
							return '';
						}
						
					}
				},
			],
			columnDefs : [],
			buttons : [],
			order : [],
		});
		
		$('#fileReferencePopUpModal').modal('show');
		
		setTimeout(function(){
			fileReferencePopUpTable.draw();
		},170);
		
	}
	
	//통합자료실 이미지 모달 보여주기
	function imageModalClick(idx) {
		$.ajax({
			url: '<c:url value="fr/fileReferenceJustRead"/>',
            type: 'GET',
            async: false,
            data : {
				'idx'	:	function(){return idx;},
			},
			success : function(res) {
				let data = res.data;
				$('#imageModal').modal('show');
				$('#fileReferenceImg').attr("src","data:image/jpg;base64," + data.fileBlob);
			}
		});
	}
	
	//기본정보 - 점검이력사항 테이블
	let corrDataListTable = $('#corrDataListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		destroy : true,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		paging : false,
		searching : false,
		ajax : {
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return " ";},
			},
		},
		rowId : 'mitCd',
		columns : [
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="" name="corrDate"/>';
						html += '</div>';

						return html;
					}else{
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrDate" value="'+moment(data).format('YYYY-MM-DD')+'" name="corrDate" disabled/>';
						html += '<input class="form-control" type="hidden" id="corrSeq" value="'+row['corrSeq']+'" name="corrSeq"/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrWillDate_'+meta.row+'" value="" name="corrWillDate"/>';
						html += '</div>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">';
						html += '<input class="form-control" type="date" id="corrWillDate_'+meta.row+'" value="'+tempCorrWillDate+'" name="corrWillDate" disabled/>';
						html += '</div>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name="userNm4"  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name="userNumber4"  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="userNm4" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="userNumber4" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" style="width:100%"/>';
					}else{
						return '<input type="text" class="form-control" id="corrNo" name="corrNo" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					if (data != null) {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					} else {
						var tempNum = meta.row + meta.settings._iDisplayStart + 1;
						
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [1], visible : false},
		]
	});
	
	//점검이력사항 테이블
	let corrDataListTabTable = $('#corrDataListTabTable').DataTable({
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
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/attachCorreDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'mitCd' : function() {return equipCd;},
				'corrGubun' : function() {return '003';},
			},
		},
		rowId : 'mitCd',
		columns : [
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						var html = '<input class="form-control" type="date" id="" value="'+moment(data).format('YYYY-MM-DD')+'" name="" style="min-width : 100%;" disabled/>';
						html += '<input class="form-control" type="hidden" id="" value="'+row['corrSeq']+'" name=""/>';

						return html;
					}
				},
				'className' : 'text-center'
			},
			{
				data : 'corrWillDate',
				render : function(data, type, row, meta) {
					if(data == null){
						var html = '<input class="form-control" type="date" id="" value="" name="" style="min-width : 100%;"/>';

						return html;
					}else{
						tempCorrWillDate = moment(data).format('YYYY-MM-DD');
						var html = '<input class="form-control" type="date" id="" value="'+tempCorrWillDate+'" name="" style="min-width : 100%;" disabled/>';

						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'regNm',
				render : function(data, type, row, meta) {
					if(data == null){
						 var html = '<input type="text" class="form-control" name=""  value="'+userNm+'" style="width:100%; text-align:center;" disabled/>';
						 html += '<input type="hidden" class="form-control" name=""  value="'+userNumber+'" style="width:100%" disabled/>';
						return html;
					} else {
						var html = '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%; text-align:center;" disabled/>';
						html += '<input type="hidden" class="form-control" name="" value="'+row['regId']+'" style="width:100%" disabled/>';
						return html;
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'corrNo',
				render : function(data, type, row, meta) {
					if(data == null){
						return '<input type="text" class="form-control" name="" style="width:100%" disabled/>';
					}else{
						return '<input type="text" class="form-control" name="" value="'+data+'" style="width:100%" disabled/>';
					}
				},
				'className' : 'text-center'
			}, 
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					
					if(data == null){
						var html = '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" for=""></label></div></form>';
						return html;
					} else {
						var html = '<a name="" href="/bm/corrDataFileDownload?attachFn='+data+'&mitCd='+equipCd+'&corrSeq='+row['corrSeq']+'&corrGubun='+row['corrGubun']+'">'+data+'</a>';
						html += '<form id="" method="post" enctype="multipart/form-data"> <div class="custom-file d-none" name="">';
						html += '<input type="file" class="custom-file-input" id="" name="">';
						html += '<label class="custom-file-label" id="" for="">'+data+'</label></div></form>';
						return html;
					}
	            }
			},
		], 
		buttons : [],
		columnDefs : [
			{targets : [4], visible : false},
		]
	});
	
	let corrGubun = '';
	let corrSeq = '';
	
	//설비정보 상세정보 보기
	$('#corrDataListTabTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			
		} else {
			$('#corrDataListTabTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		corrGubun = corrDataListTabTable.row(this).data().corrGubun;
		corrSeq = corrDataListTabTable.row(this).data().corrSeq;
		
		$('#corrDataFileTable').DataTable().ajax.reload();
		setTimeout(function(){
			corrDataFileTable.draw();
			corrDataFileTable.draw();
		},300);
	});
	
	let corrDataFileTable = $('#corrDataFileTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd' : function(){return equipCd;},
				'attachGubun' : function(){return 'CD';},
				'attachType' : function(){return corrGubun;},
				'etc1' : function(){return corrSeq;},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					var tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachType='+corrGubun+'&etc1='+corrSeq+'&attachGubun=CD">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				}
			},
		],
		order : [ [ 0, 'asc' ], ],
	});
	
	//일상점검 탭 클릭
	$('#headTab6').on('click', function() {
		btnDailyCheck = '';
		$('#btnDailyAdd').attr('disabled', false);
		$('#btnDailyEdit').attr('disabled', false);
		$('#btnDailyDel').attr('disabled', false);
		$('#btnDailySave').addClass('d-none');
		
		$('#dailyAdmTable').DataTable().ajax.reload();
		setTimeout(function(){
			dailyAdmTable.draw();
			dailyAdmTable.draw();
		},175);
	});
	
	//일상점검 목록
	let dailyAdmTable = $('#dailyAdmTable').DataTable({
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
		scrollY: '60vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/equipDailyCheckList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return equipCd;},
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
				data : 'checkList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkList" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
						return '<input type="hidden" class="form-control" name="checkSeq" value="'+row['checkSeq']+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkList" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'checkMethod',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkMethod" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkMethod" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'checkSpec',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="checkSpec" value="'+data+'" placeholder="하한~상한 단위" style="min-width : 100%; text-align : center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="checkSpec" value="" placeholder="하한~상한 단위" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(inspInputMethodCode, "inspInputMethod", data, row, meta);
					return html;
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ]
	});
	
	//일상점검 추가버튼
	$('#btnDailyAdd').on('click', function() {
		btnDailyCheck = 'add';
		$('#btnDailyEdit').attr('disabled', true);
// 		$('#btnDailyDel').attr('disabled', true);
 		$('#btnDailySave').removeClass('d-none');
 		
		$('#dailyAdmTable').DataTable().row.add({}).draw(false);
	});
	
	//일상점검 테이블 행 클릭 시
	$('#dailyAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnDailyCheck = "";
			return false;
		} else {
			$('#dailyAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		btnDailyCheck = "edit";
		tableIdx = $('#dailyAdmTable').DataTable().row(this).index();
		checkSeq = dailyAdmTable.row(tableIdx).data().checkSeq;
		
		console.log("tableIdx => " + tableIdx + ", checkSeq => " + checkSeq);
	});
	
	//일상점검 수정버튼
	$('#btnDailyEdit').on('click', function() {
// 		if(btnDailyCheck != 'edit'){
// 			toastr.warning("수정할 항목을 선택해주세요.");
// 			return false;
// 		}
		
		$('input[name=checkList]').attr('disabled', false);
		$('input[name=checkMethod]').attr('disabled', false);
		$('input[name=checkSpec]').attr('disabled', false);
		$('select[name=inspInputMethod]').attr('disabled', false);
		$('#btnDailyAdd').attr('disabled', true);
		$('#btnDailyDel').attr('disabled', true);
 		$('#btnDailySave').removeClass('d-none');
	});
	
	//일상점검 삭제버튼
	$('#btnDailyDel').on('click', function() {
		if (btnDailyCheck != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(checkSeq != null && checkSeq != undefined){
			//일상점검 삭제
			$.ajax({
				url : '<c:url value="bm/equipDailyCheckDelete"/>',
				type : 'POST',
				data  : {
					'equipCd' : function(){return equipCd;},
					'checkSeq' : function(){return checkSeq;},
				},
				success  : function(res){
					$('#dailyAdmTable').DataTable().rows(tableIdx).remove().draw();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#dailyAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnDailyCheck = '';
		

	});

	//일상점검 저장
	$('#btnDailySave').on('click',function() {
		var check = true;
		var dataArray = new Array();

		$('#dailyAdmTable tbody tr').each(function(index, item) {

			if (dailyAdmTable.data().count() != 0) {
				//입력값 검사 - 필요하면 주석 해제하기
// 				if (!$.trim($(this).find('td input[name=checkList]').val())) {
// 					toastr.warning('점검항목을 입력해 주세요.');
// 					$(this).find('td input[name=checkList]').focus();
// 					check = false;
// 					return false;
// 				}
// 				if (!$.trim($(this).find('td input[name=checkMethod]').val())) {
// 					toastr.warning('점검방법을 입력해 주세요.');
// 					$(this).find('td input[name=checkMethod]').focus();
// 					check = false;
// 					return false;
// 				}
// 				if (!$.trim($(this).find('td input[name=checkSpec]').val())) {
// 					toastr.warning('SPEC을 입력해 주세요.');
// 					$(this).find('td input[name=checkSpec]').focus();
// 					check = false;
// 					return false;
// 				}
			} 
			
			var rowData = new Object();
			rowData.equipCd = equipCd;
			rowData.checkSeq = $(this).find('td input[name=checkSeq]').val();
			rowData.mainGubun = '002';
			rowData.checkList = $(this).find('td input[name=checkList]').val();
			rowData.checkMethod = $(this).find('td input[name=checkMethod]').val();
			rowData.checkSpec = $(this).find('td input[name=checkSpec]').val();
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();

			dataArray.push(rowData);
			console.log(rowData);
		});
		
		var url = '<c:url value="/bm/equipDailyCheckCreate"/>';

		if (check) {
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (!$('#btnDailyEdit').is(':disabled')) {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						
						btnDailyCheck = "";
						
						$('#btnDailyAdd').attr('disabled', false);
						$('#btnDailyEdit').attr('disabled', false);
						$('#btnDailyDel').attr('disabled', false);
						$('#btnDailySave').addClass('d-none');
						$('#dailyAdmTable').DataTable().ajax.reload();
					} else {
						toastr.error(res.message);
					}
				}
			});
		}
	});

	$('#headTab7').on('click', function(){
		$('#btnKeyChkAdd').attr('disabled',false);
		$('#btnKeyChkEdit').attr('disabled',false);
		$('#btnKeyChkDel').attr('disabled',false);
		$('#btnKeyChkSave').addClass('d-none');
		
		$('#btnChkFileAdd').attr('disabled',true);
		$('#btnChkFileDel').attr('disabled',true);
		$('#btnChkFileSave').addClass('d-none');
		attachSeq = '';

		$('#keyChkAdmTable').DataTable().ajax.reload();
		$('#attachFileTable').DataTable().ajax.reload();
		setTimeout(function(){
			keyChkAdmTable.draw();
			attachFileTable.draw();
		}, 300);
	});

	let keyChkAdmTable = $('#keyChkAdmTable').DataTable({
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
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="/bm/attachKeyChkList"/>',
			type : 'GET',
			async : false,
			data : {
				'attachCd'		: function(){return equipCd;},
				'attachGubun'	: function(){return 'ML';},
				'attachSeq'		: function(){return attachSeq;}
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					tempNum = meta.row + meta.settings._iDisplayStart + 1;
					return tempNum;
        		},
				'className' : 'text-center'
			},
			{
				data : 'corrDate',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="date" class="form-control" name="corrDate" value="'+moment(data).format('YYYY-MM-DD')+'" style="min-width : 100%; text-align : center;" disabled />';
						return '<input type="hidden" class="form-control" name="corr" value="'+row['checkSeq']+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="date" class="form-control" name="corrDate" value="'+moment(SERVER_DATE).format('YYYY-MM-DD')+'" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'repairHistory',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="repairHistory" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="repairHistory" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
			{
				data : 'stockChargr',
				render : function(data, type, row, meta) {
					if (data != null) {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="stockCg1" value="">';
						html += '<input type="hidden" class="form-control" name="stockCg" value="">';
						html += '<input type="text" class="form-control" id="stockChargr'+tempNum+'" name="stockChargr" value="'+data+'" disabled>';
						html += '<button type="button" name="btnStockCg" class="btn btn-primary input-sub-search" onClick="attachCdOnClick()" disabled>';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
// 						return '<input type="text" class="form-control" name="stockChargr" value="'+data+'" style="min-width : 100%; text-align : center;" disabled />';
					} else {
						var html = '<div class="input-sub m-0" style="width: 100%;">';
						html += '<input type="hidden" class="form-control" name="stockCg1" value="">';
						html += '<input type="hidden" class="form-control" name="stockCg" value="">';
						html += '<input type="text" class="form-control" id="stockChargr'+tempNum+'" name="stockChargr" value="'+userNm+'" disabled>';
						html += '<button type="button" name="btnStockChargr" class="btn btn-primary input-sub-search" onClick="attachCdOnClick()">';
						html += '<span class="oi oi-magnifying-glass"></span>';
						html += '</button>';
						html += '</div>';
						return html;
// 						return '<input type="text" class="form-control" name="stockChargr" value="" style="min-width : 100%; text-align : center;" />';
					}
				}
			},
// 			{
// 				data : 'attachFn',
// 				render : function(data, type, row, meta) {
// 				if(data != null && btnDailyCheck != 'edit'){
// 					var html = '<a href="/bm/attachChkDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+equipCd+'&attachGubun=ML">'+data+'</a>';
// 					return html;
// 				} else {
// 					if(data == null){
// 						data = '파일을 선택해주세요';
// 					}
// 					var html = '<form id="formChkFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
// 					html += '<input type="file" class="custom-file-input" id="fileChkNm'+tempNum+'" name="fileChkNm">';
// 					html += '<label class="custom-file-label" for="fileChkNm'+tempNum+'" >'+data+'</label>';
// 					html += '</div></form>';
// 					return html;
// 					}
// 				}
// 			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ]
	});
	//일상점검 추가버튼
	$('#btnKeyChkAdd').on('click', function() {
		btnDailyCheck = 'add';
		$('#btnKeyChkEdit').attr('disabled', true);
// 		$('#btnDailyDel').attr('disabled', true);
 		$('#btnKeyChkSave').removeClass('d-none');
		$('#keyChkAdmTable').DataTable().row.add({}).draw(false);
	});
	
	//타수점검 테이블 행 클릭 시
	$('#keyChkAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnDailyCheck = "";
			$('#btnChkFileAdd').attr('disabled', true);
			$('#btnChkFileDel').attr('disabled', true);
			attachSeq = '';
			$('#attachFileTable').DataTable().ajax.reload(function(){})
			return false;
		} else {
			$('#keyChkAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
			$('#btnChkFileAdd').attr('disabled', false);
			$('#btnChkFileDel').attr('disabled', false);
		}
		
		btnDailyCheck = "edit";
		tableIdx = $('#keyChkAdmTable').DataTable().row(this).index();
		attachSeq = keyChkAdmTable.row(tableIdx).data().attachSeq;
		$('#attachFileTable').DataTable().ajax.reload(function(){});
		console.log("tableIdx => " + tableIdx + ", attachSeq => " + attachSeq);
	});
	
	//일상점검 수정버튼
	$('#btnKeyChkEdit').on('click', function() {
// 		if(btnDailyCheck != 'edit'){
// 			toastr.warning("수정할 항목을 선택해주세요.");
// 			return false;
// 		}
		btnDailyCheck = 'edit'
		$('#keyChkAdmTable').DataTable().ajax.reload();
		$('input[name=corrDate]').attr('disabled', false);
		$('input[name=repairHistory]').attr('disabled', false);
		$('button[name=btnStockCg]').attr('disabled', false);
// 		$('input[name=stockChargr]').attr('disabled', false);
// 		$('select[name=inspInputMethod]').attr('disabled', false);
		$('#btnKeyChkAdd').attr('disabled', true);
		$('#btnKeyChkDel').attr('disabled', true);
 		$('#btnKeyChkSave').removeClass('d-none');
	});
	
	//일상점검 삭제버튼
	$('#btnKeyChkDel').on('click', function() {
		if (btnDailyCheck != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		if(attachSeq != null && attachSeq != undefined){
			//일상점검 삭제
			$.ajax({
				url : '<c:url value="bm/attachChkDelete"/>',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'ML';},
					'attachCd' : function(){return equipCd;},
					'attachSeq' : function(){return attachSeq;},
				},
				success  : function(res){
					$('#keyChkAdmTable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
				}
			})
		} else {
			$('#keyChkAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		btnDailyCheck = '';
		

	});

	//일상점검 저장 좌표2
	let dataSeq = '';
	$('#btnKeyChkSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
		var rowData = new Object();
		
		$('#keyChkAdmTable tbody tr').each(function(index, item) {
// 			index++;
// 			if($("#fileChkNm"+index).val() != null && $("#fileChkNm"+index).val() != 'undefined' && $("#fileChkNm"+index).val() != ''){
// 				//값 있나없나 검사
// 				if (keyChkAdmTable.data().count() != 0) {
// 					if ($(this).find("td input[name=fileChkNm]").val() == "" || $(this).find("td input[name=fileChkNm]").val() == undefined) {
// 						toastr.warning('파일을 선택해 주세요.');
// 						$(this).find("td input[name=fileChkNm]").focus();
// 						check = false;
// 						return false;
// 					}
// 				}
				
			//시작
// 			var formData = new FormData(document.getElementById("formChkFile"+index));
			var rowData = new Object();
			$.ajax({
				url : '<c:url value="/bm/attachChkSeq"/>',
				type : 'GET',
				async : false,
				data : {
					'attachGubun' : 'ML',
					'attachCd' : function(){return equipCd;},
				},
				success : function(res) {
					dataSeq = res.seq;
				}
			});
			rowData.attachSeq = dataSeq;
			rowData.attachGubun = 'ML';
			rowData.attachCd = equipCd;
			rowData.corrDate = $(this).find("td input[name=corrDate]").val().replace(/-/g, '');
			rowData.repairHistory = $(this).find("td input[name=repairHistory]").val();
			rowData.stockChargr = $(this).find("td input[name=stockChargr]").val();
			
// 			rowData.contents = $(this).find("td input[name=contents]").val();
// 			rowData.attachPath = fileDate;
			
// 			attachRegDateValue = $('#attachDrDate' + index).val();
// 			rowData.attachRegDate = attachRegDateValue;
			dataArray.push(rowData);
// 				let url = '<c:url value="/bm/attachChkCreate"/>';
// 				if(btnDailyCheck == 'edit'){
// 					url = '<c:url value="/bm/attachChkUpdate"/>';
// 				}
		});
		$.ajax({
			url : '<c:url value="/bm/attachChkCreate"/>',
			type : 'POST',
			dataType : 'json',
			data : JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
// 		    processData: false,
// 			contentType: false,
// 			async : false,
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					// 보기
					toastr.success('관련자료가 등록되었습니다.');
					tempView1 = 'add';
					$('#equipCodeTable').DataTable().ajax.reload();
					$('#keyChkAdmTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnKeyChkSave').addClass('d-none');
				$('#btnKeyChkAdd').attr('disabled', false);
				$('#btnKeyChkDel').attr('disabled', false);
			}
		});
// 		}
	});

	let attachFileTable = $('#attachFileTable').DataTable({
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
			data : {
				'attachCd'		: function(){return attachSeq;},
				'attachSeq'		: function(){return baseInfoSeq;},
				'attachGubun'	: function(){return 'ML';},
			},
		},
		columns : [
			{
				render: function(data, type, row, meta) {		
					tempNum = meta.row + meta.settings._iDisplayStart + 1;
					return tempNum;
        		},
				'className' : 'text-center'
			},
			{
				data : 'attachFn',
				render : function(data, type, row, meta) {
					if (data != null) {
						var html = '<a href="/bm/attachDataCdDownload?attachFn='+data+'&attachSeq='+row['attachSeq']+'&attachCd='+attachSeq+'&attachType=1&etc1=1&attachGubun=ML">'+data+'</a>';
						return html;
					} else {
						var html = '<form id="formChkFile'+tempNum+'" method="post" enctype="multipart/form-data"> <div class="custom-file">';
						html += '<input type="file" class="custom-file-input" id="fileCdNm'+tempNum+'" name="fileNm">';
						html += '<label class="custom-file-label" for="fileCdNm'+tempNum+'"></label>';
						html += '</div></form>';
						return html;
					}
				},
				'className' : 'text-center'
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ],
		drawCallback: function(settings) {
        },
	});

	$('#attachFileTable tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			tempView1 = "add";
		} else {
			$('#attachFileTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#attachFileTable').DataTable().row(this).index();
		baseInfoSeq = attachFileTable.row(tableIdx).data().attachSeq;
		tempView1 = "edit";
	});

	$('#btnChkFileAdd').on('click', function() {
// 		sideView = 'add';
		$('#btnChkFileSave').removeClass('d-none');
		$('#attachFileTable').DataTable().row.add({}).draw(false);
		
// 		if (corrDataFileTable.data().count() > 0) {
// 			$('#btnSave4').removeClass('d-none'); // 등록버튼
// 		}
		
// 		$('#btnFileAdd').attr('disabled', true);
// 		$('#btnFileDel').attr('disabled', true);
		//btnView = '';
	});

	$('#btnChkFileDel').on('click', function() {
		if (tempView1 != 'edit') {
			toastr.warning('삭제할 첨부파일 항목을 선택해주세요.');
			return false;
		}
		
		if($('#attachFileTable tbody tr').length <= 1){
			$('#btnChkFileSave').addClass('d-none');
		}
		
		if (baseInfoSeq != undefined || baseInfoSeq != null){
			//관련자료 삭제
			$.ajax({
				url : '<c:url value="bm/attachDataDelete" />',
				type : 'POST',
				data  : {
					'attachGubun' : function(){return 'ML';},
					'attachCd' : function(){return attachSeq;},
					'attachSeq' : function(){return baseInfoSeq;},
				},
				success  : function(res){
					$('#attachFileTable').DataTable().ajax.reload();
					toastr.success("삭제되었습니다.");
				}
			});
		} else {
			$('#attachFileTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		tempView1 = 'add';

	});

	$('#btnChkFileSave').on('click', function(){
		var check = true;
		var check2 = true;
		var dataArray = new Array();

		$('#attachFileTable tbody tr').each(function(index, item){
			index++;
			if($("#fileCdNm"+index).val() != null && $("#fileCdNm"+index).val() != 'undefined' && $("#fileCdNm"+index).val() != ''){
				if (attachFileTable.data().count() != 0) {
					if ($(this).find("td input[name=fileNm]").val() == "" || $(this).find("td input[name=fileNm]").val() == undefined) {
						toastr.warning('파일을 선택해 주세요.');
						$(this).find("td input[name=fileNm]").focus();
						return false;
					}
				}
	
				var formData = new FormData(document.getElementById("formChkFile"+index));
	
				formData.append('attachGubun', 'ML');
				formData.append('attachCd', attachSeq);
				formData.append('attachSeq', attachSeq);
				formData.append('attachType', '1');
				formData.append('contents', "");
				formData.append('attchPath', fileDate);
				formData.append('attachRegDate', '');
				formData.append('etc1', '1');
	
				index--;
	
				$.ajax({
					url : '<c:url value="/bm/attachCdDataCreate"/>',
					type : 'POST',
					data : formData,
				    processData: false,
			        contentType: false,
			        async : false,
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
// 								toastr.success('등록되었습니다.');
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {
						$('#btnFileAdd').attr('disabled', false);
						$('#btnFileDel').attr('disabled', false);
	//						btnView = "";
					}
				});
			}
		});
		if(check && check2){
			if(btnView == "add"){
				toastr.success('등록되었습니다.');
			}else{
				toastr.success('수정되었습니다.');
			}
			btnView = '';
			$('#btnChkFileSave').addClass('d-none');
			$('#attachFileTable').DataTable().ajax.reload(function(){});
		}
	});
	
	var workChargrPopupTable;/* 좌표 */
	function attachCdOnClick() {
		if (workChargrPopupTable == null || workChargrPopupTable == undefined) {
			workChargrPopupTable = $('#workChargrPopupTable').DataTable({
				language : lang_kor,
				lengthChange : false,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				searching : false,
				autoWidth : false,
				pageLength : 20,
				ajax : {
					url : '/sm/matrlUserDataList',
					type : 'GET',
					data : {
						'empCd' : '001'
					}
				},
				columns : [ 
					{
						render : function(data, type, row, meta) {
							return meta.row+1;
						},
						'className' : 'text-center'
					},
					{ data : 'userNm'},
					{ data : 'departmentNm'},
					{ data : 'chargeDutyNm'},
					{ data : 'postNm'},
				],
				columnDefs : [ {
					"targets" : '_all',"className" : "text-center"
				} ],
			});
		} else {
			$('#workChargrPopupTable').DataTable().ajax.reload(function() {});
		}
			
		$('#workChargrPopupModal').modal('show');
	}
	$(document).on('click', '#workChargrPopupTable tbody tr', function() {
		var data = workChargrPopupTable.row(this).data();				
		$("#stockChargr"+(tableIdx+1)).val(data.userNm);
		$('#workChargrPopupModal').modal('hide');
	}); 

	var tempSeq;
	//기본정보 - 점검이력사항 테이블
	let ironItemTable = $('#ironItemTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'p>>",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 10,
		ajax : {
			url : '<c:url value="bm/ironItemList"/>',
			type : 'GET',
			async : false,
			data : {
				'equipCd' : function(){return equipCd;},
			},
		},
		columns : [
			{
				data : 'itemCd',
				render : function(data, type, row, meta) {
					if(data == '' || data == null){
						let html = '<input type="text" class="form-control" style="max-width: 100%;" name="itemCd" value="" disabled>';
						html += '<input type="hidden" name="itemSeq" value="">';
						return html;
					} else{
						let html = '<input type="text" class="form-control" style="max-width: 100%;" name="itemCd" value="'+data+'" disabled>';
						html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">';
						return html;
					}
				}
			},
			{
				data : 'itemNm',
				render : function(data, type, row, meta) {
					if(data == null){
						return html = '<input type="text" name="itemNm" class="form-control" style="max-width: 100%;" value="" disabled>';
					} else {
						return html = '<input type="text" name="itemNm" class="form-control" style="max-width: 100%;" value="'+(row['itemNm']==''?'':row['itemNm'])+'" disabled>';
					}
				}
			},
		], 
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
		}, ],
		drawCallback : function(){
		}
	});

	$('#ironItemTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			return false;
		} else {
			$('#ironItemTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		btnView = 'edit';
		
		//tableIdx = $('#ironItemTable').DataTable().row(this).index();
		//idx = ironItemTable.row(tableIdx).data().idx;
	
		
		/* console.log(tableIdx);
		console.log(idx); */
	});

	var popUpCheck = null;
	function itemSelectCdNm() {
		popUpCheck = '품목선택';
		if (itemPartPopUpTable3 != null && itemPartPopUpTable3 != 'undefined') {
			itemPartPopUpTable3.destroy();
		}

		itemPartPopUpTable3 = $('#itemPartPopUpTable3').DataTable({
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
					url : '<c:url value="bm/itemPartAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' :  function(){return '002';},
						'itemGubun' :  function(){return '003';},
					},
				},
				rowId : '',
				columns : [ 
					{
						render : function(data,type,row,meta){
							return meta.row+1;
						}
					}, {
						data : 'itemCd'
					}, {
						data : 'itemNm'
					}, {
						data : 'itemGubunNm'
					}, {
						data : 'itemModelNm'
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
	
			$('#itemPartPopUpModal3').modal('show');
	
			$('#itemPartPopUpTable3 tbody').on('click', 'tr', function() {
				var data = itemPartPopUpTable3.row(this).data();
				let rowLvl = $('#ironItemTable').DataTable().data().count()-1;
				$('#ironItemTable tbody tr').eq(rowLvl).find('input[name=itemSeq]').val(data.itemSeq);
				$('#ironItemTable tbody tr').eq(rowLvl).find('input[name=itemCd]').val(data.itemCd);
				$('#ironItemTable tbody tr').eq(rowLvl).find('input[name=itemNm]').val(data.itemNm);
				$('#itemPartPopUpModal3').modal('hide');
			});
	}

	let ironTableIdx;
	//선텍
	$('#ironItemTable tbody').on('click', 'tr', function() {
		ironTableIdx = ironItemTable.row(this).index();
	});

	
	//추가
	$('#ironBtnAdd').on('click', function() {
		btnDailyCheck = "add";
		$('#ironItemTable').DataTable().row.add({}).draw(false);
		$('#ironBtnSave').removeClass('d-none');
		itemSelectCdNm();
	});

	//삭제
	$('#ironBtnDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}
		
		$('#ironItemTable').DataTable().rows(ironTableIdx).remove().draw();
		
		let ironIdx = ironItemTable.row('.selected').data().idx;

		if (ironIdx != undefined && ironIdx != ''){
			//데이터 삭제 
			$.ajax({
				url : '<c:url value="bm/ironItemDelete"/>',
				type : 'POST',
				data  : {
					'equipCd' : function(){return equipCd;},
					'idx' : function(){return ironIdx;},
				},
				success  : function(res){
					$('#ironItemTable').DataTable().rows(ironTableIdx).remove().draw();
				}
			})
		} else {
			$('#ironItemTable').DataTable().rows(ironTableIdx).remove().draw();
		}
		btnView = '';
		
	});
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta) {

		var shtml = "";

		if (btnDailyCheck == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (btnDailyCheck == "add" || btnDailyCheck == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		var option;
// 		option = "<option value=''>선택</option>";
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
	
	//전체체크박스 클릭시
	$('#equipCheckAll').on('click', function(){
		$('input:checkbox[name=equipCheck]').not(':disabled').prop("checked", $(this).prop("checked"));
	});
	
	//설비점검등록 버튼 클릭시
	$('#corrPopUpBox').on('click', function(){
		if ( $('input:checkbox[name=equipCheck]').not(':disabled').is(':checked') ) {
			$('#insertCorrPopUpModal').modal('show');
			setTimeout(function(){
				insertCorrPopUpTable.clear().draw();
			},150)

			setDateBox();
			
		} else {
		    toastr.warning("등록할 항목을 선택해주세요.");
		}
	});

	let insertCorrPopUpTable = $('#insertCorrPopUpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		paging : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		scrollY: '30vh',
		pageLength : -1,
		ajax : {
			url : '<c:url value="/bm/equipCodeAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' : function(){return "000";},
			},
		},
		columns : [
			{
				render : function(data, type, row, meta) {
					if(data==null || data!=""){
						return '<input type="text" name="datepicker" class="form-control" style="min-width: 100%;" placeholder="점검일자를 선택해주세요." readonly>';
					}
				}
			},
		],
		drawCallback: function(settings) {
			 $("input[name='datepicker']").datepicker({
		        dateFormat: "mm-dd",
		        beforeShow: function(input, inst) {
		          // datepicker가 표시되기 전에 실행되는 콜백 함수입니다.
		          // 년도 선택을 비활성화합니다.
		          inst.dpDiv.find(".ui-datepicker-year").hide();
		        },
		        onChangeMonthYear: function(year, month, inst) {
		          // 월을 변경할 때 실행되는 콜백 함수입니다.
		          // 변경된 월에 맞게 날짜 선택기를 업데이트합니다.
		          inst.input.datepicker("setDate", new Date(year, month - 1, 1));
		        },
		        onSelect: function(dateText, inst) {
		          // 선택된 날짜를 처리하는 로직을 작성합니다.
		          console.log("선택된 날짜:", dateText);
		        }
		      });
		},
		order : [],
		buttons : [],
		columnDefs : [ {
		}, ]
	});

	//선택
	$('#insertCorrPopUpTable tbody').on('click','tr',function() {

		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#insertCorrPopUpTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	
	//설비점검등록 버튼 클릭시 > 추가 버튼 클릭시
	$('#corrAddBox').on('click', function() {
		$('#insertCorrPopUpTable').DataTable().row.add({}).draw(false);
	});

	//설비점검등록 버튼 클릭시 > 추가 버튼 클릭시
	$('#corrCancelBox').on('click', function() {
		$('#insertCorrPopUpTable').DataTable().row('.selected').remove().draw();
	});
	
	//설비점검등록 버튼 클릭시 > 등록 버튼 클릭시
	$('#corrSaveBox').on('click', function(){
		let corrDateList = getCorrDateList();
		if ( Boolean(corrDateList) ) {
			let dataArray = new Array();
			let mitCdList = '';
			$('#equipCodeTable tbody tr').each(function(index, item){
				if ( $(this).find('td input[name=equipCheck]').is(":checked") ) {
					let trData = equipCodeTable.row(this).data();
					let rowData = new Object();
	
					rowData.mitCd = trData.equipCd;
					rowData.corrGubun = '003';
					
					if ( !Boolean(mitCdList) ) {
						mitCdList = `'\${trData.equipCd}'`;
					} else {
						mitCdList += `,'\${trData.equipCd}'`;
					}
					
			        dataArray.push(rowData);
				}
			});
			dataArray[0].mitCdList = mitCdList;
			dataArray[0].corrDate = corrDateList;
			dataArray[0].startCorrYear = $('#startYear').val();
			dataArray[0].endCorrYear = $('#endYear').val();
			
			console.log(dataArray)
			
			$.ajax({
				url : '<c:url value="/bm/corrDataAllCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					
					$('#equipCheckAll').prop("checked", false); //전체 체크박스 체크해제
					$('input:checkbox[name=equipCheck]').prop("checked", false); //체크박스 체크해제
					$('#insertCorrPopUpModal').modal('hide');
					$('#insertCorrPopUpTable input[type="date"]').val(''); //날짜 폼 초기화
					
					if (res.result == 'ok') {
						$('#equipCodeTable').DataTable().ajax.reload(function(){});
						toastr.success('점검이력이 등록되었습니다.');
					} else if (res.result == 'fail') {
						$('#equipCodeTable').DataTable().ajax.reload(function(){});
						toastr.warning("다시 한번 시도해주세요.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		} else {
			toastr.warning("날짜를 입력해주세요.");
		}
		
	});
	
	//철형점검등록 모달 날짜 중복 제거
	$('#insertCorrPopUpTable input[type="date"]').on('change', function() {
		const selectedDate = $(this).val();
		let equalYn = false;
		
	    // 테이블 내의 모든 날짜 입력 필드들을 순회하며 비교
	    $('#insertCorrPopUpTable input[type="date"]').not(this).each(function() {
	    	const currentDate = $(this).val();

	        // 년도와 월이 동일한 경우
	        if (currentDate.substring(0, 7) === selectedDate.substring(0, 7)) {
	        	toastr.warning('년도와 월이 동일한 날짜가 있습니다.');
	        	equalYn = true;
	        	return false; // 반복문 종료
	    	}
		});
	    
	    if (equalYn) { $(this).val('') }
	});
	
	//철형점검등록 모달 날짜 데이터 출력
	function getCorrDateList() {
		var dateArray = []; // 날짜 데이터를 저장할 배열
		
		// 테이블 내부의 날짜 입력 필드에 대해 반복
		$('#insertCorrPopUpTable input[type="text"]').each(function() {
			var dateValue = $(this).val();
			if (dateValue) {
		    	dateArray.push(dateValue);
		  	}
		});
		
		var dateString = dateArray.join(',').replace(/-/g, ''); // 콤마로 구분된 문자열 생성
		return dateString;
	}

	// select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        
        // 발행 뿌려주기
        // 올해 기준으로 -5년부터 보여준다.
        for(var y = (com_year-5); y <= (com_year); y++){
            $("#startYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }

        // 올해 기준으로 -5년부터 보여준다.
        for(var y = (com_year-5); y <= (com_year); y++){
        	$("#endYear").append("<option value='"+ y +"'>"+ y + " 년" +"</option>");
        }
                
        $("#startYear option:eq(5)").prop("selected", true);
        $("#endYear option:eq(5)").prop("selected", true);

    }

	// datepicker를 초기화합니다.
    $(function() {
      $("input[name='datepicker']").datepicker({
        dateFormat: "mm-dd",
        beforeShow: function(input, inst) {
          // datepicker가 표시되기 전에 실행되는 콜백 함수입니다.
          // 년도 선택을 비활성화합니다.
          inst.dpDiv.find(".ui-datepicker-year").hide();
        },
        onChangeMonthYear: function(year, month, inst) {
          // 월을 변경할 때 실행되는 콜백 함수입니다.
          // 변경된 월에 맞게 날짜 선택기를 업데이트합니다.
          inst.input.datepicker("setDate", new Date(year, month - 1, 1));
        },
        onSelect: function(dateText, inst) {
          // 선택된 날짜를 처리하는 로직을 작성합니다.
          console.log("선택된 날짜:", dateText);
        }
      });
    });
</script>

</body>
</html>