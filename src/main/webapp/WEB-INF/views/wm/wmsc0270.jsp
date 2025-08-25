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
				<li class="breadcrumb-item active">생산실적(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<div class="left-list left-sidebar" id="left-list" style="width: 22%; min-height: 100px;">
				<div class="container-fluid p-0">
					<div class="row ml-2 mt-2 mr-2 mb-0">
						<div class="col-md-12 p-0">
							<table class="table table-bordered m-0">
								<colgroup>
									<col width="30%">
									<col width="70%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<td colspan="2" style="text-align: center;">
											<span id="clock" style="text-align: center;font-size: 1.9rem;font-weight: bold;"></span>
										</td>
									</tr>
									<tr>
										<th class="text-center align-middle">지시년월</th>
										<td class="text-center align-middle p-0">
											<input class="form-control-lg mw-100" type="month" id="workOrdDate" style="background: #0082ff2b;">
										</td>
									</tr>
									<tr>
										<th class="text-center align-middle">작업장</th>
										<td class="text-center align-middle p-0"><select id="prcssList" class="custom-select custom-select-lg mw-100" style="background: #0082ff2b;"></select></td>
									</tr>
									<tr>
										<th class="text-center align-middle">작업상태</th>
										<td class="text-center align-middle p-0">
											<select class="custom-select custom-select-lg mw-100" id="statusList" style="background: #0082ff2b;">
												<option value="">전체</option>
												<option value="W">대기</option>
												<option value="WS">진행</option>
												<option value="WE">완료</option>
											</select>
										</td>
									</tr>
<!-- 									<tr> -->
<!-- 										<th class="text-center align-middle">작업지시번호</th> -->
<!-- 										<td class="text-center align-middle p-0"> -->
<!-- 											<div class="input-sub m-0" style="max-width: 100%"> -->
<!-- 												<input class="form-control-lg mw-100" type="text" id="workOrdNoScan" placeholder="작업지시번호 SCAN" style="background: #0082ff2b;"> -->
<!-- 												<button type="button" class="btn btn-primary input-sub-search" id="btnSelWorkOrdNo" style="font-size:1rem; height:100%;" onclick="selectWorkOrd();"> -->
<!-- 													<span class="oi oi-magnifying-glass"></span> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 									</tr> -->
									<tr>
										<th class="text-center align-middle">작업지시번호</th>
										<td class="text-center align-middle p-0">
											<div class="input-sub m-0" style="max-width: 100%">
												<input class="form-control-lg mw-100" type="text" id="workProgNoScan" placeholder="작업지시번호 SCAN" style="background: #0082ff2b;">
												<button type="button" class="btn btn-primary input-sub-search" id="btnSelWorkProgNo" style="font-size:1rem; height:100%;" onclick="selectWorkProg();">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
										</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					
					<div class="row ml-2 mt-2 mr-2 mb-0">
						<div class="col-md-12 p-0">
							<table class="table table-bordered m-0" id="">
								<colgroup>
									<col width="30%">
									<col width="70%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center align-middle">시료수</th>
										<td class="text-center align-middle p-0">
											<select class="custom-select custom-select-lg mw-100" id="sampleCnt" onChange="sampleCntChange();" style="background:#ffa50085;" disabled>
												<option value="001">1개</option>
												<option value="002">2개</option>
												<option value="003">3개</option>
												<option value="004">4개</option>
												<option value="005">5개</option>
												<option value="006">6개</option>
												<option value="007">7개</option>
												<option value="008">8개</option>
												<option value="009">9개</option>
												<option value="010">10개</option>
											</select>
										</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					
					<div class="row ml-2 mt-2 mr-2 mb-0">
						<div class="col-md-12 p-0">
							<table class="table table-bordered m-0" id="workOrderProgressTable">
								<colgroup>
									<col width="20%">
									<col width="20%">
									<col width="45%">
									<col width="15%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center align-middle">구분</th>
										<th class="text-center align-middle">차종</th>
										<th class="text-center align-middle">품명</th>
										<th class="text-center align-middle">상태</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 77%; min-height: 100px;">
				<div class="container-fluid p-0">
					<div class="m-1 mb-2 ml-2">
						<button type="button" class="btn ml-2 mr-1 btn_blue_status btn-outline-primary" id="btnWorkStart" style="font-size:1.5rem; min-width: 10%; height: 2.8rem;">작업시작</button>
						<button type="button" class="btn btn-outline-success mr-1 btn_green_status" id="btnWorkEnd" style="font-size:1.5rem; min-width: 10%; height: 2.8rem;">작업종료</button>
						<button type="button" class="btn btn-dark mr-1 d-none" id="btnWorkRestart" style="font-size:1.5rem; min-width: 10%; height: 2.8rem;">작업 재시작</button>
						<button type="button" class="btn btn-dark mr-1 d-none" id="btnPrcssAdmDel" style="font-size:1.5rem; min-width: 10%; height: 2.8rem;">실적 삭제</button>
<!-- 						<button type="button" class="btn btn-outline-danger mr-1 btn_red_status" id="btnWorkStopSave" style="font-size:1.5rem;width: 25%;height: 2.8rem;">비가동등록</button> -->
						<button type="button" class="btn btn-info mr-3 btn_sky_status float-right" id="btnResultInput" style="font-size:1.5rem; min-width: 10%; height: 2.8rem;">실적등록</button>
					</div>
					<hr>
					<div class="row mt-1 mr-1 mb-3 ml-1">
						<div class="col-md-12 p-0">
							<table class="table table-bordered m-0" id="workOrderPrcssMainTable">
								<colgroup>
									<col width="10%">
									<col width="11%">
									<col width="8%">
									<col width="15%">
									<col width="15%">
									<col width="6%">
									<col width="6%">
									<col width="6%">
									<col width="6%">
									<col width="11%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center align-middle">작업지시번호</th>
										<th class="text-center align-middle">작업세부번호</th>
										<th class="text-center align-middle">차종</th>
										<th class="text-center align-middle">품번</th>
										<th class="text-center align-middle">품명</th>
										<th class="text-center align-middle">지시량</th>
										<th class="text-center align-middle">생산량</th>
										<th class="text-center align-middle">양품수량</th>
										<th class="text-center align-middle">불량수량</th>
										<th class="text-center align-middle">공정명</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="col-sm-12 p-0">
						<!-- .nav-tabs tablist -->
						<ul class="nav nav-tabs" role="tablist">
							<li class="nav-item">
								<a class="nav-link disabled active show" id="tab1Nav" data-toggle="tab" href="#tab1" style="font-size: 1rem;">자재투입내역</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab2Nav" data-toggle="tab" href="#tab2" style="font-size: 1rem;">생산실적등록</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab3Nav" data-toggle="tab" href="#tab3" style="font-size: 1rem;">불량등록</a>
							</li>
							<li class="nav-item">
								<a class="nav-link disabled" id="tab4Nav" data-toggle="tab" href="#tab4" style="font-size: 1rem;">자주검사</a>
							</li>
						</ul>
						<!-- /.nav-tabs -->
					</div>
					<div class="card">
						<div id="myTabContent" class="tab-content" style="border-right: 1px solid rgba(34, 34, 48, 0.1); border-left: 1px solid rgba(34, 34, 48, 0.1); border-bottom: 1px solid rgba(34, 34, 48, 0.1);">
							<div class="tab-pane fade active show" id="tab1">
								<div class="card-body" style="padding: 5px; padding-top: 11px;">
									<button type="button" class="btn btn-danger float-right ml-1" id="btnMatrlOutput" style="font-size:1rem; height:2rem;" disabled>투입취소</button>
									<button type="button" class="btn btn-primary float-right ml-1" id="btnMatrlReset" style="font-size:1rem; height:2rem;">새로고침</button>
									<!--
									2023-02-06 doyeji 우선 현장에서 사용 못하도록 비활성화 처리
									<button type="button" class="btn btn-primary float-right" id="btnSearchBarcodeList" style="font-size:1rem; height:2rem;" disabled>이전 자재 조회</button> 
									-->
									<input class="form-control-lg mw-100 float-left" type="text" id="barcodeNoScan" placeholder="자재바코드 SCAN" style="height: 2em; width:15vw;" disabled>
								</div>
								<div class="row">
									<div style="width: 68.3%;" class="ml-2 mr-2">
										<table class="table table-bordered m-0 tr_highlight_row" id="workOrderMatrlTable">
											<colgroup>
												<col width="3%">
												<col width="14%">
												<col width="21%">
												<col width="10%">
												<col width="8%">
												<col width="6%">
												<col width="6%">
												<col width="16%">
												<col width="8%">
												<col width="8%">
											</colgroup>
											<thead class="thead-light">
												<tr>
													<th class="text-center align-middle">No.</th>
													<th class="text-center align-middle">품번</th>
													<th class="text-center align-middle">품명</th>
													<th class="text-center align-middle">투입일자</th>
													<th class="text-center align-middle">투입수량</th>
													<th class="text-center align-middle">사용량</th>
													<th class="text-center align-middle">잔량</th>
													<th class="text-center align-middle">LOT NO</th>
													<th class="text-center align-middle">불량</th>
													<th class="text-center align-middle">조회</th>
												</tr>
											</thead>
										</table>
									</div>
									<div style="width: 30%;">
										<table class="table table-bordered m-0 tr_highlight_row" id="workOrderMatrlAccTable">
											<colgroup>
												<col width="46%">
												<col width="20%">
												<col width="17%">
												<col width="17%">
											</colgroup>
											<thead class="thead-light">
												<tr>
													<th class="text-center align-middle">품명</th>
													<th class="text-center align-middle">투입수량</th>
													<th class="text-center align-middle">사용량</th>
													<th class="text-center align-middle">잔량</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
								
							</div>
							
							<div class="tab-pane fade" id="tab2">
								<div class="card-body" style="padding: 5px; padding-top: 11px;">
									<button type="button" class="btn btn-success float-left ml-1" id="btnCheckLabelPrint" style="font-size:1rem; height:2rem;">라벨출력</button>
									
									<button type="button" class="btn btn-primary float-right ml-1 mr-1 d-none" id="btnPrcssSave" style="font-size:1rem; height:2rem;">저장</button>
									<button type="button" class="btn btn-danger float-right ml-1" id="btnPrcssDel" style="font-size:1rem; height:2rem;" disabled>실적삭제</button>
									<button type="button" class="btn btn-warning float-right" id="btnPrcssEdit" style="font-size:1rem; height:2rem;" disabled>실적수정</button> 
								</div>
								<table class="table table-bordered m-0" id="workOrderPrcssTable">
									<colgroup>
										<col width="3%">
										<col width="6%">
										<col width="15%">
										<col width="12%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="12%">
										<col width="15%">
										<col width="7%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th class="text-center align-middle"><input type="checkbox" class="form-control-lg" id="prcssAllCheck" onclick="prcssAllCheckClick()" style=""></th>
											<th class="text-center align-middle">상태</th>
											<th class="text-center align-middle">LOT NO</th>
											<th class="text-center align-middle">작업자</th>
											<th class="text-center align-middle">생산수량</th>
											<th class="text-center align-middle">양품수량</th>
											<th class="text-center align-middle">불량수량</th>
											<th class="text-center align-middle">검사취출</th>
											<th class="text-center align-middle">완료시간</th>
											<th class="text-center align-middle" style="min-width: 70px;">라벨</th>
										</tr>
									</thead>
								</table>
							</div>
							
							<div class="tab-pane fade" id="tab3">
								<div class="row p-0" style="height:100%;"> 
									<div class="col-md-12" style="padding: 5px; padding-top: 11px;">
										<input class="form-control mw-80 float-left" type="text" id="textSearchFaulty" placeholder="통합검색" style="font-size: 1rem;height: 2rem;">
										<button class="btn btn-danger float-right" type="button" id="btnFaultyDel" style="font-size: 1rem;height: 2rem;">불량삭제</button>
									</div>
								</div>
								<div class="row p-0" style="height:100%;">
									<div class="col-md-12 p-0">
										<table class="table table-bordered m-0" id="workOrderFaultyTable">
											<colgroup>
												<col width="5%">
												<col width="10%">
												<col width="15%">
												<col width="15%">
												<col width="20%">
												<col width="15%">
												<col width="20%">
											</colgroup>
											<thead class="thead-light">
												<tr>
													<th class="text-center">
														<input type="checkbox" id="faultyCheckAll" name="faultyCheckAll" style="width:1.5rem; height:1.5rem;"/>	
													</th>
													<th class="text-center align-middle">구분</th>
													<th class="text-center align-middle">품명</th>
													<th class="text-center align-middle">LOT NO</th>
													<th class="text-center align-middle">불량일자</th>
													<th class="text-center align-middle">불량수량</th>
													<th class="text-center align-middle">불량유형</th>
												</tr>
											</thead>
										</table>
									</div>
								</div>
							</div>
							<div class="tab-pane fade" id="tab4">
								<div class="card-body mb-2" style="padding: 5px; padding-top: 11px;">
									<div class="table-responsive">
										<table class="table table-bordered">
											<colgroup>
												<col width="25%">
												<col width="25%">
												<col width="25%">
												<col width="25%">
											</colgroup>
											<thead class="thead-light">
												<tr>
													<th colspan="4">제품사진</th>
												</tr>
												<tr>
													<th>사진1</th>
													<th>사진2</th>
													<th>사진3</th>
													<th>사진4</th>
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
											</thead>
										</table>
									</div>
									<div class="card-body p-0">
										<div class="card-body col-sm-12 p-1">
											<button type="button" class="btn btn-primary float-left mr-1" style="font-size:1rem; height:2rem;" id="btnInspPopup1">초물</button>	
											<button type="button" class="btn btn-primary float-left mr-1" style="font-size:1rem; height:2rem;" id="btnInspPopup2">중물</button>
											<button type="button" class="btn btn-primary float-left mr-5" style="font-size:1rem; height:2rem;" id="btnInspPopup3">종물</button>
											<div class="row float-left mr-3">
												<input type="checkbox" class="float-right mr-1" id="ckMdInspectNo" style="min-width:23px;">
												<label style="font-size: 16px;" class="input-label-sm">중물검사안함</label>
											</div>
											<div class="row float-left">
												<input type="checkbox" class="float-right mr-1" id="jajuChkBox" style="min-width:23px;">
												<label style="font-size: 16px;" class="input-label-sm">자주검사안함</label>
											</div>
										</div>
										<hr>
										<div class="card-body col-sm-12 p-1 d-none" id="jajuHd">
											<button type="button" class="btn btn-primary" style="font-size:1rem; height:2rem;" id="btnExt">외관</button>
											<button type="button" class="btn btn-primary" style="font-size:1rem; height:2rem;" id="btnSize">치수</button>
											
											<button type="button" class="btn btn-primary float-right mr-1 d-none" id="btnInspSave" style="font-size:1rem; height:2rem;">저장</button>
											<button type="button" class="btn btn-primary float-right mr-1" id="btnInspAdd" style="font-size:1rem; height:2rem;">등록</button>
										</div>
										<hr>
										
										<div class="table-responsive d-none" id="extAdmTableDiv">
											<table class="table table-bordered" id="extAdmTable" style="width:100%;">
												<thead class="thead-light">
													<tr>
														<th rowspan="2" style="min-width:40px;">순번</th>
														<th rowspan="2" style="min-width:450px;">기준</th>
														<th rowspan="2" style="min-width:80px;">확인방법</th>
														<th colspan="10" id="extBlueTh" style="min-width: 900px; background-color: #ffd07a;">초.중.종 시료수</th>
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
												<thead class="thead-light">
													<tr>
														<th rowspan="2" style="min-width:40px;">순번</th>
														<th rowspan="2" style="min-width:100px;">목록</th>
														<th rowspan="2" style="min-width:80px;">확인방법</th>
														<th colspan="2" style="min-width:200px;">기준</th>
														<th colspan="10" id="sizeBlueTh" style="min-width: 900px; background-color: #ffd07a;">초.중.종 시료수</th>
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
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- 작업지시 목록조회 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade bd-example-modal-xl" id="workOrderPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workOrderPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1400px;">
    	<div class="modal-content">
	    	<div class="modal-header p-1">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0 mb-2">
						<div class="col-md-4">
							<span style="font-size:1.4rem; font-weight:900;">작업지시 조회</span>
						</div>
					</div>
				</div>
            </div>
	      	<div class="modal-body">
                	<table id="workOrderPopUpTable" class="table table-bordered w-100">
                		<colgroup>
                			<col width="6%">
                			<col width="10%">
                			<col width="10%">
                			<col width="6%">
                			<col width="11%">
                			<col width="11%">
                			<col width="10%">
                			<col width="5%">
                			<col width="5%">
                			<col width="7%">
                			<col width="7%">
                			<col width="5%">
                			<col width="6%">
                		</colgroup>
	                    <thead class="thead-light">
		                    <tr>
		                    	<th>품목구분</th>
		                    	<th>설비명</th>
		                    	<th>작지번호</th>
		                    	<th>작업자</th>
		                    	<th>품번</th>
		                    	<th>품명</th>
		                    	<th>차종</th>   
		                    	<th>지시수량</th> 
		                    	<th>생산수량</th>
		                    	<th>작업지시일</th>  
		                    	<th>생산일자</th>   
		                    	<th>긴급여부</th>      
		                    	<th>작업상태</th>      
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
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 작업지시 목록조회 -->
<!-- 생산지시현황 목록조회 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade bd-example-modal-xl" id="workProgPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workProgPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" style="max-width: 1600px;">
    	<div class="modal-content">
	    	<div class="modal-header p-1">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0 mb-2">
						<div class="col-md-4">
							<span style="font-size:1.4rem; font-weight:900;">작업지시 조회</span>
						</div>
					</div>
				</div>
            </div>
	      	<div class="modal-body">
                	<table id="workProgPopUpTable" class="table table-bordered w-100">
	                    <thead class="thead-light">
		                    <tr>
		                    	<th><input type="checkbox" class="checkbox" id="checkAllProg" style="width:20px; height:20px;"></th>
								<th class="text-center" style="min-width: 70px;">작업지시일</th>
								<th class="text-center">작업지시번호</th>
								<th class="text-center">작업세부번호</th>
								<th class="text-center">차종</th>
								<th class="text-center">품번</th>
								<th class="text-center">품명</th>
								<th class="text-center">공정</th>
								<!-- <th class="text-center" style="min-width: 40px;">설비명</th> -->
								<th class="text-center" style="min-width: 50px;">지시수량</th>
								<th class="text-center" style="min-width: 50px;">생산수량</th>
								<th class="text-center" style="min-width: 70px;">생산일자</th>
								<th class="text-center" style="min-width: 50px;">작업상태</th>
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
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 생산지시현황 목록조회 -->
<!-- 자재투입 품목 목록조회 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="itemInfoModal" tabindex="-1" aria-labelledby="itemInfoModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 70%;">
		<div class="modal-content">
			<div class="modal-header p-1">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0 mb-2">
						<div class="col-md-4">
							<span class="ml-4" style="font-size:1.7rem; font-weight:900;">자재투입 품목 목록조회</span>
						</div>
						<div class="col-md-8 pt-2">
							<div class="row" style="display:block;">
								<button type="button" class="btn btn-secondary float-right mb-1 mr-2" data-dismiss="modal" style="font-size:1rem;">닫기</button>
								<button type="button" class="btn btn-primary float-right mb-1 mr-2" id="btnMatrlInput" style="font-size:1rem;">투입</button>
							</div>
						</div>
					</div>
				</div>
            </div>
			<div class="modal-body" style="padding-top:0px;">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:86vh;">
						<div class="m-0 p-0" style="background-color:#ffffff; flex: 0 0 99%; max-width: 99%; border-radius: 5px;">
							<div class="container-fluid p-0">
								<div class="row m-0">
									<div class="col-md-12 p-0">
										<table id="matrlInputBarcodeNoTable" class="table table-bordered m-0">
											<thead class="thead-light">
												<tr>
													<th>
														<input type="checkbox" id="btnAllCheck" style="width:25px; height:25px;" >
													</th>
													<th class="text-center">BARCODE NO</th>
													<th class="text-center">품번</th>
													<th class="text-center">품명</th>
													<th class="text-center">X (OD)</th>
													<th class="text-center">Y (ID)</th>
													<th class="text-center">Z (T)</th>
													<th class="text-center">품목구분</th>
													<th class="text-center">입고수량</th>
													<th class="text-center">창고명</th>
													<th class="text-center">구역</th>
													<th class="text-center">저장위치(단)</th>
													<th class="text-center">세부위치(열)</th>
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
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 자재투입 품목 목록조회 -->
<!-- 자재바코드 SCAN 목록조회 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="barcodeNoScanModal" tabindex="-1" aria-labelledby="barcodeNoScanModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 70%;">
		<div class="modal-content">
			<div class="modal-header p-1">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0 mb-2">
						<div class="col-md-4">
							<span class="ml-4" style="font-size:1.7rem; font-weight:900;">자재바코드 SCAN 목록조회</span>
						</div>
						<div class="col-md-8 pt-2">
							<div class="row" style="display:block;">
								<button type="button" class="btn btn-secondary float-right mb-1 mr-2" data-dismiss="modal" style="font-size:1rem;">닫기</button>
								<button type="button" class="btn btn-primary float-right mb-1 mr-2" id="btnMatrlBarcodeNoInput" style="font-size:1rem;">투입</button>
							</div>
						</div>
					</div>
				</div>
            </div>
			<div class="modal-body" style="padding-top:0px;">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:86vh;">
						<div class="m-0 p-0" style="background-color:#ffffff; flex: 0 0 99%; max-width: 99%; border-radius: 5px;">
							<div class="container-fluid p-0">
								<div class="row m-0">
									<div class="col-md-12 p-0">
										<table id="matrlBarcodeNoScanTable" class="table table-bordered m-0">
											<thead class="thead-light">
												<tr>
													<th class="text-center">BARCODE NO</th>
													<th class="text-center">품번</th>
													<th class="text-center">품명</th>
													<th class="text-center">X (OD)</th>
													<th class="text-center">Y (ID)</th>
													<th class="text-center">Z (T)</th>
													<th class="text-center">품목구분</th>
													<th class="text-center">입고수량</th>
													<th class="text-center">창고명</th>
													<th class="text-center">구역</th>
													<th class="text-center">저장위치(단)</th>
													<th class="text-center">세부위치(열)</th>
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
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 자재바코드 SCAN 목록조회 -->
<!-- 실적등록 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="resultInputModal" tabindex="-1" aria-labelledby="resultInputModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 90%;">
		<div class="modal-content" style="border: solid #00ff00 10px;border-radius: 10px;">
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-8 p-0">
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
										<th class="text-center" style="font-size: 2em;">작업자<span class="text-danger">*</span></th>
										<td class="p-0" colspan='3'>
											<select id="workChargr" class="custom-select custom-select-lg mw-100" style="height: 9vh; font-size: 4vh;"></select>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2.5em;">양품수량<span class="text-danger">*</span></th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="fairQty" onkeyup="numberFormat(this, 'int')" style="height: 11vh; font-size: 5.5vh; color: blue;">
										</td>
										<th class="text-center" style="font-size: 2.5em;">불량수량<span class="text-danger">*</span></th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="faultyQty" readonly style="height: 11vh; font-size: 5.5vh; color: red;">
										</td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2em;">포장수량<span class="text-danger">*</span></th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100" id="boxCountTd" onkeyup="numberFormat(this, 'int')" style="height: 9vh; font-size: 4vh;">
										</td>
										<th class="text-center" style="font-size: 2em;">생산수량<span class="text-danger">*</span></th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100" id="popupOutputQty" style="height: 9vh; font-size: 4vh;" disabled>
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<button type="button" class="btn btn-outline-primary" id="btnResultSave" style="font-size:3.5em;width:100%;height: 2.4em;font-weight: 700; border-width: 5px;">실 적 등 록</button>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="col-md-4 p-0">
							<table id="workOrderFaultyAddTable2" class="table table-bordered m-0">
								<colgroup>
									<col width="50%">
									<col width="50%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" style="font-size: 2em;height:6.6vh;">불량유형</th>
										<th class="text-center" style="font-size: 2em;height:6.6vh;">불량수량</th>
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
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 실적등록 -->
<%-- <!-- 불량등록 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="faultyInputModal" tabindex="-1" aria-labelledby="faultyInputModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 60%;">
		<div class="modal-content">
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<span class="ml-2" style="font-size: 2em; font-weight: 900;">불량수량 :</span>
							<span class="ml-2 faultyState" id="faultyAddSum" style="font-size: 2em; font-weight: 900;">0</span>
							<span class="ml-2 faultyState" style="font-size: 2em; font-weight: 900;">/</span>
							<span class="ml-2 faultyState" id="faultyAddValue" style="font-size: 2em; font-weight: 900;">30</span>
							<button type="button" class="btn btn-danger float-right mr-2" id="btnFaultyDel" style="font-size: 1.3rem;">삭제</button>
							<button type="button" class="btn btn-primary float-right mr-2" id="btnFaultyAdd" style="font-size: 1.3rem;">추가</button>
						</div>
					</div>
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<table id="workOrderFaultyAddTable" class="table table-bordered m-0">
								<colgroup>
									<col width="30%">
									<col width="40%">
									<col width="30%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" style="font-size: 2em;">불량발생일<span class="text-danger">*</span></th>
										<th class="text-center" style="font-size: 2em;">불량유형<span class="text-danger">*</span></th>
										<th class="text-center" style="font-size: 2em;">불량수량<span class="text-danger">*</span></th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<button type="button" class="btn btn-primary" id="btnFaultySave" style="font-size:2rem; width:100%; height: 100%;">불량등록</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 불량등록 --> --%>
<!-- 비가동시작 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="nonOperationModal" tabindex="-1" aria-labelledby="nonOperationModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl modal-dialog-centered" style="width:100%; max-width: 60%;">
		<div class="modal-content">
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:29vh;">
						<div class="col-md-12 p-0">
							<table id="" class="table table-bordered m-0">
								<colgroup>
									<col width="20%">
									<col width="50%">
									<col width="30%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" style="font-size: 2em;">비가동구분<span class="text-danger">*</span></th>
										<td>
											<select id="noGubun" class="custom-select custom-select-lg mw-100" style="height: 9vh; font-size: 4vh;"></select>
										</td>
										<td rowspan='3'>
											<button type="button" class="btn btn-primary" id="btnNonOperationStart" style="font-size:3em; width:100%; height: 27vh;">비가동처리</button>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2em;">비가동사유</th>
										<td class="p-0">
											<input type="text" class="form-control-lg mw-100 virtualKeyboard" id="noReason" style="height: 9vh; font-size: 4vh;">
										</td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2em;">시작시간<span class="text-danger">*</span></th>
										<td class="p-0">
											<input type="datetime-local" class="form-control-lg mw-100" id="noStartDate" style="height: 9vh; font-size: 4vh;">
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
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 비가동시작 -->
<!-- 강제종료 경고문구 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="workExitModal" tabindex="-1" aria-labelledby="workExitModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl modal-dialog" style="width:100%; max-width: 30%;">
		<div class="modal-content">
			<div class="modal-header">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<span class="ml-2" style="font-size: 2em; font-weight: 900;">경고 <i class="fa-solid fa-triangle-exclamation text-warning"></i></span>
						</div>
					</div>
				</div>
            </div>
			<div class="modal-body">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0">
						<div class="col-md-12 p-0">
							강제종료를 하시면 아래와 같은 작업이 수행됩니다.<br>
							<ul class="list-group">
								<li class="list-group-item" >1. 현재 공정의 마지막차수 실적이 등록되어있을 경우 재공품 생성</li>
								<li class="list-group-item" >2. 현재공정과 이후공정 모두 강제종료 처리</li>
							</ul>
							강제종료 하시겠습니까?
						</div>
					</div>
				</div>
			</div>
			<div class="modal-foot p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0">
						<div class="col-md-12 p-0">
							<button type="button" class="btn btn-secondary float-right mb-1 mr-2" data-dismiss="modal" style="font-size:1rem;">닫기</button>
							<button type="button" class="btn btn-danger float-right mb-1 mr-2" id="btnWorkExitSave" style="font-size:1rem;">강제종료</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 강제종료 경고문구 -->
<!-- 이전 자재 조회 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="matrlListModal" tabindex="-1" aria-labelledby="matrlListModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 60%;">
		<div class="modal-content">
			<div class="modal-header">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<span class="ml-2" style="font-size: 2em; font-weight: 900;">이전 자재조회 <i class="fa-solid fa-triangle-exclamation text-warning"></i></span>
						</div>
					</div>
				</div>
            </div>
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<button type="button" class="btn btn-success float-left" id="btnSelectMatrlBarcode" style="font-size: 1.3rem;">투입</button>
							<input class="form-control-lg mw-80 float-right mr-4" type="text" id="textSearch" placeholder="통합검색" style="width:20vw;">
						</div>
					</div>
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<table id="matrlListTable" class="table table-bordered m-0">
								<colgroup>
									<col width="5%">
									<col width="15%">
									<col width="25%">
									<col width="16%">
									<col width="17%">
									<col width="22%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" >
											<input type="checkbox" id="matrlCheckAll" name="matrlCheckAll" style="min-width: 100%; height: 2em;">
										</th>
										<th class="text-center" >차종</th>
										<th class="text-center" >품명</th>
										<th class="text-center" >투입일자</th>
										<th class="text-center" >잔량</th>
										<th class="text-center" >LOT NO</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
	      		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      	</div>
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 이전 자재 조회 -->
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
<!------------모달full screen------------>
<!-- 작업지시별 투입자재내역 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="matrlBarcodePopupModal" tabindex="-1" aria-labelledby="matrlBarcodeModalLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 65%;">
		<div class="modal-content">
			<div class="modal-header">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-12 p-0">
							<span class="ml-2" style="font-size: 2em; font-weight: 900;">자재 투입 내역 <i class="fa-solid fa-triangle-exclamation text-warning"></i></span>
						</div>
					</div>
				</div>
            </div>
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="" style="width: 70%;padding-right: 10px;">
							<table id="matrlBarcodePopupTable" class="table table-bordered m-0" style="font-size: 1.1rem;">
								<colgroup>
									<col width="28%">
									<col width="20%">
									<col width="13%">
									<col width="13%">
									<col width="13%">
									<col width="13%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center">작업세부번호</th>
										<th class="text-center">투입일자</th>
										<th class="text-center">투입수량</th>
										<th class="text-center">사용량</th>
										<th class="text-center">불량수량</th>
										<th class="text-center">잔량</th>
									</tr>
								</thead>
							</table>
						</div>
						<div class="" style="width: 30%;">
							<table class="table table-bordered m-0 mb-3" style="font-size: 1.1rem;">
								<colgroup>
									<col width="20%">
									<col width="80%">
								</colgroup>
								<thead class="thead-light">	
									<tr>
										<th colspan="2" class="text-center">품목 정보</th>
									<tr>
									<tr>
										<th class="text-center">바코드</th>
										<td colspan="1" class="text-center" id="barcodeNoLabel" style="background-color: #08f6df4d;"></td>
									</tr>
									<tr>
										<th class="text-center">차종</th>
										<td colspan="1" class="text-center" id="itemModelLabel"></td>
									</tr>
									<tr>
										<th class="text-center">품번</th>
										<td colspan="1" class="text-center" id="itemCdLabel"></td>
									</tr>
									<tr>
										<th class="text-center">품명</th>
										<td colspan="1" class="text-center" id="itemNmLabel"></td>
									</tr>
								</thead>
							</table>
							<table id="matrlBarcodePopupAccTable" class="table table-bordered m-0" style="font-size: 1.1rem;">
								<colgroup>
									<col width="50%">
									<col width="50%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th colspan="2" class="text-center">누적 수량</th>
									<tr>
										<th class="text-center">투입수량</th>
										<td class="text-right" id="matrlAccQty" style="background-color:lightgoldenrodyellow;color: green;"></td>
									</tr>
									<tr>
										<th class="text-center">사용량</th>
										<td class="text-right" id="useAccQty" style="background-color:lightgoldenrodyellow;"></td>
									</tr>
									<tr>
										<th class="text-center">불량수량</th>
										<td class="text-right" id="faultyAccQty" style="background-color:lightgoldenrodyellow;color: red;"></td>
									</tr>
									<tr>
										<th class="text-center">잔량</th>
										<td class="text-right" id="realAccQty" style="background-color:lightgoldenrodyellow;color: blue;"></td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
	      		<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	      	</div>
		</div>
	</div>
</div>
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 이전 자재 조회 -->
<!-- 단품불량>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<div class="modal fade" id="singleFaultyInputModal" tabindex="-1" aria-labelledby="singleFaultyInputLabel" aria-hidden="true" style="top:0px;">
	<div class="modal-dialog modal-xl" style="width:100%; max-width: 70%;">
		<div class="modal-content" style="border: solid #ff7f00 10px;border-radius: 10px;">
			<div class="modal-body p-2">
				<div class="container" style="padding:0px; min-width:100%;">
					<div class="row p-0" style="height:100%;">
						<div class="col-md-8 p-0">
							<table class="table table-bordered m-0">
								<colgroup>
									<col width="16%">
									<col width="34%">
									<col width="16%">
									<col width="34%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" style="font-size: 2.5em;">차종</th>
										<td id="singleItemModelTd" style="text-align: center; height: 11vh; font-size: 3vh; color: black;"></td>
										<th class="text-center" style="font-size: 2.5em;">품번</th>
										<td id="singleItemCdTd" style="text-align: center; height: 11vh; font-size: 3vh; color: black;"></td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2.5em;">품명</th>
										<td colspan="3" id="singleItemNmTd" style="text-align: center; height: 11vh; font-size: 3vh; color: black;"></td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2.5em;">잔량</th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="singleRealQty" style="height: 11vh; font-size: 5.5vh; color: black;" disabled>
										</td>
										<th class="text-center" style="font-size: 2.5em;">수량</th>
										<td class="p-0">
											<input type="text" class="form-control-lg text-right mw-100 virtualKeypad2" id="singleFaultyQty" style="height: 11vh; font-size: 5.5vh; color: red;" disabled>
										</td>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 2.5em;">일자</th>
										<td colspan="3" class="p-0">
											<input type="date" class="form-control-lg text-center mw-100" id="singleFaultyDate" style="height: 9vh; font-size: 4vh;">
										</td>
									</tr>
									<tr>
										<td colspan="4">
											<button type="button" class="btn btn-outline-danger" id="btnSingleFaultySave" style="font-size:3.5em;width:100%;height: 2.4em;font-weight: 700; border-width: 5px;">불 량 등 록</button>
										</td>
									</tr>
								</thead>
							</table>
						</div>
						<div class="col-md-4 p-0">
							<table id="singleFaultyTypeTable" class="table table-bordered m-0">
								<colgroup>
									<col width="44%">
									<col width="28%">
									<col width="28%">
								</colgroup>
								<thead class="thead-light">
									<tr>
										<th class="text-center" style="font-size: 1.5em;height:6.6vh;">불량유형</th>
										<th class="text-center" style="font-size: 1.5em;height:6.6vh;">불량수량</th>
										<th class="text-center" style="font-size: 1.5em;height:6.6vh;">누적수량<br>(금일)</th>
									</tr>
									<tr>
										<th class="text-center" style="font-size: 1rem; text-align:center; background-color:white;">전체</th>
										<th colspan="2">
											<input type="text" class="form-control-lg mw-100 text-right" id="totalQty" name="totalQty" style="background: lightgoldenrodyellow;border: none;font-weight: bold;" disabled>
										</th>
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
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< 단품불량 -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->

	
<%@include file="../layout/bottom.jsp"%>
<%= request.getParameter("workProgNo") %>
<%= request.getParameter("workProgDate") %>

<style>
body {
    font-size: 13px;
}

.toast-title {
	font-size: 1.4rem;
}

.toast-message {
	font-size: 1.4rem;
} 
.tr_highlight_row tr:hover {
	background-color: #3399CC !important;
	color : #ffffff;
}
</style>

<script>
	let currentHref = "wmsc0270";
	$(document).attr("title", "생산실적(봉제)");

	$('.page-title-bar').remove();
	
	$(document).ready(function() {
		if(!$('#main-wrapper').hasClass('has-compact-menu')) { // 왼쪽 메뉴가 열려있을 경우
			$('#main-wrapper').addClass('has-compact-menu');
			$('#stacked-menu').removeClass('stacked-menu-has-collapsible');
			$('#stacked-menu').addClass('stacked-menu-has-compact');
			$('#stacked-menu').addClass('stacked-menu-has-hoverable');
		}
	});

	// 현재시간 출력
	let timeCheck = 1;
	setInterval(function() {
		$('#clock').html(moment().format('YYYY-MM-DD HH:mm:ss'));
		
		if(timeCheck <= 5){
			workOrderProgressTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderPrcssTable.draw();
			workOrderProgressTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderPrcssTable.draw();

			workOrderMatrlTable.draw();
			workOrderMatrlAccTable.draw();
			timeCheck++;
		}
	}, 500);

	let singleFaultyBarcodeNo = '';
	let singleFaultyItemSeq = '';
	let singleRealQty = '';
	let matrlReadItemSeq ='';
	
	
	let workProgNoParam = "${param.workProgNo}";
	let workProgDateParam = "${param.workProgDate}";
	let startDateVal = moment().subtract('1','w').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let workOrdDateVal = moment().format('YYYY-MM');
	let workOrdNoVal = "";
	let minorPrcssCdVal = "";
	let workStatusVal = "";
	let workProgNoVal = "";
	let workOrdSeqVal = "0";
	let itemSeqVal = "";
	let workOrdQtyVal = "";
	let ordLotNoVal = "";
	let workProgNoArr = [];
	let workProgNoArr2 = [];
   	let locCd;	//공정창고코드
   	let locNo; 	//공정창고번호
	let inLocCdVal = '';	//품목정보에 등록된 창고코드
	let inLocNoVal = '';	//품목정보에 등록된 창고번호
	let workStatusCheck = '';
	let inspectGubunVal = '';
	let itemGubunVal = '';
	let matrlBarcodeNoVal = '';
	let workStatusWeYn = 'N'; // null 아니면 공백('') - 작업종료 포함 / 나머지 - 작업종료 제외
	let workChargrVal = '';
	let itemCusVal = '';
	let itemUnit = '';
	let labelProgressData = ''; //라벨프린트 용 행 데이터 변수
	//테이블 로우 인덱스>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	let prcssTbIdx;		//생산실적 인덱스
	//<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<테이블 로우 인덱스
	
	if (workProgNoParam != null && workProgNoParam != '') {
		workProgNoArr.push(workProgNoParam);
	};
	$('#workOrdDate').val(workOrdDateVal);
	if (workProgDateParam != null && workProgDateParam != '') {
		$('#workOrdDate').val(workProgDateParam);
	};
	
	let userNm = "${userNm}";
	let userNumber = "${userNumber}";
	const prcssCdVal = "${prcssCdVal}";
	const serverProgDateFrom = "${serverDateFrom}";
	const serverProgDateTo = "${serverDateTo}";
	let workProgDateFrom = serverProgDateFrom;
	let workProgDateTo = serverProgDateTo;
	let itemGubunProg = '';
	let workEmerYnProg = '';
	let minorPrcssCdProg = prcssCdVal;
	const userId = "${userId}"; // 로그인 사용자 정보
	const menuUrl = "${menuUrl}"; // 메뉴 경로
	let adminYn = false; //관리자 구분
	let serverMonthTo = serverProgDateTo.substring(0, 7);
	
	//승인여부
	$.ajax({
		url : '<c:url value="sm/approvalAuthAdmList"/>',
		type: 'GET',
		dataType: 'json',
		async: false,
		data: {
			'userId' 	: function() { return userId;},
			'apprDesc'	: function() { return menuUrl;},
		},
		success: function(res) {
			let data = res.data;
			
			if (data.length != 0) {
				adminYn = true;
			} else {
				adminYn = false;
			}
		},
	});
			
	//공통코드 시작>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	let userList = new Array(); // 사용자목록
	<c:forEach items="${userList}" var="info">
		var json = new Object();
		json.baseCd = "${info.userNumber}";
		json.baseNm = "${info.userNm}";
		userList.push(json);
	</c:forEach>

	let prcssList = new Array(); // 공정
	<c:forEach items="${prcssList}" var="info">
		var json = new Object();
		json.baseCd = "${info.prcssCd}";
		json.baseNm = "${info.prcssNm}";
		prcssList.push(json);
	</c:forEach>
	
	let workEmerYnCode = new Array(); //긴급여부
	<c:forEach items="${workEmerYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	let workGubunList = new Array(); //긴급여부
	<c:forEach items="${workGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workGubunList.push(json1);
	</c:forEach>
	
	let itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode.push(json1);
	</c:forEach>
	
	let faultyTypeArray = new Array(); //불량유형
	<c:forEach items = "${faultyTypeList}" var = "info">
	var json = new Object();
	json.baseCd = "${info.baseInfoCd}";
	json.baseNm = "${info.baseInfoNm}";
	faultyTypeArray.push(json);
	</c:forEach>
	
	let inspectGubunCode = new Array(); //검사취출
	<c:forEach items="${inspectGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	inspectGubunCode.push(json1);
	</c:forEach>
	
	let judgeCode = new Array();	//판정
    <c:forEach items="${judge}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	judgeCode.push(json);
	</c:forEach>
	
	let silhangCode = new Array();	//실행여부
    <c:forEach items="${silhang}" var="info">
	var json=new Object();
	json.baseCd="${info.baseCd}";
	json.baseNm="${info.baseNm}";
	silhangCode.push(json);
	</c:forEach>

	selectBoxAppend(userList, "workChargr", "${userNumber}", "2"); 
	selectBoxAppend(workGubunList, "workGubun", "001", "1"); 
	selectBoxAppend(prcssList, "prcssList", prcssCdVal != "" ? prcssCdVal : "", "1"); 
	selectBoxAppend(workEmerYnCode, "workEmerYn", "001", "1"); 
	selectBoxAppend(faultyTypeArray, "faultyTypeTd", "", "2");
	//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>공통코드 끝
	
	$(document).on('click', '.virtualKeyboard2', function() {
		virtualKeyboard_selector = $(this);
	});
	

	$(document).on('click', '.virtualKeyboard_content2 .virkey', function() {
		$(virtualKeyboard_selector).focus();
		var virkey_input_str = $(virtualKeyboard_selector).val();
		if($(this).attr('id') == 'virkey_0_13') { // backspace
			$(virtualKeyboard_selector).val(virkey_input_str.substring(0, virkey_input_str.length - 1)).trigger('keyup');
		} else if($(this).attr('id') == 'virkey_1_0') { // tab
			//$(virtualKeyboard_selector).next().focus();
			//virtualKeyboard_selector = $(virtualKeyboard_selector).next();
		} else if($(this).attr('id') == 'virkey_2_0') { // Caps Lock
			capsLockKey();
		} else if($(this).attr('id') == 'virkey_2_12') { // Enter
			
		} else if($(this).attr('id') == 'virkey_3_0' || $(this).attr('id') == 'virkey_3_11') { // Shift
			shiftKey();
		} else if($(this).attr('id') == 'virkey_4_0' || $(this).attr('id') == 'virkey_4_5') { // Ctrl
			
		} else if($(this).attr('id') == 'virkey_4_1') { // Win
			
		} else if($(this).attr('id') == 'virkey_4_2') { // Alt
			
		} else if($(this).attr('id') == 'virkey_4_3') { // SpaceBar
			$(virtualKeyboard_selector).val(virkey_input_str+' ').trigger('keyup');
		} else if($(this).attr('id') == 'virkey_4_4') { // 한영 전환
			if(virtualKeyboard_language == 'ko') {
				languageChange('en');
				virtualKeyboard_language = 'en';
			} else if(virtualKeyboard_language == 'en'){
				languageChange('ko');
				virtualKeyboard_language = 'ko';
			}
			
		} else {
			$(virtualKeyboard_selector).val(Hangul.assemble(Hangul.disassemble(virkey_input_str+$(this).text()))).trigger('keyup');
		}
	});

	$('.virtualKeypad2').on('click',function() {
		virtualKeypad_selector = $(this);
	});

	$('.virtualKeypad_content2 .virkey').on('click',function() {
		$(virtualKeypad_selector).focus();
		var virkey_input_str = $(virtualKeypad_selector).val();
		if($(this).attr('id') == 'virkeypad_0_0' || $(this).attr('id') == 'backspace') { // backspace
			$(virtualKeypad_selector).val(virkey_input_str.substring(0, virkey_input_str.length - 1)).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_2_3' || $(this).attr('id') == 'upCount') { // +1
			$(virtualKeypad_selector).val(virkey_input_str==''?0:parseFloat(virkey_input_str)+1).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_3_3' || $(this).attr('id') == 'downCount') { // -1
			$(virtualKeypad_selector).val(virkey_input_str==''?0:parseFloat(virkey_input_str)-1).trigger('keyup');
		} else if($(this).attr('id') == 'virkeypad_4_2') { // Enter
			
		} else {
			$(virtualKeypad_selector).val(Hangul.assemble(Hangul.disassemble(virkey_input_str+$(this).text()))).trigger('keyup');
		}
	});

	//*******************작업지시 정보******************
	//작업지시번호 목록 조회 팝업
   	let workOrderPopUpTable;
   	function selectWorkOrd() {
		if(workOrderPopUpTable == null || workOrderPopUpTable == undefined)	{
			 workOrderPopUpTable = $('#workOrderPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'f>>" +
					"<'row'<'col-sm-12 p-0'tr>>" +
					"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				searching : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : true,
				lengthChange : true,
				pageLength : 20,
				scrollY : '65vh',
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {
						'mainGubun'	: function(){ return '002'; },
					},
				},
				rowId : 'workOrdNo',
				columns : [			
					{//품목구분
						data : 'itemGubunNm'
					},
					{//설비명
						data : 'equipNm'
					},
					{//작지번호
						data : 'workOrdNo'
					},
					{//작지번호
						data : 'subWorkChargrNm'
					},
					{//품번
						data : 'itemCd'
					},
					{//품명
						data : 'itemNm'
					},
					{//차종
						data : 'itemModelNm'
					},
					{//지시수량
						data : 'workOrdQty'
					},
					{//생산수량
						data : 'outputQty'
					},
					{//작업지시일
						data : 'workOrdDate',
						render : function(data,type,row,meta){
							if(data != null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{//생산일자
						data : 'workStartDate',
						render : function(data,type,row,meta){
							if(data != null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{//긴급여부
						data : 'workEmerYnNm',
						render : function(data,type,row,meta){
							if(data == "긴급"){
								return '<span style="color:red;">'+data+'</span>';
							}else{
								return data;
							}
						}
					},			
					{//작업상태
						data : 'workStatusCd',
						render : function (data, type, row, meta) {
							if (data == "W") {
								return '대기'
							} else if (data == "WS"){
								return '<span style="color:blue">작업시작</span>'
							} else if (data == "WE") {
								return '<span style="color:green">작업종료</span>'
							} else if (data == "NS") {
								return '<span style="color:red">비가동</span>'
							} else{
								return '<span>-</span>'
							}
						}
					},			
				],
				columnDefs: [
		        	{ targets: [7,8], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3,4,5,6,9,10,11,12], className: 'text-center-td' },
		        	{ targets: [7,8], className: 'text-right-td' }
		        ],
			    order: [
			    ],
			    buttons: [],
			    drawCallback: function() {
				    var api = this.api();
				}
			});
		} else {
			$('#workOrderPopUpTable').DataTable().ajax.reload(function(){});
		}
		
		$('#workOrderPopUpModal').modal('show');
		
		setTimeout(function(){
			workOrderPopUpTable.draw();
			workOrderPopUpTable.draw();
		}, 300);
   	}

   	//작업지시번호 팝업창 행 선택시
	$(document).on('click', '#workOrderPopUpTable tbody tr', function () {
	 	if ( $(this).hasClass('selected') ) {
	 		$(this).css("background-color", "white");
            $(this).removeClass('selected');
        } else {
	         $('#workOrderPopUpTable').DataTable().$('tr.selected').css("background-color", "white");
        	 $('#workOrderPopUpTable').DataTable().$('tr.selected').removeClass('selected');
	         $(this).addClass('selected');
	         $(this).css("background-color", "#3399CC");
        }
	 	workProgNoArr = [];
        workOrdNoVal = workOrderPopUpTable.row(this).data().workOrdNo;
        $('#workOrdNoScan').val(workOrdNoVal);
        $('#workOrderProgressTable').DataTable().ajax.reload(function(){});
	    
        $('#workOrderPopUpModal').modal('hide');	
	});
   	
	//작업지시번호 목록 조회 팝업
   	let workProgPopUpTable;
   	function selectWorkProg() {
   		workStatusWeYn = 'N';
   		
		if (workProgPopUpTable == null || workProgPopUpTable == undefined) {
			workProgPopUpTable = $('#workProgPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>B>",
				language : lang_kor,
				destroy : true,
				paging : true,
				searching : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : -1,
				scrollY : '65vh',
				ajax : {
					url : '<c:url value="po/workOrdListSewingList"/>',
					type : 'GET',
					data : {
						'startDate' 	: function(){ return workProgDateFrom.replace(/-/g,''); },
						'endDate' 		: function(){ return workProgDateTo.replace(/-/g,''); },
						'itemGubun' 	: function(){ return itemGubunProg; },
						'workEmerYn' 	: function(){ return workEmerYnProg; },
						'minorPrcssCd' 	: function(){ return minorPrcssCdProg; },
						'mainGubun' 	: function(){ return '002'; },
						'workStatusWe' 	: function(){ return workStatusWeYn; }, //작업상태가 종료인 항목 조회 유무,
						'tmMon' 		: function(){return serverMonthTo;}
					},
				},
				rowId : '',
				columns : [
					{//체크박스
						render : function (data, type, row, meta) {
							let html = '';
							html += '<input type="hidden" name="workProgDate" value="'+row['workProgDate']+'">';
							html += '<input type="hidden" name="workProgNoTd" value="'+row['workProgNo']+'">';
							html += '<input type="checkbox" class="checkbox" id="checkLal-'+meta.row+'" name="checkProg" style="width:20px;height:20px;">';
							return html;
						}
					}, 
					{//작업지시일
						data : 'workProgDate',
						render : function ( data, type, row, meta ) {
							if ( data != null && data != '' ) {
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
						}
					},
					{//작업지시번호
						data : 'workOrdNo'
					},
					{//작업세부번호
						data : 'workProgNo'
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
					{//공정
						data : 'minorPrcssCd',
						render	: function ( data, type, row, meta ) {
							if ( data != null && data != 'undefined' ) {
								return data;
							} else {
								return "";
							}
						},
					},
					/* {//설비명
						data : 'equipNm',
						render : function ( data, type, row, meta ) {
							if ( data != null ) {
								return data;
							} else {
								return '';
							}
						},
					}, */
					{//지시수량
						data : 'workProgQty',
						render	: function ( data, type, row, meta ) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return "0";
							}
						},
						'className' : 'text-right'
					},
					{//생산수량
						data : 'outputQty',
						render	: function ( data, type, row, meta ) {
							if ( data != null ) {
								return rmDecimal(data);
							} else {
								return "0";
							}
						},
						'className' : 'text-right'
					},
					{//생산일자
						data : 'workEndTime',
						render : function ( data, type, row, meta ) {
							if ( data != null && data != '' ) {
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
						}
					},
					{//작업상태
						data : 'workStatus',
						render : function ( data, type, row, meta ) {
							if ( data != null ) {
								return data;
							} else {
								return '대기';
							}
						}
					},
				],
				columnDefs: [
			           {"targets": "_all", "className": "text-center"},
			           {"targets" : [0], "orderable": false},
			    ],
			    order: [
			    	[ 1, 'asc' ], [ 2, 'asc' ]
			    ],
			    buttons: [],
			});
		} else {
			$('#workProgPopUpTable').DataTable().ajax.reload(function(){});
		}
		
		$('#workProgPopUpModal').modal('show');
		
		//메인 테이블_length 변경
		let html1 = '';
		html1 +=  '<div class="row">&nbsp;&nbsp;';
		html1 += '<label class="input-label-sm" style="font-size:0.8rem; height:1.7rem;">작업지시일자</label>';
		html1 += '<input type="date" class="form-control" id="workProgDateFrom" value="'+serverProgDateFrom+'" style="max-width:130px; font-size:0.8rem; height:1.7rem;">&nbsp; ~ &nbsp;';
		html1 += '<input type="date" class="form-control" id="workProgDateTo" value="'+serverProgDateTo+'" style="max-width:130px; font-size:0.8rem; height:1.7rem;">&nbsp;&nbsp;&nbsp;&nbsp;';

		html1 += '<label class="input-label-sm" style="font-size:0.8rem; height:1.7rem;">품목구분</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += 	'<select id="itemGubunProg" title="" class="select w80 col-12 custom-select" style="font-size:0.8rem; height:1.7rem;">';
		html1 += 	'</select>';
		html1 += '</div>&nbsp;&nbsp;&nbsp;';

		html1 += '<label class="input-label-sm" style="font-size:0.8rem; height:1.7rem;">긴급여부</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += 	'<select id="workEmerYnProg" title="" class="select w80 col-12 custom-select" style="font-size:0.8rem; height:1.7rem;">';
		html1 += 	'</select>';
		html1 += '</div>&nbsp;&nbsp;&nbsp;';
		
		html1 += '<label class="input-label-sm" style="font-size:0.8rem; height:1.7rem;">공정</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += 	'<select id="prcssProg" title="" class="select w80 col-12 custom-select" style="font-size:0.8rem; height:1.7rem;">';
		html1 += 	'</select>';
		html1 += '</div>&nbsp;&nbsp;&nbsp;';
		
		html1 += '<label class="input-label-sm" id="workStatusWeLabal" style="font-size:0.8rem; height:1.7rem;" for="workStatusWeBox">작업종료 포함</label>';
		html1 += '<div class="form-group input-sub m-0" id="workStatusWeBoxDiv">';
		html1 += 	'<input type="checkbox" class="checkbox" id="workStatusWeBox" style="width: 1.7rem; height:1.7rem;">';
		html1 += '</div>&nbsp;&nbsp;&nbsp;';

		html1 += '<button type="button" class="btn btn-primary ml-3" id="btnProgRetv" style="font-size:0.8rem; height:1.7rem; width:6rem">선택</button>';
		
		html1 += '</div>';

		$('#workProgPopUpTable_length').html(html1);
		
		$('#workProgDateFrom').val(serverProgDateFrom);
	    $('#workProgDateTo').val(serverProgDateTo);
	    $('#checkAllProg').prop('checked',false);
		selectBoxAppend(itemGubunCode, "itemGubunProg", "", "1");
		selectBoxAppend(workEmerYnCode, "workEmerYnProg", "", "1");
		selectBoxAppend(prcssList, "prcssProg", prcssCdVal != "" ? prcssCdVal : "", "1");
		userList.forEach(function(object){
			if ( object.baseCd == userNumber ) {
				$('#workStatusWeLabal').addClass('d-none');
				$('#workStatusWeBoxDiv').addClass('d-none');
				return false;
			}
		});
		
		setTimeout(function(){
			workProgPopUpTable.draw();
			workProgPopUpTable.draw();
		}, 300);
   	}
   	
   	//생산지시현황 팝업창 조건 변경 시
	$(document).on('change', '#workProgDateFrom, #workProgDateTo, #itemGubunProg, #workEmerYnProg, #prcssProg, #workStatusWeBox', function () {
		workProgDateFrom = $('#workProgDateFrom').val().replace(/-/g,'');
		workProgDateTo = $('#workProgDateTo').val().replace(/-/g,'');
		itemGubunProg = $('#itemGubunProg option:selected').val();
		workEmerYnProg = $('#workEmerYnProg option:selected').val();
		minorPrcssCdProg = $('#prcssProg option:selected').val();
		workStatusWeYn = $('#workStatusWeBox').prop('checked') ? '' : 'N';
		
		$('#workProgPopUpTable').DataTable().ajax.reload(function(){$("#checkAllProg").prop("checked", false);});
	});
   	
	//생산지시현황 팝업창 전체선택 체크 시
	$(document).on('click', '#checkAllProg', function () {
		if($(this).is(':checked')) {
			$("input[name=checkProg]").prop("checked", true);
		} else {
			$("input[name=checkProg]").prop("checked", false);
		}
	});
	
	//생산지시현황 팝업창 행 클릭 시
	$(document).on('click', '#workProgPopUpTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=checkProg]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=checkProg]').prop('checked',true);
		}
	});
	let workProgDate = '';
   	//생산지시현황 팝업창 조회 버튼 선택시
	$(document).on('click', '#btnProgRetv', function(){
		let check = false;
		
		workProgNoArr=[];
		var cnt=0;
		$('#workProgPopUpTable tbody tr').each(function(index) {
			if ($('input[name=checkProg]').eq(index).is(':checked')) {
				workProgNoArr.push($(this).find('input[name=workProgNoTd]').val());
				if(cnt==0){
					workProgDate = moment($(this).find('input[name=workProgDate]').val()).format('YYYY-MM')
					cnt++;
				}
				check = true;
			};
		});
		
		if (check) {
			$('#workOrdDate').val(workProgDate);
			$('#workOrdNoScan').val('');
	        $('#workProgPopUpModal').modal('hide');	
	        $('#workOrderProgressTable').DataTable().ajax.reload();

	        
		} else {
			toastr.warning("조회할 항목을 클릭해주세요.");
		}
		
	});
   	

	$// 작업지시번호 SCAN
	$('#workOrdNoScan').on('keyup',function(e) {
		if(e.which == 13) {
			workOrdNoVal = $(this).val();
			console.log('scanData:'+workOrdNoVal)
			$('#workOrderProgressTable').DataTable().ajax.reload(function(){});
		}
	});
	
	// 작업지시일 변경
	$('#workOrdDate').on('change',function() {
		workOrderProgressTable.ajax.reload();
	});

	// 설비 변경
	$('#prcssList').on('change',function() {
		workOrderProgressTable.ajax.reload();
	});

	// 작업상태 변경
	$('#statusList').on('change',function() {
		workOrderProgressTable.ajax.reload();
	});
	
	// 작업지시번호 SCAN
	$('#workOrdNoScan').on('keyup',function(e) {
		if(e.which == 13) {
			workOrdNoVal = $(this).val();
			workOrderProgressTable.ajax.reload();
		}
	});
	
   	//생산공정 순서 목록조회
	let workOrderProgressTable = $('#workOrderProgressTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'>>" +
			"<'row'<'col-sm-12 p-0'tr>>" +
			"<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		scrollY : "45vh",
		pageLength : -1,
		ajax : {
			url : '<c:url value="po/workOrderProgressList"/>',
			type : 'GET',
			data : {
				'workProgDate' 	: function(){ return $('#workOrdDate').val().replace(/-/g,''); },
				'workProgNoArr' : function(){ return workProgNoArr; },
				'minorPrcssCd' 	: function(){ return $('#prcssList').val(); },
				'workStatus' 	: function(){ return $('#statusList').val(); },
			},
		},
		rowId : 'workProgNo',
		columns : [
			{//품목구분
				data : 'itemGubunNm'
			},
			{//차종
				data : 'itemModelNm'
			},
			{//품명
				data : 'itemNm'
			},
			{//상태
				data : 'workStatusNm',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						if ( data == "대기" ) {
							return data;
						} else if ( data == "작업시작" ) {
							return '<span>진행</span>';
						} else if ( data == "작업종료" ) {
							return '<span>완료</span>';
						} else if ( data == "비가동시작" ) {
							return '<span>비가동</span>';
						} else {
							console.log("예상치 못한 오류가 발생했습니다.");
							return '';
						}
					} else {
						return '';
					}
				}
			},			
		],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
        ],
	    order: [
	    ],
	    buttons: [],
	    drawCallback: function() {
	    	if ($('#workOrdDate').val() == workProgDateParam && workProgNoArr == workProgNoParam) {
	    		$('#workOrderProgressTable tbody tr').trigger('click');
	    	}
		}
	});
   	
   	//생산공정 순서 행 선택
	$(document).on('click', '#workOrderProgressTable tbody tr', function () {
		if ( workOrderProgressTable.data().length > 0 ) {
		 	if ( $(this).hasClass('selected') ) {
//	 	 		 $(this).css("background-color", "white");
//	             $(this).removeClass('selected');
	        } else {
		         $('#workOrderProgressTable').DataTable().$('tr.selected').css("background-color", "white");
	        	 $('#workOrderProgressTable').DataTable().$('tr.selected').removeClass('selected');
		         $(this).addClass('selected');
		         $(this).css("background-color", "#3399CC");
	        }
		 	
		 	if ($('#workOrdDate').val() == workProgDateParam && workProgNoArr == workProgNoParam) { //기간별 생산현황(봉제)(wmsc0221) 에서 넘어왔을 경우
		 		$('#tab2Nav').tab('show');
	    	} else {
	    		$('#tab1Nav').tab('show');
	    	}
		 	
		 	$('#tab1Nav').removeClass('disabled');
		 	$('#tab2Nav').removeClass('disabled');
		 	$('#tab3Nav').removeClass('disabled');
		 	$('#tab4Nav').removeClass('disabled');
		 	
		 	$('#barcodeNoScan').val('');

	        let data = workOrderProgressTable.row(this).data();
	        labelProgressData = workOrderProgressTable.row(this).data(); //라벨 출력 시 사용할 데이터
	        
	        workOrdNoVal = data.workOrdNo;
	        minorPrcssCdVal = data.minorPrcssCd;
	        workProgNoVal = data.workProgNo;
	        workProgNoArr2 = [];
	        workProgNoArr2.push(workProgNoVal);

	        workStatusVal = data.workStatus;
	        itemSeqVal = data.itemSeq;
	        workOrdQtyVal = data.workProgQty;
	        itemGubunVal = data.itemGubun;
	        workChargrVal = data.workChargrNm;
	        itemCusVal = data.itemCusNm;
	        itemUnit = data.itemUnit;

	        locCd = data.locCd;	//공정창고
	        locNo = data.locNo;	//공정창고
	        		
	        inLocCdVal = data.inLocCd==null||data.inLocCd==""?"006":data.inLocCd;	//품목정보 등록된 창고
	    	inLocNoVal = data.inLocNo==null||data.inLocNo==""?"":data.inLocNo;	//품목정보 등록된 창고
	    	
	    	$('#sampleCnt').val(data.sampleCnt != null ? data.sampleCnt : '001');
		 	$('#sampleCnt').attr('disabled', false);
		 	
		 	//중물검사안함 체크
	    	if ( data.mdInspectYn == "002" ) {
	    		$('#ckMdInspectNo').prop('checked', true);
	    		$('#btnInspPopup2').attr('disabled', true);
	        } else {
	        	$('#ckMdInspectNo').prop('checked', false);
	        	$('#btnInspPopup2').attr('disabled', false);
	        }
	    	//자주검사안함 체크
	    	if ( data.jajuInspectYn == "002" ) {
	    		$('#jajuChkBox').prop('checked', true);
	        } else {
	        	$('#jajuChkBox').prop('checked', false);
	        }
	    	//'작업 재시작', '실적 삭제' 버튼 활성화 여부
	    	if ( workStatusVal == "WE" && adminYn ) {
	    		$('#btnWorkRestart').removeClass('d-none');
	    		$('#btnPrcssAdmDel').removeClass('d-none');
	        } else {
	        	$('#btnWorkRestart').addClass('d-none');
	        	$('#btnPrcssAdmDel').addClass('d-none');
	        }

	    	//생산실적 수정/삭제 버튼 활성화 
	    	if ( workStatusVal != "WE" ) {
		       	$('#btnPrcssEdit').attr('disabled', false);
		       	$('#btnPrcssDel').attr('disabled', false);
	        }else{
			 	$('#btnPrcssEdit').attr('disabled', true);
			 	$('#btnPrcssDel').attr('disabled', true);
			 	$('#btnPrcssSave').attr('disabled', true);
		    }
			
	        //작업상태 버튼 설정
	        $('.btn_blue_status').addClass('btn-outline-primary').removeClass('btn-primary');
			$('.btn_green_status').addClass('btn-outline-success').removeClass('btn-success');
			$('.btn_red_status').addClass('btn-outline-danger').removeClass('btn-danger');

			$('#btnSearchBarcodeList').attr('disabled',true);
	    	$('#btnMatrlOutput').attr('disabled',true);
	    	$('#barcodeNoScan').attr('disabled',true);
	        if ( workStatusVal == "WS" ) {
	        	$('#btnWorkStart').removeClass('btn-outline-primary').addClass('btn-primary');
	        	$('#btnSearchBarcodeList').attr('disabled',false);
	        	//$('#btnMatrlOutput').attr('disabled',false);
	        	$('#barcodeNoScan').attr('disabled',false);
	        } else if ( workStatusVal == "WE" ) {
	        	$('#btnWorkEnd').removeClass('btn-outline-success').addClass('btn-success');
	        } else if ( workStatusVal == "NS" ) {
	        	$('#btnWorkStopSave').removeClass('btn-outline-danger').addClass('btn-danger');
	        }
	        
			prcssTbIdx = '';
			$('#btnMatrlOutput').attr('disabled',true);

	        $('#workOrderPrcssMainTable').DataTable().ajax.reload();	//생산공정 순서 목록조회
	        $('#workOrderPrcssTable').DataTable().ajax.reload();		//생산실적등록 목록조회
	        $('#workOrderMatrlTable').DataTable().ajax.reload(function(){}); //자재투입내역 목록조회
	        $('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){}); //자재투입내역 목록조회
	        
	        setTimeout(function(){
	        	workOrderMatrlTable.draw();
	            workOrderPrcssTable.draw();
	            workOrderPrcssTable.draw();
	            workOrderMatrlTable.draw();
	            workOrderMatrlAccTable.draw();
	        }, 300);
		}
	});

 	//생산공정 순서 목록조회
	let workOrderPrcssMainTable = $('#workOrderPrcssMainTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '6vh',
		ajax : {
			url : '<c:url value="po/workOrderProgressRead"/>',
			type : 'GET',
			data : {
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'minorPrcssCd' 	: function(){ return minorPrcssCdVal; },
				'workProgNoArr' : function(){ return workProgNoArr2; },
			},
		},
		columns : [
			{//작업지시번호
				data : 'workOrdNo'
			},
			{//작업세부번호
				data : 'workProgNo'
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
			{//지시량
				data : 'workProgQty',
				render : function (data, type, row, meta) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				}
			},
			{//생산량
				data : 'outputQty',
				render : function (data, type, row, meta) {
					if ( data != null ) {
						return '<span style="color:blue">'+rmDecimal(data)+'</span>';
					} else {
						return '';
					}
				}
			},
			{//양품수량
				data : 'fairQty',
				render : function (data, type, row, meta) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				}
			},
			{//불량수량
				data : 'faultyQty',
				render : function (data, type, row, meta) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				}
			},
			{//공정명
				data : 'prcssNm'
			},			
		],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
        ],
	    order: [
	    ],
	    buttons: [],
	    drawCallback: function() {
		}
		
	});


   	//상단 작업상태 버튼***********************************************************************************
   	let status = '';
	let changeWorkStatusCheck = false;
	
	//작업시작 버튼 클릭 시
	$('#btnWorkStart').on('click', function(){
		console.log("작업시작 버튼 클릭");
		
		if ( workStatusVal == "W" ) {
			changeWorkStatus('WS');
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-primary').addClass('btn-primary');
				toastr.success("작업시작 되었습니다.");

				$('#btnSearchBarcodeList').attr('disabled',false);
	        	//$('#btnMatrlOutput').attr('disabled',false);
	        	$('#barcodeNoScan').attr('disabled',false);
			}
		} else if ( workStatusVal == "WS" ) {
			toastr.warning("시작된 작업지시입니다.");
		} else if ( workStatusVal == "WE" ) {
			toastr.warning("종료된 작업지시입니다.");
		} else if ( workStatusVal == "NS" ) {
			changeWorkStatus('WS');
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-primary').addClass('btn-primary');
				toastr.success("작업시작 되었습니다.");

				$('#btnSearchBarcodeList').attr('disabled',false);
	        	//$('#btnMatrlOutput').attr('disabled',false);
	        	$('#barcodeNoScan').attr('disabled',false);
			}
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnWorkStart onclick");
		}
	});

	//작업종료 버튼 클릭 시 
	$('#btnWorkEnd').on('click', function(){
		console.log("작업종료 버튼 클릭");
		
		if ( workStatusVal == "W" ) {//대기
			toastr.warning("우선 작업을 시작해주세요.");
		
		} else if ( workStatusVal == "WS" ) {//작업시작
			let check = true;
			if ( workOrderPrcssTable.data().length <= 0 ) {
				toastr.warning("우선 생산실적을 등록해주세요.");
				check = false;
				return false;
			} 
			
			if(check){
				changeWorkStatus('WE');
				if (changeWorkStatusCheck) {
					$(this).removeClass('btn-outline-success').addClass('btn-success');
					toastr.success("작업종료 되었습니다.");
					//workOrdFaultyAdd();
					$('#btnSearchBarcodeList').attr('disabled',true);
		        	$('#btnMatrlOutput').attr('disabled',true);
		        	$('#barcodeNoScan').attr('disabled',true);

		        	$('#btnPrcssEdit').attr('disabled',true);
		        	$('#btnPrcssDel').attr('disabled',true);
				}
			}
			
		} else if ( workStatusVal == "NS" ) {//비가동시작
			changeWorkStatus('WE');
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-success').addClass('btn-success');
				toastr.success("작업종료 되었습니다.");
				//workOrdFaultyAdd();
				$('#btnSearchBarcodeList').attr('disabled',true);
	        	//$('#btnMatrlOutput').attr('disabled',true);
	        	$('#barcodeNoScan').attr('disabled',true);
	        	$('#btnPrcssEdit').attr('disabled',true);
	        	$('#btnPrcssDel').attr('disabled',true);
			}
			
		} else if ( workStatusVal == "WE" ) {//작업종료
			toastr.warning("종료된 작업지시입니다.");
		
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnWorkEnd onclick");
			
		}
		
	});
	
	//작업 재시작 버튼 클릭 시
	$('#btnWorkRestart').on('click', function(){
		console.log("작업 재시작 버튼 클릭");
		
		if ( workStatusVal == "W" ) {
			toastr.warning("우선 작업을 시작해주세요.");
		} else if ( workStatusVal == "WS" ) {
			toastr.warning("시작된 작업지시입니다.");
		} else if ( workStatusVal == "WE" ) {
			changeWorkStatus('WS');
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-primary').addClass('btn-primary');
				toastr.success("작업 재시작 되었습니다.");

				$('#btnSearchBarcodeList').attr('disabled',false);
	        	//$('#btnMatrlOutput').attr('disabled',false);
	        	$('#barcodeNoScan').attr('disabled',false);
			}
		} else if ( workStatusVal == "NS" ) {
			changeWorkStatus('WS');
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-primary').addClass('btn-primary');
				toastr.success("작업시작 되었습니다.");

				$('#btnSearchBarcodeList').attr('disabled',false);
	        	//$('#btnMatrlOutput').attr('disabled',false);
	        	$('#barcodeNoScan').attr('disabled',false);
			}
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnWorkStart onclick");
		}
	});
	
	
	//작업종료 시 불량수량 합계 별도 LOT NO 생성
	/* function workOrdFaultyAdd() {
		let sumFaultyQty = 0;
		$('#workOrderPrcssTable tbody tr').each(function(index, item){
			sumFaultyQty += $(this).find('td input[name=faultyQty]').val()*1;
		});
		
		if ( sumFaultyQty > 0 ) {//불량수량 합계 별도 LOTNO생성
			$.ajax({
				url: '<c:url value="po/workOrdAddByBongjae" />',
	            type: 'POST',
	            data: {
	            	'workOrdNo'			:	function(){ return workOrdNoVal; },
	            	'middlePrcssCd'		:	function(){ return workProgNoVal; },
	            	'minorPrcssCd'		:	function(){ return minorPrcssCdVal; },
	            	'itemSeq'			:	function(){ return itemSeqVal; },
	            	'ordDate'			:	function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
	            	'workStatus'		:	function(){ return '003'; },
	            	'workChargr'		:	function(){ return $('#workChargr').val(); },
	            	'targetQty'			:	function(){ return workOrdQtyVal; },
	            	'boxCount'			:	function(){ return sumFaultyQty; },
	            	'outputQty'			:	function(){ return '0'; },
	            	'fairQty'			:	function(){ return '0'; },
	            	'faultyQty'			:	function(){ return sumFaultyQty; },
	            	'etcQty'			:	function(){ return '0'; },
	            	'outQty'			:	function(){ return '0'; },
	            	'remainQty'			:	function(){ return '0'; },
	            	'packYn'			:	function(){ return 'N'; },
	            	'labelPrintYn'		:	function(){ return 'N'; },
	            	'workEndTime'		:	function(){ return $('#clock').text(); },
	            	'ordLotNoDate'		:	function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
	            },
           		success: function (res) {
	                var data = res.data;
	                if(res.result == 'ok') {
	                	toastr.success('불량 LotNo를 등록했습니다.');
	                	$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
	                } else {
	                	toastr.error(res.message);
	                }
	            }
			});
    	}
	} */

	//비가동등록 버튼 클릭 시 
	$('#btnWorkStopSave').on('click', function(){
		console.log("비가동등록 버튼 클릭");

		if ( workStatusVal == "W" ) {
			toastr.warning("우선 작업을 시작해주세요.");
		} else if ( workStatusVal == "WS" ) {
			changeWorkStatus('NS');	//작업상태 변경
			if (changeWorkStatusCheck) {
				$(this).removeClass('btn-outline-danger').addClass('btn-danger');
				toastr.success("비가동 되었습니다.");
			}
		} else if ( workStatusVal == "WE" ) {
			toastr.warning("종료된 작업지시입니다.");
		} else if ( workStatusVal == "NS" ) {
			toastr.warning("비가동된 작업지시입니다.");
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnWorkStopSave onclick");
		}
		
	});

	// 실적등록 버튼 click
	$('#btnResultInput').on('click',function() {
		
		if ( workStatusVal == "W" ) {
			toastr.warning("우선 작업을 시작해주세요.");
		} else if ( workStatusVal == "WS" ) { //modal show

			$.ajax({
				url : '<c:url value="po/getMatrlBomInputStatus" />',
				type : 'GET',
				data : {
					'itemSeq' 		: function(){ return itemSeqVal; },
					'workOrdNo' 	: function(){ return workOrdNoVal; },
					'middlePrcssCd' : function(){ return workProgNoVal; },
				},
				success : function(res){
					if ( res.data == "OK" ) {
						$('#itemModelTd').text(workOrderPrcssMainTable.data(0)[0].itemModelNm);
						$('#itemCdTd').text(workOrderPrcssMainTable.data(0)[0].itemCd);
						$('#itemNmTd').text(workOrderPrcssMainTable.data(0)[0].itemNm);
						selectBoxAppend(userList, "workChargr", "${userNumber}", "2");
						$('#boxCountTd').val(workOrderPrcssMainTable.data(0)[0].boxCount);
						$('#boxCountTd').attr('placeHolder', workOrderPrcssMainTable.data(0)[0].boxCount);
						$('#popupOutputQty').val("0");
						$('#fairQty').val('0');
						$('#faultyQty').val('0');
						$('#resultInputModal').modal('show');
						$('#workOrderFaultyAddTable2').DataTable().ajax.reload(function(){});
						setTimeout(function(){
							workOrderFaultyAddTable2.draw();
						},150)
					}else if(res.data=="NO"){
						toastr.warning("BOM에 등록된 자재를 모두 투입해주시기 바랍니다.");
					}
				}
			});
			
		} else if ( workStatusVal == "WE" ) {
			toastr.warning("종료된 작업지시입니다.");
		} else if ( workStatusVal == "NS" ) {
			toastr.warning("비가동된 작업지시입니다.");
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnResultInput onclick");
		}
		
	});

	// 양품수량 + 양품수량 = 생산수량 적용
	$(document).on('keyup', "#fairQty",  function() {
		let fairQty = parseFloat($('#fairQty').val().replaceAll(/,/g,''));
		let faultyQty = parseFloat($('#faultyQty').val().replaceAll(/,/g,''));
		
		if ( isNaN(fairQty) ) {
			fairQty = 0;
		}
		if ( isNaN(faultyQty) ) {
			faultyQty = 0;
		}
		$('#popupOutputQty').val( rmDecimal(fairQty+faultyQty) );
		
	});

	// 실적저장 버튼 click
	$('#btnResultSave').on('click', function() {
		if ( $('#workChargr').val() == '' ) {
			toastr.warning('작업자를 선택해주세요.');
			$('#workChargr').focus();
			return false;
		}
		if ( $('#popupOutputQty').val().replace(/,/g,'') <= 0 ) {
			toastr.warning('생산수량을 입력해주세요.');
			$('#popupOutputQty').focus();
			return false;
		}
		if ( !$('#fairQty').val().trim() ) {
			toastr.warning('양품수량을 입력해주세요.');
			$('#fairQty').focus();
			return false;
		}
		if ( !$('#faultyQty').val().trim() ) {
			toastr.warning('불량수량을 입력해주세요.');
			$('#faultyQty').focus();
			return false;
		}
		if ( !$('#boxCountTd').val().trim() ) { //포장수량 미입력 시 기존 포장수량 입력
			$('#boxCountTd').val($('#boxCountTd').attr('placeHolder'));
		} else {
			if ( $('#boxCountTd').val().replace(/,/g,'') <= 0 ) {
				toastr.warning('포장수량을 입력해주세요.');
				$('#boxCountTd').focus();
				return false;
			}
		}

		//품목정보 등록된 창고코드
		if ( inLocCdVal==null || inLocCdVal=="") {
			toastr.warning('제품정보관리(봉제)에 저장위치 등록해주세요.');
			$('#resultInputModal').modal('hide');
			return false;
		}

		$.ajax({
			url : '<c:url value="po/getMatrlBomInputConsumpt"/>',
			type : 'GET',
			data : {
				'itemSeq' 		: function(){ return itemSeqVal; },
				'workOrdNo' 	: function(){ return workOrdNoVal; },
				'middlePrcssCd' : function(){ return workProgNoVal; },
				'workOrdQty' 	: function(){ return $('#popupOutputQty').val().replace(/,/g,''); },
				'locationCd'    : function(){ return locCd},
			},
			success : function(res){
				if(res.result=="ok"){
					//생산실적 등록
					workOrderPrcssAdd();
				}else{
					toastr.warning("자재가 부족합니다. 확인바랍니다.");
				}
			}
		})
	});
	
	/* // 불량등록 버튼 클릭 시
	$('#btnFaultySave').on('click', function() {
		let dataArray = new Array();
		let check = true;
		
		if ( $('#faultyAddSum').text() != $('#faultyAddValue').text() ) {
			toastr.warning("등록할 불량수량을 확인해주세요.");
			check = false;
			return false;
		}
		
		if ( workOrderFaultyAddTable.data().count() > 0 ) {
			$('#my-spinner').show();//처리중..
			
			$('#workOrderFaultyAddTable tbody tr').each(function(index, item) {
				if ( $(this).find('select[name=faultyTypeCd]').val() == "" ) {
					$('#my-spinner').hide(); //처리완료..
					toastr.warning("불량유형을 입력해주세요.");
					$(this).find('select[name=faultyTypeCd]').focus();
					check = false;
					return false;
				}
				if ( $(this).find('input[name=faultyQtyTd]').val().replace(/,/g,'') <= 0 ) {
					$('#my-spinner').hide(); //처리완료..
					toastr.warning("불량수량을 입력해주세요.");
					$(this).find('input[name=faultyQtyTd]').focus();
					check = false;
					return false;
				}
				
				let rowData = new Object();
				rowData.workOrdNo =  workOrdNoVal;
				rowData.ordLotNo =  ordLotNoVal;
				rowData.middlePrcssCd = workProgNoVal;
				rowData.minorPrcssCd = minorPrcssCdVal;
				rowData.workOrdSeq = workOrdSeqVal;
				rowData.itemSeq =  itemSeqVal;
				rowData.locationCd =  locCd;

				rowData.workChargr = $('#workOrderPrcssTable tbody tr').eq(prcssTbIdx).find('select[name=workChargr]').val();
				rowData.inspectGubun = $('#workOrderPrcssTable tbody tr').eq(prcssTbIdx).find('select[name=inspectGubun]').val();
				rowData.outputQty = $('#workOrderPrcssTable tbody tr').eq(prcssTbIdx).find('input[name=outputQty]').val().replace(/,/g,'');
				rowData.fairQty = $('#workOrderPrcssTable tbody tr').eq(prcssTbIdx).find('input[name=fairQty]').val().replace(/,/g,'');
				rowData.faultyQty = $('#workOrderPrcssTable tbody tr').eq(prcssTbIdx).find('input[name=faultyQty]').val().replace(/,/g,'');
				
				rowData.faultyTypeCd = $(this).find('select[name=faultyTypeCd]').val();
				rowData.faultyTypeQty = $(this).find('input[name=faultyQtyTd]').val().replace(/,/g,'');
				rowData.faultyTypeDate = $(this).find('input[name=faultyDateTd]').val().replace(/-/g,'');

				dataArray.push(rowData);
				console.log(dataArray)
			});
			
		} else {
			toastr.warning("우선 불량유형을 등록 해주세요.");
			check = false;
			return false;
		}
		
		if(check){
			$.ajax({
				url: '<c:url value="/po/workOrdFaultyQty"/>',
	            type: 'POST',
	            datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
	            success: function (res) {
	                var data = res.data;
	                if(res.result == 'ok') {
	                	workOrderPrcssEdit();
	                	$('#resultInputModal').modal('hide');
	                	$('#faultyInputModal').modal('hide');
						$('#my-spinner').hide();//처리완료..
	                } else {
	                	toastr.error(res.message);
	                }
	            }
			});
		} 
		
	}); */

	//실적등록 
	function workOrderPrcssAdd() {
		$.ajax({
			url: '<c:url value="po/workOrdAddByBongjae2" />',
            type: 'POST',
            data: {
            	'workOrdNo'			:	function(){ return workOrdNoVal; },
            	'middlePrcssCd'		:	function(){ return workProgNoVal; },
            	'minorPrcssCd'		:	function(){ return minorPrcssCdVal; },
            	'itemSeq'			:	function(){ return itemSeqVal; },
            	'ordDate'			:	function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
            	'workChargr'		:	function(){ return $('#workChargr').val(); },
            	'workChargrNm'		:	function(){ return $('#workChargr :selected').text();},
            	'itemCusNm'			:	function(){ return itemCusVal;	},
            	'targetQty'			:	function(){ return workOrdQtyVal; },
            	'boxCount'			:	function(){ return $('#boxCountTd').val().replace(/,/g,''); },
            	'outputQty'			:	function(){ return $('#popupOutputQty').val().replace(/,/g,''); },
            	'fairQty'			:	function(){ return $('#fairQty').val().replace(/,/g,''); },
            	'faultyQty'			:	function(){ return $('#faultyQty').val().replace(/,/g,''); },
            	'etcQty'			:	function(){ return '0'; },
            	'outQty'			:	function(){ return '0'; },
            	'remainQty'			:	function(){ return '0'; },
            	'packYn'			:	function(){ return 'N'; },
            	'labelPrintYn'		:	function(){ return 'N'; },
            	'workStartTime'		:	function(){ return $('#clock').text(); },
            	'workEndTime'		:	function(){ return $('#clock').text(); },
            	'ordLotNoDate'		:	function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
            	'locCd'         	:   function(){ return locCd;},
            	'locationNo'    	:   function(){ return locNo;},
            	'inLoc'         	:   function(){ return inLocCdVal;},	//품목정보 등록된 창고코드 (TB_ITEM_INFO_ADM - SAVELOC_CD)
            	'inLocNo'         	:   function(){ return inLocNoVal;},	//품목정보 등록된 창고번호 (TB_ITEM_INFO_ADM - LOC_NO)
            	'itemGubun'     	:   function(){ return itemGubunVal;},
            	'workProgNo'    	:   function(){ return workProgNoVal;},
            	'itemUnit'    		:   function(){ return itemUnit;},
            	
            },
            beforeSend: function() {
            	$('#my-spinner').show();
            },
			success : function(res) {
				if (res.result == "ok") {
					let check = false;
					let dataArray = new Array();
					
					$('#workOrderFaultyAddTable2 tbody tr').each(function(item, index){
						let rowData = new Object();
						if ( !isNaN($(this).find('.faultyAddQty2').val()) && $(this).find('.faultyAddQty2').val() != "0" ) {
							rowData.workOrdNo = workOrdNoVal;
							rowData.middlePrcssCd = workProgNoVal;
							rowData.minorPrcssCd = minorPrcssCdVal;
							rowData.workOrdSeq = res.workOrdSeq; // 실적등록 후 가져온 데이터
							rowData.faultyTypeCd = workOrderFaultyAddTable2.row(index).data().faultyCd;
							rowData.faultyTypeQty = $(this).find('.faultyAddQty2').val().replace(/,/g,'');
							rowData.faultyTypeDate = $('#clock').text().substring(0,10).replace(/-/g,'');
							
							dataArray.push(rowData);
							check = true;
						}
					})
					
					if (check) { //불량수량이 있으면
						$.ajax({
							url: '<c:url value="/po/workOrdFaultyCreate"/>',
				            type: 'POST',
				            datatype : 'json',
							data : JSON.stringify(dataArray),
							contentType : "application/json; charset=UTF-8",
				            success: function (res) {
				                var data = res.data;
				                if(res.result == 'ok') {
				                	toastr.success('실적처리되었습니다.');
				                	//$('#resultInputModal').modal('hide');
				    				$('#my-spinner').hide();
				    				$('#tab2Nav').tab('show');
									workOrderPrcssMainTable.ajax.reload(function(){});
									$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
									$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
									$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
			                		setTimeout(function(){
			                			workOrderPrcssMainTable.draw();
			                			workOrderPrcssTable.draw();
			                			workOrderMatrlTable.draw();
			                			workOrderMatrlTable.draw();
			                			workOrderPrcssTable.draw();
			                			workOrderMatrlAccTable.draw();
			                		}, 300);
				                } else {
				                	toastr.error(res.message);
				                }
				            }
						});
					} else { //불량수량이 없으면
						toastr.success('실적처리되었습니다.');
	                	//$('#resultInputModal').modal('hide');
	    				$('#my-spinner').hide();
	    				$('#tab2Nav').tab('show');
						workOrderPrcssMainTable.ajax.reload(function(){});
						$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
						$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
						$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
                		setTimeout(function(){
                			workOrderPrcssMainTable.draw();
                			workOrderPrcssTable.draw();
                			workOrderMatrlTable.draw();
                			workOrderMatrlTable.draw();
                			workOrderPrcssTable.draw();
                			workOrderMatrlAccTable.draw();
                		}, 300);
					}

					barcodeLabelPrint(res.workOrderPrcssInsList);
				} else if(res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}
			
				
			},
			complete : function(){
				
			}
		});
	}

	//ESC키 클릭시 실적 모달창 HIDE
	$(document).keydown(function(event) {
	    if ( event.keyCode == 27 || event.which == 27 ) {
	    	$('#resultInputModal').modal('hide');
	    }
	});


	//작업상태 변경
	function changeWorkStatus(val) {
		if ( workOrdNoVal != null && workOrdNoVal != "" ) {
			status = val;
			
			$.ajax({
				url : '<c:url value="po/workOrderProgressUpd"/>',
				type : 'POST',
				async : false,
				data : {
					'workProgNo' 	: 	function(){return workProgNoVal},
					'workStatus' 	:	function(){return status},
				},
				beforeSedn : function(){
					$('#my-spinner').show();
				},
				success : function(res){
					if(res.result=="ok"){
						workStatusVal = status;
						changeWorkStatusCheck = true;
						
						$('.btn_blue_status').addClass('btn-outline-primary').removeClass('btn-primary');
						$('.btn_green_status').addClass('btn-outline-success').removeClass('btn-success');
						$('.btn_red_status').addClass('btn-outline-danger').removeClass('btn-danger');
						if ( val == "WS" ) {
				        	$('#btnWorkStart').removeClass('btn-outline-primary').addClass('btn-primary');
				        } else if ( val == "WE" ) {
				        	$('#btnWorkEnd').removeClass('btn-outline-success').addClass('btn-success');
				        } else if ( val == "NS" ) {
				        	$('#btnWorkStopSave').removeClass('btn-outline-danger').addClass('btn-danger');
				        }
						$('#workOrderProgressTable').DataTable().ajax.reload();
					} else {
						toastr.warning(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		} else {
			toastr.warning("작업지시를 선택해주세요.");
			changeWorkStatusCheck = false;
		}
		
	}

	
	//생산실적등록***************************************************************************************
   	//생산실적등록
   	let workOrderPrcssTable = $('#workOrderPrcssTable').DataTable({
   		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : false, //$(this).index() 때문에 정렬 쓰면 오류 생김. 절대로 true 쓰지 않도록. - 2023.02.06
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '38vh',
		ajax : {
	    	url: '<c:url value="/po/workOrderPrcssListByBongjea"/>',
	        type : 'GET',
	        data : {
		        'middlePrcssCd' : function(){ return workProgNoVal; },
	        },
	    },
	    rowId : 'workOrdSeq',
	    columns : [
	    	{//체크박스
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" class="form-control-lg" data-idx="'+meta.row+'" data-seq="'+row['workOrdSeq']+'" data-ordlotno="'+row['ordLotNo']+'" name="prcssCheck"/>';
				},
				'className' : 'text-center'
			},
	    	{//상태
				data : 'workStatus',
				render : function(data, type, row, meta) {
					if (data != null) {
 						if ( data == "001" ) {
 							return '<label title="진행중" name="workStatus" style="color: green; font-size: 21px;">●</label>';
						} else if ( data == "002" ) {
							return '<label title="진행완료" name="workStatus" style="color: black; font-size: 21px;">●</label>';
						} else if ( data == "003" ) {
							return '<label title="불량" name="workStatus" style="color: red; font-size: 21px;">●</label>';
						} else {//예상치 못한 오류
							return '';
						}
 					} else {
 						return '<label title="진행중" style="color: green; font-size: 21px;">●</label>';
					}
				},
				'className' : 'text-center'
			},
	    	{//LOT NO
				data : 'ordLotNo',
				render : function(data, type, row, meta) {
					if (data != null) {
						let html = '';
						html += '<input type="hidden" name="workOrdSeq" value="'+row['workOrdSeq']+'">';
						html += '<input type="hidden" name="ordLotNo" value="'+row['ordLotNo']+'">';
						html += '<span>'+data+'</span>';
 						return html;
 					} else {
 						return '<span>자동생성</span>';
					}
				},
				'className' : 'text-center'
			},
			{//작업자
				data : 'workChargr',
				render : function(data, type, row, meta) {
					if (data != null) {
						return selectBoxHtmlDisY(userList, "workChargr", data, row, meta);
 					} else {
 						return '<span></span>';
					}
				},
				'className' : 'text-center'
			},
			{//생산수량
				data : 'outputQty',
				render : function(data, type, row, meta) {
					if ( data != null ) {
						let html = "";
						html += '<input type="text" class="form-control-lg mw-100 text-right"';
						html += 'style="border:none; background-color: transparent;"';
						html += 'name="outputQty" value="'+rmDecimal(data)+'" disabled/>';
						return html;
	 	 			}else{
						return '';
	 	 			}
				},
				'className' : 'text-right'
			},
			{//양품수량
				data : 'fairQty',
				render : function(data, type, row, meta) {
					if(row['ordLotNo'] != null) {
						return '<input type="text" class="form-control-lg mw-100 text-right inputQty" style="border:none; background-color: transparent;" name="fairQty" value="'+rmDecimal(data)+'" disabled/>';
	 				}else {
						return '<span>0</span>';
					}
				},
				'className' : 'text-right'
			},
			{//불량수량
				data : 'faultyQty',
				render : function(data, type, row, meta) {
					if(row['ordLotNo'] != null) {
						return '<input type="text" class="form-control-lg mw-100 text-right inputQty" style="border:none; background-color: transparent;" name="faultyQty" value="'+rmDecimal(data)+'" disabled/>';
 					}else {
						return '<span>0</span>';
					}
				},
				'className' : 'text-right'
			},
			{//검사취출
				data : 'inspectGubun',
				render : function(data, type, row, meta) {
					return selectBoxHtml3(inspectGubunCode,"inspectGubun", data, row, meta);
				},
				'className' : 'text-center'
			},
			{//완료시간
				data : 'workEndTime',
				render : function(data, type, row, meta) {
					if (data != null) {
	 					return '<span>'+moment(data,'YYYYMMDDHHmm').format('YYYY-MM-DD HH:mm')+'</span>';
					} else {
						return '';
					}
				},
				'className' : 'text-center'
			},
			/*{//불량등록
				render : function (data, type, row, meta) {
					let btnHtml = '';
					if ( row['workStatus'] == "001" ) {
						if ( row['faultyCount']*1 > 0 ) {
							btnHtml += '<button type="button" class="btn btn-primary" name="" onclick="workOrderfaultyAdd(\''+row['ordLotNo']+'\',\''+meta.row+'\')" style="font-size:1rem; height:2rem; width:90%;">등록</button>';
						} else {
							btnHtml += '<button type="button" class="btn btn-primary" name="" onclick="workOrderfaultyAdd(\''+row['ordLotNo']+'\',\''+meta.row+'\')" style="font-size:1rem; height:2rem; width:90%;">미등록</button>';
						}
					} else if ( row['workStatus'] == "002" ) {
						if ( row['faultyCount']*1 > 0 ) {
							btnHtml += '<button type="button" class="btn btn-primary" name="" style="font-size:1rem; height:2rem; width:90%;" disabled>등록</button>';
						} else {
							btnHtml += '<button type="button" class="btn btn-primary" name="" style="font-size:1rem; height:2rem; width:90%;" disabled>미등록</button>';
						}
					} else {
						btnHtml += '';
					}
					return btnHtml;
				},
				'className' : 'text-center'
			},*/
			/* {//실적등록
				render : function (data, type, row, meta) {
					let btnHtml = '';
					if ( row['workStatus'] == "001" ) {
						btnHtml += '<button type="button" class="btn btn-primary"  name="btnBarcodePrint" onclick="barcodePrint('+meta.row+')" style="font-size:1rem; height:2rem; width:90%;">미등록</button>';
					} else if ( row['workStatus'] == "002" ) {
						btnHtml += '<button type="button" class="btn btn-primary"  name="btnBarcodePrint" onclick="barcodePrint('+meta.row+')" style="font-size:1rem; height:2rem; width:90%;" disabled>등록</button>';
					} else {
						btnHtml += '';
					}
					return btnHtml;
				},
				'className' : 'text-center'
			}, */
			{//라벨
				render : function(data, type, row, meta) {
					let printRowData = new Array(row);
					return '<button type="button" class="btn btn-success" id="btnLabelPrint_'+meta.row+'" name="btnLabelPrint" onclick="btnPrintLabel('+row['workOrdSeq']+')" style="font-size:1rem; height:2rem; width:90%;">출력</button>';
				},
				'className' : 'text-center'
			},
      	],         
	    order: [
	      	//[ 1, 'desc' ]
	    ],
	    buttons: [],
// 	    drawCallback: function() {
// 		}
	});

  	//생산실적등록 행 선택시
	$(document).on('click', '#workOrderPrcssTable tbody tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).css("background-color", "white");
            $(this).removeClass('selected');
        } else {
	         $('#workOrderPrcssTable').DataTable().$('tr.selected').css("background-color", "white");
        	$('#workOrderPrcssTable').DataTable().$('tr.selected').removeClass('selected');
	         $(this).addClass('selected');
	         $(this).css("background-color", "#3399CC");
        }
	});


  	//수정버튼 클릭시
  	$('#btnPrcssEdit').on('click', function(){
  		if (workStatusVal=="WE") {
  			toastr.warning("작업종료 된 생산실적은 삭제할 수 없습니다.");
			return false;
  		} 

  		if ( !$('input[name=prcssCheck]').is(':checked') ) {
			toastr.warning("수정할 항목을 선택해주세요.");
			return false;
		}

  		$('input[name=prcssCheck]:checked').each(function(index,item){
			console.log('index:'+index);
	  		$('#workOrderPrcssTable tbody tr').eq($(this).attr('data-idx')).find('select').css('border','1px solid #cccccc').css('background-color','white').attr('disabled', false);
  	  	});

  		$('#btnPrcssSave').removeClass('d-none');
		
  	});
	
  	//삭제 버튼 클릭 시
  	$('#btnPrcssDel').on('click', function(){
  		if ( workStatusVal == "WE" ) {
  			toastr.warning("작업종료 된 생산실적은 삭제할 수 없습니다.");
			return false;
  		}
  		if ( !$('input[name=prcssCheck]').is(':checked') ) {
			toastr.warning("삭제할 생산실적 항목을 선택해주세요.");
			return false;
		}
		
  	  	$('#deletePrcssModal').modal('show');
  	});
  	
  	//실적 삭제 버튼 클릭 시
  	$('#btnPrcssAdmDel').on('click', function(){
  		if ( !$('input[name=prcssCheck]').is(':checked') ) {
			toastr.warning("삭제할 생산실적 항목을 선택해주세요.");
			return false;
		}
		
  	  	$('#deletePrcssModal').modal('show');
  	});
  	
  	//삭제버튼 클릭시
  	$('#btnPrcssDeleteConfirm').on('click',function(){
  		$('#deletePrcssModal').modal('hide');
  		var dataArray = new Array();		
		var check=true;  		

	    $('td input[name=prcssCheck]:checked').each(function(index, item){
			console.log('index:'+index);
			console.log('item:'+item);
			var rowData = new Object();

			rowData.workOrdNo = workOrdNoVal;
			rowData.middlePrcssCd = workProgNoVal;
			rowData.minorPrcssCd = minorPrcssCdVal;
			
			rowData.workOrdSeq = $(this).attr('data-seq');
			rowData.ordLotNo = $(this).attr('data-ordlotno');
			
			dataArray.push(rowData);
		    console.log(rowData);
		});

	    if(check){
  			$.ajax({
  				url : '<c:url value="po/workOrdPrcssDelByBongjae" />',
  				type : 'POST',
  				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
  				success : function(res){
  					if ( res.result == "ok" ) {
  						toastr.success("실적 삭제되었습니다.");
  						$('#workOrderPrcssTable').DataTable().ajax.reload();
  						$('#workOrderPrcssMainTable').DataTable().ajax.reload();
  					} else if( res.result == "fail"){
  						toastr.warning(res.message);
  					} else {
  						toastr.error(res.message);
  					}

  					$('#my-spinner').hide();
  				}
  			});
  	  	}
  	});
	
	//저장버튼 클릭시
	$('#btnPrcssSave').on('click', function(){
		var dataArray = new Array();		
		var check=true;  		

	    $('td input[name=prcssCheck]:checked').each(function(index, item){
		    let editIdx = $(this).attr('data-idx');
			var rowData = new Object();
			rowData.workOrdNo = workOrdNoVal;
			rowData.middlePrcssCd = workProgNoVal;
			rowData.workOrdSeq = $(this).attr('data-seq');
			rowData.workChargr = $('select[name=workChargr]').eq(editIdx).val();
			rowData.inspectGubun = $('select[name=inspectGubun]').eq(editIdx).val();
			
			dataArray.push(rowData);
		    console.log(rowData);
		});

  		if(check){
  			$.ajax({
  				url : '<c:url value="po/workOrdPrcssEditByBongjae" />',
  				type : 'POST',
  				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
  				success : function(res){
  					if ( res.result == "ok" ) {
  						toastr.success("실적 수정되었습니다.");
  						$('#workOrderPrcssTable').DataTable().ajax.reload();
  				       	$('#btnPrcssSave').addClass('d-none');
  					} else if( res.result == "fail"){
  						toastr.warning(res.message);
  					} else {
  						toastr.error(res.message);
  					}

  					$('#my-spinner').hide();
  				}
  			});
  	  	}
		
	});
	
/* 	//불량등록 모달 활성화
	function workOrderfaultyAdd(olnVal, idx) {
		if ( $('input[name=outputQty]').eq(idx).val().replace(/,/g,'') <= 0 ) {
			toastr.warning('생산수량을 입력해주세요.');
			$('input[name=outputQty]').eq(idx).focus();
			return false;
		}
		if ( !$('input[name=fairQty]').eq(idx).val().trim() ) {
			toastr.warning('양품수량을 입력해주세요.');
			$('input[name=fairQty]').eq(idx).focus();
			return false;
		}
		if ( $('input[name=faultyQty]').eq(idx).val().replace(/,/g,'') <= 0 ) {
			toastr.warning('불량수량을 입력해주세요.');
			$('input[name=faultyQty]').eq(idx).focus();
			return false;
		}
// 		let sumOutputQty = 0;
// 		$('#workOrderPrcssTable tbody tr').each(function(index, item){
// 			sumOutputQty += $(this).find('td input[name=outputQty]').val()*1;
// 		});
// 		if ( sumOutputQty > workOrderPrcssMainTable.data(0)[0].workProgQty*1 ) {
// 			toastr.warning('생산수량이 지시수량을 초과했습니다.');
// 			return false;
// 		}
		
		ordLotNoVal = olnVal;
		$('#workOrderFaultyAddTable').DataTable().ajax.reload(function(){
			let faultyAddQtySum = 0;
			for ( var i=0; i < $('.faultyAddQty').length; i++ ) {
				faultyAddQtySum += parseFloat($('.faultyAddQty').eq(i).val().trim() == '' ? 0 : $('.faultyAddQty').eq(i).val().replaceAll(/,/g,''));
			}
			if ( faultyAddQtySum > parseFloat($('#faultyAddValue').text()) ) {
				$('.faultyState').css('color','#ff0000');
			} else if(faultyAddQtySum == parseFloat($('#faultyAddValue').text())) {
				$('.faultyState').css('color','#00ff00');
			} else {
				$('.faultyState').css('color','#000000');
			}
			$('#faultyAddSum').text(rmDecimal(faultyAddQtySum));
			$('#faultyAddValue').text( $('input[name=faultyQty]').eq(idx).val().replace(/,/g,'') );
		});
		$('#faultyInputModal').modal('show'); // 불량등록 모달 show
		
		setTimeout(function(){
			workOrderFaultyAddTable.draw();
			workOrderFaultyAddTable.draw();
		}, 300);
	} */

	/* // 양품수량 + 양품수량 = 생산수량 적용
	$(document).on('keyup', "input[name=fairQty],input[name=faultyQty]",  function() {
		let fairQty = parseFloat($('input[name=fairQty]').eq(prcssTbIdx).val().replaceAll(/,/g,''));
		let faultyQty = parseFloat($('input[name=faultyQty]').eq(prcssTbIdx).val().replaceAll(/,/g,''));
		if ( isNaN(fairQty) ) {
			fairQty = 0;
		}
		if ( isNaN(faultyQty) ) {
			faultyQty = 0;
		}
		console.log('fairQty: ' + fairQty);
		console.log('faultyQty: ' + faultyQty);
		
		$('input[name=outputQty]').eq(prcssTbIdx).val(fairQty+faultyQty);
	});
 */

	//불량등록***************************************************************************************
	//불량등록
	let workOrderFaultyTable = $('#workOrderFaultyTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
			+ "<'row'<'col-sm-12 p-0'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '42vh',
		ajax : {
			url : '<c:url value="po/workFaultyTypeAllList"/>',
			type : 'GET',
			data : {
				'workOrdNo' : function() { return workOrdNoVal; },
				'workProgNo' : function(){ return workProgNoVal; },
			},
		},
	    columns : [
	    	{//체크박스
				render : function ( data, type, row, meta ) {
					if(row['type']=="M"){
						return '<input type="checkbox" style="height: 1.5rem; width: 1.5rem;" data-itemSeq="'+row['itemSeq']+'" data-idx="'+row['idx']+'" data-barcodeNo="'+row['barcodeNo']+'" name="faultyCheck"/>';
					}else{
						return '<input type="checkbox" style="height: 1.5rem; width: 1.5rem;" name="faultyCheck" disabled/>';
					}
				},
				'className' : 'text-center'
			},
			{//품목구분
				data : 'itemGubunNm',
				'className' : 'text-center'
			},
			{//품명
				data : 'itemNm',
				'className' : 'text-center'
			},
			{//LOT NO
				data : 'barcodeNo',
				'className' : 'text-center'
			},
			{//불량발생일
				data : 'faultyDate',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return moment(data).format('YYYY-MM-DD');
					} else {
						return '';
			        }
				},
				'className' : 'text-center'
			},
			{//불량수량
				data : 'faultyQty',
				render : function(data, type, row, meta) {
					if(data!=null) {
						return rmDecimal(data);
				 	} else {
		           		return '';
			        }
				},
				'className' : 'text-right'
			},
			{//불량유형
				data : 'faultyTypeNm',
				render : function(data, type, row, meta) {
					if (data != null) {
						return data;
					} else {
						return '';
					}
				},
				'className' : 'text-center'
			},
	    ],
	    order: [
	      	//[ 1, 'desc' ]
	    ],
	    buttons: [],
	    drawCallback: function() {
		    var api = this.api();
		    $('#workOrderFaultyTable_filter').addClass('d-none');
		}
	}); 

	// 통합검색
	$('#textSearchFaulty').on('keyup',function() {
		$('#workOrderFaultyTable_filter').find('input').val($(this).val());
		$('#workOrderFaultyTable_filter').find('input').trigger('keyup');
	});

	//불량 행 선택시
	$(document).on('click', '#workOrderFaultyTable tbody tr', function () {
		if ( $(this).hasClass('selected') ) {
	 		$(this).css("background-color", "white");
            $(this).removeClass('selected');
       } else {
	        $('#workOrderFaultyTable').DataTable().$('tr.selected').css("background-color", "white");
       	 	$('#workOrderFaultyTable').DataTable().$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	        $(this).css("background-color", "#3399CC");
       }
	});

	//전체선택시
    $('#faultyCheckAll').on('click',function(){
    	if ( $('#faultyCheckAll').is(":checked") ) {
        	
    		$('input[name=faultyCheck]').each(function(index,item){
    			if(!$(this).is(':disabled')){
            		$(this).prop('checked', true);
                }
    		});
		} else {
			$('input[name=faultyCheck]').prop('checked', false);
		}
    }); 

	
	//삭제버튼 클릭시
  	$('#btnFaultyDel').on('click',function(){
  		var dataArray = new Array();	
  		
		if ( workStatusVal == "WE" ) {
  			toastr.warning("작업종료 된 생산실적은 삭제할 수 없습니다.");
			return false;
  		}
  		if ( !$('input[name=faultyCheck]').is(':checked') ) {
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}

		$('td input[name=faultyCheck]:checked').each(function(index, item){

			var rowData = new Object();          
			rowData.locCd = locCd;
			rowData.locNo = locNo;
			rowData.idx = $(this).attr('data-idx');
			rowData.ordLotNo = $(this).attr('data-barcodeNo');
			rowData.itemSeq = $(this).attr('data-itemSeq');
			dataArray.push(rowData);
		    console.log(rowData);
		});

		$.ajax({
			url : '<c:url value="po/workSingleItemFaultyDel" />',
			type : 'POST',
			datatype: 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res){
  				console.log(res.result)
				if ( res.result == "ok" ) {
					toastr.success(res.message);
				} else if( res.result == "fail"){
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
				}

  				$('#workOrderPrcssMainTable').DataTable().ajax.reload();
  				$('#workOrderFaultyTable').DataTable().ajax.reload();
  				
  				$('#my-spinner').hide();
			}
		});
  	});
	 
	/* //불량등록
	let workOrderFaultyAddTable = $('#workOrderFaultyAddTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '40vh',
		ajax : {
			url : '<c:url value="po/workOrderFaultyTypeList"/>',
			type : 'POST',
			async : false,
			data : {
				'workOrdNo' : function() { return workOrdNoVal; },
				'ordLotNo' : function(){ return ordLotNoVal; },
			},
		},
	    columns : [
			{//불량발생일
				data : 'faultyTypeDate',
				render : function(data, type, row, meta){
					let html = '';
					if (data != null) {
						html += '<input type="date" class="form-control text-center" name="faultyDateTd" style="min-width: 100%; height: 2em; font-size: 1.2em;" value="'+moment(data).format('YYYY-MM-DD')+'">';
						return html;
					} else {
						html += '<input type="date" class="form-control text-center" name="faultyDateTd" style="min-width: 100%; height: 2em; font-size: 1.2em;" value="'+serverProgDateTo+'">';
						return html;
					}
				},
				className : 'text-center'
			},
			{//불량유형
				data : 'faultyTypeCd',
				render : function(data, type, row, meta) {
					if (data != null) {
						return selectBoxHtmlDisN(faultyTypeArray, "faultyTypeCd", data, row, meta);
 					} else {
 						return selectBoxHtmlDisN(faultyTypeArray, "faultyTypeCd", '', row, meta);
					}
				},
				className : 'text-center p-0'
			},
			{//불량수량
				data : 'faultyTypeQty',
				render : function(data, type, row, meta){
					let html = '';
					if(data != null){
						html += '<input type="text" class="form-control-lg text-right virtualKeyboard2 mw-100 faultyAddQty" name="faultyQtyTd" value="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\')" style="min-width: 100%; height: 2em; font-size: 1.2em;">';
						return html;
					} else {
						html += '<input type="text" class="form-control-lg text-right virtualKeyboard2 mw-100 faultyAddQty" name="faultyQtyTd" value="0" onkeyup="numberFormat(this, \'int\')" style="min-width: 100%; height: 2em; font-size: 1.2em;">';
						return html;
					}
				},
				className : 'text-center p-0'
			},
		],
	    order: [
	      	//[ 1, 'desc' ]
	    ],
	    buttons: [],
	    drawCallback: function() {
	    	// 불량수량 입력 keyup
			$('.faultyAddQty').off('keyup');
			$('.faultyAddQty').on('keyup', function() {
				let faultyAddQtySum = 0;
				for ( var i=0; i < $('.faultyAddQty').length; i++ ) {
					faultyAddQtySum += parseFloat($('.faultyAddQty').eq(i).val().trim() == '' ? 0 : $('.faultyAddQty').eq(i).val().replaceAll(/,/g,''));
				}
				if ( faultyAddQtySum > parseFloat($('#faultyAddValue').text()) ) {
					$('.faultyState').css('color','#ff0000');
				} else if(faultyAddQtySum == parseFloat($('#faultyAddValue').text())) {
					$('.faultyState').css('color','#00ff00');
				} else {
					$('.faultyState').css('color','#000000');
				}
				$('#faultyAddSum').text(rmDecimal(faultyAddQtySum));
			});

			$('.faultyAddQty').trigger('keyup');
		}
		
	}); */

	
  	
  	/* //불량등록 모달 추가 버튼 클릭 시
	$('#btnFaultyAdd').on('click', function() {
		$('#workOrderFaultyAddTable').DataTable().row.add({}).draw(false);
	}); */
  	
  /* 	//불량등록 모달 테이블 행 선택시
	$(document).on('click', '#workOrderFaultyAddTable tbody tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).css("background-color", "white");
            $(this).removeClass('selected');
        } else {
	         $('#workOrderFaultyAddTable').DataTable().$('tr.selected').css("background-color", "white");
        	$('#workOrderFaultyAddTable').DataTable().$('tr.selected').removeClass('selected');
	         $(this).addClass('selected');
	         $(this).css("background-color", "#3399CC");
        }
	});
  	 */
	/* //불량등록 모달 삭제 버튼 클릭 시
	$('#btnFaultyDel').on('click', function() {
		if($('#workOrderFaultyAddTable').DataTable().row('.selected').length <= 0){
			toastr.warning("삭제할 항목을 선택해주세요.");
			return false;
		}
		$('#workOrderFaultyAddTable').DataTable().row('.selected').remove().draw();
		if ( $('.faultyAddQty').length <= 0 ) {
			$('#faultyAddSum').text('0');
			$('.faultyState').css('color','#000000');
		}
	});
 */

	//불량등록 유형별
	let workOrderFaultyAddTable2 = $('#workOrderFaultyAddTable2').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '42vh',
		ajax : {
			url : '<c:url value="bm/prcssFaultyOrdAdmlist"/>',
			type : 'GET',
			async : false,
			data : {
				'itemSeq' 		: function(){ return itemSeqVal; }, //봉제 불량유형만
				'prcssCd' 		: function(){ return minorPrcssCdVal; }, // 해당 공정의 불량유형을 조회되도록, 공정이 지정안된 불량유형까지 조회
				'useYn'			: function(){ return '001';}
			},
		},
	    columns : [
			{//불량유형
				data : 'faultyNm', 'className':'text-center',
				render : function(data, type, row, meta){
					return '<span style="font-size: 1rem; text-align:center;">'+data+'</span>';
				}
			},
			{//불량수량
				render : function(data, type, row, meta){
					let html = '';
					html += '<input type="text" class="form-control-lg mw-100 text-right faultyAddQty2" value="0" onkeyup="numberFormat(this, \'int\')">';
					html += '<input type="hidden" value="'+row['faultyCd']+'">';
					return html;
				}
			},
		],
	    order: [],
	    buttons: [],
	    drawCallback: function() {
	    	// 불량수량 입력 keyup
			$('.faultyAddQty2').off('keyup');
			$('.faultyAddQty2').on('keyup', function() {
				let faultyAddQtySum2 = 0;
				for ( var i=0; i < $('.faultyAddQty2').length; i++ ) {
					faultyAddQtySum2 += parseFloat($('.faultyAddQty2').eq(i).val().trim() == '' ? 0 : $('.faultyAddQty2').eq(i).val().replaceAll(/,/g,''));
				}
				$('#faultyQty').val(rmDecimal(faultyAddQtySum2));

				let fairQty = parseFloat($('#fairQty').val().replaceAll(/,/g,''));
				let faultyQty = faultyAddQtySum2;
				
				if ( isNaN(fairQty) ) {
					fairQty = 0;
				}
				if ( isNaN(faultyQty) ) {
					faultyQty = 0;
				}
				$('#popupOutputQty').val( rmDecimal(fairQty+faultyQty) );
			});
		}
	});
  	
	//자재투입내역 탭 클릭
	$('#tab1Nav').on('click', function() {
		$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
		$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
		
		setTimeout(function(){
			workOrderMatrlTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderMatrlTable.draw();
			workOrderMatrlAccTable.draw();
		}, 300);
		
		prcssTbIdx = '';
		$('#btnMatrlOutput').attr('disabled',true);
    });
	
	//생산실적등록 탭 클릭
	$('#tab2Nav').on('click', function() {
		$('#workOrderPrcssTable').DataTable().ajax.reload(function(){});
		
		setTimeout(function(){
			workOrderPrcssTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderPrcssMainTable.draw();
			workOrderPrcssTable.draw();
		}, 300);
		
		prcssTbIdx = '';
    });
	
	//불량등록 탭 클릭
	$('#tab3Nav').on('click', function() {
		$('#workOrderFaultyTable').DataTable().ajax.reload(function(){
			setTimeout(function(){
				workOrderFaultyTable.draw();
				workOrderPrcssMainTable.draw();
			}, 300);
		});

		setTimeout(function(){
			workOrderFaultyTable.draw();
			workOrderPrcssMainTable.draw();
		}, 300);
    });
	
	//****************************자재투입***************************
 	//이전 자재 조회 목록조회
	let matrlListTable = $('#matrlListTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-10'><'col-sm-12 col-md-2'f>>" +
			 "<'row'<'col-sm-12 p-0'tr>>" +
			 "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		scrollY : "65vh",
		pageLength : -1,
		ajax : {
			url : '<c:url value="po/preMatrlList"/>',
			type : 'GET',
			data : {
				'tmMon' 		: function(){ return endDateVal.substring(0,7).replace(/-/g, ''); },
				'realQtyOption' : function(){ return 'Y'; },
				'locationCd' 	: function(){ return locCd; },
				//'itemSeq' 		: function(){ return itemSeqVal; },
				'workPlaceMatrlUpperItemSeq' : function(){return itemSeqVal},
			},
		},
		columns : [
			{//체크박스
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" name="matrlCheck" style="min-width: 100%;height: 2em;">';
				}
			},
			{//차종
				data : 'itemModelNm',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control text-center" name="itemModelNm" style="min-width:100%;border: none;background: white;font-size: 1.0rem;" value="'+data+'" disabled>';
				}
			},
			{//품명
				data : 'spNm',
				render : function(data, type, row, meta){
					let html="";
					html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">'
					html += '<input type="text" class="form-control text-center" name="spNm" style="min-width:100%;border: none;background: white;font-size: 1.0rem;" value="'+data+'" disabled>'
					return html;
				}
			},
			{//투입일자
				render : function(data, type, row, meta){
					return '<input type="date" class="form-control text-center" name="matrlDate" style="min-width:100%;font-size: 1.0rem;height: 2.0rem;" value="'+serverProgDateTo+'">';
				}
			},
			{//잔량
				data : 'realQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control text-center" name="realQty" style="min-width:100%;border: none;background: white;font-size: 1.0rem;" value="'+rmDecimal(data)+'" disabled>';
					} else {
						return '';
					}
				}
			},	
			{//LOT NO
				data : 'barcodeNo',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control text-center" name="barcodeNo" style="min-width:100%;border: none;background: white;font-size: 1.0rem;" value="'+data+'" disabled>';
				}
			},
			{// column 6 (숨김)
				data : 'spNm'
			},	
			{// column 7 (숨김)
				data : 'realQty'
			},				
			{// column 8 (숨김)
				data : 'barcodeNo'
			},		
		],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
			{ targets: [6, 7, 8], visible : false },
        ],
	    order: [
	    ],
	    buttons: [],
	    drawCallback: function() {
	    	 $('#matrlListTable_filter').addClass('d-none');
		}
	});
	
	//이전 자재 조회 버튼 클릭
	$('#btnSearchBarcodeList').on('click',function(){
		$('#matrlListTable').DataTable().ajax.reload(function(){
			setTimeout(function(){
				matrlListTable.draw();
			},150)
		});

		$('#matrlListModal').modal('show'); 
	});

	//이전 자재 조회 전체 선택시
	$(document).on('click', '#matrlCheckAll', function () {
		if($(this).is(':checked')) {
			$("input[name=matrlCheck]").prop("checked", true);
		} else {
			$("input[name=matrlCheck]").prop("checked", false);
		}
	});

	//이전 자재 조회 투입 버튼 클릭
	$('#btnSelectMatrlBarcode').on('click',function(){

		if($('input[name=matrlCheck]').is(':checked')){
			setTimeout(function(){
				$('#matrlListTable tbody tr').each(function(index,item){
					if($(this).find('input[name=matrlCheck]').is(':checked')){
						$.ajax({
							url : '<c:url value="po/matrlBarcodeNoScanByBongjeaNoFifo"/>',
							type : 'POST',
							data : {
					            'workOrdNo' 		:	workOrdNoVal,
					            'workOrdSeq'		:	"",
					            'middlePrcssCd'		:	workProgNoVal,
					            'minorPrcssCd'		:	minorPrcssCdVal,
				            	'barcodeNo'			:	$('#matrlListTable tbody tr').eq(index).find('td input[name=barcodeNo]').val(),
				            	'matrlDate'			:	$('#matrlListTable tbody tr').eq(index).find('td input[name=matrlDate]').val().replace(/-/g,''),
				            	'locationCd' 		: 	locCd,
				            	'locationNo' 		: 	locNo,
				            	'matrlItemSeq'		:   $('#matrlListTable tbody tr').eq(index).find('td input[name=itemSeq]').val(),
				            	'matrlRealQty'		:   $('#matrlListTable tbody tr').eq(index).find('td input[name=realQty]').val().replace(/,/g,''),
				            	'itemSeq'			:	itemSeqVal,
							},			
							beforeSend : function(){
								$('#my-spinner').show();
							},
							success : function(res) {
								let data = res.data;
								if (res.result == 'ok') {
									toastr.success(res.message);
									$('#workOrderMatrlTable').DataTable().ajax.reload( function () {
										$('#barcodeNoScan').val('');
										$('#barcodeNoScan').focus();
									});

									$('#workOrderMatrlAccTable').DataTable().ajax.reload( function () {});
									$('#matrlListModal').modal('hide');
									$('#my-spinner').hide();
									
								} else if(res.result == 'fifo') {
									$('#fifoBtnModal').modal('show');
									$('#my-spinner').hide();
									
								} else if(res.result == 'fail') {
									toastr.warning(res.message)
									$('#my-spinner').hide();
								}  else  {
									toastr.error(res.message);
									$('#my-spinner').hide();
								}
							},
						});
					}
				});
			},100)
		} else {
			toastr.warning("투입할 바코드를 선택해주세요.");
			$('#my-spinner').hide();
		}
	});

	// 통합검색
	$('#textSearch').on('keyup',function() {
		$('#matrlListTable_filter').find('input').val($(this).val());
		$('#matrlListTable_filter').find('input').trigger('keyup');
	});
	
	//투입취소 버튼 클릭
	$('#btnMatrlOutput').on('click',function(){
		$.ajax({
			url : '<c:url value="po/moveMatrlDel"/>',
			type : 'POST',
			data : {
	            'workOrdNo' 		: function(){ return workOrdNoVal; },
	            'middlePrcssCd'		: function(){ return workProgNoVal; },
            	'barcodeNo'			: function(){ return matrlBarcodeNoVal; },
            	'locCd' 			: function(){ return locCd; },
            	'useQty' 			: function(){ return useQtyVal; },
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					toastr.success(res.message);
					$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
					$('#workOrderMatrlAccTable').DataTable().ajax.reload( function () {});
				} else if (res.result == 'fail') {
					toastr.warning(res.message);
				} else {
					toastr.error(res.message);
					$('#matrlBarcodeNoScan').select();
				}
			},
			complete : function(){
				$('#my-spinner').hide();
			},	
		});
	});

	//자재투입내역 목록조회
	let workOrderMatrlTable = $('#workOrderMatrlTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>" +
			 "<'row'<'col-sm-12 p-0'tr>>" +
			 "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		scrollY : "40vh",
		pageLength : -1,
		ajax : {
			url : '<c:url value="po/workOrdMatrlListAdmByBongjea2"/>',
			type : 'POST',
			data : {
 				'workOrdNo'		: function() { return workOrdNoVal; },
	        	'middlePrcssCd'	: function() { return workProgNoVal; },
	        	'regDateOrder'	: function() { return 'Y'; }, //자재투입한 순서대로 조회,
	        	'locationCd'	: function() { return locCd; }
			},
		},
		columns : [
			{//No.
				render:function(data,type,row,meta){
					return meta.row+1;					
				}
				,'className' : 'text-center'
			},
			{//품명
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//투입일자
				data : 'matrlDate',
				render:function(data,type,row,meta){
					if(data!=null){
						return moment(data).format('YYYY-MM-DD');
					}else{
						return '-';
					}
				}
			},
			{//투입수량
				data : 'totalConsumpt',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
			{//사용량
				data : 'useQty',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
			{//잔량
				data : 'realQty',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
			{//LOT NO
				data : 'barcodeNo'
			},
			{//등록
				render : function ( data, type, row, meta ) {
					return '<button type="button" class="btn btn-secondary" onclick="singleItemFaulty('+meta.row+');">등록</button>';
				}
			},
			{//내역
				render : function ( data, type, row, meta ) {
					return '<button type="button" class="btn btn-secondary" onclick="matrlBarcodeRead(\''+row['barcodeNo']+'\',\''+row['itemSeq']+'\');">내역</button>';
				}
			},
		],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
        ],
	    order: [
	    ],
	    buttons: [],
	    drawCallback: function() {
		}
	});			
	
	
	//작업지시별 투입자재내역 팝업 시작
	let matrlBarcodePopupTable;
	function matrlBarcodeRead(barcodeNo,itemSeq){
		barcodeNoVal = barcodeNo; // 이 코드가 있어야 barcodeNo가 제대로 들어감
		matrlReadItemSeq = itemSeq;
		
		if (matrlBarcodePopupTable == null || matrlBarcodePopupTable == undefined) {
			matrlBarcodePopupTable = $('#matrlBarcodePopupTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : false,
				processing : true,
				autoWidth : true,
				lengthChange : true,
				pageLength : -1,
				scrollY : "40vh",
				ajax : {
					url : '<c:url value="/po/workOrdMatrlBarcodeList"/>',
					type : 'POST',
					data : {
						'locationCd' : function(){return locCd},
						'barcodeNo' 	: function(){ return barcodeNoVal; },
					},
				},
				columns : [
					{//작업세부번호
						data : 'middlePrcssCd',
						render : function (data, type, row, meta) {
							if ( data != null ) {
								return data;
							} else {
								return '';
							}
						}
					},
					{//투입일자
						data : 'matrlDate',
						render:function(data,type,row,meta){
							if(data!=null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},
					{//투입수량
						data : 'totalConsumpt',
						render:function(data,type,row,meta){
							if(data!=null){
								return rmDecimal(data);
							}else{
								return '-';
							}
						},'className' : 'text-right'
					},
					{//사용량
						data : 'useQty',
						render:function(data,type,row,meta){
							if(data!=null){
								return rmDecimal(data);
							}else{
								return '-';
							}
						},'className' : 'text-right'
					},
					{//불량수량
						data : 'faultyQty',
						render:function(data,type,row,meta){
							if(data!=null){
								if(parseFloat(data)>0){
									return '<span style="color:red;">'+rmDecimal(data)+'</span';
								}else{
									return '<span>'+rmDecimal(data)+'</span>';
								}
							}else{
								return '<span>0</span>';
							}
						},'className' : 'text-right'
					},
					{//잔량
						data : 'realQty',
						render:function(data,type,row,meta){
							let popupMatrlQty = parseFloat(row['totalConsumpt']); 	//투입수량
							let popupUseQty = parseFloat(row['useQty']); 	//사용량
							let popupFaultyQty = parseFloat(row['faultyQty']); 	//불량수량
							
							return rmDecimal(popupMatrlQty-popupUseQty-popupFaultyQty);
						},'className' : 'text-right'
					},
				],
				columnDefs : [ 
					{"defaultContent" : "-","targets" : "_all","className" : "text-center"}
				],
				drawCallback: function() {
				},
				buttons : [],
			});
		} else {
			$('#matrlBarcodePopupTable').DataTable().ajax.reload(function(){});
		}

		//차종/품번/품명/바코드번호 조회
		$.ajax({
			url : '<c:url value="bm/itemPartDtlList"/>',
			type : 'GET',
			data : {
				'itemSeq' : function(){return matrlReadItemSeq;}
			},
			success : function(res){
				let data = res.data;
				$('#itemModelLabel').text(data.itemModelNm);
				$('#itemCdLabel').text(data.itemCd);
				$('#itemNmLabel').text(data.itemNm);
				$('#barcodeNoLabel').text(barcodeNoVal);
			}
		})
		
		//투입 자재 누적 수량
		$.ajax({
			url : '<c:url value="po/workOrdMatrlAccList" />',
			type : 'GET',
			data : {
				'locationCd' : function(){return locCd},
				'barcodeNo' : function(){return barcodeNoVal},
			},
			success : function(res){
				let data=res.data;
				$('#matrlAccQty').text(rmDecimal(Math.round(data.matrlQty)));
				$('#useAccQty').text(rmDecimal(Math.round(data.useQty)));
				$('#faultyAccQty').text(rmDecimal(Math.round(data.faultyQty)));
				$('#realAccQty').text(rmDecimal(Math.round(data.realQty)));
			} 
		});

		setTimeout(function(){
			matrlBarcodePopupTable.draw();
		},300);
		
		$('#matrlBarcodePopupModal').modal('show');
 	}


	//자재투입내역 목록조회
	let workOrderMatrlAccTable = $('#workOrderMatrlAccTable').DataTable({
		dom: "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>" +
			 "<'row'<'col-sm-12 p-0'tr>>" +
			 "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		scrollY : "40vh",
		pageLength : -1,
		ajax : {
			url : '<c:url value="po/workOrderMatrlAccList2"/>',
			type : 'POST',
			data : {
 				'workOrdNo'		: function() { return workOrdNoVal; },
	        	'middlePrcssCd'	: function() { return workProgNoVal; },
	        	'locationCd'	: function() { return locCd; }
			},
		},
		columns : [
			{//품명
				data : 'itemNm'
			},
			{//투입수량
				data : 'totalConsumpt',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
			{//사용량
				data : 'useQty',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
			{//잔량
				data : 'realQty',
				render:function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(Math.round(data));
					}else{
						return '-';
					}
				},'className' : 'text-right'
			},
		],
		columnDefs: [
			{ targets: '_all', className: 'text-center-td' },
        ],
	    order: [
	    ],
	    buttons: [],
	    drawCallback: function() {
		}
	});
	

	let useQtyVal = '';
	//자재투입 행 선택
	$(document).on('click', '#workOrderMatrlTable tbody tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).css("background-color", "white");
	         $(this).removeClass('selected');
	     } else {
	         $('#workOrderMatrlTable').DataTable().$('tr.selected').css("background-color", "white");
	    	 $('#workOrderMatrlTable').DataTable().$('tr.selected').removeClass('selected');
	         $(this).addClass('selected');
	         $(this).css("background-color", "#3399CC");
    	 } 

		matrlBarcodeNoVal = workOrderMatrlTable.row(this).data().barcodeNo;
		useQtyVal = workOrderMatrlTable.row(this).data().useQty != null ? workOrderMatrlTable.row(this).data().useQty : 0;

		 if (workStatusVal=="WS") {
			 $('#btnMatrlOutput').attr('disabled',false);
		 }else{
			 $('#btnMatrlOutput').attr('disabled',true);
		 }
	});


	//자재바코드 스캔
	$('#barcodeNoScan').keypress(function (e) {
		if ( workStatusVal == "W" ) {
			toastr.warning("우선 작업을 시작해주세요.");
			return false;
		}
		if ( workStatusVal == "WE" ) {
			toastr.warning("작업종료되었습니다.");
			return false;
		}
		
		if (e.which == 13) {
			if($('#barcodeNoScan').val() == "" || $('#barcodeNoScan').val() == null) {
				toastr.warning("바코드를 입력 후 다시 시도해주세요.");
				$('#barcodeNoScan').select();
				return false;
			}
			
			let barcodeNoVal = $(this).val();
			$('#my-spinner').show();
			setTimeout(function(){
				$.ajax({
					url : '<c:url value="po/matrlBarcodeNoScanByBongjea"/>',
					type : 'POST',
					async : false,
					data : {
			            'workOrdNo' 		: function(){ return workOrdNoVal; },
			            'workOrdSeq'		: function(){ return ""; },
			            'middlePrcssCd'		: function(){ return workProgNoVal; },
			            'minorPrcssCd'		: function(){ return minorPrcssCdVal; },
		            	'barcodeNo'			: function(){ return barcodeNoVal; },
		            	'matrlDate'			: function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
		            	'locationCd' 		: function(){ return locCd; },
		            	'locationNo' 		: function(){ return locNo; },
		            	'itemSeq'			: function(){ return itemSeqVal; },
					},			
					success : function(res) {
						let data = res.data;
						if (res.result == 'ok') {
							toastr.success(res.message);
							$('#workOrderMatrlTable').DataTable().ajax.reload(function(){
								$('#barcodeNoScan').val('');
								$('#barcodeNoScan').focus();
							});

							$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
							
						} else if(res.result == 'fifo') {
							$('#fifoBtnModal').modal('show');
						} else if(res.result == 'popup') {
							$('#message').text(res.message);
							$('#locChangeBtnModal').modal('show');
						} else if(res.result == 'fail') {
							toastr.warning(res.message)
							$('#matrlBarcodeNoScan').select();
						} else {
							toastr.error(res.message);
							$('#matrlBarcodeNoScan').select();
						}
						$('#barcodeNoScan').select();
					},
					complete : function(){
						$('#my-spinner').hide();
					},	
				},10);
			})
			
		}
	});
	
	//생산실적등록 - 등록버튼 클릭시
	function barcodePrint(row) {
		if ( $('input[name=outputQty]').eq(row).val().replace(/,/g,'') <= 0 ) {
			toastr.warning('생산수량을 입력해주세요.');
			$('input[name=outputQty]').eq(row).focus();
			return false;
		}
		if ( !$('input[name=fairQty]').eq(row).val().trim() ) {
			toastr.warning('양품수량을 입력해주세요.');
			$('input[name=fairQty]').eq(row).focus();
			return false;
		}
		if ( !$('input[name=faultyQty]').eq(row).val().trim() ) {
			toastr.warning('불량수량을 입력해주세요.');
			$('input[name=faultyQty]').eq(row).focus();
			return false;
		}
		
// 		let sumOutputQty = 0;
// 		$('#workOrderPrcssTable tbody tr').each(function(index, item){
// 			sumOutputQty += $(this).find('td input[name=outputQty]').val()*1;
// 		});
// 		if ( sumOutputQty > workOrderPrcssMainTable.data(0)[0].workProgQty*1 ) {
// 			toastr.warning('생산수량이 지시수량을 초과했습니다.');
// 			return false;
// 		}
		
		workOrdSeqVal = $('#workOrderPrcssTable tbody tr').eq(row).find('input[name=workOrdSeq]').val();
		let ordLotNoVal = $('#workOrderPrcssTable tbody tr').eq(row).find('input[name=ordLotNo]').val();
		let workEndTimeVal = $('#clock').text();
		let fairQtyVal = $('#workOrderPrcssTable tbody tr').eq(row).find('input[name=fairQty]').val().replace(/,/g,'');
		let outputQtyVal = $('#workOrderPrcssTable tbody tr').eq(row).find('input[name=outputQty]').val().replace(/,/g,'');

		$.ajax({
			url : '<c:url value="/po/workOrdEditByBongjae" />',
            type : 'POST',
            async : false,
            data: {
            	'workOrdNo' 	: 	function(){ return workOrdNoVal; },
            	'middlePrcssCd'	:   function(){ return workProgNoVal; },
				'minorPrcssCd'  : 	function(){ return minorPrcssCdVal; },
            	'workOrdSeq' 	: 	function(){ return workOrdSeqVal; },
            	'ordLotNo'		:	function(){ return ordLotNoVal; },
            	'workStatus'	:	function(){ return '002'; },
            	'workEndTime'	:	function(){ return workEndTimeVal; },
            	'outputQty'		:	function(){ return outputQtyVal; },
            	'fairQty'		:	function(){ return fairQtyVal; },
            	'itemSeq'		:	function(){ return itemSeqVal; },
            	'ordLotNoDate'	:	function(){ return $('#clock').text().substring(0,10).replace(/-/g,''); },
            	'inLoc'         :   function(){ return locCd;},
            	'locationCd'    :   function(){ return locCd;},
            	'itemGubun'     :   function(){ return itemGubunVal;},
            	'workProgNo'    :   function(){ return workProgNoVal;},
            },
            success: function (res) {
                let data = res.data;
                if (res.result == 'ok') {
            		
                	$('#workOrderPrcssTable').DataTable().ajax.reload(function(){
                		setTimeout(function(){
                			workOrderPrcssTable.draw();
                			workOrderPrcssTable.draw();
                		}, 300);
                    });
					toastr.success('등록되었습니다.');
                }else {
                	toastr.error(res.message);
                }
            }
		});
	};


	//셀렉트박스생성
	function selectBoxHtmlDisY(obj, id, sVal, row, meta) {
		let shtml = '<select class="custom-select-lg mw-100" name="'+ id +'" data-col="' + meta.col + '" disabled=""';
		shtml += 'style="border:none;background-color: transparent;color:black;min-width: 100%;height:2.2rem!important;" >';
		
		let option;
		for (key in obj) {
			let tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		let ehtml = '</select>';
		
		return shtml + option + ehtml;
	}
	
	//셀렉트박스생성
	function selectBoxHtmlDisN(obj, id, sVal, row, meta) {
		let shtml = '<select class="custom-select mw-100" name="'+ id +'" data-col="' + meta.col + '"';
		shtml += 'style="min-width: 100%; height: 2em; font-size: 1.2em;">';
		
		let option;
		option += "<option value=''>선택</option>";
		
		for (key in obj) {
			let tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		let ehtml = '</select>';
		
		return shtml + option + ehtml;
	}
	
	//셀렉트박스생성(검사취출)
	function selectBoxHtml3(obj, name, sVal, row, meta) {
		let shtml = '<select class="custom-select-lg mw-100" name="'+ name +'" data-col="' + meta.col + '" disabled=""';
		shtml += 'style="border:none;background-color: transparent;color:black;min-width: 100%;height:2.2rem!important;" >';
		
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
	
	//공정실적등록 탭 클릭시
	$('#tab4Nav').on('click', function() {
		//자주검사
		imgPrint();
		
		$('#fuzzPopup').addClass('d-none');
		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#jajuHd').addClass('d-none');
		$('#btnInspPopup1').trigger('click');
		
		setTimeout(function(){
			workOrderPrcssMainTable.draw();
			workOrderPrcssMainTable.draw();
		}, 300);
		
	});
	
	
	//이미지 조회
	let imgSrc1 = '';
	let imgSrc2 = '';
	let imgSrc3 = '';
	let imgSrc4 = '';
	
	function imgPrint() {
		$.ajax({
			url : '<c:url value="/bm/itemInfoImageRead"/>',
			data : {
				'itemSeq' : function(){return itemSeqVal;},
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
	
	//이미지 모달 활성화
	function imgShow(imgSrc){
		$('#imageModal').modal('show');
		$('#fileReferenceImg').attr("src","data:image/jpg;base64," + imgSrc);
	}
	
	//자주검사 초물 버튼 클릭시
	let inspTypeVal = "외관";
	let chojungjong = '001';
	let approvalChoVal = null;
	let approvalJungVal = null;
	$('#btnInspPopup1').on('click', function(){
		inspTypeVal = "외관";
		chojungjong = '001';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup2').removeClass('btn-danger');
	 	$('#btnInspPopup3').removeClass('btn-danger');
	 	$('#btnInspPopup2').addClass('btn-primary');
	 	$('#btnInspPopup3').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnSize').addClass('btn-primary');
	 	
		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
	 	extTbColumnVisible($('#sampleCnt').val()*1);
	 	
	});

	//자주검사 중물 버튼 클릭시
	$('#btnInspPopup2').on('click',function(){
		let data2 = null;
		$.ajax({
				url : '<c:url value="qm/jajuAdmDataList"/>',
				type : 'GET',
				async : false,
				data : {
					'middlePrcssCd' : function(){ return workProgNoVal; },		
				},
				success : function(res) {
					data2 = res.data[0];
					if ( res.data[0] == null || res.data[0] == "" ) {
						approvalChoVal = "미승인";
					} else {
						approvalChoVal = data2.approvalCho;
					}
				}
		});

		if ( approvalChoVal == "미승인" ) {
			toastr.warning("초물을 먼저 입력해주세요.");
			return false;
		}
		inspTypeVal = "외관";
		
		chojungjong = '002';
		
		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup1').removeClass('btn-danger');
	 	$('#btnInspPopup3').removeClass('btn-danger');
	 	$('#btnInspPopup1').addClass('btn-primary');
	 	$('#btnInspPopup3').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnSize').addClass('btn-primary');

		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#sampleCnt').val()*1);

	});

	//자주검사 종물 버튼 클릭시
	$('#btnInspPopup3').on('click',function(){
		let data2 = null;
		
		$.ajax({
			url : '<c:url value="qm/jajuAdmDataList"/>',
			type : 'GET',
			async : false,
			data : {
				'middlePrcssCd' : function(){ return workProgNoVal; },
			},
			success : function(res) {
				data2 = res.data[0];
				if(res.data[0]==null || res.data[0]==""){
					approvalChoVal = "미승인";
					approvalJungVal = "미승인";
				}else{
					approvalChoVal = data2.approvalCho;
					approvalJungVal = data2.approvalJung;
				}
			}				
		});

		if(approvalChoVal == "미승인"){
			toastr.warning("초물을 먼저 입력해주세요.");
			return false;
		}

		if(!$('#ckMdInspectNo').is(':checked')){
			if(approvalJungVal == "미승인"){
				toastr.warning("중물을 먼저 입력해주세요.");
				return false;
			}
		}
		
		inspTypeVal="외관";
		chojungjong = '003';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnInspPopup1').removeClass('btn-danger');
	 	$('#btnInspPopup2').removeClass('btn-danger');
	 	$('#btnInspPopup1').addClass('btn-primary');
	 	$('#btnInspPopup2').addClass('btn-primary');

		$('#btnExt').removeClass('btn-primary');
	 	$('#btnExt').addClass('btn-danger');
	 	
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnSize').addClass('btn-primary');

		$('#jajuHd').removeClass('d-none');
		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#sampleCnt').val()*1);
	 	
	});
	
 	//외관 버튼 클릭시
	$('#btnExt').on('click', function() {
		inspTypeVal = '외관';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnSize').removeClass('btn-danger');
	 	$('#btnSize').addClass('btn-primary');

		$('#extAdmTableDiv').removeClass('d-none');
		$('#sizeAdmTableDiv').addClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#extAdmTable').DataTable().ajax.reload(function(){});
		
		extTbColumnVisible($('#sampleCnt').val()*1);
	});

	//치수 버튼 클릭시
	$('#btnSize').on('click', function() {
		inspTypeVal = '치수';

		$(this).removeClass('btn-primary');
	 	$(this).addClass('btn-danger');
	 	$('#btnExt').removeClass('btn-danger');
	 	$('#btnExt').addClass('btn-primary');

		$('#extAdmTableDiv').addClass('d-none');
		$('#sizeAdmTableDiv').removeClass('d-none');
		$('#btnInspSave').addClass('d-none');
		
		$('#sizeAdmTable').DataTable().ajax.reload(function(){});
		
		sizeTbColumnVisible($('#sampleCnt').val()*1);
		
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
	
	//시료수 셀렉트박스 변경시
	function sampleCntChange() {
		//시료수 데이터 수정
		$.ajax({
			url : '<c:url value="po/workOrderProgressUpd" />',
			type : 'POST',
			data : {
				'workProgNo' 	: function(){ return workProgNoVal; },
				'sampleCnt' 	: function(){ return $('#sampleCnt').val(); },
			},
			success : function(res){
				if ( res.result == "ok" ) {
					$('#workOrderProgressTable').DataTable().ajax.reload(function(){
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).addClass('selected');
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).css("background-color", "#3399CC");
					});
					toastr.success("시료수가 수정되었습니다.");
				} else {
					toastr.error(res.message);
				}
			}
		});
		
		if ( inspTypeVal == '외관' ) {
			extTbColumnVisible($('#sampleCnt').val()*1);
		} else if ( inspTypeVal == '치수' ) {
			sizeTbColumnVisible($('#sampleCnt').val()*1);
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - sampleCntChange function");
		}
	}
	
	//중물검사안함 체크
	$('#ckMdInspectNo').on('change', function(){

		let checkMd = null;
		
		if ( $('#ckMdInspectNo').is(':checked') ) {//중물검사 체크시
			checkMd = '002'		//중물검사 안함 : 002
			//중물검사 버튼 비활성화
			$('#btnInspPopup2').attr('disabled', true);

			//중물일경우 - approvalChoVal이 승인일경우 종물로 바로가기
			if ( $('#btnInspPopup2').attr('class').indexOf("btn-danger") != -1 ) {
				if ( approvalChoVal == "승인" ) {
					$('#btnInspPopup3').trigger('click');
				} else {
					$('#btnInspPopup1').trigger('click');
				}
			}
		} else {
			checkMd = '001'		//중물검사 함 : 001
			//중물검사 버튼 활성화
			$('#btnInspPopup2').attr('disabled', false);
			
			//초물일경우 
			if ( $('#btnInspPopup1').attr('class').indexOf("btn-danger") != -1 ) {
				console.log("변화없음");
			}

			//중물일경우 - approvalChoVal이 승인일경우 종물로 바로가기
			if ( $('#btnInspPopup2').attr('class').indexOf("btn-danger") != -1 ) {
				if ( approvalJungVal == "미승인" ) {
					$('#btnInspPopup2').trigger('click');
				}
			}
			
			//종물일경우 - approvalJungVal이 미승인일경우 중물로 바로가기
			if ( $('#btnInspPopup3').attr('class').indexOf("btn-danger") != -1 ) {
				if ( approvalJungVal == "미승인" ) {
					$('#btnInspPopup2').trigger('click');
				}
			}
		}
		
		//중물검사 데이터 수정
		$.ajax({
			url : '<c:url value="po/workOrderProgressUpd" />',
			type : 'POST',
			data : {
				'workProgNo' : function(){return workProgNoVal;},
				'mdInspectYn' : function(){return checkMd;}
			},
			success : function(res){
				if ( res.result == "ok" ) {
					$('#workOrderProgressTable').DataTable().ajax.reload(function(){
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).addClass('selected');
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).css("background-color", "#3399CC");
					});
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//자주검사안함 체크
	$('#jajuChkBox').on('change', function(){
		let jajuCheck = '';
		if ( $('#jajuChkBox').is(':checked') ) {//중물검사 체크시
			jajuCheck = '002'
		} else {
			jajuCheck = '001'
		}
		
		//중물검사 데이터 수정
		$.ajax({
			url : '<c:url value="po/workOrderProgressUpd" />',
			type : 'POST',
			data : {
				'workProgNo' 	: function(){ return workProgNoVal; },
				'jajuInspectYn' : function(){ return jajuCheck; }
			},
			success : function(res){
				if ( res.result == "ok" ) {
					$('#workOrderProgressTable').DataTable().ajax.reload(function(){
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).addClass('selected');
						$('#workOrderProgressTable tbody').find('#' + workProgNoVal).css("background-color", "#3399CC");
					});
				} else {
					toastr.error(res.message);
				}
			}
		});
		
	});
	
	//등록버튼 클릭시
	$('#btnInspAdd').on('click', function(){
		if ( extAdmTable.data().length > 0 ) {
			$.ajax({
				url : '<c:url value="po/workOrdInspectDone" />',
				type : 'GET',
				data : {
					'middlePrcssCd' : function(){ return workProgNoVal; },
					'inspectGubun' 	: function(){ return chojungjong; },
				},
				success : function(res){
					if (res.result == "ok") {
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

						$('select[name=inspX1]').attr('disabled', false);
						$('select[name=inspX2]').attr('disabled', false);
						$('select[name=inspX3]').attr('disabled', false);
						$('select[name=inspX4]').attr('disabled', false);
						$('select[name=inspX5]').attr('disabled', false);
						$('select[name=inspX6]').attr('disabled', false);
						$('select[name=inspX7]').attr('disabled', false);
						$('select[name=inspX8]').attr('disabled', false);
						$('select[name=inspX9]').attr('disabled', false);
						$('select[name=inspX10]').attr('disabled', false);

						if (inspTypeVal == "외관") {
							$('#e-inspX1-0').focus();
							$('#e-inspX1-0').select();
						} else {
							$('#s-inspX1-0').focus();
							$('#s-inspX1-0').select();
						}

						$('#btnInspSave').removeClass('d-none');
					
					} else if (res.result == "fail") {
						if ( chojungjong == "001" ) {
							toastr.warning("초물등록 후 자주검사를 등록해주세요.");
						} else if ( chojungjong == "002" ) {
							toastr.warning("중물등록 후 자주검사를 등록해주세요.");
						} else if ( chojungjong == "003" ) {
							toastr.warning("종물등록 후 자주검사를 등록해주세요.");
						} else {
							console.log("예상치 못한 오류가 발생했습니다. - btnInspAdd onclick");
						}
						$('#btnInspSave').addClass('d-none');
					} else {
						$('#btnInspSave').addClass('d-none');	
						toastr.error(res.message);
					}
					
			    }
				
			});
		} else {
			toastr.warning("우선 검사항목을 등록해주세요.");
		}
		
		
	});
	
	//자주검사 저장버튼 클릭시
	$('#btnInspSave').on('click', function(){
		let check = true;
		let dataArray = new Array();
		
		if ( inspTypeVal == "외관" ) {
			$('#extAdmTable tbody tr').each(function(index, item) {
				let rowData = new Object();
				
				rowData.inspResultGubun = "004";
	            rowData.inspSourceNo = workProgNoVal;
	            rowData.inspSourceSubNo = '';
	            rowData.inspCd = extAdmTable.row(index).data().inspCd;
	            rowData.inspType = extAdmTable.row(index).data().inspType;
	            rowData.inspSeq = extAdmTable.row(index).data().inspSeq;
	            rowData.inspectGubun = chojungjong;
	            rowData.inspPass = $(this).find('td select[name=inspResult]').val();
	            
				//inspResult 값 설정
	            let resultYCnt = 0;
	            let cavityCntVal = $('#sampleCnt').val()*1;
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					if ( $(this).find('td select[name=inspX'+i+']').val() == "001" ) { //합격인가?
						resultYCnt += 1;
					}
					if ( $(this).find('td select[name=inspX'+i+']').val() == "" ) { //값을 입력하지 않았는가?
						resultYCnt = -1;
						break;
					}
				}
				if (resultYCnt == cavityCntVal) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1){
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
				switch(cavityCntVal){
					case 10:
						rowData.inspX10 = $(this).find('td select[name=inspX10]').val();
					case 9:
						rowData.inspX9 = $(this).find('td select[name=inspX9]').val();
					case 8:
						rowData.inspX8 = $(this).find('td select[name=inspX8]').val();
					case 7:
						rowData.inspX7 = $(this).find('td select[name=inspX7]').val();
					case 6:
						rowData.inspX6 = $(this).find('td select[name=inspX6]').val();
					case 5:
						rowData.inspX5 = $(this).find('td select[name=inspX5]').val();
					case 4:
						rowData.inspX4 = $(this).find('td select[name=inspX4]').val();
					case 3:
						rowData.inspX3 = $(this).find('td select[name=inspX3]').val();
					case 2:
						rowData.inspX2 = $(this).find('td select[name=inspX2]').val();
					case 1:
						rowData.inspX1 = $(this).find('td select[name=inspX1]').val();
				}
	            dataArray.push(rowData);
	            
			});
		} else if (inspTypeVal == "치수") {
			$('#sizeAdmTable tbody tr').each(function(index, item) {
				let rowData = new Object();
				
                let pass = true;
                let passCheck = true;
                rowData.inspResultGubun = "004";
                rowData.inspSourceNo = workProgNoVal;
                rowData.inspSourceSubNo = '';
                rowData.inspCd = sizeAdmTable.row(index).data().inspCd;
                rowData.inspType = sizeAdmTable.row(index).data().inspType;
                rowData.inspSeq = sizeAdmTable.row(index).data().inspSeq;
                rowData.inspectGubun = chojungjong;
                
                let min = sizeAdmTable.row(index).data().inspStandLower;
			    let max = sizeAdmTable.row(index).data().inspStandUpper;
				let resultYCnt = 0;
				let cavityCntVal = $('#sampleCnt').val()*1;
				
				for ( var i = 1; i <= cavityCntVal; i++ ) {
					let inspData = $(this).find('td input[name=inspX'+i+']').val().replace(/,/g,'');

					if ( (parseFloat(min) <= parseFloat(inspData)) && (parseFloat(inspData) <= parseFloat(max)) ) { //합격인가?
						resultYCnt += 1;
					}
					if ( inspData == null || inspData == "" ) { //값을 입력하지 않았는가?
						resultYCnt = -1;
						break;
					}
				}
				if (resultYCnt == cavityCntVal) {
					rowData.inspResult = "001";	//합격
				} else if (resultYCnt == -1){
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
               
				if($(this).find('td input[name=inspX1]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX1]').val())) || (parseFloat($(this).find('td input[name=inspX1]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}
				}
				if($(this).find('td input[name=inspX2]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX2]').val())) || (parseFloat($(this).find('td input[name=inspX2]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX3]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX3]').val())) || (parseFloat($(this).find('td input[name=inspX3]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX4]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX4]').val())) || (parseFloat($(this).find('td input[name=inspX4]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX5]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX5]').val())) || (parseFloat($(this).find('td input[name=inspX5]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX6]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX6]').val())) || (parseFloat($(this).find('td input[name=inspX6]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX7]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX7]').val())) || (parseFloat($(this).find('td input[name=inspX7]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX8]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX8]').val())) || (parseFloat($(this).find('td input[name=inspX8]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX9]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX9]').val())) || (parseFloat($(this).find('td input[name=inspX9]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}
				if($(this).find('td input[name=inspX10]').val() != ""){
					passCheck = false;
					if((parseFloat($(this).find('td input[name=inspStandLower]').val()) > parseFloat($(this).find('td input[name=inspX10]').val())) || (parseFloat($(this).find('td input[name=inspX10]').val()) > parseFloat($(this).find('td input[name=inspStandUpper]').val()))  ){
						pass = false;
					}	
				}

                if(passCheck){
                	rowData.inspPass = '';
                } else {
                	if(pass){
	                	rowData.inspPass = '001';
	                } else {
	                	rowData.inspPass = '002';
	                }
                }
                
                dataArray.push(rowData);
			});
		} else {
			console.log("예상치 못한 오류가 발생했습니다. - btnInspAdd onclick");
		}
		
		if (check) {
			$.ajax({
				url : '<c:url value="/bm/inspPrcResultAdmCreate"/>',
		        type : 'POST',
		        dataType : 'json',
		        data : JSON.stringify(dataArray),
		        contentType : "application/json; charset=UTF-8",
		        beforeSend : function(res){
					$('#my-spinner').show();
			    },
		        success : function(res) {
					let data = res.data;
	                if (res.result == 'ok') {
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
                        
				        $('select[name=inspX1]').attr('disabled', true);
				        $('select[name=inspX2]').attr('disabled', true);
				        $('select[name=inspX3]').attr('disabled', true);
				        $('select[name=inspX4]').attr('disabled', true);
				        $('select[name=inspX5]').attr('disabled', true);
				        $('select[name=inspX6]').attr('disabled', true);
				        $('select[name=inspX7]').attr('disabled', true);
				        $('select[name=inspX8]').attr('disabled', true);
				        $('select[name=inspX9]').attr('disabled', true);
				        $('select[name=inspX10]').attr('disabled', true);
                        
				        $('select[name=inspResult]').attr('disabled', true);
	        		    $('#btnInspSave').addClass('d-none');
	            	    toastr.success("등록되었습니다.");
					} else {
	                	toastr.error(res.message);
	            	}

	                $('#my-spinner').hide();
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
		scrollY: '20vh',
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
				'inspResultGubun' 	: function(){ return "004"; },
				'inspSourceNo' 		: function(){ return workProgNoVal; },			
				'inspGubun' 		: function(){ return "004"; },
				'inspType' 			: function(){ return "001"; },
				'itemSeq' 			: function(){ return itemSeqVal; },
				'inspectGubun'		: function(){ return chojungjong; },
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
						return '<textarea name="inspList" style="font-size:120% !important;height: 5.5rem !important;min-width : 100%;resize: none;" disabled="">'+data+'</textarea>'
					} else {
						return '<textarea name="inspList" style="font-size:120% !important;height: 5.5rem !important;min-width : 100%;resize: none;" disabled=""></textarea>'
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
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta, "1");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX1", row['inspX1'], row, meta, "1");
					}else{
						return selectBoxHtml4(judgeCode,"inspX1", row['inspX1'], row, meta, "1");
					}
				},
				'className' : 'text-center'
			},
			{//X2
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="002"){
						return selectBoxHtml4(judgeCode,"inspX2", row['inspX2'], row, meta, "2");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX2", row['inspX2'], row, meta, "2");
					}else{
						return selectBoxHtml4(judgeCode,"inspX2", row['inspX2'], row, meta, "2");
					}
				},
				'className' : 'text-center'
			},
			{//X3
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="003"){
						return selectBoxHtml4(judgeCode,"inspX3", row['inspX3'], row, meta, "3");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX3", row['inspX3'], row, meta, "3");
					}else{
						return selectBoxHtml4(judgeCode,"inspX3", row['inspX3'], row, meta, "3");
					}
				},
				'className' : 'text-center'
			},
			{//X4
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="004"){
						return selectBoxHtml4(judgeCode,"inspX4", row['inspX4'], row, meta, "4");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX4", row['inspX4'], row, meta, "4");
					}else{
						return selectBoxHtml4(judgeCode,"inspX4", row['inspX4'], row, meta, "4");
					}
				},
				'className' : 'text-center'
			},
			{//X5
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="005"){
						return selectBoxHtml4(judgeCode,"inspX5", row['inspX5'], row, meta, "5");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX5", row['inspX5'], row, meta, "5");
					}else{
						return selectBoxHtml4(judgeCode,"inspX5", row['inspX5'], row, meta, "5");
					}
				},
				'className' : 'text-center'
			},
			{//X6
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX6", row['inspX6'], row, meta, "6");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX6", row['inspX6'], row, meta, "6");
					}else{
						return selectBoxHtml4(judgeCode,"inspX6", row['inspX6'], row, meta, "6");
					}
				},
				'className' : 'text-center'
			},
			{//X7
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX7", row['inspX7'], row, meta, "7");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX7", row['inspX7'], row, meta, "7");
					}else{
						return selectBoxHtml4(judgeCode,"inspX7", row['inspX7'], row, meta, "7");
					}
				},
				'className' : 'text-center'
			},
			{//X8
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX8", row['inspX8'], row, meta, "8");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX8", row['inspX8'], row, meta, "8");
					}else{
						return selectBoxHtml4(judgeCode,"inspX8", row['inspX8'], row, meta, "8");
					}
				},
				'className' : 'text-center'
			},
			{//X9
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX9", row['inspX9'], row, meta, "9");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX9", row['inspX9'], row, meta, "9");
					}else{
						return selectBoxHtml4(judgeCode,"inspX9", row['inspX9'], row, meta, "9");
					}
				},
				'className' : 'text-center'
			},
			{//X10
				data : 'inspInputMethod',
				render : function(data, type, row, meta) {
					if(data=="001"){
						return selectBoxHtml4(judgeCode,"inspX10", row['inspX10'], row, meta, "10");
					}else if(data=="002"){
						return selectBoxHtml4(silhangCode,"inspX10", row['inspX10'], row, meta, "10");
					}else{
						return selectBoxHtml4(judgeCode,"inspX10", row['inspX10'], row, meta, "10");
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
		scrollY: '20vh',
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
				'inspResultGubun' 	: function(){ return "004"; },
				'inspSourceNo' 		: function(){ return workProgNoVal; },			
				'inspGubun' 		: function(){ return "004"; },
				'inspType' 			: function(){ return "002"; },
				'itemSeq' 			: function(){ return itemSeqVal; },
				'inspectGubun'		: function(){ return chojungjong; },
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
						return '<input type="text" class="form-control" name="inspList" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%" disabled />';
					} else {
						return '<input type="text" class="form-control" name="inspList" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%" />';
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
							return '<input type="text" class="form-control" name="inspStandLower" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandLower" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			},
			{//기준 - 상한
				data : 'inspStandUpper',
				render : function(data, type, row, meta) {
					if (data != null) {
						if(row['inspStandGubun']=="001"||row['inspStandGubun']=="002"){ //전체||상한
							return '<input type="text" class="form-control" name="inspStandUpper" value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
						}else{
							return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
						}
					} else {
						return '<input type="text" class="form-control" name="inspStandUpper" value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" />';
					}
				}
			},  
			{//X1
				data : 'inspX1',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" step="0.01" class="form-control" name="inspX1" id="s-inspX1-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',1,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX1\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X2
				data : 'inspX2',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX2" id="s-inspX2-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',2,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX2\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					}
				}
			}, 
			{//X3
				data : 'inspX3',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX3" id="s-inspX3-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',3,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX3\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X4
				data : 'inspX4',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled />';
					} else {
						return '<input type="number" class="form-control" name="inspX4" id="s-inspX4-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',4,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX4\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;" disabled/>';
					}
				}
			}, 
			{//X5
				data : 'inspX5',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX5" id="s-inspX5-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',5,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX5\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X6
				data : 'inspX6',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX6" id="s-inspX6-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',6,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX6\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X7
				data : 'inspX7',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX7" id="s-inspX7-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',7,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX7\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X8
				data : 'inspX8',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX8" id="s-inspX8-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',8,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX8\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X9
				data : 'inspX9',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX9" id="s-inspX9-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',9,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX9\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
					}
				}
			}, 
			{//X10
				data : 'inspX10',
				render : function(data, type, row, meta) {
					if (data != null) {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="'+data+'" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled />';
					} else {
						return '<input type="number" class="form-control num_check" name="inspX10" id="s-inspX10-'+meta.row+'" onkeyup="numberFormat(this, \'float\')" onkeydown="moveFocus(\'s\',10,'+meta.row+')" onChange="sizeCheck('+row['inspStandLower']+','+row['inspStandUpper']+',\'inspX10\',\''+meta.row+'\')"; value="" style="font-size:120% !important; height: 2rem !important; min-width : 100%;text-align:right;"  disabled/>';
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
		},],
		drawCallback : function() {
			let api = this.api();

			for ( var i=0; i < api.data().count(); i++ ) {

				let min = api.row(i).data().inspStandLower;
				let max = api.row(i).data().inspStandUpper;
				let cavityCntVal = $('#sampleCnt').val()*1;
				
				for ( var r = 1; r <= cavityCntVal; r++ ) {
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
					
					if ( (parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max)) ) {
						$('input[name='+rString+']').eq(i).css('background', '#ff0000');
					} else if ( (parseFloat(min) <= parseFloat(inspResult)) && (parseFloat(inspResult) <= parseFloat(max)) ) {
						$('input[name='+rString+']').eq(i).css('background', '#92d050');
					} else {
						$('input[name='+rString+']').eq(i).css('background', '#f6f7f9');
					}
				}
			} 
		}
	});


	/* function singleItemFaulty(data,qty,itemSeq){
		alert('기능 구현중입니다..');
	}  */

	//자재투입내역에서 등록버튼 클릭시 처리
	function singleItemFaulty(index){
		$('#my-spinner').show();
		$('#btnMatrlReset').trigger('click');
		
		setTimeout(function(){
			singleFaultyBarcodeNo = workOrderMatrlTable.row(index).data().barcodeNo;
			singleFaultyItemSeq = workOrderMatrlTable.row(index).data().itemSeq;
			singleRealQty = workOrderMatrlTable.row(index).data().realQty;
			
			if(!isNaN(singleRealQty) && singleRealQty>0){

				$.ajax({
					url : '<c:url value="bm/itemPartDtlList"/>',
					type : 'GET',
					data : {
						'itemSeq' : function(){return singleFaultyItemSeq}
					},
					success : function(res){
						let data = res.data;
						$('#singleItemModelTd').text(data.itemModelNm);
						$('#singleItemCdTd').text(data.itemCd);
						$('#singleItemNmTd').text(data.itemNm);

						$('#my-spinner').hide();
					}
				})
				
				$('#singleFaultyDate').val(serverProgDateTo);
				$('#singleRealQty').val(rmDecimal(singleRealQty));
				$('#singleFaultyQty').val('0');
				
				$('#singleFaultyInputModal').modal('show'); 

				$('#singleFaultyTypeTable').DataTable().ajax.reload(function(){});
				setTimeout(function(){
					singleFaultyTypeTable.draw();
				},150)
			}else{
				$('#my-spinner').hide();
				toastr.warning("잔량이 있을 경우만 불량 등록 하실 수 있습니다.");
			}
		},1000)
	}


	//불량등록 유형별
	let singleFaultyTypeTable = $('#singleFaultyTypeTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'><'col-sm-12 col-md-7'>>B",
		language : lang_kor,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : true,
		lengthChange : true,
		pageLength : -1,
		scrollY : '41vh',
		ajax : {
			url : '<c:url value="po/singleFaultyTypeAccList"/>',
			type : 'GET',
			async : false,
			data : {
				'faultyDate'	: function(){ return serverProgDateTo.replace(/-/g,''); },
				'upperItemSeq' 	: function(){ return itemSeqVal; },
				'itemSeq' 		: function(){ return singleFaultyItemSeq; },
				'minorPrcssCd' 	: function(){ return minorPrcssCdVal; }, // 해당 공정의 불량유형을 조회되도록, 공정이 지정안된 불량유형까지 조회
			},
		},
	    columns : [
			{//불량유형
				data : 'baseInfoNm', 'className':'text-center',
				render : function(data, type, row, meta){
					return '<span style="font-size: 1rem; text-align:center;">'+data+'</span>';
				}
			},
			{//불량수량
				render : function(data, type, row, meta){
					let html = '';
					html += '<input type="text" class="form-control-lg mw-100 text-right singleFaultyTypeQty" name="singleFaultyTypeQty" value="0" onkeyup="numberFormat(this, \'int\')">';
					html += '<input type="hidden" name="singleFaultyTypeCd" value="'+row['baseInfoCd']+'">';
					return html;
				}
			},
			{//누적수량
				data : 'totalFaultyQty',
				render : function(data, type, row, meta){
					return '<input type="text" class="form-control-lg mw-100 text-right" name="totalFaultyQty" value="'+rmDecimal(data)+'" style="background: lightgoldenrodyellow;border: none;" disabled>';
				}
			},
		],
	    order: [],
	    buttons: [],
	    drawCallback: function() {
	    	// 불량수량 입력 keyup
			$('.singleFaultyTypeQty').off('keyup');
			$('.singleFaultyTypeQty').on('keyup', function() {
				let singleFaultyQtySum = 0;
				for ( var i=0; i < $('.singleFaultyTypeQty').length; i++ ) {
					singleFaultyQtySum += parseFloat($('.singleFaultyTypeQty').eq(i).val().trim() == '' ? 0 : $('.singleFaultyTypeQty').eq(i).val().replaceAll(/,/g,''));
				}
				$('#singleFaultyQty').val(rmDecimal(singleFaultyQtySum));
			});

			let totalTypeQtySum = $('#singleFaultyTypeTable').DataTable().column(2,{ page: 'current'} ).data().sum();
			console.log("totalTypeQtySum:"+totalTypeQtySum)
			$('#totalQty').val(rmDecimal(totalTypeQtySum));
		}
	});


	//팝업창 내에서 불량등록 버튼 클릭시 처리
	$('#btnSingleFaultySave').on('click',function(){
		console.log('팝업창 내 불량등록 버튼 클릭 ok');
		let check = true;
		let dataArray = new Array();

		if (isNaN($('#singleRealQty').val().replace(/,/g,''))) {
			toastr.warning("팝업창을 닫고 다시 [불량]버튼을 클릭해주세요. 확인바랍니다.");
			check == false;
			return false;
		}

		if (isNaN($('#singleFaultyQty').val().replace(/,/g,''))) {
			toastr.warning("불량수량을 다시 확인해주세요.");
			check == false;
			return false;
		}
		
		if (!isNaN($('#singleRealQty').val().replace(/,/g,'')) && !isNaN($('#singleFaultyQty').val().replace(/,/g,'')) 
				&& parseFloat($('#singleRealQty').val().replace(/,/g,''))<parseFloat($('#singleFaultyQty').val().replace(/,/g,''))) {
			toastr.warning("불량수량이 잔량을 초과하였습니다. 확인바랍니다.");
			check == false;
			return false;
		}

		if (isNaN($('#singleFaultyQty').val().replace(/,/g,'')) || $('#singleFaultyQty').val().replace(/,/g,'')<=0) {
			toastr.warning("불량수량을 입력해주세요.");
			check == false;
			return false;
		}

		$('#singleFaultyTypeTable tbody tr').each(function(item,index){
			if (!isNaN(parseFloat($(this).find('input[name=singleFaultyTypeQty]').val())) && (parseFloat($(this).find('input[name=singleFaultyTypeQty]').val().replace(/,/g,''))>0)) {
				console.log('ok 불량유형:'+singleFaultyTypeTable.row(index).data().baseInfoCd)
				let rowData = new Object();

				rowData.workOrdNo = workOrdNoVal;
				rowData.workProgNo = workProgNoVal;
				rowData.itemSeq = singleFaultyItemSeq;
				rowData.barcodeNo = singleFaultyBarcodeNo;
				rowData.faultyQty = $(this).find('input[name=singleFaultyTypeQty]').val().replace(/,/g,'');
				rowData.faultyType = $(this).find('input[name=singleFaultyTypeCd]').val().replace(/,/g,'');
				rowData.faultyDate = $('#singleFaultyDate').val().replace(/-/g,'');
				rowData.faultyDesc = '단품불량';
				rowData.locCd = locCd; //공정창고
				rowData.locNo = locNo; //공정창고번호
				
		        dataArray.push(rowData);
			}else{
				console.log('no 불량유형:'+singleFaultyTypeTable.row(index).data().baseInfoCd)
			}
		})
		
		if (check) {
			$.ajax({
				url :'<c:url value="po/workSingleItemFaultyIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend  : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {
					if (res.result == 'ok') {

						$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
						$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
						
						$('#singleFaultyInputModal').modal('hide');
						toastr.success('불량등록 되었습니다.');
					} else {
						toastr.error(res.message);
					}

					//처리완료..
					$('#my-spinner').hide();
				},
				complete : function() {
				}
			});
		}
	});
	


	//새로고침 버튼 클릭시
	$('#btnMatrlReset').on('click',function(){
		$('#workOrderMatrlTable').DataTable().ajax.reload(function(){});
		$('#workOrderMatrlAccTable').DataTable().ajax.reload(function(){});
	});
	
	
	//셀렉트박스생성
	function selectBoxHtml4(obj, name, sVal, row, meta,idx) {

		var shtml = '<select style="font-size: 120%; height: 2rem; min-width : 100%" class="custom-select" id="e-'+name+'-'+meta.row+'" name="'+ name +'" onkeydown="moveFocus(\'e\','+idx+','+meta.row+')" data-col="' + meta.col + '" disabled>';
		
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
	
	//커서이동
	function moveFocus(type, value, row){
		if (event.keyCode == 13) {

			if ( type == "s" ) {
				rowCount = sizeAdmTable.data().count()-1;	//행수
			} else if ( type == "e" ) {
				rowCount = extAdmTable.data().count()-1;	//행수
			} else {
				console.log("예상치 못한 오류가 발생했습니다. - moveFocus function");
			}

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
	
	//x1~x5 결과값 onchage시
	function sizeCheck ( min, max, result, row ) {

		let inspResult = $('input[name='+result+']').eq(row).val();
		
		if ( (parseFloat(min) > parseFloat(inspResult)) || (parseFloat(inspResult) > parseFloat(max)) ) {
			$('input[name='+result+']').eq(row).css('background','#ff0000');
		} else {
			$('input[name='+result+']').eq(row).css('background','#92d050');
		}

	}
	
  	//생산실적등록 탭 전체체크박스 클릭
    function prcssAllCheckClick() {
		if ( $('#prcssAllCheck').is(":checked") ) {
			$('input[name=prcssCheck]').prop('checked', true);
		} else {
			$('input[name=prcssCheck]').prop('checked', false);
		}
    }


	// *********************************************************************** 바코드 출력 ***********************************************************************
	// 체크박스 라벨 출력
	$("#btnCheckLabelPrint").on('click', function() {
		if ( $('input:checkbox[name="prcssCheck"]').is(':checked') ) {
			let today = new Date();
			console.log("라벨출력 btnCheckLabelPrint onClick 시작시간: " + today);
			
	        let trDataArr = new Array();
			$('input:checkbox[name="prcssCheck"]').each(function() {
			    if($(this).prop("checked")) {
			        let trData = workOrderPrcssTable.row(this.parentNode).data();
			        trDataArr.push(trData);
				};
			});
			barcodeLabelPrint(trDataArr);
		} else {
			toastr.warning("라벨을 출력할 항목을 선택해주세요.");
		}
	})

	// 출력 버튼 클릭
	function btnPrintLabel(obj) {
		let today = new Date();
		console.log("라벨출력 btnPrintLabel() 시작시간: " + today);
		
		let trData = workOrderPrcssTable.row("#"+obj).data();
		barcodeLabelPrint(new Array(trData));
	};
	
	// 라벨 프린트
	function barcodeLabelPrint(dataArr) {
		console.log(dataArr);
		let trPrintList = new Array(); 	// 통합된 프린트할 데이터 배열
		let columnList = new Array();	// 통합된 프린트할 컬럼 배열
		let columnArr = new Array();	// 각 용지의 컬럼 배열
		let paperSize = "";				// 용지 사이즈
		
		let mainTrData = labelProgressData; // 메인 행 데이터
		let selectItemGubun = mainTrData.itemGubun; // 구분 (001 : 제품, 003 : 반제품)
		$.each(dataArr, function(index, item) {
			let trPrintArr = new Array(); // 각 용지의 데이터 배열

			let resultQty = ""; 	// 수량
			let workChargrNm = "";	// 작업자
			let outputQty = "";		// 생산량
			let ordDate = "";		// 생산일자
			let gongjungChk = (item.gonjungChk=='002')?"불합격":"합격";	// 공정검사 확인
			let jajuChk = "합격";		// 자주검사 확인
			let okNgChk = "";		// 합불판정/출하검사확인

			if (item.workStatus == '003') {
				resultQty = item.faultyQty; 
				jajuChk = "불합격"; 
			} else {
				resultQty = item.fairQty;
				jajuChk = "합격"; 
			}
			
			/* $.ajax({
		        url : '<c:url value="tm/listForLabel"/>',
		        async : false,
		        type : 'GET',
		        data : {
			        'barcodeNo' : function(){return item.ordLotNo;},
		        },
		        success: function(res){
			        let data = res.data;

			        if (data != null) {
				        workChargrNm = data.workChargrNm; //작업자
				        outputQty = data.outputQty; //생산량
				        ordDate = data.ordDate; //생산일자
				        gongjungChk = (data.gongjungChk=='002') ? "불합격" : "합격"; //공정검사확인
				        jajuChk = (data.jajuChk=='002') ? "불합격" : "합격"; //자주검사확인
			        }
			    }
		    }); */
			
			// 양식에 맞추어 컬럼 집어넣기
			if (selectItemGubun == '001') { // 제품
				paperSize = "productLabel";
				columnArr = ["차종", "품목번호", "품명", "생산일자", "수량", "작업자", "납품처", "공정검사 확인"];
				
				trPrintArr[0] = mainTrData.itemModelNm;
				trPrintArr[1] = mainTrData.itemCd;
				trPrintArr[2] = mainTrData.itemNm;
				trPrintArr[3] = moment(item.workEndTime).format("YY/MM/DD");
				trPrintArr[4] = resultQty+' '+item.itemUnitNm;
				trPrintArr[5] = item.workChargrNm;
				trPrintArr[6] = item.itemCusNm;
				trPrintArr[7] = gongjungChk;
				trPrintArr[8] = item.ordLotNo;
			} else if (selectItemGubun == '003') { // 반제품
				paperSize = "productLabel";
				columnArr = ["차종", "품목번호", "품명", "생산일자", "자주검사", "생산수량", "작업자", "공정검사 확인"];
				
				trPrintArr[0] = mainTrData.itemModelNm;
				trPrintArr[1] = mainTrData.itemCd;
				trPrintArr[2] = mainTrData.itemNm;
				trPrintArr[3] = moment(item.workEndTime).format("YY/MM/DD");
				trPrintArr[4] = jajuChk;
				trPrintArr[5] = resultQty+' '+item.itemUnitNm;
				trPrintArr[6] = item.workChargrNm;
				trPrintArr[7] = gongjungChk;
				trPrintArr[8] = item.ordLotNo;
			}
			trPrintList.push(trPrintArr);
			columnList.push(columnArr);
		})
		
		if (trPrintList.length > 0) {
	    	labelPrint(trPrintList, columnList, paperSize);
		}
	};
	
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
	
	//라벨 프린트 시작
	function labelPrint12(data, action) {
	   let cmds = {};
	   
	   let cmd = "";
	      cmd += "{D0520,0980,0500|}";
	      cmd += "{AY;+04,0|}";
	      cmd += "{AX;-020,+000,+00|}";
	      cmd += "{C|}";
	
	    //행
	      cmd += "{LC;0010,0035,0980,0110,1,5|}";
	      cmd += "{LC;0010,0035,0980,0180,1,5|}";
	      cmd += "{LC;0010,0035,0980,0250,1,5|}";
	      cmd += "{LC;0010,0035,0980,0320,1,5|}";
	      cmd += "{LC;0010,0035,0980,0485,1,5|}";
	      cmd += "{LC;0659,0184,0980,0380,1,5|}";
			
	      //열
	      cmd += "{LC;0155,0035,0155,0320,0,5|}";

	      cmd += "{LC;0655,0035,0655,0110,0,5|}";
	      cmd += "{LC;0800,0035,0800,0110,0,5|}";
	      
	      cmd += "{LC;0350,0180,0350,0320,0,5|}";
	      cmd += "{LC;0505,0180,0505,0320,0,5|}";
	      cmd += "{LC;0655,0180,0655,0485,0,5|}";
	      cmd += "{LC;0800,0180,0800,0320,0,5|}";
	      
	      //데이터
	      cmd += "{PV23;0015,0090,0040,0040,01,0,00,B=품목번호|}";
	      cmd += "{PV23;0165,0090,0040,0040,01,0,00,B="+data.itemCd+"|}";
	      cmd += "{PV23;0015,0160,0040,0040,01,0,00,B=품명|}";
	      cmd += "{PV23;0165,0160,0040,0040,01,0,00,B="+data.itemNm+"|}";
	      cmd += "{PV23;0015,0230,0040,0040,01,0,00,B=생산일|}";
	      cmd += "{PV23;0165,0230,0040,0040,01,0,00,B="+moment(data.workEndTime).format('YYYY.MM.DD')+"|}"; 
	      cmd += "{PV23;0015,0300,0040,0040,01,0,00,B=생산수량|}";
	      cmd += "{PV23;0165,0300,0040,0040,01,0,00,B="+data.qty+"|}";
	      cmd += "{PV23;0360,0230,0040,0040,01,0,00,B=자주검사|}";
	      if (data.workStatus == '003') {
			  cmd += "{PV23;0520,0230,0040,0040,01,0,00,B="+"불합격"+"|}";
		  } else {
		      cmd += "{PV23;0520,0230,0040,0040,01,0,00,B="+"합격"+"|}";
		  }
	      cmd += "{PV23;0360,0300,0040,0040,01,0,00,B=작업자|}";
	      cmd += "{PV23;0520,0300,0040,0040,01,0,00,B="+data.workChargrNm+"|}";
	      cmd += "{PV23;0670,0090,0040,0040,01,0,00,B=차종|}";
	      cmd += "{PV23;0820,0090,0040,0040,01,0,00,B="+data.itemModel+"|}";
	      cmd += "{PV23;0670,0230,0040,0040,01,0,00,B=창고|}";
	      if (data.areaNm != null) {
	      	cmd += "{PV23;0820,0230,0040,0040,01,0,00,B="+data.areaNm + '/' + data.floorNm+"|}";
	      }
	      cmd += "{PV23;0670,0300,0040,0040,01,0,00,B=고객사|}";
	      cmd += "{PV23;0820,0300,0040,0040,01,0,00,B="+data.dealCorpNm+"|}";
	      cmd += "{PV23;0710,0365,0040,0040,01,0,00,B="+"공정검사확인"+"|}";
	      cmd += "{PV23;0770,0450,0040,0040,01,0,00,B="+"합 격"+"|}";
	      cmd += "{XB03;0080,0350,9,3,02,0,0100,+0000000001,000,1,00|}";
	      cmd += "{RB03;"+data.ordLotNo+"|}";
	      cmd += "{XS;I,0001,0002C4001|}";
	
	   cmds.cmd = cmd; // 인쇄 명령어
	   cmds.action = action; // 동작
	
	   sendMessage(JSON.stringify(cmds)); // 전송
	}
	
	
	let webSocket = new WebSocket("ws://localhost:8181");
	
	// 웹소켓 연결
	function wsConnect() {
	   webSocket = new WebSocket("ws://localhost:8181");
	}
	
	// 웹소켓 상태확인
	function getWsStatus() {
	   return webSocket.readyState;
	}
	
	// 소켓 접속이 되면 호출되는 함수
	webSocket.onopen = function(message){
	   toastr.success('인쇄 서버에 연결되었습니다.')
	   $('#wsStateView').text('연결됨');
	   $('#wsStateView').css('color','#19FF00');
	   wsState = true;
	};
	// 소켓 접속이 끝나면 호출되는 함수
	webSocket.onclose = function(message){
	   toastr.warning('인쇄 서버가 종료되었습니다.')
	   $('#wsStateView').text('연결끊김');
	   $('#wsStateView').css('color','#FF0004');
	   wsState = false;
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
			let today = new Date();
			console.log("라벨출력 sendMessage() 시작시간: " + today);
			
			webSocket.send(cmd);
		} else {
			toastr.warning('인쇄 서버와의 연결을 확인해주세요.');
		}
	}
</script>
</body>
</html>

