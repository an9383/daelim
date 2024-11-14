<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>
<style>
 body{
  overflow:hidden;
 }
 
 .row {
 	display: flex;
	flex-wrap: nowrap;
 }
 
#topDiv > * {
  flex: 1;
}

.inputDiv {
	height: 80%;
}

.buttonFont {
  font-size: 6vmin;
}

.inputFont {
  font-size: 3.7vmin;
}

.titleFont {
  font-size: 3.5vmin;
}

table {
  font-size: 3vmin;
}
</style>

<!-- .app -->
<div class="app pda_mo_wrap" style="display: flex;flex-direction: column;height: 100%;">
	<header class="pda_mo_hd" style="background-color:#3d3ee5!important">
		<a class="mo_logout p-2" href="<c:url value="/auth/logoutPrcss"/>"><img class="mr-2" src="/resources/assets/images/mo_logout_bk.png"><span class="text-middle">로그아웃</span></a>
		<p class="mo_main_title">생산 작업일보 등록</p>
	</header>
	
	<button type="button" class="btn d-none" id="btnDetailOpen"  style="background: #a4a5ff!important"">▼</button>
	
	<main style="height: calc(100vh - 50px); overflow:auto;">
		<div id="topDiv" class="container-fluid bg_wh pb-3" style="height: 100%;display: flex;flex-direction: column;">
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-2 mo_sort_title titleFont">작업일자</div>
					<div class="form-group input-sub col-3 m-0 p-0"><input type="date" class="form-control-md inputFont" id="workDate" value="${serverDate}" style="height: 100%;"></div>
					<div class="col-2 mo_sort_title titleFont" style="text-align: center;">작업자</div>
					<div class="form-group input-sub col-3 m-0 p-0"><input type="text" class="form-control-md inputFont" value="${userNm}" style="height: 100%;" disabled></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">공정</div>
					<div class="form-group input-sub col-8 m-0 p-0"><input type="text" class="form-control-md inputFont" value="${prcssNm}" style="height: 100%;" disabled></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">작업내용</div>
					<div class="form-group input-sub col-8 m-0 p-0"><select id="workDtl" class="form-control-md inputFont p-0" style="height: 100%; min-width: 100%;"></select></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">차종</div>
					<div class="form-group input-sub col-8 m-0 p-0"><select id="itemModel" class="form-control-md inputFont p-0" style="height: 100%; min-width: 100%;"></select></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">작업시간(분)</div>
					<div class="form-group input-sub col-8 m-0 p-0"><input type="text" class="form-control-md inputFont" id="workMin" inputmode="none" onkeyup="javascript:chnNum(this)" style="height: 100%; text-align:right;"></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">생산수량(EA)</div>
					<div class="form-group input-sub col-8 m-0 p-0"><input type="text" class="form-control-md inputFont" id="outputQty" inputmode="none" onkeyup="javascript:chnNum(this)" style="height: 100%; text-align:right;""></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">양품수량(EA)</div>
					<div class="form-group input-sub col-8 m-0 p-0"><input type="text" class="form-control-md inputFont" id="pairQty" inputmode="none" onkeyup="javascript:chnNum(this)" style="height: 100%; text-align:right;""></div>
				</div>
			</div>
			<div class="mo_sortbox m-0">
				<div class="col-12 row p-1 inputDiv">
					<div class="col-4 mo_sort_title titleFont">불량수량(EA)</div>
					<div class="form-group input-sub col-8 m-0 p-0"><input type="text" class="form-control-md inputFont" id="faultyQty" inputmode="none" onkeyup="javascript:chnNum(this)" style="height: 100%; text-align:right;""></div>
				</div>
			</div>
			<div class="mo_sortbox m-0 p-1">
				<button type="button" class="btn btn-primary buttonFont" id="btnSave" style="height: 100%; width: 100%; background-color:#3d3ee5!important">실적 등록</button>
			</div>
		</div>
		
		<div class="container-fluid bg_wh d-none" id="bottomDiv" style="height: 100%;display: flex;flex-direction: column;">
			<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title titleFont">조회일자</div>
					<div class="form-group input-sub col-5 m-0 p-0"><input type="date" class="form-control-md inputFont" id="searchDate" value="${serverDate}" style="height: 100%;"></div>
					<div class="col-4 m-0 p-0 ml-1"><button type="button" class="btn btn-primary buttonFont" id="btnSearch" style="height: 100%; width: 100%;background-color:#3d3ee5!important">조회</button></div>
				</div>
			</div>
			<div class="card" style="OVERFLOW-Y:auto; width:100%;">
				<div class="table-responsive">
					<table id="prcssUserReportTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th class="text-center text-nowrap">공정</th>
								<th class="text-center text-nowrap">작업내용</th>
								<th class="text-center text-nowrap">차종</th>
								<th class="text-center text-nowrap">생산수량</th>
								<th class="text-center text-nowrap">양품수량</th>
								<th class="text-center text-nowrap">불량수량</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</main>
	
	<button type="button" class="btn" id="btnDetailClose" style="background: #a4a5ff!important">▲</button>
	
	<footer class="p-2" style="margin-top: auto;">
		<div class="mo_sumbox">
			<button type="button" class="btn btn-warning float-left" id="btnKeyboard">자판 Off</button>
		</div>
	</footer>
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>
<%@include file="../layout/bottom.jsp" %>

