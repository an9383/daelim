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
				<li class="breadcrumb-item active">일생산계획(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid" style="height:850px;">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="dayProdPlanAdmTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th colspan="9" style="text-align:left;"><span style="font-weight: 500;">체크(✔)한 항목만 반영됩니다.</span></th>
									<th><input type="checkbox" id="dayAllCheck" onclick="rowAllCheck()" name="dayAllCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day1Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day2Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day3Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day4Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day5Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day6Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day7Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day8Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day9Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day10Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day11Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th> 
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day12Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day13Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day14Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day15Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day16Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day17Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day18Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day19Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day20Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day21Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day22Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day23Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day24Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day25Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day26Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day27Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day28Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day29Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day30Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox"  id="day31Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th>월계획</th>
									<th>합계</th>
									<th colspan="31">1</th>
								</tr>
								<tr>
									<th style="min-width: 25px"><input type="checkbox" onclick="columnAllCheck()" name="checkAll" style="min-width: 17px; min-height: 17px;"></th>
									<th style="min-width: 70px">품목코드</th>
									<th style="min-width: 50px">품목구분</th>
	 								<th style="min-width: 50px">업체코드</th>
									<th style="min-width: 100px">업체명</th>
									<th style="min-width: 100px">차종</th>
									<th style="min-width: 140px">품번</th>
									<th style="min-width: 240px">품명</th>
									<th class="text-center" style="min-width: 60px">월계획</th>
									<th class="text-center" style="min-width: 70px">합계</th>
									<th class="text-center" style="min-width: 50px">1</th>
									<th class="text-center" style="min-width: 50px">2</th>
									<th class="text-center" style="min-width: 50px">3</th>
									<th class="text-center" style="min-width: 50px">4</th>
									<th class="text-center" style="min-width: 50px">5</th>
									<th class="text-center" style="min-width: 50px">6</th>
									<th class="text-center" style="min-width: 50px">7</th>
									<th class="text-center" style="min-width: 50px">8</th>
									<th class="text-center" style="min-width: 50px">9</th>
									<th class="text-center" style="min-width: 50px">10</th>
									<th class="text-center" style="min-width: 50px">11</th> 
									<th class="text-center" style="min-width: 50px">12</th>
									<th class="text-center" style="min-width: 50px">13</th>
									<th class="text-center" style="min-width: 50px">14</th>
									<th class="text-center" style="min-width: 50px">15</th>
									<th class="text-center" style="min-width: 50px">16</th>
									<th class="text-center" style="min-width: 50px">17</th>
									<th class="text-center" style="min-width: 50px">18</th>
									<th class="text-center" style="min-width: 50px">19</th>
									<th class="text-center" style="min-width: 50px">20</th>
									<th class="text-center" style="min-width: 50px">21</th>
									<th class="text-center" style="min-width: 50px">22</th>
									<th class="text-center" style="min-width: 50px">23</th>
									<th class="text-center" style="min-width: 50px">24</th>
									<th class="text-center" style="min-width: 50px">25</th>
									<th class="text-center" style="min-width: 50px">26</th>
									<th class="text-center" style="min-width: 50px">27</th>
									<th class="text-center" style="min-width: 50px">28</th>
									<th class="text-center" style="min-width: 50px">29</th>
									<th class="text-center" style="min-width: 50px">30</th>
									<th class="text-center" style="min-width: 50px">31</th>
									<th>월계획</th>
									<th>합계</th>
									<th>1</th>
									<th>2</th>
									<th>3</th>
									<th>4</th>
									<th>5</th>
									<th>6</th>
									<th>7</th>
									<th>8</th>
									<th>9</th>
									<th>10</th>
									<th>11</th> 
									<th>12</th>
									<th>13</th>
									<th>14</th>
									<th>15</th>
									<th>16</th>
									<th>17</th>
									<th>18</th>
									<th>19</th>
									<th>20</th>
									<th>21</th>
									<th>22</th>
									<th>23</th>
									<th>24</th>
									<th>25</th>
									<th>26</th>
									<th>27</th>
									<th>28</th>
									<th>29</th>
									<th>30</th>
									<th>31</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
		<!-- Modal Start-->
	<div class="modal fade bd-example-modal-xl" id="workOrdModal" tabindex="-1" role="dialog" aria-labelledby="workOrdLabel"aria-hidden="true">
		<div class="modal-dialog" style="max-width:1600px;" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="workOrdLabel">작업지시 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="card-body p-1">
							<!-- 설비명 삭제(04/20)
							<label class="input-label-sm float-left">설비명</label>
							<div class="form-group input-sub m-0 float-left">
								<input type="hidden" class="form-control" id="batchEquipCd" name="batchEquipCd" disabled="">
								<input type="text" class="form-control float-left" id="batchEquipNm" name="batchEquipNm" value="" style="max-width: 150px;" disabled="">
								<button type="button" class="btn btn-primary input-sub-search float-left" name="" onclick="selectBatchEquip();">
									<span class="oi oi-magnifying-glass"></span>
								</button>
							</div> 
							-->
							<label class="input-label-sm float-left ml-2">작업지시일</label>
							<input type="date" class="form-control float-left" id="selectDate" style="max-width:100px;">
							<button type="button" class="btn btn-primary float-left ml-2 mr-2" id="btnBatchEquip">일괄등록</button>
							<button type="button" class="btn btn-primary float-left mr-2" id="btnWorkOrdRead">BOM 조회 </button>
							<button type="button" class="btn btn-success float-left mr-2" id="btnWorkOrdCreate">작업지시 등록</button>
							<button type="button" class="btn btn-warning float-left mr-2" id="btnWorkOrdList">작업지시 조회이동 →</button>
						</div>
					</div>
					<div class="table-responsive">
						<table id="workOrdTable" class="table table-bordered table-striped" style="width:100%">
							<colgroup>
								<col width="3%">
								<col width="5%">
								<col width="10%">
								<col width="10%">
								<col width="15%">
								<col width="15%">
								<col width="6%">
								<col width="8%">
								<%-- <col width="8%"> --%>
								<col width="8%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">
										<input type="checkbox" id="workCheckAll" name="workCheckAll" checked>
									</th>
									<th class="text-center">품목구분</th>
									<th class="text-center">품목구분</th>
									<th class="text-center">업체명</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">긴급여부</th>
									<th class="text-center">작업지시일</th>
									<th class="text-center">부작업자</th>
									<!-- <th class="text-center">설비명</th>  -->
									<th class="text-center">현재고</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">시퀀스</th>
								</tr>
							</thead>
						</table>
					</div>
					<hr class="m-2">
					<h5 class="modal-title mb-2">공정 작업지시 조회</h5>
					<div class="table-responsive" >
						<table id="workOrderProgressTable" class="table table-bordered table-striped" style="width:100%">
							<thead>
								<tr>
									<th class="text-center"><input type="checkbox" id="procCheckAll" name="procCheckAll" checked></th>
									<th class="text-center">품목구분</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>									<th class="text-center">공정</th>
									<th class="text-center">작업지시일</th>
									<th class="text-center">소요량</th>
									<th class="text-center">필요수량</th>
									<th class="text-center">재고수량</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">작업지시세부번호</th> 
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Modal End-->
	<!-- 설비정보 모달 시작-->
	<!-- <div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipPopUpLabel">설비코드조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="equipPopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 10%">설비코드</th>
									<th style="width : 10%">설비명</th>
									<th style="width : 10%">설비장소</th>
									<th style="width : 10%">규격</th>
									<th style="width : 10%">제작일자</th>
									<th style="width : 10%">제조사</th>
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
	</div> -->
	<!-- 설비정보 모달 종료-->
	<!-- 설비정보 모달 시작-->
	<!-- <div class="modal fade bd-example-modal-lg" id="equipPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="equipPopUpLabel2" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="equipPopUpLabel2">설비코드조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="equipPopUpTable2" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 10%">설비코드</th>
									<th style="width : 10%">설비명</th>
									<th style="width : 10%">공정명</th>
									<th style="width : 10%">규격</th>
									<th style="width : 10%">제작일자</th>
									<th style="width : 10%">제조사</th>
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
	</div> -->
	<!-- 설비정보 모달 종료-->
</div>
<!-- /.page-wrapper -->

<style>
#th{
	padding-bottom: 12px;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "wmsc0181";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "일생산계획(봉제)"); 
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let serverDate = null;

	let userNumber = "${userNumber}";
	
	let dt = new Date();
	let year = "";
	let com_year = dt.getFullYear();
	let mon = dt.getMonth()+1;
    
	let prodYear = com_year;
	let prodMon = mon < 10 ? "0" + mon : mon;
    let confirmYn = '';
    let urlData = '';
    let mainGubun = '001';
    let mainGubun2 = '';
    let itemGubun = "001";
    let dealCorpGubun = ' '; // 페이지 접속 시 아무 데이터도 조회 안되도록 구현 (2023.02.13)
    let workEmerYn = "";
	let workOrdDateFrom = serverDateFrom;
	let workOrdDateTo = serverDateTo;
	let itemSeqPopupVal="";
	let ordQtyPopupVal="";
	let itemSeqPopupArr = [];	  //배열생성
	
	//공통코드 처리 시작      
	let mainGubunCode = new Array(); //구분
	<c:forEach items="${mainGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	mainGubunCode.push(json1);
	</c:forEach>

	let itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode.push(json1);
	</c:forEach>

	let workEmerYnCode = new Array(); //긴근여부
	<c:forEach items="${workEmerYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>

	let userListCode = new Array(); //부작업자
	<c:forEach items="${userList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.userNumber}";
	json1.baseNm = "${info.userNm}";
	userListCode.push(json1);
	</c:forEach>

	/* let equipListCode = new Array(); //설비명
	<c:forEach items="${equipList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.equipCd}";
	json1.baseNm = "${info.equipNm}";
	equipListCode.push(json1);
	</c:forEach> */

	let dealCorpCode = new Array(); //고객사
	<c:forEach items="${dealCorpList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.dealCorpCd}";
	json1.baseNm = "${info.dealCorpNm}";
	dealCorpCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료   
	
  	//전체선택(가로) 버튼 클릭
    function rowAllCheck() {
		if ( $('input[name=dayAllCheck]').is(":checked") ) {
			$('input[name=dayCheck]').prop('checked', true);
		} else {
			$('input[name=dayCheck]').prop('checked',false);
		}
    }
	
  	//전체선택(세로) 버튼 클릭
    function columnAllCheck() {
		if ( $('input[name=checkAll]').is(":checked") ) {
			$('input[name=itemCheck]').prop('checked', true);
		} else {
			$('input[name=itemCheck]').prop('checked',false);
		}
    }

	//메인 테이블
	let dayProdPlanAdmTable = $('#dayProdPlanAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12 col-md-1 mr-6 mt-3'f><'col-sm-12 col-md-8 mt-3'B>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "63vh",
		scrollX: true, 
		scrollCollapse: true,
		fixedColumns: {
			 leftColumns: 10
	    },
		ajax : {
			url : '<c:url value="wm/dayProdPlanAdmList"/>',
			type : 'GET',
			data : {
				'prodYear' 		: function(){ return prodYear; },
				'prodMon' 		: function(){ return prodMon; },
				'prodDay' 		: function(){ return '01'; },
				'urlData' 		: function(){ return urlData; },
				'mainGubun' 	: function(){ return '002'; },
				'itemGubun' 	: function(){ return itemGubun; },
				'itemCus' 		: function(){ return dealCorpGubun; },
				'bongjaeCheck' 	: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '구매'나 '외주'가 아닌 것만 조회되도로 구현
			},
		},
		rowId : 'itemSeq',
		columns : [ 
			{//선택
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" id="check_'+meta.row+'" name="itemCheck" style="min-width: 17px; min-height: 17px;"/>';
				}
			},
			{//품목코드 (숨김)
				data : 'itemSeq',
				className : 'itemSeq'
			}, 
			{//구분
				data : 'itemGubunNm',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return data;
					} else {
						return '-';
					}
				}
			},
			{//업체코드
				data : 'itemCus'
			},
			{//업체명
				data : 'itemCusNm'
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
			{//월계획
				data : 'prodMonQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control" name="prodMonQty_'+row['itemSeq']+'" value="'+rmDecimal(data)+'" style="text-align:right; border:none;" readonly/>';
					} else {
						return '<input type="text" class="form-control" name="prodMonQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
					}
					
				},
				'className' : 'text-right'
			}, 
			{//합계
				data : 'prodSumQty',
				render : function ( data, type, row, meta ) {
					if ( data != null ) {
						return '<input type="text" class="form-control number-sum" name="prodSumQty_'+row['itemSeq']+'" value="'+rmDecimal(data)+'" style="text-align:right; border:none;" readonly/>';
					} else {
						return '<input type="text" class="form-control number-sum" name="prodSumQty_'+row['itemSeq']+'" value="0" style="text-align:right; border:none;" readonly/>';
					}
					
				},
			}, 
			{//1
				data : 'd01',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//2
				data : 'd02',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//3
				data : 'd03',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			},
			{//4
				data : 'd04',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//5
				data : 'd05',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//6
				data : 'd06',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//7
				data : 'd07',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//8
				data : 'd08',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//9
				data : 'd09',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//10
				data : 'd10',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//11
				data : 'd11',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//12
				data : 'd12',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//13
				data : 'd13',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//14
				data : 'd14',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//15
				data : 'd15',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//16
				data : 'd16',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//17
				data : 'd17',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//18
				data : 'd18',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//19
				data : 'd19',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//20
				data : 'd20',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//21
				data : 'd21',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//22
				data : 'd22',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//23
				data : 'd23',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//24
				data : 'd24',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//25
				data : 'd25',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//26
				data : 'd26',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//27
				data : 'd27',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//28
				data : 'd28',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//29
				data : 'd29',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//30
				data : 'd30',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//31
				data : 'd31',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31" name="prodDayQty_'+row['itemSeq']+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right" value="'+0+'" />';
					}
				}
			},
			{//월계획 (숨김)
				data : 'prodMonQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				}
			}, 
			{//합계 (숨김)
				data : 'prodSumQty',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//1 (숨김)
				data : 'd01',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//2 (숨김)
				data : 'd02',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//3 (숨김)
				data : 'd03',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//4 (숨김)
				data : 'd04',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//5 (숨김)
				data : 'd05',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//6 (숨김)
				data : 'd06',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//7 (숨김)
				data : 'd07',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//8 (숨김)
				data : 'd08',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//9 (숨김)
				data : 'd09',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//10 (숨김)
				data : 'd10',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//11 (숨김)
				data : 'd11',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//12 (숨김)
				data : 'd12',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//13 (숨김)
				data : 'd13',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//14 (숨김)
				data : 'd14',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//15 (숨김)
				data : 'd15',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//16 (숨김)
				data : 'd16',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//17 (숨김)
				data : 'd17',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//18 (숨김)
				data : 'd18',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//19 (숨김)
				data : 'd19',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//20 (숨김)
				data : 'd20',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//21 (숨김)
				data : 'd21',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//22 (숨김)
				data : 'd22',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//23 (숨김)
				data : 'd23',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//24 (숨김)
				data : 'd24',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//25 (숨김)
				data : 'd25',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//26 (숨김)
				data : 'd26',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//27 (숨김)
				data : 'd27',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//28 (숨김)
				data : 'd28',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//29 (숨김)
				data : 'd29',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//30 (숨김)
				data : 'd30',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
			{//31 (숨김)
				data : 'd31',
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},
		],
		columnDefs: [
			{"targets" : [0,1,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40], "orderable": false},
			{ "targets": "_all" , "className" : "text-center" },
			{ "visible": false, "targets": [1,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73] }
        ],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '일 생산계획(봉제)',
			filename : function(){
				let year = $('#YEAR').val();
				let mon = $('#MONTH').val();
				return year + '년 ' + mon + '월 일 생산계획';
			},
			exportOptions: {
				columns  : [2,1,3,4,5,6,7,41,42,43,44,45,46,47,48,49,50,
							51,52,53,54,55,56,57,58,59,60,
							61,62,63,64,65,66,67,68,69,70,71,72,73],
            },
		 	customize : function(xlsx){
		 		let sheet = xlsx.xl.worksheets['sheet1.xml'];
		 		let col = $('col', sheet);

		 		col.each(function () {
		 	    	$(this).attr('width', 10);
		 	    });

		 		$(col[2]).attr('width', 15);
		 		$(col[3]).attr('width', 15);
		 		$(col[4]).attr('width', 15);
		 		$(col[5]).attr('width', 20);
			 	$(col[6]).attr('width', 40);
			} 
		}, 'print' ],
		drawCallback : function() {
        	let api = this.api();
        	
        	for ( var i = 0; i < api.data().count(); i++ ) {
        		let sumQty = 0;
        		for ( var j = 0; j < 31; j++ ) {
        			sumQty += parseFloat( $('#dayProdPlanAdmTable tbody tr').eq(i).find('input[name=prodDayQty]').eq(j).val() );
        		}
        		$('input[name=prodSumQty_'+i+']').val( rmDecimal(sumQty) );
        		sumQty = 0;
        	}
    	
        }
	});

	//dayProdPlanAdmTable의 dataTables_length 변경
	let html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	
	html1 += '<label class="input-label-sm">년도</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select" ></select>&nbsp;&nbsp;&nbsp;&nbsp;';
    html1 += '</div>';
    
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select" ></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">고객사</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="dealCorpList" id="dealCorpList" title="" class="select w80 col-12 custom-select" ></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm" >품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select" ></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;'; 
	
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info ml-3">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>';
	
	html1 += '<button type="button" class="btn btn-success ml-2" id="btnWorkOrdNo">작업지시 등록</button>';

	html1 += '<button type="button" class="btn btn-primary ml-2" id="btnItemCheck">품목선택</button>';
	
	html1 += '</div>';
	
	html1 += '<button type="button" class="btn btn-primary float-right mr-1" id="btnSave" >저장</button>';
	html1 += '</div>';

	$('#dayProdPlanAdmTable_length').html(html1);

	selectBoxAppend(itemGubunCode, "itemGubun", "", "");
	selectBoxAppend(dealCorpCode, "dealCorpList", "", "1");

	//조회버튼 클릭시
	$('#btnRetv').on('click', function() {
		prodYear 	= $('#YEAR option:selected').val();
		prodMon 	= $('#MONTH option:selected').val();
		confirmYn 	= $('#selectView option:selected').val();
		urlData 	= '';
		mainGubun 	= $('#mainGubun option:selected').val();
		mainGubun2 	= mainGubun;
		itemGubun 	= $('#itemGubun option:selected').val();
		dealCorpGubun = $('#dealCorpList option:selected').val();
		$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
	});
	
	//년도, 월, 구분 변경 시
