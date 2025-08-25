<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
	<!-- 검사항목복사모달 -->
	<div class="modal fade bd-example-modal-lg" id="inspCopyPopUpModal" tabindex="-1" role="dialog" aria-labelledby="inspCopyPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="inspCopyPopUpLabel">검사항목복사</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<form id="formList">
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="inspCopyPopUpTable" class="table table-bordered">
	        				<colgroup>
	        					<col width="15%">
	        					<col width="20%">
	        					<col width="15%">
	        					<col width="20%">
	        					<col width="10%">
	        					<col width="20%">
	        				</colgroup>
	                   		<thead class="thead-light">
		                   		<tr>
									<th>복사검사유형</th>
									<td><select class="custom-select" id="inspChkCp" style="min-width: 100%;" onChange="inspOnchange1()"></select></td>
									<th>복사품번</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="copyCdHide" name="copyCdHide"> 
												<input type="text" class="form-control" id="copyCd" name="copyCd" style="min-width: 100%;" disabled>
												<button type="button" id="btnCopyCd"
												class="btn btn-primary input-sub-search" onClick="copySelectCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
									<th>대상검사유형</th>
									<td><select class="custom-select" id="inspChkCp2" style="min-width: 100%;" onChange="inspOnchange2()"></select></td>
									<td class="d-none">
										<input type="hidden" id="itemCpSeq" name="itemCpSeq">
										<input type="text" id="inspCp" name="inspCp" disabled>
									</td>
		                   		</tr>
<!-- 		                   		<tr> -->
<!-- 		                   		<th>저장품번</th> -->
<!-- 									<td> -->
<!-- 										<div class="row"> -->
<!-- 											<div class="input-sub m-0" style="min-width: 100%;"> -->
<!-- 												<input type="hidden" class="form-control" id="itemCpHide" name="itemCpHide">  -->
<!-- 												<input type="text" class="form-control" id="itemCp" name="itemCp" disabled> -->
<!-- 												<button type="button" id="btnItemCp" -->
<!-- 													class="btn btn-primary input-sub-search" -->
<!-- 													onClick="itemCdSelectInCorpCd()"> -->
<!-- 													<span class="oi oi-magnifying-glass"></span> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</td> -->
<!-- 									<th>복사항목코드</th> -->
<!-- 		                   		</tr> -->
	                   		</thead>
						</table>
					<hr class="text-secondary">
					<div class="modal-body">
					<div class="row">
			      		<button type="button" class="btn btn-primary float-left mr-1" id="btnListAdd">품목추가</button>
			      		<button type="button" class="btn btn-danger float-right" id="btnListDel">품목삭제</button>
			      	</div>
		        		<table id="copyAddTable" class="table table-bordered">
		                	<thead class="thead-light">
			                	<tr>
			                   		<th style="width : 8%"><input type="checkbox" id="delCheck"></th>
									<th style="width : 8%">구분</th>
			                   		<th style="width : 8%">품목구분</th>
			                   		<th style="width : 18%">품번</th>
									<th style="width : 37%">품명</th>
									<th style="width : 13%">고객사</th>
									<th style="width : 8%">상태</th>
									<th>상상태</th>
			                   	</tr>
		                   	</thead>
						</table>
					    <hr class="text-secondary"> 
	      			</div>
	      		</div>
	      		</form>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-primary mr-2" id="btnCpSave">저장</button>
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	<!-- 검사항목복사모달 끝 -->
	<!-- 검사항목관리 코드 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="inspCodePopUpLabel">제품검사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="inspCodePopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   			<th style="width : 7%">구분</th>
		                   			<th style="width : 8%">품목구분</th>
									<th style="width : 22%">품번</th>
									<th style="width : 33%">품명</th>
									<th style="width : 15%">고객사</th>
									<th style="width : 15%">상태</th>
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
	<!-- 검사항목관리 코드 모달 종료-->
	
	<!-- 검사항목관리1 코드 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal1" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel1" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="inspCodePopUpLabel1">제품검사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="inspCodePopUpTable1" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   			<th style="width : 10%">검사항목코드</th>
		                   			<th style="width : 19%">고객사</th>
									<th style="width : 28%">품번</th>
									<th style="width : 33%">품명</th>
									<th style="width : 10%">상태</th>
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
	<!-- 검사항목관리1 코드 모달 종료-->
	
	<!-- 검사항목관리2 코드 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="inspCodePopUpModal2" tabindex="-1" role="dialog" aria-labelledby="inspCodePopUpModalLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="inspCodePopUpLabel2">제품검사조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div>
	      		<div class="modal-body">
	      			<div class="row">
			      		<button type="button" class="btn btn-primary float-left" id="btnListChk">목록추가</button>
			      	</div>
	      			<hr class="text-secondary">
	        			<table id="inspCodePopUpTable2" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
		                   		 	<th style="width : 8%"><input type="checkbox" id="addCheck"></th>
									<th style="width : 8%">구분</th>
		                   			<th style="width : 8%">품목구분</th>
		                   			<th style="width : 22%">품번</th>
									<th style="width : 33%">품명</th>
									<th style="width : 13%">고객사</th>
									<th style="width : 8%">상태</th>
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
	<!-- 검사항목관리2 코드 모달 종료-->
	
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">검사항목관리(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list" style="width: 44%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="inspAdmTable" class="table table-bordered">
							<colgroup>
								<col width="11%">
								<col width="14%">
								<col width="11%">
								<col width="24%">
								<col width="32%">
								<col width="8%">
							</colgroup>
							<thead class="thead-light">
 								<tr> 
									<th>검사항목코드</th>
									<th>외주/협력업체</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>상태</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 55%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand" class="closebtn float-right" onclick="closerNav()">
								<i class="mdi mdi-close"></i>
							</a>
						</div>
						<button type="button" class="btn btn-primary float-left" id="btnCopy">📄</button>
						<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
						<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<!--/오른쪽 등록 부분 상단 버튼 영역-->
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-3">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>검사유형</th>
									<td colspan="3">
										<div class="container">	
											<div class="row">
												<div class="col-sm">
													<input class="custom-radio mt-1" type="radio" id="inspChk1" onclick="inspOnclick()" name="inspChkGrp" value="001" disabled checked> 
													<label for="inspChk1">제품검사</label>
												</div>
												<div class="col-sm d-none">
													<input class="custom-radio mt-1" type="radio" id="inspChk5" onclick="inspOnclick()" name="inspChkGrp" value="005" disabled> 
													<label for="inspChk5">수분측정</label>
												</div>
												<div class="col-sm">
													<input class="custom-radio mt-1" type="radio" id="inspChk2" onclick="inspOnclick()" name="inspChkGrp" value="002" disabled> 
													<label for="inspChk2">공정검사</label>
												</div>
												<div class="col-sm">
													<input class="custom-radio mt-1" type="radio" id="inspChk3" onclick="inspOnclick()" name="inspChkGrp" value="003" disabled> 
													<label for="inspChk3">수입검사</label>
												</div>
												<div class="col-sm">
													<input class="custom-radio mt-1" type="radio" id="inspChk4" onclick="inspOnclick()" name="inspChkGrp" value="004" disabled> 
													<label for="inspChk4">자주검사</label>
												</div>
												
											</div>
										</div>
									</td>
								</tr>
							</table>
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>검사항목코드</th>
									<td>
										<input type="hidden" class="form-control" id="itemSeq" name="itemSeq" style="min-width:100%">
										<input type="text" class="form-control" id="inspCd" name="inspCd" style="min-width:100%" disabled>
									</td>  
			                       	<th class="d-none">구분</th>
		                           	<td class="d-none">
		                            	<div class="row">
		                                	<div class="custom-control custom-radio row ml-4">
		                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg1" value="001" disabled> 
		                                    	<label class="custom-control-label input-label-sm" for="mg1">사출</label>
		                                 	</div>
		                                 	<div class="custom-control custom-radio row ml-2">
		                                    	<input type="radio" class="custom-control-input" name="mainGubun" id="mg2" value="002" disabled> 
		                                    	<label class="custom-control-label input-label-sm" for="mg2">봉제</label>
		                                	</div>
		                            	</div>
		                        	</td>
								</tr>
								<tr>
									<th>품번</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="min-width: 100%;">
												<input type="hidden" class="form-control" id="itemCdHide" name="itemCdHide"> 
												<input type="text" class="form-control" id="itemCd" name="itemCd" style="min-width:100%" disabled>
												<button type="button" id="btnItemCd"
													class="btn btn-primary input-sub-search"
													onClick="itemCdSelectInCorpCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</div>
									</td>
									<th>품명</th>
									<td><input type="text" class="form-control" id="itemNm" name="itemNm" style="min-width:100%" disabled></td>
								</tr>
								<tr>
									<th>고객사</th>
									<td><input type="text" class="form-control" id="itemCusNm" name="itemCusNm" style="min-width:100%" disabled></td>
									<th>상태</th>
									<td><input type="text" class="form-control" id="stateCd" name="stateCd" style="min-width:100%" disabled></td>
								</tr>
								<tr id="inspDescDiv1" class="d-none">
									<th>재질</th>
									<td colspan="3"><input type="text" class="form-control" id="inspDesc1" name="inspDesc1" placeholder="" style="min-width:100%;" disabled></td>
								</tr>
								<tr id="inspDescDiv2" class="d-none">
									<th>GRADE</th>
									<td colspan="3"><input type="text" class="form-control" id="inspDesc2" name="inspDesc2" placeholder="" style="min-width:100%;" disabled></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<div class="card-header card-tab p-0 mb-2">
					<ul class="nav nav-tabs card-header-tabs m-0">
						<li class="nav-item">
							<a class="nav-link active" data-toggle="tab" href="#tab1" id="extTab">외관</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled" data-toggle="tab" href="#tab2" id="sizeTab">치수</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab4" id="weightTab">중량</a>
						</li>
						<li class="nav-item">
							<a class="nav-link disabled d-none" data-toggle="tab" href="#tab3" id="rlbtTab">신뢰성</a>
						</li>
					</ul>
				</div>
				<div class="card-body p-0">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="tab1">
							<div>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnExtAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnExtEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnExtDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnExtSave">저장</button>
							</div>
							<form id="extForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="extAdmTable">
										<colgroup>
											<col width="8%">
											<col width="12%">
											<col width="14%">
											<col width="56%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>사용여부</th>
												<th>*입력방식</th>
												<th>*기준</th>
												<th>*확인방법</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab2">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnSizeAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnSizeEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnSizeDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnSizeSave">저장</button>
							</div>
							<form id="sizeForm" enctype="multipart/form-data">
								<div class="table-responsive d-none" id="sizeAdmTableDiv2">
									<table class="table table-bordered" id="sizeAdmTable2">
										<colgroup id="basicGroup">
											<col width="6%">
											<col width="12%">
											<col width="12%">
											<col width="25%">
											<col width="13%">
											<col width="10%">
											<col width="12%">
											<col width="12%">
										</colgroup>
										<colgroup id="newGroup" class="d-none">
											<col width="6%">
											<col width="11%">
											<col width="12%">
											<col width="12%">
											<col id="orderCol" width="8%">
											<col width="17%">
											<col width="10%">
											<col width="10%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>사용여부</th>
												<th>*입력방식</th>
												<th>*목록</th>
												<th>*순서</th>
												<th>*확인방법</th>
												<th>*구분</th>
												<th colspan="2">*기준</th>
											</tr>
										</thead>
									</table>
								</div>
								<div class="table-responsive" id="sizeAdmTableDiv">
									<table class="table table-bordered" id="sizeAdmTable">
										<colgroup id="basicGroup2">
											<col width="6%">
											<col width="9%">
											<col width="10%">
											<col width="4%">
											<col width="24%">
											<col width="8%">
											<col width="15%">
											<col width="12%">
											<col width="12%">
										</colgroup>
										
										<colgroup id="newGroup2" class="">
											<col width="5%">
											<col width="14%">
											<col width="12%">
											<col width="5%">
											<col id="orderCol" width="8%">
											<col width="23%">
											<col width="10%">
											<col width="15%">
											<col width="11%">
											<col width="11%">
										</colgroup>
										<thead>
											<tr>
												<th rowspan="2">순번</th>
												<th rowspan="2">사용여부</th>
												<th rowspan="2">*입력방식</th>
												<th rowspan="2">특별<br>특성</th>
												<th rowspan="2">*순서</th>
												<th rowspan="2">*기준</th>
												<th rowspan="2">*구분</th>
												<th rowspan="2">*확인방법</th>
												<th colspan="2">SPEC</th>
											</tr>
											<tr>
												<th>*최소</th>
												<th>*최대</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab3">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnRlbtAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnRlbtEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnRlbtDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnRlbtSave">저장</button>
							</div>
							<form id="rlbtForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="rlbtAdmTable">
										<colgroup>
											<col width="20%">
											<col width="20%">
											<col width="20%">
											<col width="30%">
											<col width="10%">
										</colgroup>
										<thead>
											<tr>	
												<th>사용여부</th>
												<th>*입력방식</th>
												<th>*일정</th>
												<th>*계획</th>
												<th>*실적</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
						<div class="tab-pane fade" id="tab4">
							<div class="card-body col-sm-12 p-1">
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnWeightAdd">추가</button>
								<button type="button" class="btn btn-primary float-left ml-1 invisible" id="btnWeightEdit">수정</button>
								<button type="button" class="btn btn-warning float-left ml-1 invisible" id="btnWeightDel">삭제</button>
								<button type="button" class="btn btn-primary float-right d-none ml-1" id="btnWeightSave">저장</button>
							</div>
							<form id="weightForm" enctype="multipart/form-data">
								<div class="table-responsive">
									<table class="table table-bordered" id="weightAdmTable" style="width:100%;">
										<colgroup>
											<col width="6%">
											<col width="10%">
											<col width="12%">
											<col width="23%">
											<col width="14%">
											<col width="10%">
											<col width="12%">
											<col width="12%">
										</colgroup>
										<thead>
											<tr>
												<th>순번</th>
												<th>사용여부</th>
												<th>*입력방식</th>
												<th>*목록</th>
												<th>*확인방법</th>
												<th>*구분</th>
												<th colspan="2">*기준</th>
											</tr>
										</thead>
									</table>
								</div>
							</form>
						</div>
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
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

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

	let currentHref = "bmsc0300";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","검사항목관리(봉제)"); 
	
	//변수설정
	let viewIdx;
	let sideView = 'add';
	let btnView = '';
	var inspCd;
	var seqCheck = 'G';
	var seqCpCheck = 'G';
	var seqCpCheck2 = 'G';
	var inspGubun;
	var inspOnchangeCheck = '001';
	let inspCpCheck = '001';
	let inspCpCheck2 = '001';
	let mainGubunList = '001';