<script>

	$(document).attr("title", "생산 작업일보 등록");
	const MENU_AUTH = 'tmsc0371';

	const SERVER_DATE = "${serverDate}";
	const USER_NUMBER = "${userNumber}";
	const USER_NM = "${userNm}";
	
	let searchDateVal = SERVER_DATE.replace(/-/g,'');
		
	//공통코드 적용
	const itemModelArray = new Array(); //차종
	<c:forEach items="${itemModel}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemModelArray.push(json);
	</c:forEach>
	
	const workDtlArray = new Array(); //작업내용
	<c:forEach items="${workDtl}" var="info">
	var json = new Object();
	json.baseCd = `${info.prcssCd}|${info.prcssType}|${info.lowerPrcssCd}|${info.prcssSeq}`;
	json.baseNm = "${info.prcssNm}";
	workDtlArray.push(json);
	</c:forEach>
	
	selectBoxAppend(workDtlArray, "workDtl", "", ""); //작업내용
	selectBoxAppend(itemModelArray, "itemModel", "", ""); //차종
	//// 공통코드 적용 끝
	
	//바코드 목록조회
	let prcssUserReportTable = $('#prcssUserReportTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		scrollX : true,
		lengthChange : false,
		scrollCollapse: true,
		scrollY : "60vh",
		ajax : {
			url : '<c:url value="tm/prcssUserReportList"/>',
			type : 'GET',
			data : {
				'puaIdx'  	: function(){ return USER_NUMBER; },
				'workDate'  : function(){ return searchDateVal; },
			},
		},
		columns : [
			{ data : 'puaIdxNm', 'className' : 'text-center text-nowrap' }, //공정
			{ data : 'workDtlNm', 'className' : 'text-center text-nowrap' }, //작업내용
			{ data : 'itemModelNm', 'className' : 'text-center text-nowrap' }, //차종
			{ //생산수량
				data : 'outputQty', 'className' : 'text-right text-nowrap',
				render: function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //양품수량
				data : 'pairQty', 'className' : 'text-right text-nowrap',
				render: function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //불량수량
				data : 'faultyQty', 'className' : 'text-right text-nowrap',
				render: function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
		 ],
		order : [],
	});
	
	//조회 버튼 클릭시
	$('#btnSearch').on('click', function() {
		searchDateVal = $('#searchDate').val().replace(/-/g,'');
		$('#prcssUserReportTable').DataTable().ajax.reload(function(){});
	});
	
	//저장 버튼 클릭시
	$('#btnSave').on('click', function() {
		$.ajax({
			url : '<c:url value="tm/prcssUserReportCreate"/>',
			type : 'POST',
			data : {
				'puaIdx' 		: 	function(){ return USER_NUMBER; },
				'workDate' 		: 	function(){ return $('#workDate').val().replace(/-/g,''); },
				'workDtl' 		: 	function(){ return $('#workDtl').val(); },
				'itemModel' 	: 	function(){ return $('#itemModel').val(); },
				'workMin' 		: 	function(){ return $('#workMin').val().replace(/,/g,''); },
				'outputQty' 	: 	function(){ return $('#outputQty').val().replace(/,/g,''); },
				'pairQty' 		: 	function(){ return $('#pairQty').val().replace(/,/g,''); },
				'faultyQty' 	: 	function(){ return $('#faultyQty').val().replace(/,/g,''); },
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$('#prcssUserReportTable').DataTable().ajax.reload(function(){});
					
					//초기화
					$('#workDate').val(SERVER_DATE);
					selectBoxAppend(workDtlArray, "workDtl", "", "");
					selectBoxAppend(itemModelArray, "itemModel", "", "");
					
					toastr.success('등록되었습니다.');
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
				$('#my-spinner').hide();
			}
		});
	});
	
  	//모바일 자판 On/Off
	$('#btnKeyboard').on('click', function() {
		let inputmode = $('#workMin').attr('inputmode');
		if ( inputmode == 'none') {
			$('#btnKeyboard').text("자판 On");
			
			$('#workMin').attr('inputmode', 'numeric');
			$('#outputQty').attr('inputmode', 'numeric');
			$('#pairQty').attr('inputmode', 'numeric');
			$('#faultyQty').attr('inputmode', 'numeric');
		} else if ( inputmode == 'numeric' ) {
			$('#btnKeyboard').text("자판 Off");
			
			$('#workMin').attr('inputmode', 'none');
			$('#outputQty').attr('inputmode', 'none');
			$('#pairQty').attr('inputmode', 'none');
			$('#faultyQty').attr('inputmode', 'none');
		}
	});
  	
	//▼ 버튼 click
	$('#btnDetailOpen').on('click', function(){
		$('#topDiv').removeClass('d-none');
		$('#bottomDiv').addClass('d-none');
		
		$('#btnDetailOpen').addClass('d-none');
		$('#btnDetailClose').removeClass('d-none');
	});

	//▲ 버튼 click
	$('#btnDetailClose').on('click', function(){
		$('#topDiv').addClass('d-none');
		$('#bottomDiv').removeClass('d-none');
		
		$('#btnDetailOpen').removeClass('d-none');
		$('#btnDetailClose').addClass('d-none');
		
		prcssUserReportTable.draw();
	});
	
	function chnNum(a) {
		let commaNumber = comma($(a).val());
		$(a).val(commaNumber);
	}

	function comma(num){
		let len, point, str; 
	  	num = num.replace(/[^0-9]/g,''); // 숫자가 아닌 문자는 전부 replace하여 숫자만 추출
	  	num = num != '0' ? num.replace(/(^0+)/, "") : num; // 0으로 시작하는 첫자리 수는 제거
	  
	  	//해당 숫자의 길이와 천단위 콤마를 찍을 위치값을 구해 콤마를 추가
	  	point = num.length % 3 ;
	  	len = num.length;
	  	str = num.substring(0, point); 
	  
	  	while (point < len) { 
			if (str != "") str += ","; 
	    	str += num.substring(point, point + 3); 
	    	point += 3; 
		} 

		//결과값을 반환
		return str; 
	}
	
</script>

</body>
</html>
