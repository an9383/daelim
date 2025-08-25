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
				<li class="breadcrumb-item active">기간별 생산현황(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<div class="left-list" id="left-list" style="width: 67%;">
				<div class="table-responsive">
					<table id="workStatusTable" class="table table-bordered tr_highlight_row" <%--style="width:<c:out value="${1500+(baseInfoAdmListLength*60)+(noGubunLength*60)}" />px;"--%> >
						<thead class="thead-light">
							<tr>
								<th>생산일자</th>
								<th>공정</th>
								<th>작업지시번호</th>
								<th>작업자</th>
								<th>차종</th>
								<th>품번</th>
								<th>품명</th>
								<th class="text-center">생산수량</th>
								<th class="text-center">양품수량</th>
								<th class="text-center">불량수량</th>
<%-- 									<th colspan='<c:out value="${baseInfoAdmListLength}" />'>불량유형별</th> --%>
							</tr>
<!-- 								<tr> -->
<%-- 									<c:forEach items="${baseInfoAdmList}" var="info"> --%>
<%-- 										<th class="text-center">${info.baseInfoNm}</th> --%>
<%-- 									</c:forEach> --%>
<!-- 									<th class="text-center">합계</th> -->
<!-- 								</tr> -->
						</thead>
						<tbody class="thead-light">
							<tr style="background-color: #edacb1; color: #ff0000;">
								<th colspan='7' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
								<th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th>
								<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
								<th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th>
<%-- 									<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status"> --%>
<%-- 										<th class='totalFaultyTypeQty${status.index}' style="background-color: #edacb1; color: #ff0000;"></th> --%>
<%-- 									</c:forEach> --%>
<!-- 									<th class="totalFaultyTypeQtySum" style="background-color: #edacb1; color: #ff0000;"></th> -->
						</tbody>
					</table>
				</div>
			</div>
			<div class="right-list right-sidebar" id="myrSidenav" style="width: 32%;">
				<div class="table-responsive">
					<table id="faultyTypeQtyTable" class="table table-bordered tr_highlight_row">
						<colgroup>
							<col width="60%">
							<col width="40%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th class="text-center">불량유형</th>
								<th class="text-center">불량수량</th>
							</tr>
						</thead>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 품번 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="itemCdPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemCdPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="itemCdPopUpLabel">품번 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="itemCdPopUpTable" class="table table-bordered">
	                   		<colgroup>
								<col width="20%">
								<col width="15%">
								<col width="25%">
								<col width="30%">
								<col width="10%">
							</colgroup>
	                   		<thead class="thead-light">
		                   		<tr>
									<th>공급사</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>단위</th>
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
	<!-- 품번 모달 종료-->
</div>
<%@include file="../layout/bottom.jsp"%>
<!-- Modal >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
<!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< Modal -->
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<script>
	let currentHref = "wmsc0221";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 생산현황(봉제)");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemSeqList = '';
	let workProgNoVal = 'none';
	//let equipListVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	let itemList = new Array(); // 제품 목록
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	/* let equipList = new Array(); // 설비 목록
	<c:forEach items="${equipList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipList.push(json);
	</c:forEach> */

	
	// 기간별 생산 현황 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
		scrollY: '70vh',
		scrollX: true,
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="wm/workListByBongjae"/>',
			type : 'POST',
			data : {
				'startDate'		:	function(){ return moment(startDateVal).format('YYYYMMDD'); },
				'endDate'		:	function(){ return moment(endDateVal).format('YYYYMMDD'); },
				'itemSeqList'	:	function(){ return itemSeqList; },
				'mainGubun'		:	"002"
				//'equipCd'	:	function(){ return equipListVal;},
			},
		},
		columns : [
			{ //생산일자
				data : 'workOrdDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'prcssNm', className : 'text-center' }, //공정
			{
				data : 'workOrdNo', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<a href="/wmsc0270?workProgNo=\${row['workProgNo']}&workProgDate=\${moment(row['workProgDate']).format('YYYY-MM')}">\${data}</a>`;
				}
			}, //작업지시번호
			{ data : 'workChargrNm', className : 'text-center' }, //작업자
			{ data : 'itemModelNm', className : 'text-center' }, //차종
			{ data : 'itemCd', className : 'text-center' }, //품번
			{ data : 'itemNm', className : 'text-center' }, //품명
			{ //생산수량
				data : 'outputQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //양품수량
				data : 'fairQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
			{ //불량수량
				data : 'faultyQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
// 		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 			{ data : 'faultyTypeQty${status.index}', className : 'text-right' },
// 		</c:forEach>
// 			{
// 				data : 'faultyTypeQtySum', className : 'text-right',
// 				render : function(data, type, row, meta) {
// 					return data != null ? rmDecimal(data) : '';
// 				}
// 			}, //합계
		],
		columnDefs : [],
		order : [],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let equipCount = 0; //인덱스
			let equipOutputQty = 0;
			let equipFairQty = 0;
			let equipFaultyQty = 0;
// 		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 			let equipFaultyTypeQty${status.index} = 0;
// 		</c:forEach>
// 			let equipFaultyTypeQtySum = 0;
	

			let dateCount = 0; //인덱스
			let dateOutputQty = 0;
			let dateFairQty = 0;
			let dateFaultyQty = 0;
			
// 		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 			let dateFaultyTypeQty${status.index} = 0;
// 		</c:forEach>
// 			let dateFaultyTypeQtySum = 0;
		
		
			let totalOutputQty = 0;
			let totalFairQty = 0;
			let totalFaultyQty = 0;
			
// 		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 			let totalFaultyTypeQty${status.index} = 0;
// 		</c:forEach>
// 			let totalFaultyTypeQtySum = 0;

			let lastEquipNm = ''; // 기준 설비명
			let lastWorkOrdDate = ''; // 기준 생산일자
			
			for ( var i=0; i<data.length; i++ ) {
				equipCount += 1; //인덱스
				equipOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				equipFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
// 			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 				equipFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
// 			</c:forEach>
// 				equipFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);

				dateCount += 1; //인덱스
				dateOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				dateFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				dateFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
// 			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 				dateFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
// 			</c:forEach>
// 				dateFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);

				totalOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				totalFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				totalFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
// 			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 				totalFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
// 			</c:forEach>
// 				totalFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);
				
				if ( i+1 != data.length ) { // 마지막 데이터가 아닐 경우
					if ( (moment(data[i].workOrdDate).format('YYYYMMDD') != moment(data[i+1].workOrdDate).format('YYYYMMDD'))
							|| (data[i].prcssCd != data[i+1].prcssCd) ) { // 생산일자가 다를 경우 OR 공정이 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" colspan="" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>'; //생산일자
							html += `	<th class="text-center" colspan="6" style="background-color:#aed3ec">\${data[i].prcssNm} 소계</th>`; //소계
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>'; //생산수량
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>'; //양품수량
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>'; //불량수량
// 						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
// 						</c:forEach>
// 							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);

						dateCount = 0; //인덱스
						dateOutputQty = 0;
						dateFairQty = 0;
						dateFaultyQty = 0;
// 					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 						dateFaultyTypeQty${status.index} = 0;
// 					</c:forEach>
// 						dateFaultyTypeQtySum = 0;

					} 
				} else { // 마지막에 소계 전체 출력

					let html2 = '';
					html2 += '<tr style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th colspan="7" style="background-color: #edacb1; color: #ff0000;">전체합계</th>'; //전체합계
					html2 += '<th class="totalOutputQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalOutputQty)+'</th>'; //생산수량
					html2 += '<th class="totalFairQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFairQty)+'</th>'; //양품수량
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyQty)+'</th>'; //불량수량
// 					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 					html2 += '<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+ addCommas(totalFaultyTypeQty${status.index})+'</th>';
// 					 </c:forEach>
// 					html2 += '<th class="totalFaultyTypeQtySum text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyTypeQtySum)+'</th>';
					html2 += '</tr>';
					$(workStatusTable.row(i).node()).after(html2);
					//$($('#workStatusTable').DataTable().row($('#workStatusTable').DataTable().data().count()-1).node()).after(html2);
					
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" colspan="" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>'; //생산일자
						html += `	<th class="text-center" colspan="6" style="background-color:#aed3ec">\${data[i].prcssNm} 소계</th>`; //소계
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>'; //생산수량
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>'; //양품수량
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>'; //불량수량
// 					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
// 						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
// 					</c:forEach>
// 						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

				}

			}
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
		}
	});

	let html1  = '<div class="row">';
	
	    html1 += '	<label class="input-label-sm mr-1">생산일자</label>';
	    html1 += '	<input class="form-control mr-1" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-1">~</label>';
	    html1 += '	<input class="form-control mr-3" type="date" id="endDate" style="width:125px;" />';
	    
	    html1 += '	<label class="input-label-sm mr-1">제품</label>';
		html1 += '	<div class="form-group input-sub m-0">';
		html1 += '		<input type="text" class="form-control" id="itemCdFind" style="width:200px;" disabled>';
		html1 += '		<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
		html1 += '			<span class="oi oi-magnifying-glass"></span>';
		html1 += '		</button>';
		html1 += '	</div>';
		html1 += '	<button type="button" id="itemCdDelete" class="btn form-control mr-1" style="width: 40px;" onclick="$(\'#itemCdFind\').val(\'\'); itemSeqList=\'\';">';
		html1 += '		<i class="mdi mdi-close"></i>';
		html1 += '	</button>';
	    
	    /* html1 += '	<label class="input-label-sm mr-1">설비</label>';
	    html1 += '	<select class="custom-select mr-3" id="equipList"></select>'; */
	    
	    html1 += '	<button type="button" class="btn btn-primary" id="btnSearch">조회</button>';
	    html1 += '</div>';
	    
	$('#workStatusTable_length').html(html1);
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	//selectBoxAppend(equipList, "equipList", "", "1");

	// 시작일 변경
	$('#startDate').on('change',function() {
		startDateVal = $(this).val();
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change',function() {
		endDateVal = $(this).val();
		$('#startDate').val(startDateVal);
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		//equipListVal = $('#equipList').val();
		workStatusTable.ajax.reload(function(){});
	})
	
	//메인 테이블 행 클릭시
	$('#workStatusTable tbody').on('click', 'tr', function() {
		workProgNoVal = workStatusTable.row(this).data().workProgNo;
		$('#faultyTypeQtyTable').DataTable().ajax.reload();
	});
	
	//품번 팝업 시작
	let itemCdPopUpTable;
	function itemCdModalShow() {
		if (itemCdPopUpTable != null && itemCdPopUpTable != 'undefined') {
			itemCdPopUpTable.destroy();
		}
		itemCdPopUpTable = $('#itemCdPopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
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
			pageLength : -1,
			scrollY : '50vh',
			select: {
	            style: 'multi'
	        },
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){ return '002'; },
					'itemGubun' : function(){ return '001'; },
				},
			},
			columns : [ 
				{ data : 'itemCusNm', 'className' : 'text-center' }, //공급사
				{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
				{ data : 'itemCd', 'className' : 'text-center' }, //품번
				{ data : 'itemNm', 'className' : 'text-center' }, //품명
				{ data : 'itemUnitNm', 'className' : 'text-center' }, //단위
			],
			columnDefs : [ ],
			order : [ ],
			buttons : [],
		});
		
		let html2 = '<div class="row">';
		html2 += '<button type="button" class="btn btn-primary" id="btnDealCorpSelect">선택</button>'
		html2 += '</div>';
		$('#itemCdPopUpTable_length').html(html2);
		$('#itemCdPopUpModal').modal('show');
		
		//선택 버튼 클릭시
		$('#btnDealCorpSelect').on('click', function() {
			if ( itemCdPopUpTable.rows('.selected').data().length > 0 ) {
				let selectedRows = itemCdPopUpTable.rows('.selected');
				let itemNmVal = selectedRows.data().pluck('itemNm').toArray()[0];
				itemNmVal += selectedRows.data().length > 1 ? ' 외 ' + ( selectedRows.data().length - 1 ) + '개' : '';
				$('#itemCdFind').val(itemNmVal);
				
				itemSeqList = selectedRows.data().pluck('itemSeq').toArray();
				
				$('#itemCdPopUpModal').modal('hide');
			} else {
				toastr.warning('항목을 선택해주세요.');
			}
		});
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}
	
	// 불량유형별 불량수 조회 테이블
	let faultyTypeQtyTable = $('#faultyTypeQtyTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
		scrollY: '70vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/workFaultyListByBongjae"/>',
			type : 'POST',
			data : {
				'workProgNo' : function(){ return workProgNoVal; },
			},
		},
		columns : [
			{ data : 'baseInfoNm', className : 'text-center', }, //불량유형
			{ //불량수량
				data : 'faultyTypeQty', className : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			},
		],
		columnDefs : [],
		order : [],
		buttons : [],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
		
			let totalFaultyQty = 0;
			
			for ( var i=0; i<data.length; i++ ) {
				totalFaultyQty += parseFloat( data[i].faultyTypeQty == null ? 0 : data[i].faultyTypeQty );
				
				if ( i+1 == data.length ) { // 마지막 데이터가 아닐 경우
					let html2 = '';
					html2 += '<tr style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th colspan="1" style="background-color: #edacb1; color: #ff0000;">전체합계</th>'; //전체합계
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyQty)+'</th>'; //불량수량
					html2 += '</tr>';
					$(faultyTypeQtyTable.row(i).node()).after(html2);
				}

			}
			
			$('#faultyTypeQtyTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#faultyTypeQtyTable').find('tfoot').remove();
		}
	});
	
</script>
</body>
</html>