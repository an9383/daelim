<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">
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
	    	</div>
	  	</div>
	</div>
	<!-- 품번 모달 종료-->
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
	    	</div>
	  	</div>
	</div>
	<!-- 설비정보 모달 종료-->
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">생산관리</a></li>
				<li class="breadcrumb-item active">기간별 자재사용현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid overflow-hidden" id="main">
		<div class="row">
			<div class="col-md-12 p-0">
				<div class="row p-0 mb-2" style="height:86vh;">
					<div class="col-md-12 ml-1 p-1" style="background-color:#ffffff;">
						<table id="workStatusTable" class="table table-bordered m-0 tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th rowspan='2' class="text-center align-middle">작업지시번호</th>
									<th rowspan='2' class="text-center align-middle">설비명</th>
									<th rowspan='2' class="text-center align-middle">차종</th>
									<th rowspan='2' class="text-center align-middle">품번</th>
									<th rowspan='2' class="text-center align-middle">품명</th>
									<th rowspan='2' class="text-center align-middle">양품수량</th>
									<th rowspan='2' class="text-center align-middle">자재코드</th>
									<th rowspan='2' class="text-center align-middle">자재명</th>
									<th rowspan='2' class="text-center align-middle">GRADE</th>
									<th colspan='7' class="text-center align-middle">투입LOT내역</th>
								</tr>
								<tr>
									<th class="text-center align-middle">투입일자</th>
									<th class="text-center align-middle">LOT NO</th>
									<th class="text-center align-middle">투입량</th>
									<th class="text-center align-middle">건조기준(℃)</th>
									<th class="text-center align-middle">건조기준(HR)</th>
									<th class="text-center align-middle">건조조건(℃)</th>
									<th class="text-center align-middle">건조조건(HR)</th>
								</tr>
							</thead>
							<tfoot class="thead-light">
								<tr style="background-color: #edacb1; color: #ff0000;">
									<th colspan='5' style="background-color: #edacb1; color: #ff0000;">전체합계</th>
									<th class="totalFairQty" style="background-color: #edacb1; color: #ff0000;"></th>
									<th colspan='5' style="background-color: #edacb1; color: #ff0000;"></th>
									<th class="totalTotalConsumpt" style="background-color: #edacb1; color: #ff0000;"></th>
									<th colspan='4' style="background-color: #edacb1; color: #ff0000;"></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div></div>
	</div>
