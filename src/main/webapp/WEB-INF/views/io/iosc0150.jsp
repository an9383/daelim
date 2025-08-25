<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">


<!-- 작업지시 모달 시작-->
	<div class="modal fade bd-example-modal-xl" id="workOrderPopUpModal" tabindex="-1" role="dialog" aria-labelledby="workOrderPopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" style="max-width: 1250px;">
	    	<div class="modal-content">
		    	<div class="modal-header pb-0">
		        	<h4>작업지시 조회</h4>
		        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          		<span aria-hidden="true" style="font-size: xx-large;">&times;</span>
		        	</button>
		      	</div> 
		      	<div class="modal-body">
		      		<hr class="text-secondary">	         
	                	<table id="workOrderPopUpTable" class="table table-bordered w-100">
		               		<colgroup>
								<col width="7%">
								<col width="15%">
								<col width="22%">
								<col width="12%">
								<col width="10%">
								<col width="12%">
								<col width="10%">
								<col width="7%">
							</colgroup>
	                    <thead class="thead-light">
		                    <tr>
		                    	<th>품목구분</th>
		                    	<th>작지번호</th>
		                    	<th>품번</th>
		                    	<th>품명</th>
		                    	<th>차종</th>   
		                    	<th>지시수량</th> 
		                    	<th>생산일자</th>   
		                    	<th>긴급여부</th>                                   
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
	<!-- 작업지시 모달 종료-->

	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">자재출고현황(사출)</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="table-responsive">
						<table id="preOutWhsAdmTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="10%">
								<col width="13%">
								<col width="13%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
								<col width="10%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>품목구분</th>
									<th>차종</th>
									<th>품번</th>
									<th>품명</th>
									<th>창고</th>
									<th>출고일자</th>
									<th class="text-center">수량</th>
									<th>작업지시번호</th>
									<th>작업자</th>
									<th>바코드</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- / #main  -->
	</div>
