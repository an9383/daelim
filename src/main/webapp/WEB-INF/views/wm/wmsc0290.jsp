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
				<li class="breadcrumb-item active">작업자별 작업일보 조회</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="table-responsive">
						<table id="prcssUserReportTable" class="table table-bordered">
							<thead class="thead-light">
								<tr>
									<th class="text-center text-nowrap">작업자</th>
									<th class="text-center text-nowrap">작업일자</th>
									<th class="text-center text-nowrap">공정</th>
									<th class="text-center text-nowrap">작업내용</th>
									<th class="text-center text-nowrap">차종</th>
									<th class="text-center text-nowrap">작업시간</th>
									<th class="text-center text-nowrap">생산수량</th>
									<th class="text-center text-nowrap">양품수량</th>
									<th class="text-center text-nowrap">불량수량</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr>
									<th colspan='6'>합계</th>
									<th class="sumOutputQty"></th>
									<th class="sumPairQty"></th>
									<th class="sumFaultyQty"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="../layout/bottom.jsp" %>
<script>
	const CURRENT_HREF = "wmsc0290";
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');
	
	$('#'+CURRENT_PAGE).closest('.has-child','li').addClass('has-open has-active');
	$('#'+CURRENT_PAGE).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","작업자별 작업일보 조회");
	
	const SERVER_DATE_FROM = "${serverDateFrom}";
	const SERVER_DATE_TO = "${serverDateTo}";
	
	let searchDateFromVal = SERVER_DATE_FROM;
	let searchDateToVal = SERVER_DATE_TO;
	let puaIdxVal = null;
	let prcssIdxVal = null;
	let itemModelVal = null;
	
	//공통코드 적용
	const puaIdxArray = new Array(); //작업자
	<c:forEach items="${puaIdx}" var="info">
	var json = new Object();
	json.baseCd = "${info.idx}";
	json.baseNm = "${info.userNm}";
	puaIdxArray.push(json);
	</c:forEach>
	
	const prcssCodeList = new Array(); //공정
	<c:forEach items = "${prcssCode}" var="info">
	var json = new Object();
	json.baseCd = `${info.prcssCd}|${info.prcssType}|${info.lowerPrcssCd}|${info.prcssSeq}`;
	json.baseNm = "${info.prcssNm}";
	prcssCodeList.push(json);
	</c:forEach>
	
	const itemModelArray = new Array(); //차종
	<c:forEach items="${itemModel}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	itemModelArray.push(json);
	</c:forEach>
	//// 공통코드 적용 끝
	
	//메인 테이블
	let prcssUserReportTable = $('#prcssUserReportTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY : "65vh",
		ajax : {
			url : '<c:url value="tm/prcssUserReportList"/>',
			type : 'GET',
			data : {
				'startDate' 		: function(){ return searchDateFromVal.replace(/-/g,''); }, //작업일자 - 시작
				'endDate' 			: function(){ return searchDateToVal.replace(/-/g,''); }, //작업일자 - 끝
				'puaIdx' 			: function(){ return puaIdxVal; }, //작업자
				'prcssIdx' 			: function(){ return prcssIdxVal; }, //공정
				'itemModel' 		: function(){ return itemModelVal; }, //차종
				'setOrderWmsc0290' 	: function(){ return 'Y'; }, //ORDER BY 작업자, 작업일자, 공정, 차종 설정
			},
		},
		columns : [
			{ data : 'userNm', 'className' : 'text-center text-nowrap' }, //작업자
			{ //작업일자
				data : 'workDate', 'className' : 'text-center text-nowrap',
				render: function(data, type, row, meta){
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'puaIdxNm', 'className' : 'text-center text-nowrap' }, //공정
			{ data : 'workDtlNm', 'className' : 'text-center text-nowrap' }, //작업내용
			{ data : 'itemModelNm', 'className' : 'text-center text-nowrap' }, //차종
			{ //작업시간
				data : 'workMin', 'className' : 'text-right text-nowrap',
				render: function(data, type, row, meta){
					return data != null ? rmDecimal(data) : '';
				}
			},
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
		columnDefs: [],
	    order: [],
	    buttons: [],
	    drawCallback: function() {}
	});
	
	// 테이블이 reload 될 때마다 이벤트 핸들러 함수 실행
	prcssUserReportTable.on('draw', function() {
		// 각 열의 합계를 저장할 변수
	    let sumOutputQty = 0, sumPairQty = 0, sumFaultyQty = 0;
	
	    // 각 열의 데이터를 반복하며 합계 계산
		prcssUserReportTable.columns().every(function() {
	    	let data = this.data();
	      	switch (this.header().innerHTML) {
	        	case '생산수량':
	          	sumOutputQty = data.reduce(function(a, b) {
		        	return Number(a) + Number(b);
				}, 0);
	          	break;
	        	case '양품수량':
	          	sumPairQty = data.reduce(function(a, b) {
	            	return Number(a) + Number(b);
	          	}, 0);
	          	break;
	        	case '불량수량':
	          	sumFaultyQty = data.reduce(function(a, b) {
	            	return Number(a) + Number(b);
	          	}, 0);
	          	break;
				default:
	          	break;
			}
		});

    	// 계산된 합계를 tfoot에 표시
    	$(prcssUserReportTable.table().footer()).find('.sumOutputQty').text(rmDecimal(sumOutputQty));
    	$(prcssUserReportTable.table().footer()).find('.sumPairQty').text(rmDecimal(sumPairQty));
		$(prcssUserReportTable.table().footer()).find('.sumFaultyQty').text(rmDecimal(sumFaultyQty));
	});

  
	//영업주문관리(외부 일자)
	let html1 = '<div class="row">';
	
		html1 += '<label class="input-label-sm mr-1">작업일자</label>';
	    html1 += '&nbsp;<div class="form-group input-sub m-0 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="date" id="searchDateFrom" value="'+SERVER_DATE_FROM+'"/>';
	    html1 += '</div>';
	    html1 += '&nbsp; ~ &nbsp;<div class="form-group input-sub mr-3 row">';
	    html1 += '<input class="form-control" style="width:97px;" type="date" id="searchDateTo" value="'+SERVER_DATE_TO+'"/>';
	    html1 += '</div>';
	    
	    html1 += '<label class="input-label-sm mr-1">작업자</label>';
		html1 += '<div class="form-group input-sub mr-3">';
		html1 += '<select id="puaIdx" class="select w80 col-12 custom-select">';
		html1 += '</select></div>';
		
	    html1 += '<label class="input-label-sm mr-1">공정</label>';
		html1 += '<div class="form-group input-sub mr-3">';
		html1 += '<select id="prcssIdx" class="select w80 col-12 custom-select">';
		html1 += '</select></div>';
		
	    html1 += '<label class="input-label-sm mr-1">차종</label>';
		html1 += '<div class="form-group input-sub mr-3">';
		html1 += '<select id="itemModel" class="select w80 col-12 custom-select">';
		html1 += '</select></div>';
		
	    html1 += '&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" id="btnSearch">조회</button>';
	    html1 += '</div>';
    
	$('#prcssUserReportTable_length').html(html1);
	selectBoxAppend(puaIdxArray, "puaIdx", "", "1"); //작업자
	selectBoxAppend(prcssCodeList, "prcssIdx", "", "1"); //공정
	selectBoxAppend(itemModelArray, "itemModel", "", "1"); //차종

	//조회버튼 클릭 시
	$('#btnSearch').on('click', function(){
		searchDateFromVal = $('#searchDateFrom').val();
		searchDateToVal = $('#searchDateTo').val();
		puaIdxVal = $('#puaIdx').val();
		prcssIdxVal = $('#prcssIdx').val();
		itemModelVal = $('#itemModel').val();
		
		$('#prcssUserReportTable').DataTable().ajax.reload(function(){});
	});
	
</script>
</body>
</html>