</div>
<%@include file="../layout/bottom.jsp"%>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<script>
	const CURRENT_HREF = "wmsc0230";
	const CURRENT_PAGE = $('.' + CURRENT_HREF).attr('id');

	$('#' + CURRENT_PAGE).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + CURRENT_PAGE).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "기간별 자재사용현황");

	const START_DATE = "${serverDateFrom}"
	const END_DATE = "${serverDateTo}"
	
	let startDateVal = START_DATE;
	let endDateVal = END_DATE;
	let itemListVal = '';
	let equipListVal = '';
	let mainGubunVal = '002';

	$('#startDate').val(START_DATE);
	$('#endDate').val(END_DATE);

	let itemList = new Array(); // 제품 목록
	<c:forEach items="${itemList}" var="info">
	var json = new Object();
	json.baseCd = "${info.itemSeq}";
	json.baseNm = "${info.itemNm}";
	itemList.push(json);
	</c:forEach>

	let mainGubunCode = new Array(); // 설비 목록
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunCode.push(json);
	</c:forEach>
	
	// 기간별 생산 현황 조회
	let workStatusTable = $('#workStatusTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-10'l><'col-sm-12 col-md-2'f>>"
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
		scrollY: '65vh',
		scrollX: true,
		scrollCollapse: true,
		select: false,
		ajax : {
			url : '<c:url value="wm/materialList"/>',
			type : 'POST',
			data : {
				'startDate'	:	function(){ return moment(startDateVal).format('YYYYMMDD');},
				'endDate'	:	function(){ return moment(endDateVal).format('YYYYMMDD');},
				'itemSeq'	:	function(){ return itemListVal;},
				'equipCd'	:	function(){ return equipListVal;},
				'mainGubun' :   function(){ return mainGubunVal;}
			},
		},
		rowId : 'workOrdNo',
		columns : [
			{ data : 'workOrdNo', className : 'text-center align-top', name: 'rowspan' }, //작업지시번호
			{ data : 'equipNm', className : 'text-center align-top', name: 'rowspan' }, //설비명
			{ data : 'itemModelNm', className : 'text-center align-top', name: 'rowspan' }, //차종
			{ data : 'itemCd', className : 'text-center align-top', name: 'rowspan' }, //품번
			{ data : 'itemNm', className : 'text-center align-top', name: 'rowspan' }, //품명
			{ //양품수량
				data : 'fairQty', className : 'text-right align-top', name: 'rowspan',
				render : function (data, type, row, meta) {
					return data != null ? rmDecimal(parseFloat(data)) : '';
				}
			},
			{ data : 'matrlItemCd', className : 'text-center align-top', name: 'rowspan' }, //자재코드
			{ data : 'matrlItemNm', className : 'text-center align-top', name: 'rowspan' }, //자재명
			{ data : 'matrlItemGrade', className : 'text-center align-top', name: 'rowspan' }, //GRADE
			{ //투입일자
				data : 'matrlDate', className : 'text-center align-top',
				render : function (data, type, row, meta) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ data : 'barcodeNo', className : 'text-center align-top' }, //LOT NO
			{ //투입량
				data : 'totalConsumpt', className : 'text-right',
				render : function (data, type, row, meta) {
					return data != null ? rmDecimal(parseFloat(data)) : '';
				}
			},
			{ data : 'matrlItemCel', className : 'text-center align-top' }, //건조기준(℃)
			{ data : 'matrlItemHr', className : 'text-center align-top' }, //건조기준(HR)
			{ data : 'matrlCel', className : 'text-center align-top' }, //건조조건(℃)
			{ data : 'matrlHr', className : 'text-center align-top' }, //건조조건(HR)
		],
		rowsGroup: [
			'rowspan:name'
	 	],
		columnDefs : [],
		buttons : [ 'copy', 'excel', 'print' ],
		drawCallback: function() {
			let api = this.api();
			let data = api.data();
			
			let totalFairQty = 0;
			let totalTotalConsumpt = 0;

			let workOrdObj = []; // 작업지시별 수량 목록
			for(var i=0;i<data.length;i++) {
				if(workOrdObj.findIndex( d => d.workOrdNo == data[i].workOrdNo) == -1) { // 작업지시별 수량 목록에 해당 작업지시가 존재하지 않을 경우
					let obj = new Object();
					obj.workOrdNo = data[i].workOrdNo;
					obj.totalFairQty = parseFloat(data[i].fairQty);
					workOrdObj.push(obj);
				}
				totalTotalConsumpt += parseFloat(data[i].totalConsumpt==null?0:data[i].totalConsumpt);
			}

			totalFairQty = workOrdObj.map(item => item.totalFairQty).reduce((prev, curr) => prev + curr, 0);

			$('.totalFairQty').text(rmDecimal(totalFairQty));
			$('.totalTotalConsumpt').text(rmDecimal(totalTotalConsumpt));
			
			$('#workStatusTable_filter').find('label').addClass('m-0'); // 검색창 우측정렬
			$('#workStatusTable').find('tfoot').remove();
		}
	});

	let html1  = '<div class="row">';
	    html1 += '	<label class="input-label-sm mr-2">투입일자</label>';
	    html1 += '	<input class="form-control mr-2" type="date" id="startDate" style="width:125px;"/>';
	    html1 += '	<label class="input-label-sm mr-2">~</label>';
	    html1 += '	<input class="form-control mr-4" type="date" id="endDate" style="width:125px;" />';
	    html1 += '	<label class="input-label-sm mr-2">구분</label>';
	    html1 += '	<select class="custom-select mr-4" id="mainGubunList"></select>';
	    html1 += '	<label class="input-label-sm mr-2">제품</label>';
	    html1 += '	<div class="form-group input-sub m-0">';
	    html1 += '	<input type="hidden" id="itemSeqFind">';
	    html1 += '	<input type="text" class="form-control" id="itemCdFind" style="width:130px;" disabled>';
	    html1 += '	<button type="button" class="btn btn-primary input-sub-search" id="itemCdBtn" onClick="itemCdModalShow();">';
	    html1 += '	<span class="oi oi-magnifying-glass"></span>';
	   	html1 += '	</button>';
	   	html1 += '	</div>';
	   	html1 += '<button type="button" id="itemCdDelete" class="btn form-control" style="width: 40px;" onclick="$(\'#itemCdFind\').val(\'\'); $(\'#itemSeqFind\').val(\'\');">';
	   	html1 += '<i class="mdi mdi-close"></i>';
	   	html1 += '</button>';

	   	
	    html1 += '<label class="input-label-sm mr-2">설비</label>';
		html1 += '<div class="form-group input-sub m-0">';
		html1 += '<input type="hidden" id="batchEquipCd" name="batchEquipCd">';
		html1 += '<input type="text" class="form-control float-left" id="batchEquipNm" name="batchEquipNm" value="" style="max-width: 150px;" disabled>';
		html1 += '<button type="button" class="btn btn-primary input-sub-search float-left" onclick="selectBatchEquip();">';
		html1 += '<span class="oi oi-magnifying-glass"></span>';
		html1 += '</button>';
		html1 += '</div>';
		html1 += '<button type="button" id="equipCdDelete" class="btn form-control" style="width: 40px;" onclick="$(\'#batchEquipCd\').val(\'\'); $(\'#batchEquipNm\').val(\'\');">';
	   	html1 += '<i class="mdi mdi-close"></i>';
	   	html1 += '</button>';
	   	
	    html1 += '	<button type="button"  class="btn btn-primary mr-2" id="btnSearch">조회</button>';
	    html1 += '</div>';
	    
	$('#workStatusTable_length').html(html1);
	$('#startDate').val(startDateVal);
	$('#endDate').val(endDateVal);

	selectBoxAppend(itemList, "itemList", "", "1");
	selectBoxAppend(mainGubunCode, "mainGubunList", "002", "1");

	// 시작일 변경
	$('#startDate').on('change', function() {
		startDateVal = $(this).val();
		$('#endDate').val(endDateVal);
	});

	// 종료일 변경
	$('#endDate').on('change', function() {
		endDateVal = $(this).val();
		$('#startDate').val(startDateVal);
	});
	
	// 조회 버튼 click
	$('#btnSearch').on('click',function() {
		itemListVal = $('#itemSeqFind').val();
		equipListVal = $('#batchEquipCd').val();
		mainGubunVal = $('#mainGubunList').val();
		workStatusTable.ajax.reload(function() {});
	})
	
	//품번 팝업 시작
	let itemCdPopUpTable;
	function itemCdModalShow() {
		if (itemCdPopUpTable != null && itemCdPopUpTable != 'undefined') {
			itemCdPopUpTable.destroy();
		}
		itemCdPopUpTable = $('#itemCdPopUpTable').DataTable({
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
			pageLength : 15,
			ajax : {
				url : '<c:url value="/bm/itemPartAdmList"/>',
				type : 'GET',
				data : {
					'mainGubun' : function(){return $('#mainGubunList option:selected').val();},
					'itemGubunList' : function(){return ['001','003']}
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
			$('#itemCdFind').val(data.itemCd);
			$('#itemSeqFind').val(data.itemSeq);
			$('#itemCdPopUpModal').modal('hide');
		});
		
		$('#itemCdPopUpModal').modal('show');
		
		setTimeout(function(){
			itemCdPopUpTable.draw();
			itemCdPopUpTable.draw();
		}, 300);
		
	}


	//작업지시 등록 모달 - 설비명 조회
	let equipPopUpTable2;
	function selectBatchEquip() {
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
						'prcNm' 		: function(){ return $('#mainGubunList option:selected').val()=="001"?"002":"001"; }, //사출(002)
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
	
	
</script>
</body>
</html>