// 	$('#YEAR, #MONTH, #itemGubun, #dealCorpList').on('change', function() {
// 		prodYear 	= $('#YEAR option:selected').val();
// 		prodMon 	= $('#MONTH option:selected').val();
// 		confirmYn 	= $('#selectView option:selected').val();
// 		urlData 	= '';
// 		mainGubun 	= $('#mainGubun option:selected').val();
// 		mainGubun2 	= mainGubun;
// 		itemGubun 	= $('#itemGubun option:selected').val();
// 		dealCorpGubun = $('#dealCorpList option:selected').val();
// 		$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
//     });

	//품목선택 버튼 클릭 시
	$('#btnItemCheck').on('click', function() {
		let checkCount = 0; //몇 개 선택했는지 카운트
		$('.DTFC_LeftBodyLiner .DTFC_Cloned tbody tr').each(function(index, item) {
			let prodDayQtySum = 0;
			let rowId = $(this).find('input[name=itemCheck]').attr('id').split('_');
			let itemSeqVal = dayProdPlanAdmTable.row(rowId[1]).data().itemSeq;

			for ( var i = 1; i <= 31; i++ ) {
				if ( $('#day'+i+'Check').is(':checked') ) {
					let prodDayQty = $('#'+rowId[1]+'_prodDayQty_'+i).val();
					prodDayQtySum += parseFloat( (prodDayQty).replace(/,/g, '') );
				}
			}

			if ( prodDayQtySum > 0 ) { //수량이 있으면 체크
				$(this).find('input[name=itemCheck]').prop("checked", true);
				checkCount += 1;
			} else { //수량이 0이면 체크해제
		        $(this).find('input[name=itemCheck]').prop("checked", false);
		    }
		})
		
		toastr.success("수량이 있는 품목 "+checkCount+"개가 선택됐습니다.");
	})
	
	//저장처리
	$('#btnSave').on('click', function() {
		if ( $('input:checkbox[name=itemCheck]').is(':checked') ) {
			let dataArray = new Array();
			let check = true;  		

			$('#my-spinner').show(); //처리중 모달 시작

			//못씀
// 			$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
// 				if ( $('input[id=check_'+index+']').is(':checked') ) {
// 					let rowId = $(this).attr('id');
// 					for ( var i = 0; i < 31; i++ ) {
// 						//입력값 검사
// 						if ( $(this).find(".number-float0").eq(i).val() == "" || $(this).find(".number-float0").eq(i).val() == undefined ) {
// 							toastr.warning('일계획수량을 입력해주세요');	
// 							check = false;
// 							$('#my-spinner').hide(); //처리중 모달 종료
							
// 							return false;
// 						}
						
// 						let rowData = new Object();
						
// 						rowData.prodYear = $('#YEAR option:selected').val();
// 						rowData.prodMon = $('#MONTH option:selected').val();
// 						rowData.itemSeq = rowId;
						
// 						let prodMonQtyValue = $(this).find("td input[name=prodMonQty_"+rowId+"]").val().replace(/,/g, '');
// 						rowData.prodMonQty = prodMonQtyValue == null ? "0" : prodMonQtyValue;
// 						rowData.prodDay = i < 9 ? "0" + (i+1) : (i+1);
						
// 						rowData.prodDayQty = $(this).find("td input[name=prodDayQty_"+rowId+"]").eq(i).val().replace(/,/g, '');
// 						rowData.prodSumQty = $(this).find("td input[name=prodSumQty_"+rowId+"]").val().replace(/,/g, '');
						
// 				        dataArray.push(rowData);
// 					}
// 				}
// 			});

			$('.DTFC_LeftBodyLiner .DTFC_Cloned tbody tr').each(function(index, item) {
			    if ( $(this).find('input[name=itemCheck]').is(':checked') ) {
			        let rowId = dayProdPlanAdmTable.row($(this).find('input[name=itemCheck]').attr('id').split('_')[1]).data().itemSeq;
			        for ( var i = 0; i < 31; i++ ) {						
						let rowData = new Object();
						
						rowData.prodYear = $('#YEAR option:selected').val();
						rowData.prodMon = $('#MONTH option:selected').val();
						rowData.itemSeq = rowId;
						
						let prodMonQtyValue = $("td input[name=prodMonQty_"+rowId+"]").val().replace(/,/g, '');
						rowData.prodMonQty = prodMonQtyValue == null ? "0" : prodMonQtyValue;
						rowData.prodDay = i < 9 ? "0" + (i+1) : (i+1);
						
						rowData.prodDayQty = $("td input[name=prodDayQty_"+rowId+"]").eq(i).val().replace(/,/g, '');
						rowData.prodSumQty = $("td input[name=prodSumQty_"+rowId+"]").val().replace(/,/g, '');

						dataArray.push(rowData);
					}
			    }
			});
			
			if (check) {
				$.ajax({
					url : '<c:url value="wm/dayProdPlanAdmCreate"/>',
					type : 'POST',
					datatype: 'json',
					data: JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					success : function(res) {				
						if ( res.result == 'ok' ) {
							urlData = '';
							$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){
								toastr.success('저장되었습니다.');
								$('#my-spinner').hide(); //처리중 모달 종료
							});
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
		} else {
			toastr.warning('일생산계획을 저장할 항목을 선택해주세요.');
		}
	});
	
	//계획확정 버튼 클릭
	$('#btnConfirm').on('click',function(){
		$('#confirmSaveModal').modal('show');
	});

	//계획확정 버튼 클릭
	$('#confirmSaveModalY').on('click',function(){
		confirmUpdate();
	});
	
	//계획확정
	function confirmUpdate() {
		let dataArray = new Array();
		let check = true;  		

		$('#my-spinner').show(); //처리중 모달 시작
		
		$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
			let day = 1;
			if ( dayProdPlanAdmTable.row(index).data().dayConfirmYn == "002" ) {
				let rowData = new Object();
				rowData.prodYear = $('#YEAR option:selected').val();
				rowData.prodMon = $('#MONTH option:selected').val();
				rowData.prodDay = day < 10 ? '0' + day : day;
				rowData.itemSeq = dayProdPlanAdmTable.row(index).data().itemSeq;
				rowData.confirmYn = '001';
				dataArray.push(rowData);
			}
			day++;
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="wm/dayProdPlanAdmUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if ( res.result == 'ok' ) {
						$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});
						toastr.success('계획확정되었습니다.');

						$('#my-spinner').hide(); //처리중 모달 종료
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
	}
	
	//확정취소 버튼 클릭
	$('#btnCancel').on('click', function(){
		if ( !$('input[name=itemCheck]').is(':checked') ) {
			toastr.warning("확정취소할 항목을 선택해주세요.");
			return false;
		}

		$('#dayProdPlanAdmTable tbody tr').each(function(index, item) {
			if ( $('input[id=check_'+index+']').is(':checked') ) {
				let day = 1;
				$(this).find('input[name=prodDayQty]').eq(day-1).attr('disabled', false);
			}
		});
		
	});

	let itemSeqArr = [];	  //배열생성
	let prodDayQtySum = null; //일생산계획 합계
	
	//작업지시 등록 버튼 클릭
	$('#btnWorkOrdNo').on('click', function() {
		//$('#batchEquipCd').val(""); //설비코드 초기화
		//$('#batchEquipNm').val(""); //설비명 초기화
		//$('#workCheckAll').prop('checked', false);	//체크박스 초기화
		
		selectBoxAppend(mainGubunCode, "mainGubun2", mainGubun, "1");
		selectBoxAppend(itemGubunCode, "itemGubun", "", "1");
		selectBoxAppend(workEmerYnCode, "workEmerYn", "", "1");

		$('#workOrdTable').DataTable().clear().draw();
		$('#workOrderProgressTable_filter').find('input[type=search]').val('');

		itemSeqArr = [];	//배열초기화
		itemSeqPopupArr = [];	//배열초기화

		//품목 선택 확인
		$('.DTFC_LeftBodyLiner .DTFC_Cloned tbody tr').each(function(index, item) {
			if ( $(this).find('input[name=itemCheck]').is(':checked') ) {
				let prodDayQtySum = 0;
				let rowId = $(this).find('input[name=itemCheck]').attr('id').split('_');
				let itemSeqVal = dayProdPlanAdmTable.row(rowId[1]).data().itemSeq;
		
				for ( var i = 1; i <= 31; i++ ) {
					if ( $('#day'+i+'Check').is(':checked') ) {
						let prodDayQty = $('#'+rowId[1]+'_prodDayQty_'+i).val();
						prodDayQtySum += parseFloat( (prodDayQty).replace(/,/g, '') );
					}
				}
		
				//수량이 없는 품목은 조회 안되도록 수정 (2023.02.03)
				if ( prodDayQtySum > 0 ) {
					itemSeqArr.push([itemSeqVal,prodDayQtySum]);
					itemSeqPopupArr.push(itemSeqVal);
				}
		
			}
			
		})
		
		$('#my-spinner').show(); //처리중 모달 시작
		
		//일별 선택 확인
		setTimeout(function() {
			for ( var arrIdx = 0; arrIdx < itemSeqArr.length; arrIdx++) {
				let itemSeq = itemSeqArr[arrIdx][0];	//품목시퀀스
				let workOrdQty = itemSeqArr[arrIdx][1];	//지시수량 
				
				$.ajax({
					url : '<c:url value="bm/itemPartDtlList" />',
					type : 'GET',
					async : false,
					data : {
						'itemSeq' : function(){ return itemSeq; },
					},
					success : function(res){
						let data = res.data;
						
						 $('#workOrdTable').DataTable().row.add({
							"mainGubun" 	: data.mainGubunNm,
							"itemGubun" 	: data.itemGubun,
							"itemGubunNm" 	: data.itemGubunNm,
							"itemSeq" 		: itemSeq,
							"itemCus" 		: data.itemCus,
							"itemCusNm" 	: data.itemCusNm,
							"itemCd" 		: data.itemCd,
							"itemNm" 		: data.itemNm,
							"itemModel" 	: data.itemModelNm,
							"tmQty" 	  	: data.tmQty*1 >= 0 ? data.tmQty : 0,
							"workOrdQty"  	: workOrdQty,
						}).draw(true);
						 
					}
				});
			}
			
			$('#my-spinner').hide(); //처리중 모달 종료
			$('#workOrdModal').modal('show');

			//상단 조회
			$('#workOrdTable').DataTable().columns.adjust();
			setTimeout(function(){
				workOrdTable.draw();
				workOrdTable.draw();
			}, 200);

			//하단 조회
			$('#workOrderProgressTable').DataTable().ajax.reload(function(){});
			setTimeout(function(){
				workOrderProgressTable.draw();
				workOrderProgressTable.draw();
			}, 200);
			
		}, 100);
		
	});

	//작업지시 생성 조회
	let workOrdTable = $('#workOrdTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-1'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : false,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "25vh",
		scrollX: true, 
// 		scrollCollapse: true,
		rowId : '',
		columns : [
			{//체크박스
				render : function(data,type,row,meta){
					return '<input type="checkbox" name="workCheck" checked/>';
				},
				'className' : 'text-center'
			},
			{//품목구분
				data : 'itemGubunNm',
				'className' : 'text-center'
			},
			{//품목구분 (숨김)
				data : 'itemGubun',
				'className' : 'text-center'
			},
			{//업체명
				data : 'itemCusNm',
				'className' : 'text-center'
			},
			{//차종
				data : 'itemModel',
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
			{//긴급여부
				render	: function(data,type,row,meta){
					return selectBoxAppend2(workEmerYnCode, "workEmerYn", "002", row, meta);
				},
				'className' : 'text-center'
			},
			{//작업지시일
				data : 'workOrdDate',
				render	: function(data,type,row,meta){
					return '<input type="date" class="form-control" name="workOrdDate" value="'+serverDateTo+'">';
				},
				'className' : 'text-center'
			},
			{//부작업자
				render	: function (data,type,row,meta) {
					/* var html="";
					html += '<div class="form-group input-sub m-0 row">';
					html += '	<input type="hidden" class="form-control" id="subWorkChargr" name="subWorkChargr" disabled>';
					html += '	<input type="text" class="form-control" id="subWorkChargrNm" name="subWorkChargrNm" value="" style="max-width: 150px;" disabled>';
					html += '	<button type="button"class="btn btn-primary input-sub-search" name="btnSubWorkChargr" onClick="selectSubWorkChargr('+meta.row+');">';
					html += '		<span class="oi oi-magnifying-glass"></span>';
					html += '	</button>';
					html += '</div>';
					return html; */
					return selectBoxAppend2(userListCode, "subWorkChargr", userNumber, row, meta);
				},
			}, 
			/* {//설비명
				render	: function (data,type,row,meta) {
					var html="";
					html += '<div class="form-group input-sub m-0 row">';
					html += '	<input type="hidden" class="form-control" id="equipCd" name="equipCd" disabled>';
					html += '	<input type="text" class="form-control" id="equipNm" name="equipNm" value="" style="max-width: 150px;" disabled>';
					html += '	<button type="button"class="btn btn-primary input-sub-search" name="btnEquipCd" onClick="selectEquipCd('+meta.row+');">';
					html += '		<span class="oi oi-magnifying-glass"></span>';
					html += '	</button>';
					html += '</div>';
					return html;
					return selectBoxAppend2(equipListCode, "equipCd", "", row, meta);
				},
			},  */
			{//현재고
				data : 'tmQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{//지시수량
				data : 'workOrdQty',
				render : function ( data, type, row, meta ) {
					let html = "";
					html += '<input type="text" class="form-control" name="workOrdQty" value="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right">';
					html += '<input type="hidden" name="itemGubun" value="'+row['itemGubun']+'">';
					html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'">';
					return html;
				},
				'className' : 'text-center'
			},
			{//시퀀스 (숨김)
				data : 'itemSeq'
			},
		],
		columnDefs: [
	    	{"targets": [2,12],"visible": false}
	    ],
		order: [
			[ 5, 'asc' ]
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});
	
	//작업지시 생성 조회
	let workOrderProgressTable = $('#workOrderProgressTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "30vh",
		scrollX: true, 
// 		scrollCollapse: true, 
		ajax : {
			url : '<c:url value="bm/workOrderProgressBomList"/>',
			type : 'GET',
			data : {
				'itemSeqList'	: function(){ return itemSeqPopupArr; },
				'upperItemSeq' 	: function(){ return "0"; },
				'menuPath' 		: function(){ return "wmsc0181"; },
			},
		},
		rowId : '',
		columns : [
			{//체크박스
				render : function(data,type,row,meta){
					return '<input type="checkbox" name="procCheck" checked/>';
				},
				"className" : "text-center"
			},
			{//품목구분
				data : 'itemGubun',
				"className" : "text-center"
			},
			{//차종
				data : 'itemModel',
				"className" : "text-center"
			},
			{//품번
				data : 'itemCd',
				"className" : "text-center"
			},
			{//품명
				data : 'itemNm',
				"className" : "text-center"
			},
			{//공정
				data : 'prcssNm',
				"className" : "text-center"
			},
			{//작업지시일
				data : 'workProgDate',
				render	: function(data,type,row,meta){
					if(data!=null){
						return '<input type="date" class="form-control" name="workProgDate" value="'+moment(data).format('YYYY-MM-DD')+'" />';
					}else{
						return '<input type="date" class="form-control" name="workProgDate" value="'+moment(serverDateTo).format('YYYY-MM-DD')+'" />';
					}
				},
				"className" : "text-center"
			},
			{//소요량
				data : 'itemConsumpt',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				"className" : "text-right"
			},
			{//필요수량
				data : 'seqCon',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						let seqConArr = data.split('>'); //레벨 0 제품의 시퀀스 > 레벨 0의 소요량 > ... > 레벨 n의 소요량
						let workProgQtyVal = "";
						for ( var i=0; i < itemSeqArr.length; i++ ) {
							if (itemSeqArr[i][0] == seqConArr[0]) {//1. 자기가 속해있는 제품의 지시수량을 가져온다.
								workProgQtyVal = itemSeqArr[i][1];
							}
						}
						for ( var i=1; i < seqConArr.length; i++ ) {//2. 지시수량에 각 레벨의 소요량을 자신의 레벨 수만큼 곱한다. 
							workProgQtyVal *= seqConArr[i];
						}
						
						return rmDecimal(workProgQtyVal);
					} else {
						return '';
					}
				},
				"className" : "text-right"
			},
			{//재고수량
				data : 'tmQty',
				render	: function ( data, type, row, meta ) {
					if ( data != null ) {
						return rmDecimal(data*1 >= 0 ? data : 0);
					} else {
						return '0';
					}
				},
				"className" : "text-right"
			},
			{//지시수량
				data : 'seqCon',
				render	: function ( data, type, row, meta ) {
					let html = "";
					
					// (지시수량 * 소요량) - 재고수량 -> 지시수량 그대로 가져오기 (2023.02.07)
					let seqConArr = data.split('>'); //레벨 0 제품의 시퀀스 > 레벨 0의 소요량 > ... > 레벨 n의 소요량
					let workProgQtyVal = "";
					for ( var i=0; i < itemSeqArr.length; i++ ) {//1. 자기가 속해있는 제품의 지시수량을 가져온다.
						if (itemSeqArr[i][0] == seqConArr[0]) {
							workProgQtyVal = itemSeqArr[i][1];
						}
					}
// 					for ( var i=1; i < seqConArr.length; i++){//2. 지시수량에 각 레벨의 소요량을 자신의 레벨 수만큼 곱한다. 
// 						workProgQtyVal *= seqConArr[i];
// 					}
// 					workProgQtyVal -= row['tmQty']*1 >= 0 ? row['tmQty'] : 0; //3. 2번에서 구한 값(필요수량)에 재고수량을 뺀다.
// 					workProgQtyVal = workProgQtyVal*1 >= 0 ? workProgQtyVal : 0;
					
					html += '<input type="text" class="form-control" name="workProgQty" value="'+rmDecimal(workProgQtyVal)+'" onkeyup="numberFormat(this, \'int\')" style="text-align:right; min-width: 100%;"/>';
					html += '<input type="hidden" name="minorPrcssCd" value="'+row['prcssCd']+'" />';
					html += '<input type="hidden" name="upperItemSeq" value="'+row['upperItemSeq']+'" />';
					html += '<input type="hidden" name="itemSeq" value="'+row['itemSeq']+'" />';
					html += '<input type="hidden" name="workProgCorp" value="'+row['itemCus']+'" />';
					html += '<input type="hidden" name="startItemSeq" value="'+row['startItemSeq']+'" />';
					return html;
				},
				"className" : "text-center"
			},
			{//작업지시세부번호
				data : 'workProgNo',
				render	: function(data,type,row,meta){
					return '자동생성'
				},
				'className' : 'text-center'
			},
		],
		columnDefs: [
	           
	    ],
		//order: [ [ 1, 'asc' ] ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	   
	});

	//BOM조회 버튼 클릭시
	$('#btnWorkOrdRead').on('click',function(){
		itemSeqPopupArr = [];	//배열 초기화
		
		//품목 선택 확인
		$('#workOrdTable tbody tr').each( function(index, item) {
			if ( $(this).find('input[name=workCheck]').is(':checked') ) {
				let itemSeqVal = $('#workOrdTable tbody tr').eq(index).find('input[name=itemSeq]').val();
				itemSeqPopupArr.push(itemSeqVal);
				console.log("index:"+index);
			}
		});

		//하단 조회
		$('#workOrderProgressTable').DataTable().ajax.reload(function(){});
		setTimeout(function(){
			workOrderProgressTable.draw();
			workOrderProgressTable.draw();
		}, 200);
		
	});
	
	//작업지시등록 버튼 클릭시
	$('#btnWorkOrdCreate').on('click', function() {
		let dataArray = new Array();
		let check = true;
		let check2 = true;

		if ( workOrdTable.data().count() == 0 ) {
			toastr.warning("팝업창을 닫고 작업지시 품번과 일자를 선택해 주세요.");
			check = false;
			return false;
		} else {
			if ( $('input[name=workCheck]').is(':checked') ) {
				$('#workOrdTable tbody tr').each( function(index, item) {
					if ( $(this).find('input[name=workCheck]').is(':checked') ) {
						console.log('작업지시 등록 인덱스 : '+index);

						/* if ( $(this).find('select[name=equipCd]').val() == "" ) {
							toastr.warning('설비명을 선택해주세요.');
							check = false;
							$(this).find('select[name=equipCd]').focus();
							return false;
						} */
						
						if ( $(this).find('input[name=workOrdQty]').val().replace(/,/g, "")*1 <= 0 ) {
							toastr.warning('지시수량을 입력해주세요.');
							check = false;
							$(this).find('input[name=workOrdQty]').focus();
							return false;
						}
	
						let rowData = new Object();
						rowData.tbGubun = "top";
						rowData.mainGubun = "002";
						rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
						rowData.itemGubun = $(this).find('td input[name=itemGubun]').val();
						rowData.dlvDate =  $(this).find('td input[name=workOrdDate]').val().replace(/-/g, "");
						rowData.outputDate = $(this).find('td input[name=workOrdDate]').val().replace(/-/g, "");
						rowData.dtlOrdCnt = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.dtlOrdQty = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.workOrdQty = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.workEmerYn = $(this).find('td select[name=workEmerYn] option:selected').val();
						//owData.equipCd = $(this).find('td select[name=equipCd]').val();
						rowData.subWorkChargr = $(this).find('td select[name=subWorkChargr]').val();
						
						dataArray.push(rowData);
						console.log(dataArray)
					}
				});
			} else {
				toastr.warning("작업지시 등록 항목을 선택해주세요.");
				check = false;
				return false;
			}

			if(check){
				if ( $('input[name=procCheck]').is(':checked') ) {
					$('#workOrderProgressTable tbody tr').each( function(index, item) {
						if ( $(this).find('input[name=procCheck]').is(':checked') ) {
							if ( $(this).find('input[name=workProgDate]').val() == "" ) {
								toastr.warning('작업지시일을 입력해주세요.');
								check2 = false;
								$(this).find('input[name=workProgDate]').focus();
								return false;
							}  
							
							if ( $(this).find('input[name=workProgQty]').val().replace(/,/g, "")*1 > 0 ) { //지시수량이 0 초과인 것만 등록되도록
								let rowData = new Object();
								rowData.tbGubun = "bottom";
								rowData.minorPrcssCd = $(this).find('td input[name=minorPrcssCd]').val();
								rowData.upperItemSeq = $(this).find('td input[name=upperItemSeq]').val();
								rowData.itemSeq = $(this).find('td input[name=itemSeq]').val();
								rowData.workProgDate = $(this).find('td input[name=workProgDate]').val().replace(/-/g, "");
								rowData.workProgQty = $(this).find('td input[name=workProgQty]').val().replace(/,/g, "");
								rowData.workProgCorp = $(this).find('td input[name=workProgCorp]').val();
								rowData.startItemSeq = $(this).find('td input[name=startItemSeq]').val();
								rowData.workStatus = 'W';
								dataArray.push(rowData);
							}
						}
					});
				} else {
					toastr.warning("공정 작업지시 조회 항목을 선택해주세요.");
					check2 = false;
					return false;
				}
			}
		}

		if ( check && check2 ) {
			$.ajax({
				url : '<c:url value="/po/workOrderAdmCreateByBongjae"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					$('#my-spinner').show();
				},
				success : function(res) {
					let data = res.data;
					if ( res.result == 'ok' ) {
						//$('#workOrdTable').DataTable().clear().draw();
						//$('#workOrderProgressTable').DataTable().clear().draw();
						toastr.success("작업지시 등록되었습니다.");
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

	//작업지시등록시 설비 팝업창
	//설비 팝업 시작
	/* let equipPopUpTable;
	var equipPopupIndex = "";
	function selectEquipCd(index) {
		equipPopupIndex = index;
		if ( equipPopUpTable == null || equipPopUpTable == 'undefined' ) {
			equipPopUpTable = $('#equipPopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : true,
				info : false,
				ordering : false,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' : "001",
						'equipGubun' : "001",
						'prcNm' : function(){return $('#mainGubun option:selected').val()=="001"?"002":"001"}
					},
				},
				columns : [ {
						data : 'equipNo'
					}, {
						data : 'equipNm'
					}, {
						data : 'prcRealNm'
					}, {
						data : 'equipType'
					}, {
						render : function(data, type, row){
							return moment(row['mfcDate']).format('YYYY-MM-DD');
						}
					}, {
						data : 'mfcCorpCd'
					}
				],
				columnDefs: [
					{ "targets": "_all" , "className" : "text-center" },
		        ],
				order : [ [ 0, 'asc' ], ],
				buttons : [ {
					extend : 'copy',
					title : '설비정보관리',
				}, {
					extend : 'excel',
					title : '설비정보관리',
				}, {
					extend : 'print',
					title : '설비정보관리',
				}, ],
			});
		}
		$('#equipPopUpModal').modal('show');

		$(document).on('click', '#equipPopUpTable tbody tr', function() {
			console.log('배치xxxxxx')
			var data = equipPopUpTable.row(this).data();

			$('input[name=equipCd]').eq(equipPopupIndex).val(data.equipCd);
			$('input[name=equipNm]').eq(equipPopupIndex).val(data.equipNm);
			$('#equipPopUpModal').modal('hide');

		});
	}

	let equipPopUpTable2;
	function selectBatchEquip() {
		console.log("일괄등록 설비설정");
		if ( equipPopUpTable2 == null || equipPopUpTable2 == 'undefined' ) {
			equipPopUpTable2 = $('#equipPopUpTable2').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>",
				language : lang_kor,
				paging : true,
				info : false,
				ordering : false,
				processing : true,
				autoWidth : false,
				lengthChange : true,
				pageLength : 20,
				ajax : {
					url : '<c:url value="/bm/equipCodeAdmList"/>',
					type : 'GET',
					data : {
						'mainGubun' 	: function(){ return "001"; }, //설비(001)
						'equipGubun' 	: function(){ return "001"; }, //주생산설비(001)
						'prcNm' 		: function(){ return "001"; }, //봉제조립(001)
					},
				},
				columns : [
					{//설비코드
						data : 'equipNo'
					},
					{//설비명
						data : 'equipNm'
					},
					{//공정명
						data : 'prcRealNm'
					},
					{//규격
						data : 'equipType'
					},
					{//제작일자
						data : 'mfcDate',
						render : function(data, type, row) {
							if ( data != null && data != '' ) {
								return moment(data).format('YYYY-MM-DD');
							} else {
								return '';
							}
						}
					},
					{//제조사
						data : 'mfcCorpCd'
					}
				],
				columnDefs: [
					{ "targets": "_all" , "className" : "text-center" },
		        ],
				order : [ [ 0, 'asc' ], ],
				buttons : [ {
					extend : 'copy',
					title : '설비정보관리',
				}, {
					extend : 'excel',
					title : '설비정보관리',
				}, {
					extend : 'print',
					title : '설비정보관리',
				}, ],
			});
		} else {
			$('#equipPopUpTable2').DataTable().ajax.reload();
		}
		
		$('#equipPopUpModal2').modal('show');

		$(document).on('click', '#equipPopUpTable2 tbody tr', function() {
			var data = equipPopUpTable2.row(this).data();

			$('#batchEquipCd').val(data.equipCd);
			$('#batchEquipNm').val(data.equipNm);
			$('#equipPopUpModal2').modal('hide');
		});
		
	} */

	//담당자 팝업 시작
	let userPopUpTable;
	var userPopupIndex = "";
	function selectSubWorkChargr(index) {
		userPopupIndex = index;
		if ( userPopUpTable == null || userPopUpTable == undefined ) {
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
						'empCd' : '001',
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
					"targets" : '_all',"className" : "text-center"
				} ],
				order : [ [ 0, 'asc' ] ],
			});
		} else {
			$('#userPopUpTable').DataTable().ajax.reload(function() {});
		}
			
		$('#userPopUpModal').modal('show');
	}

	//부작업자 선택
	$(document).on('click', '#userPopUpTable tbody tr', function() {
		let data = userPopUpTable.row(this).data();

		$('input[name=subWorkChargr]').eq(userPopupIndex).val(data.userNumber);
		$('input[name=subWorkChargrNm').eq(userPopupIndex).val(data.userNm);
		$('#userPopUpModal').modal('hide');
	});

	//일괄등록 전체선택박스 클릭시
	$('#workCheckAll').on('click', function() {
		if ( $(this).is(":checked") ) {
			$('input[name=workCheck]').prop('checked', true);
		} else {
			$('input[name=workCheck]').prop('checked', false);
		}
	});

	//일괄등록 전체선택박스 클릭시
	$('#procCheckAll').on('click', function() {
		if ( $(this).is(":checked") ) {
			$('input[name=procCheck]').prop('checked', true);
		} else {
			$('input[name=procCheck]').prop('checked', false);
		}
	});
	
	//일괄등록 버튼 클릭시
	$('#btnBatchEquip').on('click', function() {
		if ( !$.trim($('#selectDate').val())) {
			toastr.warning("작업지시일을 선택해주세요.");
			return false;
		}
		
		if ( $('input[name=workCheck]').is(':checked') ) {
			$('#workOrdTable tbody tr').each(function(index, item) {
				if ( $(this).find('input[name=workCheck]').is(":checked") ) {
					/* if($('#batchEquipCd').val()!=''){
						$(this).find('select[name=equipCd]').val($('#batchEquipCd').val());
					} */
					if($('#selectDate').val()!=''){
						$(this).find('input[name=workOrdDate]').val($('#selectDate').val());
					}
				}
			});

			$('#workOrderProgressTable tbody tr').each(function(index, item) {
				if ( $(this).find('input[name=procCheck]').is(":checked") ) {
					if($('#selectDate').val()!=''){
						$(this).find('input[name=workProgDate]').val($('#selectDate').val());
					}
				}	
			});
			//$('#workCheckAll').prop('checked', false);
			//$('input[name=workCheck]').prop('checked', false);
			
		} else {
			toastr.warning("일괄등록할 항목을 선택해주세요.");
		}
		
	});


	// 테이블 행 더블클릭
	$('#btnWorkOrdList').on('click',function() {
		window.location.href = "wmsc0011";
	});
	
	//***************엑셀 업로드 시작***************
	//엑셀업로드 버튼 클릭
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);
		formData.append('case', 'day');
		
		var str = $('#btnExcelUpload').val();
		let index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="wm/prodPlanAdmExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;

					$('#dayProdPlanAdmTable').DataTable().clear().draw();
					$('#dayProdPlanAdmTable').DataTable().ajax.reload(function(){});

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
	//***************엑셀 업로드 종료***************

	
	//숫자만 입력하게 처리
	$(document).on('keyup', ".number-float0", function(event){
// 		let preInWhsQtyData = $(this).val();
		   
// 		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

// 			$('.number-float0').on("blur keyup", function() {
// 				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
// 			}); 
			
// 			toastr.warning('숫자만 입력해주세요.');
// 			$(this).val("0");
// 			$(this).select();
// 			event.preventDefault();
// 			return false;
// 		}

		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
// 		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
// 		console.log( $(this).parents().parents().attr('id') );

		let rowId = $(this).parents().parents().attr('id');
		let sumQty = 0;
		
		for ( var j = 0; j < 31; j++ ) {
			sumQty += parseFloat( $('input[name=prodDayQty_'+rowId+']').eq(j).val().replace(/,/g,'') );
// 			console.log("sumQty: " + sumQty);
		}

		$('input[name=prodSumQty_'+rowId+']').val(rmDecimal(sumQty));
		sumQty = 0;
		
	}); 

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=workOrdQty], input[name=workProgQty]", function(event){
// 		let preInWhsQtyData = $(this).val();
		   