// 	var inspChkCp = '001';
	var inspType = "002";
	var inspExtSeq;
	var inspSizeSeq;
	var inspRlbtSeq;
	var serverDate = "${serverDateTo}";
	var sideView2 = "";
	let itemGubunList = ['001','003'];

	let completYn = 'N';
	
	//화면설정
	uiProc(true);

	//공통코드 처리 시작      
	let useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	let inspChkGrp = new Array();
	<c:forEach items="${inspChkGrp}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspChkGrp.push(json);
	</c:forEach>

	let methodCode = new Array();
	<c:forEach items="${methodCodeList}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	methodCode.push(json);
	</c:forEach>
	
	//확인방법 - 제품검사, 외관
	let inspCheckCode1_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '제품검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode1_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 제품검사, 치수
	let inspCheckCode1_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '제품검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode1_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수분측정, 수분측정
	let inspCheckCode2_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수분측정' && "${info.etc2}" == '수분측정'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode2_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수분측정, 중량
	let inspCheckCode2_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수분측정' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode2_3.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 외관
	let inspCheckCode3_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 치수
	let inspCheckCode3_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 공정검사, 중량
	let inspCheckCode3_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '공정검사' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode3_3.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수입검사, 외관
	let inspCheckCode4_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수입검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode4_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 수입검사, 물성치
	let inspCheckCode4_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '수입검사' && "${info.etc2}" == '물성치'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode4_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 외관
	let inspCheckCode5_1 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '외관'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_1.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 치수
	let inspCheckCode5_2 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '치수'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_2.push(json);
	}
	</c:forEach>
	
	//확인방법 - 자주검사, 중량
	let inspCheckCode5_3 = new Array();
	<c:forEach items="${inspCheck}" var="info">
	if("${info.etc1}" == '자주검사' && "${info.etc2}" == '중량'){
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		inspCheckCode5_3.push(json);
	}
	</c:forEach>

	//검사순서
	let inspOrderCode = new Array();
	<c:forEach items="${inspOrder}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspOrderCode.push(json);
	</c:forEach>

	//기준구분
	let inspStandGubunCode = new Array();
	<c:forEach items="${inspStandGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	inspStandGubunCode.push(json);
	</c:forEach>

	//구분
	let mainGubunCode = new Array();
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunCode.push(json);
	</c:forEach>
	//공통코드 처리 종료
	
	$(document).on('click', '#inspCodePopUpTable2 tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=check]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=check]').prop('checked',true);
		}
	});

	$(document).on('click', '#copyAddTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=check2]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=check2]').prop('checked',true);
		}
	});

	$('#addCheck').on('click',function(){
		if($('#addCheck').prop("checked")){
			$('input:checkbox[name=check]').prop("checked",true);
			$('#inspCodePopUpTable2 tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=check]').prop("checked",false);
			$('#inspCodePopUpTable2 tbody tr').removeClass('selected');
		}
	});
	
	$('#delCheck').on('click',function(){
		if($('#delCheck').prop("checked")){
			$('input:checkbox[name=check2]').prop("checked",true);
			$('#copyAddTable tbody tr').addClass('selected');
		}else{
			$('input:checkbox[name=check2]').prop("checked",false);
			$('#copyAddTable tbody tr').removeClass('selected');
		}
	});

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#btnCopy').attr('disabled', false);
		$('#inspChkGrp').attr('disabled', false);

		if(inspOnchangeCheck == '001'){
			$('#inspDescDiv1').addClass('d-none');
			$('#inspDescDiv2').addClass('d-none');
		}else if(inspOnchangeCheck == '002'){
			$('#inspDescDiv1').addClass('d-none');
			$('#inspDescDiv2').addClass('d-none');
		}else if(inspOnchangeCheck == '003'){
			$('#inspDesc1').attr('disabled');
			$('#inspDesc2').attr('disabled');
		}else if(inspOnchangeCheck == '004'){
			$('#inspDescDiv1').addClass('d-none');
			$('#inspDescDiv2').addClass('d-none');
		}else if(inspOnchangeCheck == '005'){
			$('#inspDesc1').attr('disabled');
			$('#inspDesc2').attr('disabled');
		}
		
		$('#btnExtAdd').addClass('invisible');
		$('#btnExtEdit').addClass('invisible');
		$('#btnExtDel').addClass('invisible');
 		$('#btnExtSave').addClass('invisible');
		
		$('#btnSizeAdd').addClass('invisible');
		$('#btnSizeEdit').addClass('invisible');
		$('#btnSizeDel').addClass('invisible');
 		$('#btnSizeSave').addClass('invisible');
		
		$('#btnRlbtAdd').addClass('invisible');
		$('#btnRlbtEdit').addClass('invisible');
		$('#btnRlbtDel').addClass('invisible');
 		$('#btnRlbtSave').addClass('invisible');

		$('#btnWeightAdd').addClass('invisible');
		$('#btnWeightEdit').addClass('invisible');
		$('#btnWeightDel').addClass('invisible');
 		$('#btnWeightSave').addClass('invisible');
 		
 		//변경이력
 		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');

 		sideView2="";
 		$('#weightAdmTable').DataTable().ajax.reload();
