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
				<li class="breadcrumb-item active">기간별 생산현황(사출)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row" style="width:<c:out value="${2300+(baseInfoAdmListLength*60)+(noGubunLength*60)}" />px;">
							<thead class="thead-light">
								<tr>
									<th rowspan='2'>작업지시번호</th>
									<th rowspan='2'>생산일자</th>
									<th rowspan='2'>주야</th>
									<th rowspan='2'>설비명</th>
									<th rowspan='2'>작업자</th>
									<th rowspan='2'>차종</th>
									<th rowspan='2'>품번</th>
									<th rowspan='2'>품명</th>
									<th colspan='2'>BOM설정자재</th>
									<th colspan='2'>금형정보</th>
									<th rowspan='2' class="text-center">생산수량</th>
									<th rowspan='2' class="text-center">양품수량</th>
									<th rowspan='2' class="text-center">불량수량</th>
									<th rowspan='2' class="text-center">작업시간</th>
									<th rowspan='2' class="text-center">비가동시간</th>
									<th rowspan='2' class="text-center">총퍼징횟수</th>
									<th rowspan='2' class="text-center">퍼징량(g)</th>
									<th rowspan='2' class="text-center">런너량(g)</th>
									<th colspan='<c:out value="${baseInfoAdmListLength}" />'>불량유형별</th>
									<th colspan='<c:out value="${noGubunLength}" />'>비가동정보</th>
								</tr>
								<tr>
									<th>자재명</th>
									<th>GRADE</th>
									<th>금형코드</th>
									<th>Cavity</th>
								<c:forEach items="${baseInfoAdmList}" var="info">
									<th class="text-center">${info.baseInfoNm}</th>
								</c:forEach>
									<th class="text-center">합계</th>
								<c:forEach items="${noGubun}" var="info">
									<th class="text-center">${info.baseNm}</th>
								</c:forEach>
									<th class="text-center">합계</th>
								</tr>
							</thead>
							<tbody class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='12' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalOutputQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFaultyQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalWorkTime" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalNoTime" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFuzzCnt" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalFuzzQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalRunnerQty" style="background-color: #edacb1; color: #ff0000;"></th>
								<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
									<th class='totalFaultyTypeQty${status.index}' style="background-color: #edacb1; color: #ff0000;"></th>
								</c:forEach>
									<th class="totalFaultyTypeQtySum" style="background-color: #edacb1; color: #ff0000;"></th>
								<c:forEach items="${noGubun}" var="info" varStatus="status">
									<th class='totalNoTime${status.index}' style="background-color: #edacb1; color: #ff0000;"></th>
								</c:forEach>
									<th class="totalNoTimeSum" style="background-color: #edacb1; color: #ff0000;"></th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div></div>
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
								<col width="16%">
								<col width="24%">
								<col width="26%">
								<col width="14%">
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
	let currentHref = "wmsc0220";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 생산현황(사출)");

	let startDateVal = moment().subtract('1','M').format('YYYY-MM-DD');
	let endDateVal = moment().format('YYYY-MM-DD');
	let itemSeqVal = '';
	let equipListVal = '';

	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	let itemList = new Array(); // 제품 목록
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	let equipList = new Array(); // 설비 목록
	<c:forEach items="${equipList}" var="info">
	var json = new Object();
	json.baseCd = "${info.equipCd}";
	json.baseNm = "${info.equipNm}";
	equipList.push(json);
	</c:forEach>
	
	// 기간별 생산 현황 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
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
			url : '<c:url value="wm/workList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return moment(startDateVal).format('YYYYMMDD');},
				'endDate'	:	function(){ return moment(endDateVal).format('YYYYMMDD');},
				'itemSeq'	:	function(){ return itemSeqVal;},
				'equipCd'	:	function(){ return equipListVal;},
				'mainGubun'	:	"001"
			},
		},
		columns : [
			{ //작업지시번호
				data : 'workOrdNo', className : 'text-center',
				render: function ( data, type, row, meta ) {
					return `<a href="/posc0020?workOrdNo=\${data}">\${data}</a>`;
				}
			},
			{ data : 'workOrdDate', className : 'text-center',
				render : function(data, type, row, meta) {
					return moment(data).format('YYYY-MM-DD');
				}
			},
			{ data : 'workGubunNm', className : 'text-center' },
			{ data : 'equipNm', className : 'text-center' },
			{ data : 'workChargrNm', className : 'text-center' },
			{ data : 'itemModelNm', className : 'text-center' },
			{ data : 'itemCd', className : 'text-center' },
			{ data : 'itemNm', className : 'text-center' },
			{ data : 'matrlItemNm', className : 'text-center' },
			{ data : 'matrlItemGrade', className : 'text-center' },
			{ data : 'equipNo', className : 'text-center' },
			{ data : 'cavity', className : 'text-center' },
			{ data : 'outputQty',
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
			{ data : 'fairQty',
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				},className : 'text-right' 
			},
			{ data : 'faultyQty',
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				},className : 'text-right' 
			},
			{ data : 'workTime',
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
			{ data : 'noTime', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				},className : 'text-right' 
			},
			{ data : 'fuzzCnt', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				},className : 'text-right' 
			},
			{ data : 'fuzzQty', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
			{ data : 'runnerQty', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				},className : 'text-right' 
			},
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			{ data : 'faultyTypeQty${status.index}',
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
		</c:forEach>
			{ data : 'faultyTypeQtySum', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			{ data : 'noTime${status.index}', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
		</c:forEach>
			{ data : 'noTimeSum', 
				render : function(data, type, row, meta) {
					return addCommas(data==null?"0":data);
				}, className : 'text-right' 
			},
		],
		columnDefs : [
			//{'targets' : 0, 'visible':false}
		],
		order : [],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();

			let equipCount = 0;
			let equipOutputQty = 0;
			let equipFairQty = 0;
			let equipFaultyQty = 0;
			let equipWorkTime = 0;
			let equipNoTime = 0;
			let equipFuzzCnt = 0;
			let equipFuzzQty = 0;
			let equipRunnerQty = 0;
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let equipFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let equipFaultyTypeQtySum = 0;
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			let equipNoTime${status.index} = 0;
		</c:forEach>
			let equipNoTimeSum = 0;

			let dateCount = 0;
			let dateOutputQty = 0;
			let dateFairQty = 0;
			let dateFaultyQty = 0;
			let dateWorkTime = 0;
			let dateNoTime = 0;
			let dateFuzzCnt = 0;
			let dateFuzzQty = 0;
			let dateRunnerQty = 0;
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let dateFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let dateFaultyTypeQtySum = 0;
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			let dateNoTime${status.index} = 0;
		</c:forEach>
			let dateNoTimeSum = 0;

			
			let totalOutputQty = 0;
			let totalFairQty = 0;
			let totalFaultyQty = 0;
			let totalWorkTime = 0;
			let totalNoTime = 0;
			let totalFuzzCnt = 0;
			let totalFuzzQty = 0;
			let totalRunnerQty = 0;
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			let totalFaultyTypeQty${status.index} = 0;
		</c:forEach>
			let totalFaultyTypeQtySum = 0;
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			let totalNoTime${status.index} = 0;
		</c:forEach>
			let totalNoTimeSum = 0;

			let lastEquipNm = ''; // 기준 설비명
			let lastWorkOrdDate = ''; // 기준 생산일자
			for(var i=0;i<data.length;i++) {
				equipCount += 1;
				equipOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				equipFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				equipFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				equipWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				equipNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				equipFuzzCnt += parseFloat(data[i].fuzzCnt==null?0:data[i].fuzzCnt);
				equipFuzzQty += parseFloat(data[i].fuzzQty==null?0:data[i].fuzzQty);
				equipRunnerQty += parseFloat(data[i].runnerQty==null?0:data[i].runnerQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				equipFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				equipFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);
			<c:forEach items="${noGubun}" var="info" varStatus="status">
				equipNoTime${status.index} += parseFloat(data[i].noTime${status.index}==null?0:data[i].noTime${status.index});
			</c:forEach>
				equipNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				dateCount += 1;
				dateOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				dateFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				dateFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				dateWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				dateNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				dateFuzzCnt += parseFloat(data[i].fuzzCnt==null?0:data[i].fuzzCnt);
				dateFuzzQty += parseFloat(data[i].fuzzQty==null?0:data[i].fuzzQty);
				dateRunnerQty += parseFloat(data[i].runnerQty==null?0:data[i].runnerQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				dateFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				dateFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);
			<c:forEach items="${noGubun}" var="info" varStatus="status">
				dateNoTime${status.index} += parseFloat(data[i].noTime${status.index}==null?0:data[i].noTime${status.index});
			</c:forEach>
				dateNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				totalOutputQty += parseFloat(data[i].outputQty==null?0:data[i].outputQty);
				totalFairQty += parseFloat(data[i].fairQty==null?0:data[i].fairQty);
				totalFaultyQty += parseFloat(data[i].faultyQty==null?0:data[i].faultyQty);
				totalWorkTime += parseFloat(data[i].workTime==null?0:data[i].workTime);
				totalNoTime += parseFloat(data[i].noTime==null?0:data[i].noTime);
				totalFuzzCnt += parseFloat(data[i].fuzzCnt==null?0:data[i].fuzzCnt);
				totalFuzzQty += parseFloat(data[i].fuzzQty==null?0:data[i].fuzzQty);
				totalRunnerQty += parseFloat(data[i].runnerQty==null?0:data[i].runnerQty);
			<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
				totalFaultyTypeQty${status.index} += parseFloat(data[i].faultyTypeQty${status.index}==null?0:data[i].faultyTypeQty${status.index});
			</c:forEach>
				totalFaultyTypeQtySum += parseFloat(data[i].faultyTypeQtySum==null?0:data[i].faultyTypeQtySum);
			<c:forEach items="${noGubun}" var="info" varStatus="status">
				totalNoTime${status.index} += parseFloat(data[i].noTime${status.index}==null?0:data[i].noTime${status.index});
			</c:forEach>
				totalNoTimeSum += parseFloat(data[i].noTimeSum==null?0:data[i].noTimeSum);

				if(i+1 != data.length) { // 마지막 데이터가 아닐 경우
					if(moment(data[i].workOrdDate).format('YYYYMMDD') != moment(data[i+1].workOrdDate).format('YYYYMMDD')) { // 생산일자가 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>';
							html += '	<th class="text-center" colspan="9" style="background-color:#aed3ec">생산일별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateWorkTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFuzzCnt)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFuzzQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateRunnerQty)+'</td>';
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
						<c:forEach items="${noGubun}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTimeSum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);

						dateCount = 0;
						dateOutputQty = 0;
						dateFairQty = 0;
						dateFaultyQty = 0;
						dateWorkTime = 0;
						dateNoTime = 0;
						dateFuzzCnt = 0;
						dateFuzzQty = 0;
						dateRunnerQty = 0;
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						dateFaultyTypeQty${status.index} = 0;
					</c:forEach>
						dateFaultyTypeQtySum = 0;
					<c:forEach items="${noGubun}" var="info" varStatus="status">
						dateNoTime${status.index} = 0;
					</c:forEach>
						dateNoTimeSum = 0;

						if(equipCount != 0) {
							html = '';
								html += '<tr>';
								html += '	<th class="text-center" colspan="3" style="background-color:#aed3ec"></th>';
								html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
								html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipWorkTime)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFuzzCnt)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFuzzQty)+'</td>';
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipRunnerQty)+'</td>';
							<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
							</c:forEach>
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
							<c:forEach items="${noGubun}" var="info" varStatus="status">
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime${status.index})+'</td>';
							</c:forEach>
								html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
								html += '</tr>';
							$(workStatusTable.row(i).node()).after(html);
	
							equipCount = 0;
							equipOutputQty = 0;
							equipFairQty = 0;
							equipFaultyQty = 0;
							equipWorkTime = 0;
							equipNoTime = 0;
							equipFuzzCnt = 0;
							equipFuzzQty = 0;
							equipRunnerQty = 0;
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							equipFaultyTypeQty${status.index} = 0;
						</c:forEach>
							equipFaultyTypeQtySum = 0;
						<c:forEach items="${noGubun}" var="info" varStatus="status">
							equipNoTime${status.index} = 0;
						</c:forEach>
							equipNoTimeSum = 0;
						}
					} else if(data[i].equipNm != data[i+1].equipNm) { // 설비명이 다를 경우
						let html = '';
							html += '<tr>';
							html += '	<th class="text-center" colspan="3" style="background-color:#aed3ec"></th>';
							html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
							html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipWorkTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFuzzCnt)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFuzzQty)+'</td>';
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipRunnerQty)+'</td>';
						<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
						<c:forEach items="${noGubun}" var="info" varStatus="status">
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime${status.index})+'</td>';
						</c:forEach>
							html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
							html += '</tr>';
						$(workStatusTable.row(i).node()).after(html);
						
						equipOutputQty = 0;
						equipFairQty = 0;
						equipFaultyQty = 0;
						equipWorkTime = 0;
						equipNoTime = 0;
						equipFuzzCnt = 0;
						equipFuzzQty = 0;
						equipRunnerQty = 0;
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						equipFaultyTypeQty${status.index} = 0;
					</c:forEach>
						equipFaultyTypeQtySum = 0;
					<c:forEach items="${noGubun}" var="info" varStatus="status">
						equipNoTime${status.index} = 0;
					</c:forEach>
						equipNoTimeSum = 0;
					}
				} else { // 마지막에 소계 전체 출력

					let html2 = '';
					html2 += '<tr style="background-color: #edacb1; color: #ff0000;">';
					html2 += '<th colspan="12" style="background-color: #edacb1; color: #ff0000;">전체합계</th>';
					html2 += '<th class="totalOutputQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalOutputQty)+'</th>';
					html2 += '<th class="totalFairQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFairQty)+'</th>';
					html2 += '<th class="totalFaultyQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyQty)+'</th>';
					html2 += '<th class="totalWorkTime text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalWorkTime)+'</th>';
					html2 += '<th class="totalNoTime text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalNoTime)+'</th>';
					html2 += '<th class="totalFuzzCnt text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFuzzCnt)+'</th>';
					html2 += '<th class="totalFuzzQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFuzzQty)+'</th>';
					html2 += '<th class="totalRunnerQty text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalRunnerQty)+'</th>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
					html2 += '<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+ addCommas(totalFaultyTypeQty${status.index})+'</th>';
					 </c:forEach>
					html2 += '<th class="totalFaultyTypeQtySum text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalFaultyTypeQtySum)+'</th>';
					<c:forEach items="${noGubun}" var="info" varStatus="status">
					html2 += '<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalNoTime${status.index})+'</th>';
					</c:forEach>
					html2 += '<th class="text-right" style="background-color: #edacb1; color: #ff0000;">'+addCommas(totalNoTimeSum)+'</th>';
					html2 += '</tr>';
					$(workStatusTable.row(i).node()).after(html2);
					//$($('#workStatusTable').DataTable().row($('#workStatusTable').DataTable().data().count()-1).node()).after(html2);
					
					let html = '';
						html += '<tr>';
						html += '	<th class="text-center" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" colspan="2" style="background-color:#aed3ec">'+moment(data[i].workOrdDate).format('YYYY-MM-DD')+'</th>';
						html += '	<th class="text-center" colspan="9" style="background-color:#aed3ec">생산일별소계</th>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateOutputQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFairQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateWorkTime)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFuzzCnt)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFuzzQty)+'</td>';
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateRunnerQty)+'</td>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQty${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateFaultyTypeQtySum)+'</td>';
					<c:forEach items="${noGubun}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTime${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(dateNoTimeSum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

					html = '';
						html += '<tr>';
						html += '	<th class="text-center" colspan="3" style="background-color:#aed3ec"></th>';
						html += '	<th class="text-center" style="background-color:#aed3ec">'+(data[i].equipNm==null?'':data[i].equipNm)+'</th>';
						html += '	<th class="text-center" colspan="8" style="background-color:#aed3ec">설비별소계</th>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipOutputQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFairQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFaultyQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipWorkTime)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipNoTime)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFuzzCnt)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipFuzzQty)+'</td>';
						html += '	<td class="text-right"style="background-color:#aed3ec">'+addCommas(equipRunnerQty)+'</td>';
					<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQty${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipFaultyTypeQtySum)+'</td>';
					<c:forEach items="${noGubun}" var="info" varStatus="status">
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTime${status.index})+'</td>';
					</c:forEach>
						html += '	<td class="text-right" style="background-color:#aed3ec">'+addCommas(equipNoTimeSum)+'</td>';
						html += '</tr>';
					$(workStatusTable.row(i).node()).after(html);

				
				}

			
			}

			
		
		