// 		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

// 			$('.number-float0').on("blur keyup", function() {
// 				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
// 			}); 
			
// 			toastr.warning('숫자만 입력해주세요.');
// 			$(this).val("0");
// 			$(this).select();
// 			event.preventDefault();
// 			return false;
// 		}

		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
// 		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
		
	}); 

	//select 박스
	function selectBoxAppend2(obj, id, sVal, row, meta){
		let shtml="";
		if(id=="workEmerYn"){
			shtml = '<select class="custom-select custom-select-sm" id="'+id+meta.row+'" name="'+id+'" data-col="' + meta.col + '" style="max-width: 60px;">';
		}else{
			shtml = '<select class="custom-select custom-select-sm" id="'+id+meta.row+'" name="'+id+'" data-col="' + meta.col + '" style="max-width: 110px;">';
		}
		
		let option;
		
		for ( key in obj ) {
			let tmp;
			if ( obj[key].baseCd == sVal ) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+obj[key].baseNm+"</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"+obj[key].baseNm+"</option>";
			}	
			option += tmp;
		}
		let ehtml = '</select>';
		return shtml + option + ehtml;
	}
</script>
<script>
	$(document).ready(function() {
    	setDateBox();
    });
	
    // select box 연도 , 월 표시
    function setDateBox() {
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -100년부터 +100년을 보여준다.
        for ( var y = (com_year-100); y <= (com_year+100); y++ ) {
            $("#YEAR").append('<option value="'+ y +'"'+(y == com_year ? 'selected' : '')+'>'+ y + '년' +'</option>');
        }

        // 월 뿌려주기(1월부터 12월)
        let month;
        $("#MONTH").append("<option value=''>월</option>");
        for ( var i = 1; i <= 12; i++ ) {
        	$("#MONTH").append('<option value="'+(i < 10 ? '0' + i : i)+'" '+(i==mon?'selected':'')+'>'+i+'월'+'</option>'); 
        }
        
    }
</script>

</body>
</html>