// 		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload();

		$('#extTab').trigger('click');
	});

// 	$("#dealCorpNm").attr("disabled", true);
// 	$("#btnEdit").attr("disabled", true);
// 	$("#btnDel").attr("disabled", true);
	

	// 목록
	let inspAdmTable = $('#inspAdmTable').DataTable({
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
			url : '<c:url value="bm/inspAdmList"/>',
			type : 'GET',
			data : {
				'inspGubun' : function(){return inspOnchangeCheck;},
				'mainGubun' : function(){return '002';},
			},
		},
		columns : [
			{ data : 'inspCd', 'className' : 'text-center' }, //검사항목코드
			{ data : 'itemCusNm', 'className' : 'text-center' }, //외주/협력업체
			{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
			{ data : 'itemCd', 'className' : 'text-center' }, //품번
			{ data : 'itemNm', 'className' : 'text-center' }, //품명
			{ data : 'stateCd', 'className' : 'text-center' }, //상태
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '검사항목관리'
		}, 'print' ],
		columnDefs : []
	});

	let copyAddTable = $('#copyAddTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language	 : lang_kor,
		paging		 : false,
		info		 : false,
		ordering	 : true,
		processing	 : true,
		autoWidth	 : false,
		lengthChange : false,
		searching	 : true,
		scrollX		 : false,
		scrollY		 : '50vh',
		ajax : {
			url	 : '<c:url value="bm/copyAddTableReset"/>',
			type : 'get',
			data : {
			},
		},
		columns : [
			{
				data : 'itemSeq',
				render : function(data, type, row, meta){
					return '<input type="checkbox" name="check2">';
				}
			},{
				data : 'mainGubunNm'
			},{
				data : 'itemGubunNm'
			},{
				data : 'itemCd'
			},{
				data : 'itemNm'
			},{
				data : 'itemCusNm'
			},{
				data : 'stateCdNm'
			},
			{
				render : function(){
					return completYn;
				}
			}
		],
		order 	: [[0, 'asc']],
		buttons : [],
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center nowrap"
		}, ]
	});
	
	
	let inspCodePopUpTable1;
	function copySelectCd(){
		if(inspCodePopUpTable1 != null && inspCodePopUpTable1 != 'undefined'){
		    inspCodePopUpTable1.destroy();
		}
		inspCodePopUpTable1 = $('#inspCodePopUpTable1').DataTable({
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
				url : '<c:url value="bm/inspAdmList"/>',
				type : 'GET',
				data : {
					'inspGubun' : function(){return $('#inspChkCp').val();},
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [
				{data : 'inspCd'},
				{data : 'itemCusNm'},
				{data : 'itemCd'},
				{data : 'itemNm'},
				{data : 'stateCd'},
			],
			order : [ [ 0, 'asc' ] ],
			buttons : [ 'copy', {
				extend : 'excel',
				title : '검사항목관리'
			}, 'print' ],
			columnDefs : [ {
				"defaultContent" : "-",
				"targets" : "_all",
				"className" : "text-center"
			}, ]
		});
		
		$('#inspCodePopUpTable1 tbody').on('click', 'tr', function(){
			let data = inspCodePopUpTable1.row(this).data();
			$('#inspCp').val(data.inspCd);
			$('#copyCd').val(data.itemCd);
// 			$('#itemSeq').val(data.itemSeq);

			$('#inspCodePopUpModal1').modal('hide');
		});
		$('#inspCodePopUpModal1').modal('show');
	}

	$('#btnListChk').on('click', function(){
		if($('input:checkbox[name=check]').is(":checked")==false){
			toastr.warning("추가할 항목을 선택해주세요.");
			return false;
		}
		$('#inspCodePopUpTable2 tbody tr').each(function(index, item){
			var data = inspCodePopUpTable2.row(this).data();
			if($(this).find('td input[name=check]').is(":checked") == true){
				$('#copyAddTable').DataTable().row.add({
						'itemSeq'     : data.itemSeq,
						'mainGubunNm' : data.mainGubunNm,
						'itemGubunNm' : data.itemGubunNm,
						'itemCd'	  : data.itemCd,
						'itemNm'	  : data.itemNm,
						'itemCusNm'	  : data.itemCusNm,
						'stateCdNm'	  : data.stateCdNm,
				}).draw(true);
			}
		});
		$('#inspCodePopUpModal2').modal('hide');
		$('#addCheck').prop("checked",false);
	});
	
	let idxCt;
	let inspCodePopUpTable2;
	$('#btnListAdd').on('click', function(){
		if (inspCodePopUpTable2 != null && inspCodePopUpTable2 != 'undefined') {
			inspCodePopUpTable2.destroy();
		}
		inspCodePopUpTable2 = $('#inspCodePopUpTable2').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
			language	: lang_kor,
			paging		: false,
			info		: true,
			ordering	: true,
			processing	: true,
			autoWidth	: false,
			scrollX		: false,
			lengthChange: true,
			async		: false,
			scrollY		: '60vh',
			pageLength	: 10,
			ajax : {
				url : '<c:url value="/bm/inspPartAdmList"/>',
				type : 'GET',
				data : {
					'inspGubun' : function(){return $('#inspChkCp2').val();},
					//'itemGubunList' : function(){return itemGubunList;},
					'mainGubun' : function(){return '002';},
				},
			},
			columns : [
				{
					data : 'itemSeq',
					render : function(data, type, row, meta){
						return '<input type="checkbox" name="check">';
					}
				},
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
				if(inspOnchangeCheck == '001'){
					$('#inspCodePopUpLabel').text('제품검사조회');
				}else if(inspOnchangeCheck == '002'){
					$('#inspCodePopUpLabel').text('공정검사조회');
				}else if(inspOnchangeCheck == '003'){
					$('#inspCodePopUpLabel').text('수입검사조회');
				}else if(inspOnchangeCheck == '004'){
					$('#inspCodePopUpLabel').text('자주검사조회');
				}else if(inspOnchangeCheck == '005'){
					$('#inspCodePopUpLabel').text('수분측정조회');
				}
			},
			//$('#inspCodePopUpModal2').modal('hide');
		});
		setTimeout(function(){
			inspCodePopUpTable2.draw();
		},150);
		$('#inspCodePopUpModal2').modal('show');
	});

	//복사 리스트 제거
	$('#btnListDel').on('click',function(){
		if($('input:checkbox[name=check2]').is(":checked")==false){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		var arr = [];
		$('#copyAddTable tbody tr').each(function(index, item) {
			if ($(this).find('td input[name=check2]').is(":checked") == true) {
				arr.push(index);
			}
		});
		$('#copyAddTable').DataTable().rows(arr).remove().draw();	
		$('input[name=check2]').prop("checked",false); 
		$('#delCheck').prop("checked",false); 
	});

	//제품검사조회
	let inspCodePopUpTable;
	function itemCdSelectInCorpCd() {
		if (inspCodePopUpTable != null && inspCodePopUpTable != 'undefined') {
			inspCodePopUpTable.destroy();
		}
		inspCodePopUpTable = $('#inspCodePopUpTable').DataTable({	
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
				url : '<c:url value="/bm/inspPartAdmList"/>',
				type : 'GET',
				data : {
					'inspGubun' : function(){return inspOnchangeCheck;},
					'itemGubunList' : function(){return itemGubunList;},
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
				if(inspOnchangeCheck == '001'){
					$('#inspCodePopUpLabel').text('제품검사조회');
				}else if(inspOnchangeCheck == '002'){
					$('#inspCodePopUpLabel').text('공정검사조회');
				}else if(inspOnchangeCheck == '003'){
					$('#inspCodePopUpLabel').text('수입검사조회');
				}else if(inspOnchangeCheck == '004'){
					$('#inspCodePopUpLabel').text('자주검사조회');
				}else if(inspOnchangeCheck == '005'){
					$('#inspCodePopUpLabel').text('수분측정조회');
				}
			}
		});
	
	//코드 팝업 시작
// 	let inspCodePopUpTable;
// 	function itemCdSelectInCorpCd() {
// 		if (inspCodePopUpTable != null && inspCodePopUpTable != 'undefined') {
// 			inspCodePopUpTable.destroy();
// 		}
// 		inspCodePopUpTable = $('#inspCodePopUpTable').DataTable({	
// 			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
// 					+ "<'row'<'col-sm-12'tr>>"
// 					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
// 			language : lang_kor,
// 			paging : true,
// 			info : true,
// 			ordering : true,
// 			processing : true,
// 			autoWidth : false,
// 			scrollX : false,
// 			lengthChange : true,
// 			async : false,
// 			pageLength : 10,
// 			ajax : {
// 				url : '<c:url value="/bm/itemPartAdmList"/>',
// 				type : 'GET',
// 				data : {
// 					'inspGubun' : function(){return inspOnchangeCheck;},
// 					'itemGubunList' : function(){return itemGubunList;},
// 					'mainGubun' : function(){return '002';},
// 				},
// 			},
// 			columns : [ 
// 				{
// 					data : 'mainGubunNm'
// 				},
// 				{
// 					data : 'itemGubunNm'
// 				},
// 				{
// 					data : 'itemCd'
// 				}, 
// 				{
// 					data : 'itemNm'
// 				}, 
// 				{
// 					data : 'itemCusNm'
// 				}, 
// 				{
// 					data : 'stateCdNm'
// 				}  
// 			],
// 			columnDefs : [ {
// 				"defaultContent" : "-",
// 				"targets" : "_all",
// 				"className" : "text-center"
// 			} ],
// 			order : [ [ 0, 'asc' ] ],
// 			buttons : [],
// 			drawCallback : function(){
// 				if(inspOnchangeCheck == '001'){
// 					$('#inspCodePopUpLabel').text('제품검사조회');
// 				}else if(inspOnchangeCheck == '002'){
// 					$('#inspCodePopUpLabel').text('공정검사조회');
// 				}else if(inspOnchangeCheck == '003'){
// 					$('#inspCodePopUpLabel').text('수입검사조회');
// 				}else if(inspOnchangeCheck == '004'){
// 					$('#inspCodePopUpLabel').text('자주검사조회');
// 				}else if(inspOnchangeCheck == '005'){
// 					$('#inspCodePopUpLabel').text('수분측정조회');
// 				}
// 			}
// 		});
		
		$('#inspCodePopUpTable tbody').on('click', 'tr', function() {
			var data = inspCodePopUpTable.row(this).data();
			
			if(data.mainGubun == '001'){
				$('#mg1').prop('checked', true);
				$('#mg2').prop('checked', false);
				$('#sizeAdmTableDiv2').removeClass('d-none');
				$('#sizeAdmTableDiv').addClass('d-none');
			} else if (data.mainGubun == '002'){
				$('#mg1').prop('checked', false);
				$('#mg2').prop('checked', true);
				$('#sizeAdmTableDiv2').addClass('d-none');
				$('#sizeAdmTableDiv').removeClass('d-none');
			} else {
				$('#mg1').prop('checked', false);
				$('#mg2').prop('checked', false);
				$('#sizeAdmTableDiv2').addClass('d-none');
				$('#sizeAdmTableDiv').removeClass('d-none');
			}
			$('#itemCp').val(data.itemCd);
			$('#itemSeq').val(data.itemSeq);
			$('#itemCd').val(data.itemCd);
			$('#itemNm').val(data.itemNm);
			$('#itemCusNm').val(data.itemCusNm);
			$('#stateCd').val(data.stateCdNm);
			
			sizeAdmTable.draw();
			sizeAdmTable2.draw();

			
			$('#inspCodePopUpModal').modal('hide');
		});
		$('#inspCodePopUpModal').modal('show');
	}
	
	// 보기
	$('#inspAdmTable tbody').on('click','tr',function() {
		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#inspAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		inspCd = inspAdmTable.row(this).data().inspCd;
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //삭제버튼

		if($("#inspChkGrp option:selected").val()=="005"){
			$('#sizeTab').trigger('click');
		}else{
			$('#extTab').trigger('click');
		}
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/inspAdmRead"/>',
			type : 'GET',
			data : {
				'inspCd' : function(){return inspCd;},
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';

				$('#inspCd').val(data.inspCd);
				$('#itemSeq').val(data.itemSeq);
				$('#itemCd').val(data.itemCd);
				$('#itemNm').val(data.itemNm);
				$('#itemCusNm').val(data.itemCusNm);
				$('#stateCd').val(data.stateCd);

				$('#inspDesc1').val(data.inspDesc1);
				$('#inspDesc2').val(data.inspDesc2);

				$('#inspDescDiv1').addClass('d-none');
				$('#inspDescDiv2').addClass('d-none');
				
				if(data.inspGubun == '001'){
					$('#inspChk1').prop('checked', true);
				}else if(data.inspGubun == '002'){
					$('#inspChk2').prop('checked', true);
				}else if(data.inspGubun == '003'){
					$('#inspDescDiv1').removeClass('d-none');
					$('#inspDescDiv2').removeClass('d-none');
					$('#inspChk3').prop('checked', true);
				}else if(data.inspGubun == '004'){
					$('#inspChk4').prop('checked', true);
				}else if(data.inspGubun == '005'){
					$('#inspDescDiv1').removeClass('d-none');
					$('#inspDescDiv2').removeClass('d-none');
					$('#inspChk5').prop('checked', true);
				}

				//라디오버튼
				if(data.mainGubun == '001'){
					$('#mg1').prop('checked', true);
					$('#sizeAdmTableDiv2').removeClass('d-none');
					$('#sizeAdmTableDiv').addClass('d-none');
				}else if(data.mainGubun == '002'){
					$('#mg2').prop('checked', true);
					$('#sizeAdmTableDiv2').addClass('d-none');
					$('#sizeAdmTableDiv').removeClass('d-none');
				} 

				//공정순서 항목 숨김처리
// 				if ( inspOnchangeCheck == "003" && inspType == "002" ) {
// 					sizeAdmTable.column( 3 ).visible(true);
// 					sizeAdmTable2.column( 3 ).visible(true);
				
// 					$('#newGroup').removeClass('d-none');
// 					$('#basicGroup').addClass('d-none');

// 					$('#newGroup2').removeClass('d-none');
// 					$('#basicGroup2').addClass('d-none');
// 				} else {
					sizeAdmTable.column( 4 ).visible(false);
					sizeAdmTable2.column( 4 ).visible(false);

					$('#newGroup').addClass('d-none');
					$('#basicGroup').removeClass('d-none');

					$('#newGroup2').addClass('d-none');
					$('#basicGroup2').removeClass('d-none');
// 				}
				
				$('#sizeAdmTable').DataTable().ajax.reload(function(){});
				$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
				$('#extAdmTable').DataTable().ajax.reload(function(){});
				$('#rlbtAdmTable').DataTable().ajax.reload(function(){});
				$('#weightAdmTable').DataTable().ajax.reload(function(){});

			}
		});
	});
	
	var html1 = '<div class="row">';
    html1 += '&nbsp;&nbsp;&nbsp;&nbsp;<label class="input-label-sm">유형</label>';
	html1 += '<select class="custom-select" id="inspChkGrp" onChange="inspOnchange()">';
	html1 += '</select>';
    html1 += '</div>';

	$('#inspAdmTable_length').html(html1);
	selectBoxAppend(inspChkGrp, "inspChkGrp", "", "");
	selectBoxAppend(inspChkGrp, "inspChkCp", "", "");
	selectBoxAppend(inspChkGrp, "inspChkCp2", "", "");
	selectBoxAppend(mainGubunCode, "mainGubun", mainGubunList, "");
	inspType = "002"

	function mainGubunOnChange(){
		mainGubunList = $('#mainGubun option:selected').val();
		$('#inspAdmTable').DataTable().ajax.reload();
	}
	
	//유형 셀렉트박스 변경 시
	function inspOnchange(){
		$('#inspDescDiv1').addClass('d-none');
		$('#inspDescDiv2').addClass('d-none');
		$('#extTab').trigger('click');
		inspOnchangeCheck = $("#inspChkGrp option:selected").val();
		$('#sizeTab').text('치수');
		inspType = "002"
		if ( inspOnchangeCheck == '001' ) {//제품검사
			$('#inspChk1').prop('checked', true);
			seqCheck = 'G';
			itemGubunList = ['001','003'];
			
			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		} else if ( inspOnchangeCheck == '002' ) {//공정검사
			$('#inspChk2').prop('checked', true);
			seqCheck = 'P';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		} else if ( inspOnchangeCheck == '003' ) {//수입검사
			$('#inspChk3').prop('checked', true);
			seqCheck = 'E';
			itemGubunList = ['003', '004', '005'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			$('#sizeTab').addClass('disabled');

			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#rlbtTab').addClass('disabled');

			$('#inspDescDiv1').removeClass('d-none');
			$('#inspDescDiv2').removeClass('d-none');
			
// 			$('#sizeTab').text('물성치');
		} else if ( inspOnchangeCheck == '004' ) {//자주검사
			$('#inspChk4').prop('checked', true);
			seqCheck = 'J';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#weightTab').addClass('disabled');
		} else if (inspOnchangeCheck == '005') {//수분측정
			$('#inspChk5').prop('checked', true);
			seqCheck = 'W';
			itemGubunList = ['003', '004', '005'];

			$('#extTab').addClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').removeClass('d-none');

			$('#extTab').removeClass('active');
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').addClass('disabled');
			$('#sizeTab').trigger('click');

			$('#inspDescDiv1').removeClass('d-none');
			$('#inspDescDiv2').removeClass('d-none');
			
			$('#sizeTab').text('수분측정');
			inspType = "005"
		}

		$('#inspAdmTable').DataTable().ajax.reload(function(){});
		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload();
		$('#weightAdmTable').DataTable().ajax.reload();
	}

	function inspOnchange1(){
		inspCpCheck = $("#inspChkCp option:selected").val();
		if ( inspCpCheck == '001' ) {//제품검사
			$('#inspChk1').prop('checked', true);
			seqCpCheck = 'G';
		} else if ( inspCpCheck == '002' ) {//공정검사
			$('#inspChk2').prop('checked', true);
			seqCpCheck = 'P';
		} else if ( inspCpCheck == '003' ) {//수입검사
			$('#inspChk3').prop('checked', true);
			seqCpCheck = 'E';
		} else if ( inspCpCheck == '004' ) {//자주검사
			$('#inspChk4').prop('checked', true);
			seqCpCheck = 'J';
		} else if (inspCpCheck == '005') {//수분측정
			$('#inspChk5').prop('checked', true);
			seqCpCheck = 'W';
		}
		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'POST',
			data : {
				'seqCheck' : function(){return seqCpCheck;},
			}
		});

		$('#inspAdmTable').DataTable().ajax.reload(function(){});
	}

	function inspOnchange2(){
		inspCpCheck2 = $("#inspChkCp2 option:selected").val();
		if ( inspCpCheck2 == '001' ) {//제품검사
			$('#inspChk1').prop('checked', true);
			seqCpCheck2 = 'G';
		} else if ( inspCpCheck2 == '002' ) {//공정검사
			$('#inspChk2').prop('checked', true);
			seqCpCheck2 = 'P';
		} else if ( inspCpCheck2 == '003' ) {//수입검사
			$('#inspChk3').prop('checked', true);
			seqCpCheck2 = 'E';
		} else if ( inspCpCheck2 == '004' ) {//자주검사
			$('#inspChk4').prop('checked', true);
			seqCpCheck2 = 'J';
		} else if (inspCpCheck2 == '005') {//수분측정
			$('#inspChk5').prop('checked', true);
			seqCpCheck2 = 'W';
		}
		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'POST',
			data : {
				'seqCheck' : function(){return seqCpCheck2;},
			},
			success : function(res) {
				data = res.inspCd;
				$('#inspCd').val(data);
			}
		});