/* 			
			$('.totalOutputQty').text(addCommas(totalOutputQty));
			$('.totalFairQty').text(addCommas(totalFairQty));
			$('.totalFaultyQty').text(addCommas(totalFaultyQty));
			$('.totalWorkTime').text(addCommas(totalWorkTime));
			$('.totalNoTime').text(addCommas(totalNoTime));
			$('.totalFuzzCnt').text(addCommas(totalFuzzCnt));
			$('.totalFuzzQty').text(addCommas(totalFuzzQty));
			$('.totalRunnerQty').text(addCommas(totalRunnerQty));
		<c:forEach items="${baseInfoAdmList}" var="info" varStatus="status">
			$('.totalFaultyTypeQty${status.index}').text(addCommas(totalFaultyTypeQty${status.index}));
		</c:forEach>
			$('.totalFaultyTypeQtySum').text(addCommas(totalFaultyTypeQtySum));
		<c:forEach items="${noGubun}" var="info" varStatus="status">
			$('.totalNoTime${status.index}').text(addCommas(totalNoTime${status.index}));
		</c:forEach>
			$('.totalNoTimeSum').text(addCommas(totalNoTimeSum)); */


			
			
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
	    html1 += '		<input type="hidden" id="itemSeqFind">';
	    html1 += '		<input type="text" class="form-control" id="itemCdFind" style="width:130px;" disabled>';
	    html1 += '		<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
	    html1 += '			<span class="oi oi-magnifying-glass"></span>';
	    html1 += '		</button>';
	    html1 += '	</div>';
	    html1 += `	<button type="button" id="itemCdDelete" class="btn form-control ml-1 mr-1" style="width: 40px;" onclick="$('#itemSeqFind').val(''); $('#itemCdFind').val(''); itemSeqVal='';">`;
	    html1 += '		<i class="mdi mdi-close"></i>';
	    html1 += '	</button>';
	    
	    html1 += '	<label class="input-label-sm mr-1">설비</label>';
	    html1 += '	<select class="custom-select mr-3" id="equipList"></select>';
	    
	    html1 += '	<button type="button" class="btn btn-primary" id="btnSearch">조회</button>';
	    
	    html1 += '</div>';
	    
	$('#workStatusTable_length').html(html1);
	
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);
	selectBoxAppend(equipList, "equipList", "", "1");

	// 시작일 변경
	$('#startDate').on('change',function() {
		startDateVal = $(this).val();
		//endDateVal = moment($(this).val()).add('1','M').format('YYYY-MM-DD')
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change',function() {
		endDateVal = $(this).val();
		//startDateVal = moment($(this).val()).subtract('1','M').format('YYYY-MM-DD')
		$('#startDate').val(startDateVal);
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		itemSeqVal = $('#itemSeqFind').val();
		equipListVal = $('#equipList').val();
		workStatusTable.ajax.reload(function(){});
	});
	
	//품번 팝업 시작
	let itemCdPopUpTable;
	function itemCdModalShow() {
		if (itemCdPopUpTable != null && itemCdPopUpTable != 'undefined') {
			itemCdPopUpTable.destroy();
		}
		itemCdPopUpTable = $('#itemCdPopUpTable').DataTable({
			dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
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
			pageLength : -1,
			scrollY : '50vh',
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return '001';}, //사출
					'itemGubun' : function(){return '001';}, //제품
				},
			},
			columns : [ 
				{ data : 'itemCusNm', 'className' : 'text-center' }, //공급사
				{ data : 'itemModelNm', 'className' : 'text-center' }, //차종
				{ data : 'itemCd', 'className' : 'text-center' }, //품번
				{ data : 'itemNm', 'className' : 'text-center' }, //품명
				{ data : 'itemUnitNm', 'className' : 'text-center' }, //단위
			],
			columnDefs : [],
			order : [],
			buttons : [],
		});
		
		$('#itemCdPopUpTable tbody').on('click', 'tr', function() {
			let data = itemCdPopUpTable.row(this).data();
			$('#itemSeqFind').val(data.itemSeq);
			$('#itemCdFind').val(data.itemCd);
			$('#itemCdPopUpModal').modal('hide');
		});
		
		$('#itemCdPopUpModal').modal('show');
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}
	
</script>
</body>
</html>