</div>
<!-- /.page-wrapper -->
<%@include file="../layout/bottom.jsp" %>
<style>
#th{
	padding-bottom: 12px;
}
</style>
<script>

	let currentHref = "iosc0150";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","자재출고현황(사출)"); 

	let sideView = 'add';

	var preOutWhsDateFromCal =  "${serverDateFrom}";
	var preOutWhsDateToCal =  "${serverDateTo}";
	var selStartDateVal = preOutWhsDateFromCal;
	var selEndDateVal = preOutWhsDateToCal;
	var workEmerYn = null;
	
	var serverDateFrom =  "${serverDateFrom}";
	var serverDateTo =  "${serverDateTo}";	
	var workOrdNoVal="";
	var itemNm=null;
	
	var locationCd = "";
	var itemGubun = "";
	var mainGubun = "";
	var outGubun = null;

	var tapView = 'tap1';

	//탭에 따라 날짜 저장
	var xDate= preOutWhsDateToCal;
	var xEndDate= preOutWhsDateFromCal;
	var yDate= preOutWhsDateToCal;
	var yEndDate= preOutWhsDateFromCal;

	//공통코드 처리 시작
	let locCdList = new Array();
	<c:forEach items="${locCd}" var="info">
	if ( "${info.baseNm}".startsWith('사출') ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		locCdList.push(json);
	}
	</c:forEach>
	////공통코드 처리 끝

	//자재출고현황 목록조회	
	let preOutWhsAdmTable = $('#preOutWhsAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		searching : true,
// 		scrollY: '60vh',
		pageLength : 1000000000,
		scrollY : "650px",
		ajax : {
			url : '<c:url value="io/preOutWhsAdmRead"/>',
			type : 'GET',
			data : {
				'startDate'  : function(){return preOutWhsDateFromCal.replace(/-/g,'')},
				'endDate'  : function(){return preOutWhsDateToCal.replace(/-/g,'')},
				'workOrdNo'  : function(){return workOrdNoVal},
				'mainGubun' : '001',
				'locationCd' : function(){return locationCd},
			}	
		},	
		rowId : '',
		columns : [
				{data : 'itemGubunNm'},
				{data : 'itemModelNm'},
				{data : 'itemCd'},
				{data : 'itemNm'},
				{
					data : 'locationNm',
					render: function(data,type,row,meta){
						if(data!=null){
							return data;
						}else{
							return '';
						}
					}
				}, 
				{
					data : 'outWhsDate',
					render: function(data,type,row,meta){
						if(data!=null){
							return moment(data).format('YYYY-MM-DD');
						}else{
							return '';
						}
					}
				}, 
				{
					data : 'outQty',
					render: function(data, type, row, meta) {
						if(data!=null){
							return addCommas(data);
						}else{
							return '';
						}
					}, "className": "text-right"
				},
				{data : 'workOrdNo'},
				{data : 'mainWorkChargr'},
				{data : 'barcodeNo'},
		],
        columnDefs: [
	    ], 
	    order: [
	        [ 0, 'asc' ]
	    ],
	    buttons: [
	    	 'copy', 'excel', 'print' ,
	    	                  
	    ],
	});
	
	//preOutWhsAdmTable의 dataTables_length 추가
	var html1 = '<div class="card-body p-0">';
	
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">출고일자</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateFrom" name="preOutWhsDateFrom" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateFrom, preOutWhsDateFrom, ';
	html1 += "'yyyy-mm-dd'";
	html1 += ')"  class="btn btn-secondary input-sub-search" id="preOutWhsDateFromFromCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
    html1 += '</div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">~</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input class="form-control" style="width:97px;" type="text" id="preOutWhsDateTo" name="preOutWhsDateTo" disabled/>';
	html1 += '<button onclick="fnPopUpCalendar(preOutWhsDateTo,preOutWhsDateTo, ';
	html1 += "'yyyy-mm-dd'";
	html1 += ')"  class="btn btn-secondary input-sub-search" id="preOutWhsDateToCalendar" type="button">';
	html1 += '<span class="oi oi-calendar"></span>';
	html1 += '</button>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	
	/* html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="mainGubun" name="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">사출</option>';
	html1 += '<option value="002">봉제</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;'; */
	
	html1 += '<label class="input-label-sm">창고</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select id="locationCd" name="locationCd" title="" class="select w80 col-12 custom-select">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