// 		$('#extAdmTable').DataTable().ajax.reload();
// 		$('#sizeAdmTable2').DataTable().ajax.reload();
// 		$('#sizeAdmTable').DataTable().ajax.reload();
// 		$('#rlbtAdmTable').DataTable().ajax.reload();
// 		$('#weightAdmTable').DataTable().ajax.reload();
		$('#inspAdmTable').DataTable().ajax.reload(function(){});
	}
	

	
	//검사유형 라디오버튼 클릭 시
	function inspOnclick(){
		$('#inspDescDiv1').addClass('d-none');
		$('#inspDescDiv2').addClass('d-none');
		inspOnchangeCheck = $('input[name=inspChkGrp]:checked').val();
		$('#sizeTab').text('치수');
		inspType = "002"
		if ( inspOnchangeCheck == '001' ) {//제품검사
			$('#extTab').trigger('click');
			seqCheck = 'G';
			itemGubunList = ['001','003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').removeClass('disabled');
			
		} else if ( inspOnchangeCheck == '002' ) {//공정검사
			$('#extTab').trigger('click');
			seqCheck = 'P';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').removeClass('disabled');

		} else if ( inspOnchangeCheck == '003' ) {//수입검사
			$('#extTab').trigger('click');
			seqCheck = 'E';
			itemGubunList = ['003', '004', '005'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').addClass('disabled');
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').removeClass('disabled');
			$('#rlbtTab').removeClass('disabled');

			$('#inspDescDiv1').removeClass('d-none');
			$('#inspDescDiv2').removeClass('d-none');
			
// 			$('#sizeTab').text('물성치');
		} else if ( inspOnchangeCheck == '004' ) {//자주검사
			$('#extTab').trigger('click');
			seqCheck = 'J';
			itemGubunList = ['001', '003'];

			$('#extTab').removeClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#weightTab').addClass('d-none');
			
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').removeClass('disabled');
			
		} else if ( inspOnchangeCheck == '005' ) {//수분측정
			$('#sizeTab').trigger('click');
			seqCheck = 'W';
			itemGubunList = ['003', '004', '005'];
			
			$('#extTab').addClass('d-none');
			$('#rlbtTab').addClass('d-none');
			$('#sizeTab').removeClass('d-none');
			$('#weightTab').removeClass('d-none');
			
			$('#extTab').removeClass('active');
			$('#sizeTab').removeClass('disabled');
			$('#weightTab').removeClass('disabled');

			$('#inspDescDiv1').removeClass('d-none');
			$('#inspDescDiv2').removeClass('d-none');
			
			$('#sizeTab').text('수분측정');
			inspType = "005"
		}
		
		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'POST',
			data : {
				'seqCheck' : function(){return seqCheck;},
			},
			success : function(res) {
				data = res.inspCd;
				$('#inspCd').val(data);
			}
		});
		
		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload();
		$('#weightAdmTable').DataTable().ajax.reload();
	}
	
	function deleteOnclick(){
		$('#itemSeq').val('');
		$('#itemCd').val('');
		$('#itemNm').val('');
		$('#itemCusNm').val('');
		$('#stateCd').val('');
		$('#mg1').prop('checked', false);
		$('#mg2').prop('checked', false);
	}

	// 복사폼
	$('#btnCopy').on('click', function(){
		$('#formList').each(function() {this.reset();});
		$('#form').each(function() {this.reset();});
		$('#copyAddTable').DataTable().ajax.reload(function(){
			setTimeout(function(){
				copyAddTable.draw();
			},150);
		});
		

		$('#extAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		$('#rlbtAdmTable').DataTable().ajax.reload(function(){});
		$('#weightAdmTable').DataTable().ajax.reload(function(){});
		

		if(inspCpCheck == '001'){
			$('#inspChk1').prop('checked', true);
		}else if(inspCpCheck == '002'){
			$('#inspChk2').prop('checked', true);
		}else if(inspCpCheck == '003'){
			$('#inspChk3').prop('checked', true);
		}else if(inspCpCheck == '004'){
			$('#inspChk4').prop('checked', true);
		}else if(inspCpCheck == '005'){
			$('#inspChk5').prop('checked', true);
		}
		
		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'post',
			data : {
				'seqCheck' : function(){return seqCpCheck;},
			},
			success : function(res){
				data = res.inspCd;
				$('#inspCd').val(data);
			}
		});
		$('#inspCopyPopUpModal').modal('show');
	});


	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#inspAdmTable').DataTable().$('tr.selected').removeClass('selected');
		
		$('#form').each(function() {this.reset();});
		inspCd = 'none';
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		$('#sizeAdmTable2').DataTable().ajax.reload(function(){});
		$('#rlbtAdmTable').DataTable().ajax.reload(function(){});
		$('#weightAdmTable').DataTable().ajax.reload(function(){});

		
		if(inspOnchangeCheck == '001'){
			$('#inspChk1').prop('checked', true);
		}else if(inspOnchangeCheck == '002'){
			$('#inspChk2').prop('checked', true);
		}else if(inspOnchangeCheck == '003'){
			$('#inspChk3').prop('checked', true);
		}else if(inspOnchangeCheck == '004'){
			$('#inspChk4').prop('checked', true);
		}else if(inspOnchangeCheck == '005'){
			$('#inspChk5').prop('checked', true);
		}
		
		//공정순서 항목 숨김처리
		sizeAdmTable.column( 4 ).visible(false);
		sizeAdmTable2.column( 4 ).visible(false);
		$('#newGroup').addClass('d-none');
		$('#basicGroup').removeClass('d-none');
		$('#newGroup2').addClass('d-none');
		$('#basicGroup2').removeClass('d-none');
		
		//설비코드 중복체크
		$('#btnCheck').attr("disabled", false);
		
		//화면처리        
		uiProc(false);

		$.ajax({
			url : '<c:url value="/bm/inspAdmSeq"/>',
			type : 'POST',
			data : {
				'seqCheck' : function(){return seqCheck;},
			},
			success : function(res) {
				data = res.inspCd;
				$('#inspCd').val(data);
			}
		});

		$('#btnSave').removeClass('d-none'); // 등록버튼
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnDel').attr('disabled', true); //삭제버튼
		$('#btnCopy').attr('disabled', true);//복사버튼
		$('#inspChkGrp').attr('disabled', true);
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		$('#btnExtAdd').removeClass('invisible');
		$('#btnExtEdit').removeClass('invisible');
		$('#btnExtDel').removeClass('invisible');
 		$('#btnExtSave').removeClass('invisible');
		
		$('#btnSizeAdd').removeClass('invisible');
		$('#btnSizeEdit').removeClass('invisible');
		$('#btnSizeDel').removeClass('invisible');
 		$('#btnSizeSave').removeClass('invisible');
		
		$('#btnRlbtAdd').removeClass('invisible');
		$('#btnRlbtEdit').removeClass('invisible');
		$('#btnRlbtDel').removeClass('invisible');
		$('#btnRlbtSave').removeClass('invisible');

		$('#btnWeightAdd').removeClass('invisible');
		$('#btnWeightEdit').removeClass('invisible');
		$('#btnWeightDel').removeClass('invisible');
 		$('#btnWeightSave').removeClass('invisible');

 		
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요.");
			return false;
		}
		uiProc(false);
		$('input[name=inspChkGrp]').attr('disabled',true);
		
		//수정관련 기능(검사코드는 수정 불가)
		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#baseInfoCd').attr('disabled', true);

		$('#btnCopy').attr('disabled', true);//복사버튼
		$('#btnSave').removeClass('d-none');
		$('#inspChkGrp').attr('disabled', true);
		
		$('#extTab').removeClass('disabled');
		$('#sizeTab').removeClass('disabled');
		$('#rlbtTab').removeClass('disabled');
		$('#weightTab').removeClass('disabled');
		
		$('#btnExtAdd').removeClass('invisible');
		$('#btnExtEdit').removeClass('invisible');
		$('#btnExtDel').removeClass('invisible');
 		$('#btnExtSave').removeClass('invisible');
		
		$('#btnSizeAdd').removeClass('invisible');
		$('#btnSizeEdit').removeClass('invisible');
		$('#btnSizeDel').removeClass('invisible');
 		$('#btnSizeSave').removeClass('invisible');
		
		$('#btnRlbtAdd').removeClass('invisible');
		$('#btnRlbtEdit').removeClass('invisible');
		$('#btnRlbtDel').removeClass('invisible');
 		$('#btnRlbtSave').removeClass('invisible');

		$('#btnWeightAdd').removeClass('invisible');
		$('#btnWeightEdit').removeClass('invisible');
		$('#btnWeightDel').removeClass('invisible');
 		$('#btnWeightSave').removeClass('invisible');

 		//변경이력
 		$('#changeHisTable').removeClass('d-none');

	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}
		sideView = 'add';
		
		$('#form').each(function(){this.reset();});
		if(inspOnchangeCheck == '001'){
			$('#inspChk1').prop('checked', true);
		}else if(inspOnchangeCheck == '002'){
			$('#inspChk2').prop('checked', true);
		}else if(inspOnchangeCheck == '003'){
			$('#inspChk3').prop('checked', true);
		}else if(inspOnchangeCheck == '004'){
			$('#inspChk4').prop('checked', true);
		}else if(inspOnchangeCheck == '005'){
			$('#inspChk5').prop('checked', true);
		}
		
		$.ajax({
			url : '<c:url value="bm/inspAdmDelete"/>',
			type : 'POST',
			data :{
				'inspCd' : function(){return inspCd;},
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#inspAdmTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	// 저장 처리
	$('#btnSave').on('click', function() {
		var check = true;
		var check2 = true;
		var check3 = true;
		var dataArray = new Array();
		var dataArray2 = new Array();
		var dataArray3 = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		//기본 입력값 검사
		if (!$.trim($('#inspCd').val())) {
			toastr.warning('검사항목코드를 입력해주세요.');
			$('#inspCd').focus();
			return false;
		}

		if (!$.trim($('#itemCd').val())) {
			toastr.warning('품번을 입력해주세요.');
			$('#btnItemCd').focus();
			return false;
		}

		var url = '<c:url value="/bm/inspAdmCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/bm/inspAdmUpdate"/>';
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'inspGubun' : $('input[name=inspChkGrp]:checked').val(),
				'inspCd' : $('#inspCd').val(),
				'itemSeq' : $('#itemSeq').val(),
				'inspDesc1' : $('#inspDesc1').val(),
				'inspDesc2' : $('#inspDesc2').val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#btnAddConfirm').removeClass('d-none');
				$('#btnAddConfirmLoading').addClass('d-none');
				$('#btnSelDealCorp').attr('disabled', true);
				$('#inspChkGrp').attr('disabled', false);
				$('#btnAdd').attr('disabled', false);
				$('#btnEdit').attr('disabled', false);
				$('#btnDel').attr('disabled', false);
				$('#btnCopy').attr('disabled', false);

				if(inspOnchangeCheck == '003' || inspOnchangeCheck == '005'){
					$('#inspDescDiv1').removeClass('d-none');
					$('#inspDescDiv2').removeClass('d-none');
				}else {
					$('#inspDescDiv1').addClass('d-none');
					$('#inspDescDiv2').addClass('d-none');
				}
				
				$('#btnExtAdd').addClass('invisible');
				$('#btnExtEdit').addClass('invisible');
				$('#btnExtDel').addClass('invisible');
		 		$('#btnExtSave').addClass('invisible');
				
				$('#btnSizeAdd').addClass('invisible');
				$('#btnSizeEdit').addClass('invisible');
				$('#btnSizeDel').addClass('invisible');
		 		$('#btnSizeSave').addClass('invisible');
				
				$('#btnRlbtAdd').addClass('invisible');
				$('#btnRlbtEdit').addClass('invisible');
				$('#btnRlbtDel').addClass('invisible');
		 		$('#btnRlbtSave').addClass('invisible');

				$('#btnWeightAdd').addClass('invisible');
				$('#btnWeightEdit').addClass('invisible');
				$('#btnWeightDel').addClass('invisible');
		 		$('#btnWeightSave').addClass('invisible');
				
			}
		});
		
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
			});
		}else{
			$('#changeHisTable').addClass('d-none');
		}
		
		if (sideView == "edit") {
			toastr.success('수정되었습니다.');
		} else {
			toastr.success('등록되었습니다.');
		}
		sideView = 'edit';
		sideView2 = "";
		
		//새로고침
		$('#inspAdmTable').DataTable().ajax.reload(function() {});
		$('#extAdmTable').DataTable().ajax.reload();
		$('#sizeAdmTable2').DataTable().ajax.reload();
		$('#sizeAdmTable').DataTable().ajax.reload();
		$('#rlbtAdmTable').DataTable().ajax.reload(); 
		$('#weightAdmTable').DataTable().ajax.reload(); 
		
		selectBoxAppend(inspChkGrp, "inspChkGrp", inspOnchangeCheck, "");
		selectBoxAppend(mainGubunCode, "mainGubun", mainGubunList, "");
		//화면설정
		uiProc(true);
		uiProc_ext(true);
		uiProc_size(true);
		uiProc_rlbt(true);
		uiProc_weight(true);

		$('#btnExtSave').addClass('d-none');
		$('#btnSizeSave').addClass('d-none');
		$('#btnRlbtSave').addClass('d-none');
		$('#btnSave').addClass('d-none');
	});

    //복사 저장버튼
	$('#btnCpSave').on('click', function(){
		let obj = new Object();
		let dataArray2 = new Array();
		let rowData2 = new Object();

		//품목확인
		if (!$.trim(copyAddTable.row().data())) {
			toastr.warning('품목을 추가해주세요.');
			$('#btnListAdd').focus();
			return false;
		}

		//품번확인
		if (!$.trim($('#copyCd').val())) {
			toastr.warning('복사할 품번을 선택해주세요.');
			$('#btnCopyCd').focus();
			return false;
		}

// 		if (!$.trim($('#itemCp').val())) {
// 			toastr.warning('품번을 입력해주세요.');
// 			$('#btnitemCp').focus();
// 			return false;
// 		}
		
		$('#copyAddTable tbody tr').each(function(){
			rowData2 = new Object();
			rowData2.itemSeq = copyAddTable.row(this).data().itemSeq;
			rowData2.inspCp = $('#inspCp').val();
			rowData2.seqCheck = seqCpCheck2;
			rowData2.inspGubun = $('#inspChkCp2').val();
			rowData2.inspDesc1 = $('#inspDesc1').val();
			rowData2.inspDesc2 = $('#inspDesc2').val();
			dataArray2.push(rowData2);
			setTimeout(function(){
				completYn='Y';
				
			},2000);
		});
		
		$.ajax({
			url : '<c:url value="bm/inspAdmCpCreate"/>',
		    type : 'post',
		    dataType : 'json',
		    data : JSON.stringify(dataArray2),
		    contentType : "application/json; charset=UTF-8",
// 			    'itemCd' : function() {return $('#itemCp').val();},
// 		    	'inspCp' : function() {return $('#inspCp').val();},
// 			    'inspCd' : function() {return $('#inspCd').val();},
// 			    'inspGubun' : $('#inspChkCp2').val(),
// 			    'itemSeq' : $('#itemSeq').val(),
// 			    'inspDesc1' : $('#inspDesc1').val(),
// 				'inspDesc2' : $('#inspDesc2').val(),
			beforeSend : function(res) {
				$('#my-spinner').show();
		    },
			success : function(res) {
				let data = res.data;
				if(res.result == 'ok'){
					toastr.success('복사 되었습니다.');
					$('#inspCopyPopUpModal').modal('hide');
					$('#inspAdmTable').DataTable().ajax.reload(function() {});
				} else {
					toastr.error(res.message);
				}
		    },
		    complete : function(res) {
		    	$('#my-spinner').hide();
		    },
		});
		
	});

	
	//외관 저장
	$('#btnExtSave').on('click',function() {
		var check = true;
		var dataArray = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#extAdmTable tbody tr').each(function(index, item) {

			if (extAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspList]').val()=="") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspList]').focus();
					check = false;
					return false;
				}
			} 
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "001";
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			rowData.inspList = $(this).find('td input[name=inspList]').val();
			rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
			rowData.useYn = $(this).find('td select[name=useYn]').val();

			dataArray.push(rowData);
			console.log(rowData)
		});
		
		var url = '<c:url value="/bm/inspDtlCreate"/>';

		if (check == true) {
			$.ajax({
				url : url,
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2 = "";
						//새로고침
						$('#extAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_ext(true);
						$('#btnExtSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});
	
	//치수 저장
	$('#btnSizeSave').on('click',function() {
		var check2 = true;
		var dataArray2 = new Array();

		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		if ($('input[name=mainGubun]:checked').val() == '001') {//사출
			$('#sizeAdmTable2 tbody tr').each(function(index, item) {

				if (sizeAdmTable2.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=inspList]').val() == "") {
						toastr.warning('목록을 입력해 주세요.');
						$(this).find('td input[name=inspList]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandUpper]').val() == "") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspStandUpper]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandLower]').val() == "") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspStandLower]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspOrder]').val() == "") {
						toastr.warning('순서를 선택해 주세요.');
						$(this).find('td input[name=inspOrder]').focus();
						check2 = false;
						return false;
					}
				}
				
				var rowData = new Object();
				rowData.inspCd = inspCd;
				if($("#inspChkGrp option:selected").val()=="005" || $('input[name=inspChkGrp]:checked').val()=="005"){
					rowData.inspType = "005";
				}else{
					rowData.inspType = "002";
				}
				
				rowData.inspSpc = '';
				rowData.inspList = $(this).find('td input[name=inspList]').val();
				rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');;
				rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');;
				rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
				rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
				rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
				
// 				if(inspOnchangeCheck=="003" && inspType=="002"){
// 					rowData.inspOrder = $(this).find('td select[name=inspOrder] option:selected').val();
// 				}else{
					rowData.inspOrder = '0';
// 				}
				
				rowData.useYn = $(this).find('td select[name=useYn]').val();
					
				dataArray2.push(rowData);
				console.log(rowData)
			});
		} else {//봉제
			$('#sizeAdmTable tbody tr').each(function(index, item) {

				if (sizeAdmTable.data().count() != 0) {
					//입력값 검사
					if ($(this).find('td input[name=inspList]').val()=="") {
						toastr.warning('기준을 입력해 주세요.');
						$(this).find('td input[name=inspList]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandUpper]').val()=="") {
						toastr.warning('최대를 입력해 주세요.');
						$(this).find('td input[name=inspStandUpper]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspStandLower]').val()=="") {
						toastr.warning('최소를 입력해 주세요.');
						$(this).find('td input[name=inspStandLower]').focus();
						check2 = false;
						return false;
					}
					if ($(this).find('td input[name=inspOrder]').val() == "") {
						toastr.warning('순서를 선택해 주세요.');
						$(this).find('td input[name=inspOrder]').focus();
						check2 = false;
						return false;
					}
				}
				
				var rowData = new Object();
				rowData.inspCd = inspCd;

				if( $("#inspChkGrp option:selected").val() == "005" || $('input[name=inspChkGrp]:checked').val() == "005" ){
					rowData.inspType = "005";
				} else {
					rowData.inspType = "002";
				}
				
				if( $(this).find('td input[name=inspSpc]').is(':checked') ){
					rowData.inspSpc = '001';
				} else {
					rowData.inspSpc = '002';
				}
				
				rowData.inspList = $(this).find('td input[name=inspList]').val();
				rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');;
				rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');;
				rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
				rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
				rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
				
// 				if ( inspOnchangeCheck == "003" && inspType == "002" ) {
// 					rowData.inspOrder = $(this).find('td select[name=inspOrder] option:selected').val();
// 				} else {
					rowData.inspOrder = '0';
// 				}

				rowData.useYn = $(this).find('td select[name=useYn]').val();
					
				dataArray2.push(rowData);
				console.log(rowData)
			});
		}

		if (check2) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray2),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}

						sideView2 = "";
						//새로고침
						$('#sizeAdmTable').DataTable().ajax.reload();
						$('#sizeAdmTable2').DataTable().ajax.reload();
						//화면설정
						uiProc_size(true);
						$('#btnSizeSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});
	
	//신뢰성 저장
	$('#btnRlbtSave').on('click',function() {
		var check3 = true;
		var dataArray3 = new Array();
		
		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#rlbtAdmTable tbody tr').each(function(index, item) {

			if (rlbtAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspPlan]').val()=="") {
					toastr.warning('계획을 입력해 주세요.');
					$(this).find('td input[name=inspPlan]').focus();
					check3 = false;
					return false;
				}
				if ($(this).find('td input[name=inspReport]').val()=="") {
					toastr.warning('실적을 입력해 주세요.');
					$(this).find('td input[name=inspReport]').focus();
					check3 = false;
					return false;
				}
			}
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "004";
			rowData.inspPlanDate = $(this).find('td input[name=inspPlanDate]').val();
			rowData.inspPlan = $(this).find('td input[name=inspPlan]').val();
			rowData.inspReport = $(this).find('td input[name=inspReport]').val();
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			rowData.useYn = $(this).find('td select[name=useYn]').val();
			
			dataArray3.push(rowData);
			console.log(rowData);
		});
		
		if (check3) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray3),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2= "";
						//새로고침
						$('#rlbtAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_rlbt(true);
						$('#btnRlbtSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});


	//중량 저장
	$('#btnWeightSave').on('click',function() {
		var check2 = true;
		var dataArray2 = new Array();

		if(sideView == 'add'){
			inspCd = $('#inspCd').val();
		}

		$('#weightAdmTable tbody tr').each(function(index, item) {

			if (weightAdmTable.data().count() != 0) {
				//입력값 검사
				if ($(this).find('td input[name=inspList]').val() == "") {
					toastr.warning('목록을 입력해 주세요.');
					$(this).find('td input[name=inspList]').focus();
					check2 = false;
					return false;
				}
				if ($(this).find('td input[name=inspStandUpper]').val() == "") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspStandUpper]').focus();
					check2 = false;
					return false;
				}
				if ($(this).find('td input[name=inspStandLower]').val() == "") {
					toastr.warning('기준을 입력해 주세요.');
					$(this).find('td input[name=inspStandLower]').focus();
					check2 = false;
					return false;
				}
			}
			
			var rowData = new Object();
			rowData.inspCd = inspCd;
			rowData.inspType = "003";
			rowData.inspSpc = '';
			rowData.inspList = $(this).find('td input[name=inspList]').val();
			rowData.inspStandUpper = $(this).find('td input[name=inspStandUpper]').val().replace(/,/g,'');
			rowData.inspStandLower = $(this).find('td input[name=inspStandLower]').val().replace(/,/g,'');
			rowData.inspInputMethod = $(this).find('td select[name=inspInputMethod]').val();
			rowData.inspCheck = $(this).find('td select[name=inspCheck]').val();
			rowData.inspStandGubun = $(this).find('td select[name=inspStandGubun] option:selected').val();
			rowData.useYn = $(this).find('td select[name=useYn]').val();
			
			dataArray2.push(rowData);
			console.log(rowData)
		});
		
		if (check2) {
			$.ajax({
				url : '<c:url value="/bm/inspDtlCreate"/>',
				type : 'POST',
				dataType : 'json',
				data : JSON.stringify(dataArray2),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						if (btnView == "edit") {
							toastr.success("수정되었습니다.");
						} else {
							toastr.success("등록되었습니다.");
						}
						sideView2="";
						//새로고침
						$('#weightAdmTable').DataTable().ajax.reload();
						//화면설정
						uiProc_weight(true);
						$('#btnWeightSave').addClass('d-none');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					btnView = "";
				}
			});
		}
	});

	function uiProc(flag) {
		$("input[name='inspChkGrp']").attr("disabled", flag);
		$('#btnItemCd').attr('disabled', flag);
		$('#inspDesc1').attr('disabled', flag);
		$('#inspDesc2').attr('disabled', flag);
	}
	
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//외관, 치수, 신뢰성 탭
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
 	//외관 탭 클릭시
	$('#extTab').on('click', function() {
		setTimeout(function(){
			extAdmTable.draw();
			extAdmTable.draw();
		},175);

	});
	
	//치수 탭 클릭시
	$('#sizeTab').on('click', function() {
		setTimeout(function(){
			sizeAdmTable.draw();
			sizeAdmTable.draw();
			sizeAdmTable2.draw();
			sizeAdmTable2.draw();
		},175);

	});
	
	//신뢰성 탭 클릭시
	$('#rlbtTab').on('click', function() {
		setTimeout(function(){
			rlbtAdmTable.draw();
			rlbtAdmTable.draw();
		},175);

	});

	//중량 탭 클릭시
	$('#weightTab').on('click', function() {
		setTimeout(function(){
			weightAdmTable.draw();
			weightAdmTable.draw();
		},175);

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
		scrollY: '42vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "001";},
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
				data : 'useYn',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
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
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode4_1,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_1,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
					
				}
			},
		],
		order : [ [ 0, 'asc' ] ],
		buttons : [],
		columnDefs : [ {
// 			className : "text-left",
// 			targets : 2
		}, ]
	});
	
	//치수 목록 - 사출
	let sizeAdmTable2 = $('#sizeAdmTable2').DataTable({
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
		scrollY: '42vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return inspType;},
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
				data : 'useYn',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
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
				data : 'inspOrder',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspOrderCode,"inspOrder", data, row, meta);
				}
			},
			{
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
// 						html = selectBoxHtml2(inspCheckCode4_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_2,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%; text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%; text-align:right;" />';
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
		drawCallback : function(){
			
		} 
		
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
		scrollY: '42vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return inspType;},
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
				data : 'useYn',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
			},
			{
				data : 'inspSpc',
				render : function(data, type, row, meta) {
					if (data == null) {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="" style="min-width : 100%" />';
					} else if (data == '001') {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%;" checked disabled/>';
					} else {
						return '<input type="checkbox" class="form-control" name="inspSpc" value="'+data+'" style="min-width : 100%;" disabled/>';
					}
				}
			}, 
			{
				data : 'inspOrder',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspOrderCode,"inspOrder", data, row, meta);
				}
			},
			{
				data : 'inspList',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="min-width : 100%;" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="min-width : 100%;" />';
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "001") {//제품검사
						html = selectBoxHtml2(inspCheckCode1_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "003") {//수입검사
						html = selectBoxHtml2(inspCheckCode3_2,"inspCheck", data, row, meta);
// 						html = selectBoxHtml2(inspCheckCode4_2,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_2,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			}, 
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
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
		drawCallback : function(){
			
		} 
	});
	
	//신뢰성 목록
	let rlbtAdmTable = $('#rlbtAdmTable').DataTable({
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
		scrollY: '42vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "004";},
			},
		},
		columns : [
			{
				data : 'useYn',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
			},
			{
				data : 'inspPlanDate',
				render : function(data, type, row, meta) {
					tempNum = meta.row + meta.settings._iDisplayStart + 1;
					if (data != null) {
						var dateData = moment(data).format('YYYY-MM-DD');
						var html = '<div class="form-group input-sub m-0 row">'
						html += '<input type="date" class="form-control" value="'+dateData+'" id="inspPlanDate'+tempNum+'" name="inspPlanDate" disabled/>';
						html += '</div>';
						return html;
					} else {
						var html = '<div class="form-group input-sub m-0 row">'
							html += '<input type="date" class="form-control" value="'+serverDate+'" id="inspPlanDate'+tempNum+'" name="inspPlanDate"/>';
							html += '</div>';
						return html;
					}
				}
			}, 
			{
				data : 'inspPlan',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspPlan" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspPlan" value="" style="min-width : 100%" />';
					}
				}
			}, 
			{
				data : 'inspReport',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="text" class="form-control" name="inspReport" value="'+data+'" style="min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspReport" value="" style="min-width : 100%" />';
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
		}, ]
	});

	//중량 목록
	let weightAdmTable = $('#weightAdmTable').DataTable({
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
		scrollY: '42vh',
		pageLength : 100000000,
		ajax : {
			url : '<c:url value="bm/inspDtlList"/>',
			type : 'GET',
			async : false,
			data : {
				'inspCd' : function(){return inspCd;},
				'inspType' : function(){return "003";},
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
				data : 'useYn',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(useYnCode,"useYn", data, row, meta);
				}
			},
			{
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					var html = "";
					html = selectBoxHtml2(methodCode,"inspInputMethod", data, row, meta);
					return html;
				}
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
				data : 'inspCheck',
				render : function(data, type, row, meta) {
					var html = "";
					
					if (inspOnchangeCheck == "005") {//수분측정
						html = selectBoxHtml2(inspCheckCode2_3,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "002") {//공정검사
						html = selectBoxHtml2(inspCheckCode3_3,"inspCheck", data, row, meta);
						return html;
					} else if (inspOnchangeCheck == "004") {//자주검사
						html = selectBoxHtml2(inspCheckCode5_3,"inspCheck", data, row, meta);
						return html;
					} else {
						return html;
					}
				}
			},
			{
				data : 'inspStandGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml2(inspStandGubunCode,"inspStandGubun", data, row, meta);
				}
			},
			{
				data : 'inspStandLower',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandLower" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandLower" value="" style="min-width : 100%;text-align:right;" />';
					}
				}
			},
			{
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspStandUpper" value="'+data+'" style="min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspStandUpper" value="" style="min-width : 100%;text-align:right;" />';
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
		}, ]
	});
	
	//외관 데이터 클릭 시
	$('#extAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#extAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#extAdmTable').DataTable().row(this).index();
		inspSeq = extAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//치수 데이터 클릭 시 - 사출
	$('#sizeAdmTable2 tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#sizeAdmTable2').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#sizeAdmTable2').DataTable().row(this).index();
		inspSeq = sizeAdmTable2.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//치수 데이터 클릭 시 - 봉제
	$('#sizeAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#sizeAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#sizeAdmTable').DataTable().row(this).index();
		inspSeq = sizeAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});

	//신뢰성 데이터 클릭 시
	$('#rlbtAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#rlbtAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		tableIdx = $('#rlbtAdmTable').DataTable().row(this).index();
		inspSeq = rlbtAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});

	//중량 데이터 클릭 시 
	$('#weightAdmTable tbody').on('click','tr',function() {
		btnView = "edit";
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			btnView = "";
			return false;
		} else {
			$('#weightAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
		
		tableIdx = $('#weightAdmTable').DataTable().row(this).index();
		inspSeq = weightAdmTable.row(tableIdx).data().inspSeq;
		
		console.log(tableIdx);
	});
	
	//외관 추가버튼
	$('#btnExtAdd').on('click', function() {
		btnView = '';
		sideView2 = "add";
		$('#extAdmTable').DataTable().row.add({}).draw(false);
		
 		$('#btnExtSave').removeClass('d-none'); // 등록버튼
	});
	
	//치수 추가버튼
	$('#btnSizeAdd').on('click', function() {
		if($('#itemCd').val() == '' || $('#itemCd').val() == undefined){
			toastr.warning("품번을 입력해주세요.");
			$('#btnItemCd').focus();
			return false;
		}
		
		btnView = '';
		sideView2 = "add";
		if($('input[name=mainGubun]:checked').val() == '001'){
			$('#sizeAdmTable2').DataTable().row.add({}).draw(false);
		} else if($('input[name=mainGubun]:checked').val() == '002') {
			$('#sizeAdmTable').DataTable().row.add({}).draw(false);
		}
		
 		$('#btnSizeSave').removeClass('d-none'); // 등록버튼
	});

	//신뢰성 추가버튼
	$('#btnRlbtAdd').on('click', function() {
		btnView = '';
		sideView2 = "add";
		$('#rlbtAdmTable').DataTable().row.add({}).draw(false);
 		$('#btnRlbtSave').removeClass('d-none'); // 등록버튼
	});

	//중량 추가버튼
	$('#btnWeightAdd').on('click', function() {
		if($('#itemCd').val() == '' || $('#itemCd').val() == undefined){
			toastr.warning("품번을 입력해주세요.");
			$('#btnItemCd').focus();
			return false;
		}
		
		btnView = '';
		sideView2 = "add";
		if($('input[name=mainGubun]:checked').val() == '001'){
			$('#weightAdmTable').DataTable().row.add({}).draw(false);
		} else if($('input[name=mainGubun]:checked').val() == '002') {
			$('#weightAdmTable').DataTable().row.add({}).draw(false);
		}
		
 		$('#btnWeightSave').removeClass('d-none'); // 등록버튼
	});
	
	
	//외관 수정버튼
	$('#btnExtEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}
		
		console.log(tableIdx);
		$('#extAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
		$('#extAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled',false);
		$('#extAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled',false);
		$('#extAdmTable td').find('select[name=useYn]').eq(tableIdx).attr('disabled',false);
 		$('#btnExtSave').removeClass('d-none');
	});
	
	//치수 수정버튼
	$('#btnSizeEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		
		console.log(tableIdx);
		$('#sizeAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspOrder]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable td').find('select[name=useYn]').eq(tableIdx).attr('disabled', false);

		$('#sizeAdmTable2 td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspList]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspOrder]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled', false);
		$('#sizeAdmTable2 td').find('select[name=useYn]').eq(tableIdx).attr('disabled', false);
		
		
		$('#btnSizeSave').removeClass('d-none');
	});
	
	//신뢰성 수정버튼
	$('#btnRlbtEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		
		console.log(tableIdx);
		$('#rlbtAdmTable td').find('button[name=inspPlanDate]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('input[name=inspPlan]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('input[name=inspReport]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
		$('#rlbtAdmTable td').find('select[name=useYn]').eq(tableIdx).attr('disabled',false);
 		$('#btnRlbtSave').removeClass('d-none');
	});


	//중량 수정버튼
	$('#btnWeightEdit').on('click', function() {
		if(btnView != 'edit'){
			toastr.warning("수정할 항목을 선택해주세요.")
			return false;
		}
		
		console.log(tableIdx);
		$('#weightAdmTable td').find('select[name=inspInputMethod]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspSpc]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspList]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspStandUpper]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('input[name=inspStandLower]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('select[name=inspCheck]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('select[name=inspStandGubun]').eq(tableIdx).attr('disabled',false);
		$('#weightAdmTable td').find('select[name=useYn]').eq(tableIdx).attr('disabled',false);
 		$('#btnWeightSave').removeClass('d-none');
	});
	
	//외관 삭제버튼
	$('#btnExtDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//외관 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "001";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					if(res.result=="ok"){
						$('#extAdmTable').DataTable().rows(tableIdx).remove().draw();
						toastr.success("삭제되었습니다.");
					}else{
						toastr.warning("해당 항목으로 검사한 이력이 있어 삭제 할 수 없습니다. 사용여부를 '미사용'으로 수정해주시길 바랍니다.");
					}
				}
			})
		} else {
			$('#extAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		
		btnView = '';

	});
	
	//치수 삭제버튼
	$('#btnSizeDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//치수 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "002";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					if(res.result=="ok"){
						$('#sizeAdmTable').DataTable().rows(tableIdx).remove().draw();
						$('#sizeAdmTable2').DataTable().rows(tableIdx).remove().draw();
						toastr.success("삭제되었습니다.");
					}else{
						toastr.warning("해당 항목으로 검사한 이력이 있어 삭제 할 수 없습니다. 사용여부를 '미사용'으로 수정해주시길 바랍니다.");
					}
				}
			})
		} else {
			$('#sizeAdmTable').DataTable().rows(tableIdx).remove().draw();
			$('#sizeAdmTable2').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});
	
	//신뢰성 삭제버튼
	$('#btnRlbtDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//신뢰성 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "004";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					if(res.result=="ok"){
						$('#rlbtAdmTable').DataTable().rows(tableIdx).remove().draw();
						toastr.success("삭제되었습니다.");
					}else{
						toastr.warning("해당 항목으로 검사한 이력이 있어 삭제 할 수 없습니다. 사용여부를 '미사용'으로 수정해주시길 바랍니다.");
					}
				}
			})
		} else {
			$('#rlbtAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});

	//치수 삭제버튼
	$('#btnWeightDel').on('click', function() {
		if (btnView != 'edit') {
			toastr.warning('삭제할 항목을 선택해주세요.');
			return false;
		}

		if (inspSeq != undefined && inspSeq != ''){
			//치수 삭제
			$.ajax({
				url : '<c:url value="bm/inspDtlDelete"/>',
				type : 'POST',
				data  : {
					'inspCd' : function(){return inspCd;},
					'inspType' : function(){return "003";},
					'inspSeq' : function(){return inspSeq;},
				},
				success  : function(res){
					if(res.result=="ok"){
						$('#weightAdmTable').DataTable().rows(tableIdx).remove().draw();
						toastr.success("삭제되었습니다.");
					}else{
						toastr.warning("해당 항목으로 검사한 이력이 있어 삭제 할 수 없습니다. 사용여부를 '미사용'으로 수정해주시길 바랍니다.");
					}
				}
			})
		} else {
			$('#weightAdmTable').DataTable().rows(tableIdx).remove().draw();
		}
		
		btnView = '';

	});
	
	function uiProc_ext(flag) {
		$("input[name='inspList']").attr("disabled", flag);
	}
	
	function uiProc_size(flag) {
		$("input[name='inspSpc']").attr("disabled", flag);
		$("input[name='inspList']").attr("disabled", flag);
		$("input[name='inspStandUpper']").attr("disabled", flag);
		$("input[name='inspStandLower']").attr("disabled", flag);
	}
	
	function uiProc_rlbt(flag) {
		$("button[name='inspPlanDate']").attr("disabled", flag);
		$("input[name='inspPlan']").attr("disabled", flag);
		$("input[name='inspReport']").attr("disabled", flag);
	}

	function uiProc_weight(flag) {
		$("input[name='inspSpc']").attr("disabled", flag);
		$("input[name='inspList']").attr("disabled", flag);
		$("input[name='inspStandUpper']").attr("disabled", flag);
		$("input[name='inspStandLower']").attr("disabled", flag);
	}
	
	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {

		var shtml = "";

		if (sideView2 == "") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
		} else if (sideView2 == "add" || sideView2 == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '">';
		}
		var option;
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
	
</script>