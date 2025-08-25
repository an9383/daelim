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
				<li class="breadcrumb-item active">일생산계획(사출)</li>
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
									<th colspan="9" style="text-align:left;"><span style="font-weight: 500;">체크(✔)시 작업지시 등록에만 적용됩니다.</span></th>
									<th><input type="checkbox" id="dayAllCheck" onclick="rowAllCheck()" name="dayAllCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day1Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day2Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day3Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day4Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day5Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day6Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day7Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day8Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day9Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day10Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day11Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th> 
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day12Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day13Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day14Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day15Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day16Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day17Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day18Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day19Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day20Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day21Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day22Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day23Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day24Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day25Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day26Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day27Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day28Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day29Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day30Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th class="text-center" style="min-width: 50px"><input type="checkbox" id="day31Check" name="dayCheck" style="min-width: 17px; min-height: 17px;"></th>
									<th>월계획</th>
									<th>합계</th>
									<th colspan="31">1</th>
								</tr>
								<tr>
									<th style="min-width: 25px"><input type="checkbox" onclick="columnAllCheck()" name="checkAll" style="min-width: 17px; min-height: 17px;"></th>
									<th style="min-width: 70px">품목코드</th>
									<th style="min-width: 50px">품목구분</th>
	 								<th style="min-width: 60px">업체코드</th>
									<th style="min-width: 100px">업체명</th>
									<th style="min-width: 70px">차종</th>
									<th style="min-width: 100px">품번</th>
									<th style="min-width: 180px">품명</th>
									<th class="text-center" style="min-width: 70px">월계획</th>
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
							<label class="input-label-sm float-left">설비명</label>
							<div class="form-group input-sub m-0 float-left">
								<input type="hidden" class="form-control" id="batchEquipCd" name="batchEquipCd" disabled="">
								<input type="text" class="form-control float-left" id="batchEquipNm" name="batchEquipNm" value="" style="max-width: 150px;" disabled="">
								<button type="button" class="btn btn-primary input-sub-search float-left" name="" onclick="selectBatchEquip();">
									<span class="oi oi-magnifying-glass"></span>
								</button>
							</div>
							<button type="button" class="btn btn-primary float-left ml-2 mr-2" id="btnBatchEquip">일괄등록</button>
							<button type="button" class="btn btn-success float-left" id="btnWorkOrdCreate">작업지시 등록</button>
						</div>
					</div>
					<div class="table-responsive">
						<table id="workOrdTable" class="table table-bordered table-striped" style="width:100%">
							<colgroup>
								<col width="3%">
								<col width="3%">
								<col width="5%">
								<col width="5%">
								<col width="8%">
								<col width="8%">
								<col width="10%">
								<col width="13%">
								<col width="5%">
								<col width="10%">
								<col width="8%">
								<col width="8%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">
										<input type="checkbox" id="workCheckAll" name="workCheckAll" checked>
									</th>
									<th class="text-center">구분</th>
									<th class="text-center">품목구분</th>
									<th class="text-center">품목구분</th>
									<th class="text-center">업체코드</th>
									<th class="text-center">업체명</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">긴급여부</th>
									<th class="text-center">작업지시일</th>
									<th class="text-center">부작업자</th>
									<th class="text-center">설비명</th> 
									<th class="text-center">현재고</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">시퀀스</th>
								</tr>
							</thead>
						</table>
					</div>
					<hr class="m-2">
					<h5 class="modal-title mb-2">작업지시 조회</h5>
					<div class="table-responsive" >
						<table id="workOrdListTable" class="table table-bordered table-striped" style="width:100%">
							<colgroup>
								<col width="3%">
								<col width="4%">
								<col width="8%">
								<col width="9%">
								<col width="10%">
								<col width="10%">
								<col width="7%">
								<col width="7%">
								<col width="6%">
								<col width="6%">
								<col width="8%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr>
									<th class="text-center">구분</th>
									<th class="text-center">품목구분</th>
									<th class="text-center d-none">품목구분</th>
									<th class="text-center">업체코드</th>
									<th class="text-center">업체명</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">차종</th>
									<th class="text-center">긴급여부</th>
									<th class="text-center">작업지시일</th>
									<th class="text-center">부작업자</th>
									<th class="text-center">설비명</th> 
									<th class="text-center">현재고</th>
									<th class="text-center">지시수량</th>
									<th class="text-center">작업지시번호</th>
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
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal" tabindex="-1" role="dialog" aria-labelledby="equipPopUpLabel" aria-hidden="true">
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
	</div>
	<!-- 설비정보 모달 종료-->
	<!-- 설비정보 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="equipPopUpModal2" tabindex="-1" role="dialog" aria-labelledby="equipPopUpLabel2" aria-hidden="true">
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
	</div>
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
	let currentHref = "wmsc0180";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "일생산계획(사출)"); 
	
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
    let itemGubun = null;
    let itemGubun2 = '001';
    let workEmerYn = "";
	let workOrdDateFrom = serverDateFrom;
	let workOrdDateTo = serverDateTo;

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

	let equipListCode = new Array(); //설비명
	<c:forEach items="${equipList}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.equipCd}";
	json1.baseNm = "${info.equipNm}";
	equipListCode.push(json1);
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

	// 목록조회
	let dayProdPlanAdmTable = $('#dayProdPlanAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12 col-md-1 mr-6 mt-3'f><'col-sm-12 col-md-8 mt-3'B>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>", 
		language : lang_kor,
		destroy : true,
		paging : true,
		info : true,
		ordering : false,
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
				'prodYear' : function(){ return prodYear; },
				'prodMon' : function(){ return prodMon; },
				'prodDay' : '01',
				'urlData' : function(){ return urlData; },
				'mainGubun' : '001' ,
				'itemGubun' : function(){return itemGubun2;},
			},
		},
		rowId : 'itemSeq',
		columns : [ 
			{//선택
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" class="" id="check_'+meta.row+'" name="itemCheck" style="min-width: 17px; min-height: 17px;"/>';
				}
			}, 
			{//품목코드 (숨김)
				data : 'itemSeq'
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
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_1" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//2
				data : 'd02',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_2" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//3
				data : 'd03',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_3" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			},
			{//4
				data : 'd04',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_4" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//5
				data : 'd05',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_5" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//6
				data : 'd06',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_6" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//7
				data : 'd07',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_7" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//8
				data : 'd08',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_8" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//9
				data : 'd09',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_9" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//10
				data : 'd10',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_10" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//11
				data : 'd11',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_11" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//12
				data : 'd12',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_12" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//13
				data : 'd13',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_13" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//14
				data : 'd14',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_14" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//15
				data : 'd15',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_15" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//16
				data : 'd16',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_16" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//17
				data : 'd17',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_17" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//18
				data : 'd18',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_18" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//19
				data : 'd19',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_19" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//20
				data : 'd20',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_20" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//21
				data : 'd21',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_21" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//22
				data : 'd22',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_22" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//23
				data : 'd23',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_23" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//24
				data : 'd24',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_24" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//25
				data : 'd25',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_25" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//26
				data : 'd26',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_26" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//27
				data : 'd27',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_27" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//28
				data : 'd28',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_28" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//29
				data : 'd29',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_29" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//30
				data : 'd30',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_30" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
					}
				}
			}, 
			{//31
				data : 'd31',
				render : function(data,type,row,meta){
					if(data!=null){
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31" name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+rmDecimal(data)+'" />';
					}else{
						return '<input type="text" class="form-control number-float0" id="'+meta.row+'_prodDayQty_31"  name="prodDayQty_'+row['itemSeq']+'" style="text-align:right" value="'+0+'" />';
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
			{ "targets": "_all" , "className" : "text-center" },
			{ "visible": false, "targets": [1,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73] }
        ],
		order : [],
		buttons : [ 'copy', { 
			extend : 'excel',
			title : '일 생산계획(사출)',
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
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
    html1 += '</div>';
    
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">품목구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="itemGubun2" id="itemGubun2" title="" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>';
	
	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info ml-3">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>';
	
	html1 += '<button type="button" class="btn btn-success ml-2" id="btnWorkOrdNo">작업지시 등록[조회]</button>&nbsp;&nbsp;&nbsp;';
	html1 += '</div>';
	
	html1 += '<button type="button" class="btn btn-primary float-right mr-1" id="btnSave">저장</button>';
	html1 += '</div>';

	$('#dayProdPlanAdmTable_length').html(html1);

	selectBoxAppend(itemGubunCode, "itemGubun2", "", "");
	
	//조회버튼 클릭시
	$('#btnRetv').on('click', function() {
		prodYear =  $('#YEAR option:selected').val();
		prodMon =  $('#MONTH option:selected').val();
		confirmYn =  $('#selectView option:selected').val();
		urlData = '';
		mainGubun =  $('#mainGubun option:selected').val();
		mainGubun2 = mainGubun;
		itemGubun2 = $('#itemGubun2 option:selected').val();
		$('#dayProdPlanAdmTable').DataTable().ajax.reload(function () {});
	});
	
	//년도, 월, 구분 변경 시
// 	$('#YEAR, #MONTH, #itemGubun2').on('change', function() {
// 		prodYear =  $('#YEAR option:selected').val();
// 		prodMon =  $('#MONTH option:selected').val();
// 		confirmYn =  $('#selectView option:selected').val();
// 		urlData = '';
// 		mainGubun =  $('#mainGubun option:selected').val();
// 		mainGubun2 = mainGubun;
// 		itemGubun2 = $('#itemGubun2 option:selected').val();
// 		$('#dayProdPlanAdmTable').DataTable().ajax.reload(function () {});
//     });

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
	$('#btnCancel').on('click',function(){
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
		$('#batchEquipCd').val(""); //설비코드 초기화
		$('#batchEquipNm').val(""); //설비명 초기화
		//$('#workCheckAll').prop('checked', false);	//체크박스 초기화
		
		selectBoxAppend(mainGubunCode, "mainGubun2", mainGubun, "1");
		selectBoxAppend(itemGubunCode, "itemGubun", "", "1");
		selectBoxAppend(workEmerYnCode, "workEmerYn", "", "1");

		$('#workOrdTable').DataTable().clear().draw();

		itemSeqArr = [];	//배열초기화

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

				if ( prodDayQtySum > 0 ) {
					itemSeqArr.push([itemSeqVal,prodDayQtySum]);
				}else{
					itemSeqArr.push([itemSeqVal,0]);
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
							"mainGubun" : data.mainGubunNm,
							"itemGubun" : data.itemGubun,
							"itemGubunNm" : data.itemGubunNm,
							"itemSeq" 	: itemSeq,
							"itemCus" 	: data.itemCus,
							"itemCusNm" : data.itemCusNm,
							"itemCd" 	: data.itemCd,
							"itemNm" 	: data.itemNm,
							"itemModel" : data.itemModelNm,
							"tmQty" 	  : data.tmQty,
							"workOrdQty"  : workOrdQty,
						}).draw(true);
						 
					}
				});
			}
			
			$('#my-spinner').hide(); //처리중 모달 종료
			$('#workOrdModal').modal('show');

			//상단 조회
			setTimeout(function(){
				$('#workOrdTable').DataTable().columns.adjust();
				setTimeout(function(){
					workOrdTable.draw();
				});
			}, 150);

			//하단 조회
			setTimeout(function(){
				$('#workOrdListTable').DataTable().ajax.reload(function(){});
				setTimeout(function(){
					workOrdListTable.draw();
				});
			}, 150);
			
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
		columns : [
			{
				render : function(data,type,row,meta){
					return '<input type="checkbox" name="workCheck" checked/>';
				},
				'className' : 'text-center'
			},
			{
				data : 'mainGubun',
				'className' : 'text-center'
			},
			{
				data : 'itemGubunNm',
				'className' : 'text-center'
			},
			{
				data : 'itemGubun',
				'className' : 'text-center'
			},
			{
				data : 'itemCus',
				'className' : 'text-center'
			},
			{
				data : 'itemCusNm',
				'className' : 'text-center'
			},
			{
				data : 'itemModel',
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
				render	: function(data,type,row,meta){
					return selectBoxAppend2(workEmerYnCode, "workEmerYn", "002", row, meta);
				},
				'className' : 'text-center'
			},
			{
				data : 'workOrdDate',
				render	: function(data,type,row,meta){
					return '<input type="date" class="form-control" name="workOrdDate" value="'+serverDateTo+'">';
				},
				'className' : 'text-center'
			},
			{
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
			{
				render	: function (data,type,row,meta) {
					/* var html="";
					html += '<div class="form-group input-sub m-0 row">';
					html += '	<input type="hidden" class="form-control" id="equipCd" name="equipCd" disabled>';
					html += '	<input type="text" class="form-control" id="equipNm" name="equipNm" value="" style="max-width: 150px;" disabled>';
					html += '	<button type="button"class="btn btn-primary input-sub-search" name="btnEquipCd" onClick="selectEquipCd('+meta.row+');">';
					html += '		<span class="oi oi-magnifying-glass"></span>';
					html += '	</button>';
					html += '</div>';
					return html; */

					return selectBoxAppend2(equipListCode, "equipCd", "", row, meta);
				},
			}, 
			{
				data : 'tmQty',
				render	: function(data,type,row,meta){
					return rmDecimal(data);
				},
				'className' : 'text-right'
			},
			{
				data : 'workOrdQty',
				render	: function(data,type,row,meta){
					return '<input type="text" class="form-control" name="workOrdQty" value="'+rmDecimal(data)+'" style="text-align:right">';
				},
				'className' : 'text-center'
			},
			{
				data : 'itemSeq'
			},
		],
		columnDefs: [
	    	{"targets": [3,15],"visible": false}
	    ],
		order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	});

	//작업지시 생성 조회
	let workOrdListTable = $('#workOrdListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>",
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
		scrollY: "30vh",
		scrollX: true, 
// 		scrollCollapse: true,
		ajax : {
			url : '<c:url value="po/workOrderDayDataList"/>',
			type : 'GET',
			data : {
				'startDate' : function(){return workOrdDateFrom.replace(/-/g,'')},
				'endDate' : function(){return workOrdDateTo.replace(/-/g,'')},
				'mainGubun' : '001',
				'itemGubun' : function(){return itemGubun;},
				'workEmerYn' : function(){return workEmerYn;},
			},
		},
		rowId : '',
		columns : [
			{data : 'mainGubunNm'},
			{data : 'itemGubunNm'},
			{data : 'itemGubun'},
			{data : 'itemCus',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
			},
			{data : 'itemCusNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				},
			},
			{data : 'itemCd'},
			{data : 'itemNm'},
			{data : 'itemModelNm'},
			{data : 'workEmerYnNm',
				render : function(data,type,row,meta){
					if(data=='긴급'){
						return '<span style="color: orange;"><b>'+data+'</b></span>';
					}else{
						return data
					}
				},
			},
			{
				data : 'workOrdDate',
				render	: function(data,type,row,meta){
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{
				data : 'subWorkChargrNm',
				render	: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'equipNm',
				render	: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{
				data : 'tmQty',
				render	: function(data,type,row,meta){
					if(data != null){
						return rmDecimal(data);
					} else {
						return '0';
					}
				},
				'className' : 'text-right'
			},
			{
				data : 'workOrdQty',
				render	: function(data,type,row,meta){
					return rmDecimal(data);
				},
				'className' : 'text-right'
			},
			{data : 'workOrdNo'},
			{data : 'itemSeq'},
		],
		columnDefs: [
	           {"targets": [2,15],"visible": false},
	           {"targets": "_all","className": "text-center"},
	    ],
		order: [ [ 0, 'asc' ] ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	   
	});
	
	let html2 = '';
	html2 +=  '<div class="row">&nbsp;&nbsp;';
	html2 += '<label class="input-label-sm">작업지시일자</label>';
	html2 += '<input type="date" class="form-control" id="workOrdDateFrom" value="'+serverDateFrom+'" style="max-width:130px;">&nbsp;~ &nbsp;';
	html2 += '<input type="date" class="form-control" id="workOrdDateTo" value="'+serverDateTo+'" style="max-width:130px;">&nbsp;&nbsp;&nbsp;&nbsp;';
/* 	html2 += '<label class="input-label-sm">구분</label>';
	html2 += '<div class="form-group input-sub m-0">';
	html2 += 	'<select name="mainGubun2" id="mainGubun2" title="" class="select w80 col-12 custom-select">';
	html2 += 	'</select>';
	html2 += '</div>&nbsp;&nbsp;&nbsp;'; */

	html2 += '<label class="input-label-sm">품목구분</label>';
	html2 += '<div class="form-group input-sub m-0">';
	html2 += 	'<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select">';
	html2 += 	'</select>';
	html2 += '</div>&nbsp;&nbsp;&nbsp;';

	html2 += '<label class="input-label-sm">긴급여부</label>';
	html2 += '<div class="form-group input-sub m-0">';
	html2 += 	'<select name="workEmerYn" id="workEmerYn" title="" class="select w80 col-12 custom-select">';
	html2 += 	'</select>';
	html2 += '</div>&nbsp;&nbsp;&nbsp;';
	
	html2 += '</div>';

	$('#workOrdListTable_length').html(html2);

	$('#workOrdDateFrom').val(serverDateFrom);
    $('#workOrdDateTo').val(serverDateTo);

	//조건 선택시
	$('#workOrdDateFrom, #workOrdDateTo, #mainGubun2, #itemGubun, #workEmerYn').on('change', function() {
		workOrdDateFrom =  $('#workOrdDateFrom').val().replace(/-/g,'');
		workOrdDateTo =  $('#workOrdDateTo').val().replace(/-/g,'');
		mainGubun2 =  $('#mainGubun2 option:selected').val();
		itemGubun =  $('#itemGubun option:selected').val();
		workEmerYn =  $('#workEmerYn option:selected').val();
		$('#workOrdListTable').DataTable().ajax.reload(function(){});
    });	
	
	//작업지시등록 버튼 클릭시
	$('#btnWorkOrdCreate').on('click', function() {
		let dataArray = new Array();
		let check = true;

		if ( workOrdTable.data().count() == 0 ) {
			toastr.warning("팝업창을 닫고 작업지시 품번과 일자를 선택해 주세요.");
			check = false;
			return false;
		} else {
			if ( $('input[name=workCheck]').is(':checked') ) {
				$('#workOrdTable tbody tr').each( function(index, item) {
					if ( $(this).find('input[name=workCheck]').is(':checked') ) {

						if ( $(this).find('select[name=equipCd]').val() == "" ) {
							toastr.warning('설비명을 선택해주세요.');
							check = false;
							$(this).find('select[name=equipCd]').focus();
							return false;
						}  
						
						if ( $(this).find('input[name=workOrdQty]').val() == "0" || $(this).find('input[name=workOrdQty]').val() == "" ) {
							toastr.warning('지시수량을 입력해주세요.');
							check = false;
							$(this).find('input[name=workOrdQty]').focus();
							return false;
						}
	
						let rowData = new Object();
						rowData.mainGubun = workOrdTable.row(index).data().mainGubun;
						rowData.itemSeq = workOrdTable.row(index).data().itemSeq;
						rowData.itemGubun = workOrdTable.row(index).data().itemGubun;
						rowData.dlvDate = $(this).find('td input[name=workOrdDate]').val().replace(/-/g, "");
						rowData.outputDate = $(this).find('td input[name=workOrdDate]').val().replace(/-/g, "");
						rowData.dtlOrdCnt = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.dtlOrdQty = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.workOrdQty = $(this).find('td input[name=workOrdQty]').val().replace(/,/g, "");
						rowData.workEmerYn = $(this).find('td select[name=workEmerYn] option:selected').val();
						rowData.equipCd = $(this).find('td select[name=equipCd]').val();
						rowData.subWorkChargr = $(this).find('td select[name=subWorkChargr]').val();
						
						dataArray.push(rowData);
						console.log(dataArray)
					}
				});
			} else {
				toastr.warning("작업지시 등록할 항목을 선택해주세요.");
				check = false;
				return false;
			}
		}

		if (check) {
			$.ajax({
				url : '<c:url value="/po/workOrderAdmCreate"/>',
				type : 'POST',
				datatype : 'json',
				data : JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					let data = res.data;
					if ( res.result == 'ok' ) {
						$('#workOrdTable').DataTable().clear().draw();
						$('#workOrdListTable').DataTable().ajax.reload(function(){});
						
						$('#batchEquipCd').val("");	//설비코드 초기화
						$('#batchEquipNm').val("");	//설비명 초기화
						//$('#workCheckAll').prop('checked', false);	//전체선택 초기화
						
						toastr.success("작업지시 등록되었습니다.");
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {

				}
			});
		}
		
	});

	//작업지시등록시 설비 팝업창
	//설비 팝업 시작
	
	let equipPopUpTable;
	let equipPopupIndex = "";
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

	//작업지시 등록 모달 - 설비명 조회
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
						'prcNm' 		: function(){ return "002"; }, //사출(002)
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
			let data = equipPopUpTable2.row(this).data();

			$('#batchEquipCd').val(data.equipCd);
			$('#batchEquipNm').val(data.equipNm);
			$('#equipPopUpModal2').modal('hide');
		});
		
	}

	//담당자 팝업 시작
	let userPopUpTable;
	let userPopupIndex = "";
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
		$('input[name=subWorkChargrNm]').eq(userPopupIndex).val(data.userNm);
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
	
	//일괄등록 버튼 클릭시
	$('#btnBatchEquip').on('click', function() {
		if ( !$.trim($('#batchEquipCd').val()) ) {
			toastr.warning("일괄등록할 설비명을 선택해주세요.");
			return false;
		}
		
		if ( $('input[name=workCheck]').is(':checked') ) {
			$('#workOrdTable tbody tr').each(function(index, item) {
				if ( $(this).find('input[name=workCheck]').is(":checked") ) {
					$(this).find('select[name=equipCd]').val($('#batchEquipCd').val());
				}
			});
			//$('#workCheckAll').prop('checked', false);
			//$('input[name=workCheck]').prop('checked', false);
			
		} else {
			toastr.warning("일괄등록할 항목을 선택해주세요.");
		}
		
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
		let preInWhsQtyData = $(this).val();
		   
		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}

		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
		console.log( $(this).parents().parents().attr('id') );
		let rowId = $(this).parents().parents().attr('id');

		let sumQty = 0;
		for ( var j = 0; j < 31; j++ ) {
			sumQty += parseFloat( $('input[name=prodDayQty_'+rowId+']').eq(j).val().replace(/,/g,'') );
			console.log("sumQty: " + sumQty);
		}

		$('input[name=prodSumQty_'+rowId+']').val(rmDecimal(sumQty));
		sumQty = 0;
		
	}); 

	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=workOrdQty]", function(event){
		let preInWhsQtyData = $(this).val();
		   
		if ( !((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9) ) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}

		if ( $(this).val() == "" ) {
			$(this).val("0");
		}
		
		$(this).val( rmDecimal($(this).val().replace(/,/g,'')) );
		
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