// 	html1 += '<label class="input-label-sm">출고구분</label>';
// 	html1 += '<div class="form-group input-sub m-0">';
// 	html1 += '<select id="outGubun" name="outGubun" title="" class="select w80 col-12 custom-select">';
// 	html1 += '<option value="" selected>전체</option>';
// 	html1 += '<option value="001">자재</option>';
// 	html1 += '<option value="002">개별</option>';
// 	html1 += '<option value="003">요청</option>';
// 	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm">작업지시번호</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<input type="text" class="form-control" id="workOrdNoScan" placeholder="스캐너만 입력">';
	html1 += '<button type="button" class="btn btn-primary input-sub-search" onClick="selectWorkOrd();">';
	html1 += '<span class="oi oi-magnifying-glass"></span>';
	html1 += '</button>';
	html1 += '</div>';
	
	html1 += '</div>';
	html1 += '</div>';

	$('#preOutWhsAdmTable_length').html(html1);
	
	$('#preOutWhsDateFrom').val(preOutWhsDateFromCal);
	$('#preOutWhsDateTo').val(preOutWhsDateToCal);
	selectBoxAppend(locCdList, "locationCd", "", "1");
	
	$('#mainGubun, #locationCd, #outGubun').on('change', function() {
		preOutWhsDateFromCal =  $('#preOutWhsDateFrom').val();
		preOutWhsDateToCal =  $('#preOutWhsDateTo').val();
		mainGubun =  $('#mainGubun option:selected').val();
		locationCd =  $('#locationCd option:selected').val();
		outGubun =  $('#outGubun option:selected').val();
		workOrdNoVal = '';
		$('#workOrdNoScan').val('');
		$('#preOutWhsAdmTable').DataTable().ajax.reload( function () {});
    });
	
	function closeCalendar() {
//		var	sTmp;

		hideCalendar();
		ctlToPlaceValue.value =	constructDate(dateSelected,monthSelected,yearSelected);
		
		if(typeof(OnDateChange) == 'function'){
			OnDateChange(ctlToPlaceValue);
		}
		
		preOutWhsDateFromCal =  $('#preOutWhsDateFrom').val();
		preOutWhsDateToCal =  $('#preOutWhsDateTo').val();
		mainGubun =  $('#mainGubun option:selected').val();
		locationCd =  $('#locationCd option:selected').val();
		outGubun =  $('#outGubun option:selected').val();
		workOrdNoVal = '';
		$('#workOrdNoScan').val('');
		$('#preOutWhsAdmTable').DataTable().ajax.reload( function () {});
	}
	
	// 테이블 행 선택
	$('#preOutWhsAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#preOutWhsAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});


// 	var html2= '<button type="button" class="btn btn-warning" id="btnPrint">선택 출력</button>';
// 	$('#preOutWhsAdmTable_length').html(html2);
	
	

	//작업지시번호 SCAN
	$('#workOrdNoScan').keypress(function (e) {
		if (e.which == 13) {
			if($('#workOrdNoScan').val() == "" || $('#workOrdNoScan').val() == null) {
				workOrdNoVal = "";
			}else{
				workOrdNoVal = $('#workOrdNoScan').val();
			}

			toastr.success("작업지시번호를 스캔헀습니다.");
			$('#preOutWhsAdmTable').DataTable().ajax.reload(function() {}); 
		}
	});

	
	//작업지시번호 목록 조회 팝업
   	var workOrderPopUpTable;
   	function selectWorkOrd() {	   	
		if(workOrderPopUpTable == null || workOrderPopUpTable == undefined)	{
			//작지상세 테이블 
			 workOrderPopUpTable = $('#workOrderPopUpTable').DataTable({
				dom: "<'row'<'col-sm-12 col-md-9'l><'col-sm-12 col-md-3'f>>" +
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
				pageLength : 10,
				//ordering: false,
				ajax : {
					url : '<c:url value="po/workOrderModalDataList"/>',
					type : 'GET',
					data : {					     
			            'menuAuth' : 'posc0010',
			            'selStartDate'	:	function() { return selStartDateVal.replace(/-/g,''); },
			            'selEndDate'	:	function() { return selEndDateVal.replace(/-/g,''); },
			            'mainGubun'		:	'001',
			            'itemGubun'		:	function() { return itemGubun; },
			            'workEmerYn'	:	function() { return workEmerYn; },
			            'value'			:	'',
			            'workStatusCd'	:	'E',
					},
				},
				rowId : 'workOrdNo',
				columns : [			
					{data : 'itemGubunNm',
						render : function(data,type,row,meta){
							if(data!=null){
								return data;
							}else{
								return '-';
							}
						}
					},	
					{data : 'workOrdNo',
						render : function(data,type,row,meta){
							if(data!=null){
								return data;
							}else{
								return '-';
							}
						}
					},
					{data : 'itemCd',
						render : function(data,type,row,meta){
							if(data!=null){
								return data;
							}else{
								return '-';
							}
						}
					},	
					{data : 'itemNm',
						render : function(data,type,row,meta){
							if(data!=null){
								return data;
							}else{
								return '-';
							}
						}
					},	
					{data : 'itemModelNm',
						render : function(data,type,row,meta){
							if(data!=null){
								return data;
							}else{
								return '-';
							}
						}
					},	
					{data : 'workOrdQty',
						render : function(data,type,row,meta){
							if(data!=null){
								return rmDecimal(data);
							}else{
								return '-';
							}
						}
					},	
					{data : 'workStartDate',
						render : function(data,type,row,meta){
							if(data!=null){
								return moment(data).format('YYYY-MM-DD');
							}else{
								return '-';
							}
						}
					},		
					{
						data : 'workEmerYnNm',
						render : function(data,type,row,meta){
							if(data=="긴급"){
								return data;
							}else{
								return data;
							}
						}
					},			
				],
				columnDefs: [
		        	{ targets: [5], render: $.fn.dataTable.render.number( ',' ) },
		        	{ targets: [0,1,2,3,5,6,7], className: 'text-center-td' },
		        	{ targets: [5], className: 'text-right-td' }
		        ],
			    order: [
			    ],
			    buttons: [],
			    drawCallback: function() {
				    var api = this.api();
				}
			});
			

		    //workOrderPopUpTable 테이블에 workOrderPopUpTable_length 추가
			var html = '';
			html += '<div class="row">';
			html += '	<label class="input-label-sm">기간</label>';
			html += '	<div class="form-group input-sub m-0 row">';
			html += '		<input type="date" class="form-control" id="selStartDate">';
			html += '	</div>';
			html += '	<label class="input-label-sm mr-2 ml-2">~</label>';
			html += '	<div class="form-group input-sub m-0 row">';
			html += '		<input type="date" class="form-control" id="selEndDate">';
			html += '	</div>&nbsp;&nbsp;&nbsp;';
			/* html += '	<label class="input-label-sm ">구분</label>';
			html += '	<div class="form-group input-sub m-0">';
			html += '		<select name="mainGubun" id="mainGubun" title="" class="select w80 col-12 custom-select">';
			html += '		<option value="">전체</option>';
			html += '		<option value="001">사출</option>';
			html += '		<option value="002">봉제</option>';
			html += '		</select>'; */
			html += '	&nbsp;&nbsp;&nbsp;';
			html += '	<label class="input-label-sm">품목구분</label>';
			html += '	<div class="form-group input-sub m-0">';
			html += '		<select name="itemGubun" id="itemGubun" title="" class="select w80 col-12 custom-select">';
			html += '		<option value="">전체</option>';
			html += '		<option value="001">제품</option>';
			html += '		<option value="002">상품</option>';
			html += '		<option value="003">재공품</option>';
			html += '		</select>';
			html += '	</div>&nbsp;&nbsp;&nbsp;';

			html += '	<label class="input-label-sm">긴급여부</label>';
			html += '	<div class="form-group input-sub m-0">';
			html += '		<select name="workEmerYn" id="workEmerYn" title="" class="select w80 col-12 custom-select">';
			html += '		<option value="">전체</option>';
			html += '		<option value="001">긴급</option>';
			html += '		<option value="002">일반</option>';
			html += '		</select>';
			html += '	</div>&nbsp;&nbsp;&nbsp;';
			//html += '	<button type="button" class="btn btn-primary ml-2" id="btnWorkOrderPopupRev">조회</button>';
			html += '</div>';
				
			$('#workOrderPopUpTable_length').html(html);
			$('#selStartDate').val(moment(selStartDateVal).format('YYYY-MM-DD'));
			$('#selEndDate').val(moment(selEndDateVal).format('YYYY-MM-DD'));

			$('#selStartDate,#selEndDate,#mainGubun,#itemGubun,#workEmerYn').on('change',function() {
				selStartDateVal = moment($('#selStartDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				selEndDateVal = moment($('#selEndDate').val(),'YYYY-MM-DD').format('YYYYMMDD');
				mainGubun =  $('#mainGubun option:selected').val();
				itemGubun =  $('#itemGubun option:selected').val();
				workEmerYn =  $('#workEmerYn option:selected').val();
				$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
			});
			
// 			$('select').css('font-size','120%').css('height','2rem');
// 			$('button').css('font-size','120%').css('height','2rem');
// 			$('input').css('font-size','120%').css('height','2rem'); 
			
			
		}else{
			$('#workOrderPopUpTable').DataTable().ajax.reload(function() {});
		}
		$('#workOrderPopUpModal').modal('show');	
   	} 
   	
 	//작업지시 목록 선택시
	$(document).on('click', '#workOrderPopUpTable tbody tr', function () {
		
    	var data = workOrderPopUpTable.row(this).data();

    	workOrdNoVal = data.workOrdNo;
    	$('#workOrdNoScan').val(data.workOrdNo);
		$('#preOutWhsAdmTable').DataTable().ajax.reload( function () {});
    	
		toastr.success("작업지시번호를 스캔헀습니다.");
    	$('#workOrderPopUpModal').modal('hide');
	});

  

	var array = new Array();
	var i='';
	
	//자재출고 선택 event
	$(document).on('change','input:checkbox[name=partCheckbox]',function() {
		if($(this).is(':checked')) {
			
			//선택 시 값 저장 해주기
			var obj = new Object();
			obj.workOrdNo = preOutWhsAdmTable.row($(this).parents().parents()).data().workOrdNo;	//작지번호
			obj.lotNo = preOutWhsAdmTable.row($(this).parents().parents()).data().lotNo;			//LOTNO
			obj.partCd = preOutWhsAdmTable.row($(this).parents().parents()).data().partCd;			//CODE
			obj.partNm = preOutWhsAdmTable.row($(this).parents().parents()).data().partNm;			//ITEM
			obj.barcodeNo = preOutWhsAdmTable.row($(this).parents().parents()).data().barcodeNo;	//barcodeNo
			obj.preOutQty = preOutWhsAdmTable.row($(this).parents().parents()).data().preOutQty;	//수량
			obj.poNo = preOutWhsAdmTable.row($(this).parents().parents()).data().poNo;				//PoNo
			array.push(obj);
			
			console.log(obj);
			console.log(array);
			console.log("선택해줘서 고마워");

	    } else {
	    	var poNo = preOutWhsAdmTable.row($(this).parents().parents()).data().poNo;
		    if(array.findIndex(i => i.poNo == poNo) != -1) {
		    	array.splice(array.findIndex(i => i.poNo == poNo),1);
		    	console.log("check해제 됐당?");
			}
	    }
	});


	//출력부분
	function body(){
		for(var i=0;i<array.length;i++){
			var	html = "<tr><td class='text-center-td'>"+array[i].partCd+"</td>";
			html += "<td class='text-center-td'>"+array[i].partNm+"</td>";
			html += "<td class='text-center-td'><svg id='modelBarcode-"+i+"'>"+array[i].barcodeNo+"</svg></td>";
			html += "<td class='text-right-td'>"+addCommas(array[i].preOutQty)+"</td></tr>";
			$('#printTable tbody').append(html);

			JsBarcode("#modelBarcode-"+i,array[i].barcodeNo, {
				format: "code128",
				height : 25,
				displayValue : false,
				marginTop : 12,
				marginBottom  :12,
			});
		}

		//진하게
// 		$("#printTable").find('tr').css('border','1px solid black');
		$("#printTable").find('th').attr('style', 'color: black !important;');
		$("#printTable").find('td').attr('style', 'color: black !important;');
	}

	//출력 프린트 클릭시
	$('#btnPrint, #btnPrint2').on('click',function() {
		$('#AAA').text("자재출고(바코드)");
		if($('input:checkbox[name=partCheckbox]:checked').is(':checked') == false){
			toastr.warning("값을 먼저 선택해주세요.");
			return false;		
		}
		$('#my-spinner').show();
		
		body();
		
		setTimeout(function() {
			$('#sudelModel').print({
				deferred: $.Deferred().done(function() {
					$('#preOutWhsAdmTable').DataTable().ajax.reload(function() {});
					array = new Array();
					$('#printTable tbody').empty();
				})
			});
			$('#my-spinner').hide();
		},300);
	});

</script>
</body>
</html>
