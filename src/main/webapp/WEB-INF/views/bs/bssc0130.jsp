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
				<li class="breadcrumb-item"><a href="#">영업관리</a></li> 
				<li class="breadcrumb-item active">월판매계획</li>
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
						<table id="monSalesPlanAdmTable" class="table table-bordered tr_highlight_row">
							<colgroup>
								<col width="3%">
								<col width="3%">
								<col width="5%">
								<col width="5%">
								<col width="4%">
								<col width="10%">
								<col width="5%">
								<col width="8%">
								<col width="15%">
								<col width="6%">
								<col width="6%">
								<col width="6%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
							</colgroup> 
							<thead class="thead-light">
								<tr>
									<th class="text-center">No.</th>
									<th class="text-center">
										<input type="checkbox" id="checkBoxAll" style="width: 1.2rem; height: 1.2rem;">
									</th>
									<th class="text-center">품목코드</th>
									<th class="text-center">구분</th>
									<th class="text-center">확정여부</th>
									<th class="text-center">업체코드</th>
									<th class="text-center">업체명</th>
									<th class="text-center">차종</th>
									<th class="text-center">품번</th>
									<th class="text-center">품명</th>
									<th class="text-center">M-3실적</th>
									<th class="text-center">M-2실적</th>
									<th class="text-center">M-1실적</th>
									<th class="text-center">3개월 평균</th>
									<th class="text-center">현재고</th>
									<th class="text-center">월계획</th>
									<th class="text-center">월계획</th>
									<th class="text-center">단가</th>
									<th class="text-center">금액</th>
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
	let currentHref = "bssc0130";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","월판매계획"); 
	
	var serverDateFrom = "${serverDateFrom}";
	var serverDateTo = "${serverDateTo}";
	var serverDate = null;

	var dt = new Date();
    var year = "";
    var com_year = dt.getFullYear();
    var mon = dt.getMonth()+1;

    var salesYear = com_year;
    var salesMon = mon<10?"0"+mon:mon;
    var confirmYn = '';
    var urlData='';
    var mainGubun = null;
    
	let m3DateVal = beforeDateFormat(3, salesYear, salesMon);
	let m2DateVal = beforeDateFormat(2, salesYear, salesMon);
	let m1DateVal = beforeDateFormat(1, salesYear, salesMon);
    
	// 목록조회
	let monSalesPlanAdmTable = $('#monSalesPlanAdmTable').DataTable({
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
	 	fixedHeader: true,
		pageLength : -1, 
		scrollY: "65vh",
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="bs/monSalesPlanAdmList" />',
			type : 'GET',
			data : {
				'salesYear' 	: function(){ return salesYear; },
				'salesMon' 		: function(){ return salesMon; },
				'confirmYn' 	: function(){ return confirmYn; },
				'urlData' 		: function(){ return urlData; },
				'mainGubun' 	: function(){ return mainGubun; },
				'bongjaeCheck' 	: function(){ return 'Y'; }, //품목구분이 반제품이면 생산구분이 '구매'나 '외주'가 아닌 것만 조회되도로 구현
				'm3Date' 		: function(){ return m3DateVal; },
				'm2Date' 		: function(){ return m2DateVal; },
				'm1Date' 		: function(){ return m1DateVal; },
			},
		},
		rowId : '',
		columns : [ 
			{ render : function(data,type,row,meta){ return meta.row+1; }, className : "text-center" }, //No.
			{ //체크박스
				render : function(data,type, row, meta){
					return '<input type="checkbox" name="checkBox" style="width: 1.2rem; height: 1.2rem;">';
				}, 'className' : 'text-center', orderable: false
			},
			{ data : 'itemSeq', className : "text-center", visible: false }, //품목코드
			{//구분
				data : 'mainGubunNm', className : "text-center",
				render	: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '-';
					}
				}
			},
			{//확정여부
				data : 'confirmYnNm', className : "text-center",
				render	: function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '미확정';
					}
				}
			},
			{ data : 'itemCus', className : "text-center" }, //업체코드
			{ data : 'itemCusNm', className : "text-center" }, //업체명
			{ data : 'itemModel', className : "text-center" }, //차종
			{ data : 'itemCd', className : "text-center" }, //품번
			{ data : 'itemNm', className : "text-center" }, //품명
			{//M-3실적
				data : 'm3', 'className' : 'text-right',
				render : function(data,type,row,meta){
					if ( data != null && data != '0' ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				}
			},
			{//M-2실적
				data : 'm2', 'className' : 'text-right',
				render : function(data,type,row,meta){
					if ( data != null && data != '0' ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				}
			},
			{//M-1실적
				data : 'm1', 'className' : 'text-right',
				render : function(data,type,row,meta){
					if ( data != null && data != '0' ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				}
			},
			{//3개월 평균
				data : 'salesAvgQty', 'className' : 'text-right',
				render : function(data,type,row,meta){
					if ( data != null && data != '0' ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				}
			},
			{//현재고
				data : 'tmQty', 'className' : 'text-right',
				render : function(data,type,row,meta){
					if ( data != null && data != '0' ) {
						return rmDecimal(data);
					} else {
						return '0';
					}
				}
			},
			{//월계획
				data : 'salesPlanQty', className : "text-center",
				 render : function(data,type,row,meta){
					if(data!=null){
						if ( row['confirmYn'] == '001' ) {
							return '<input type="text" class="form-control number-float0" name="salesPlanQty" value="'+rmDecimal(data)+'" onclick="this.select()" style="text-align:right;" disabled/>';
						} else {
							return '<input type="text" class="form-control number-float0" name="salesPlanQty" value="'+rmDecimal(data)+'" onclick="this.select()" style="text-align:right;" />';
						}
					} else {
						return '<input type="text" class="form-control number-float0" name="salesPlanQty" value="0" onclick="this.select()" style="text-align:right;" />';
					}
				}
			},
			{//월계획
				data : 'salesPlanQty', className : "text-center", visible: false,
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '0';
					}
				},
			},  
			{ data : 'exportCost', className : "text-center", visible: false, }, //단가
			{ data : 'salesPlanCost', className : "text-center", visible: false, }, //금액
		],
		columnDefs: [],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '월 판매계획',
			filename : function(){
				var year = $('#YEAR').val();
				var mon = $('#MONTH').val();
				return year+'년 '+mon+'월 월 판매계획';
			},
			exportOptions: {
               	columns  : [0,2,3,5,6,7,8,9,10,11,12,13,14,16,17,18],
               },
		 	customize : function(xlsx){
		 		var sheet = xlsx.xl.worksheets['sheet1.xml'];
		 		var col = $('col', sheet);

		 		col.each(function () {
		 	    	$(this).attr('width', 15);
		 	    });

		 		$(col[0]).attr('width', 10);
		 		$(col[2]).attr('width', 25);
			 	$(col[5]).attr('width', 25);
			} 
		}, 'print' ],
// 		drawCallback : function() {}
	});


	//monSalesPlanAdmTable의 dataTables_length 추가
	var html1 = '<div class="card-body p-0">';
	html1 += '<div class="row float-left">&nbsp;';
	html1 += '<label class="input-label-sm">년도</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="YEAR" id="YEAR" title="년도" class="select w80 col-12 custom-select"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
    html1 += '</div>';
	html1 += '<label class="input-label-sm">월</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="MONTH" id="MONTH" title="월" class="select w80 col-12 custom-select"></select>';
	html1 += '</div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">구분</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="mainGubun" id="mainGubun" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">사출</option>';
	html1 += '<option value="002">봉제</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">확정여부</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select name="selectView" id="selectView" title="" class="select w80 col-12 custom-select">';
	html1 += '<option value="" selected>전체</option>';
	html1 += '<option value="001">확정</option>';
	html1 += '<option value="002">미확정</option>';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'; 
	
	//html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>&nbsp;&nbsp;&nbsp;';

	html1 += '<form method="POST" enctype="multipart/form-data" id="fileUploadForm" action="">';
	html1 += '<label for="btnExcelUpload" class="btn btn-info">엑셀업로드</label>'
	html1 += '<input type="file" id="btnExcelUpload" name="excelfile" style="display: none" /></form>';
	
	html1 += '</div>';
	
	html1 += '<button type="button" class="btn btn-danger float-right" id="btnCancel">확정취소</button>';
	
	html1 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnConfirm">계획확정</button>';
	
	html1 += '<button type="button" class="btn btn-primary float-right mr-2" id="btnSave">저장</button>';
	
	html1 += '</div>';

	$('#monSalesPlanAdmTable_length').html(html1);

	//조회버튼 클릭
/* 	$('#btnRetv').on('click', function() {
		salesYear =  $('#YEAR option:selected').val();
		salesMon =  $('#MONTH option:selected').val();
		confirmYn =  $('#selectView option:selected').val();
		mainGubun =  $('#mainGubun option:selected').val();
		urlData ='';
		$('#monSalesPlanAdmTable').DataTable().ajax.reload( function () {});
    });	
 */
	// 년도/월/구분/확정여부 클릭 시 
	$('#YEAR, #MONTH, #mainGubun , #selectView').on('change', function() {
		salesYear =  $('#YEAR option:selected').val();
		salesMon =  $('#MONTH option:selected').val();
		confirmYn =  $('#selectView option:selected').val();
		mainGubun =  $('#mainGubun option:selected').val();
		m3DateVal = beforeDateFormat(3, salesYear, salesMon);
		m2DateVal = beforeDateFormat(2, salesYear, salesMon);
		m1DateVal = beforeDateFormat(1, salesYear, salesMon);
		urlData = '';
		$('#monSalesPlanAdmTable').DataTable().ajax.reload( function () {});
    });	

	//저장처리
	$('#btnSave').on('click',function() {

		var dataArray = new Array();		
		var check=true;  		

		//처리중..
		$('#my-spinner').show();

		if($('#monSalesPlanAdmTable_filter').find('input[type=search]').val()!=''){
			toastr.warning("검색란에 값을 지워주세요.");
			
			//처리완료..
			$('#my-spinner').hide();
			
			check=false;
			return false;
		}
		
		$('#monSalesPlanAdmTable tbody tr').each(function(index, item){
			//입력값 검사
			if ($(this).find("td input[name=salesPlanQty]").val() == "" ) {
						 
				toastr.warning('월계획을 입력해주세요');	
				$(this).find("td input[name=salesPlanQty]").focus();
				check=false;

				//처리완료..
				$('#my-spinner').hide();
				
				return false;
			} 
			
			var tempSalesPlanQty = $(this).find("td input[name=salesPlanQty]").val();
			if(tempSalesPlanQty.indexOf('.') == -1){
				tempSalesPlanQty = tempSalesPlanQty + '.00';
			}
			
			if (tempSalesPlanQty.substring(tempSalesPlanQty.lastIndexOf("."), 0).replace(/,/g, '').length > 8) {
				toastr.warning('월계획이 너무 큽니다. (일 억 미만으로 입력해주세요.)');
				$(this).find("td input[name=salesPlanQty]").val('0.00');
				$(this).find("td input[name=salesPlanQty]").focus();
				$(this).find("td input[name=salesPlanQty]").select();
				check=false;

				//처리완료..
				$('#my-spinner').hide();
				
				return false;
			}

			if ( monSalesPlanAdmTable.row(index).data().confirmYn == "002" 
				|| monSalesPlanAdmTable.row(index).data().confirmYn == null ) {
				
				var rowData = new Object();
				
				rowData.salesYear = $('#YEAR option:selected').val();
				rowData.salesMon = $('#MONTH option:selected').val();
				rowData.itemSeq = monSalesPlanAdmTable.row(index).data().itemSeq;
				rowData.salesAvgQty = monSalesPlanAdmTable.row(index).data().salesAvgQty != null ? monSalesPlanAdmTable.row(index).data().salesAvgQty.replace(/,/g,'') : '0';
				//rowData.salesTmQty = monSalesPlanAdmTable.row(index).data().salesTmQty.replace(/,/g,'');
				rowData.salesPlanQty = $(this).find('input[name="salesPlanQty"]').val().replace(/,/g,'');
				
		        dataArray.push(rowData);
		        console.log(rowData);
			}
			
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="bs/monSalesPlanAdmCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {				
					if (res.result == 'ok') {
						// 보기				
						
						urlData='';	
						$('#monSalesPlanAdmTable').DataTable().ajax.reload(function() {});
						toastr.success('저장되었습니다.');

						//처리완료..
						$('#my-spinner').hide();
					}else{
						toastr.error(res.message);
					}
				},
				complete : function() {}
			});
		}
	});

	//계획확정 버튼 클릭시
	$('#btnConfirm').on('click', function(){
		let check = true;
		let dataArray = new Array();

		$('#my-spinner').show();

		$('#monSalesPlanAdmTable tbody tr').each(function(index, item) {
			if ( monSalesPlanAdmTable.row(this).data().confirmYn == '002' ) {
				let rowData = new Object();
				
				rowData.salesYear = $('#YEAR option:selected').val();
				rowData.salesMon = $('#MONTH option:selected').val();
				rowData.itemSeq = monSalesPlanAdmTable.row(this).data().itemSeq;
				rowData.confirmYn = '001';
				
		        dataArray.push(rowData);
			}
		});
	
		if (check) {
			$.ajax({
				url : '<c:url value="bs/monSalesPlanAdmUpdate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					if (res.result == 'ok') {
						$('#monSalesPlanAdmTable').DataTable().ajax.reload(function(){});
						toastr.success('계획확정되었습니다.');

						$('#my-spinner').hide();
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {}
			});
		}
	});
	
	//확정취소 버튼 클릭시
	$('#btnCancel').on('click', function(){
		if ( $('input:checkbox[name=checkBox]').is(":checked") ) {
			let check = true;
			let dataArray = new Array();
	
			$('#my-spinner').show();
	
			$('#monSalesPlanAdmTable tbody tr').each(function(index, item) {
				if ( $(this).find('td input:checkbox[name=checkBox]').is(":checked") ) {
					if ( monSalesPlanAdmTable.row(this).data().confirmYn == '001' ) {
						let rowData = new Object();
						
						rowData.salesYear = $('#YEAR option:selected').val();
						rowData.salesMon = $('#MONTH option:selected').val();
						rowData.itemSeq = monSalesPlanAdmTable.row(this).data().itemSeq;
						rowData.confirmYn = '002';
						
				        dataArray.push(rowData);
					}
				}
			});
		
			if (check) {
				$.ajax({
					url : '<c:url value="bs/monSalesPlanAdmUpdate"/>',
					type : 'POST',
					datatype: 'json',
					data: JSON.stringify(dataArray),
					contentType : "application/json; charset=UTF-8",
					success : function(res) {
						if (res.result == 'ok') {
							$('#monSalesPlanAdmTable').DataTable().ajax.reload(function(){});
							toastr.success('확정취소되었습니다.');
	
							$('#my-spinner').hide();
						} else {
							toastr.error(res.message);
						}
					},
					complete : function() {}
				});
			}
		} else {
			toastr.warning('확정취소할 항목을 선택해주세요.');
		}
		
	});
	

	//***************엑셀 업로드***************
	
	//엑셀업로드 버튼 클릭
	$('#btnExcelUpload').change( function() {
		console.log("파일선택했습니다.");
		var formData = new FormData($('#fileUploadForm')[0]);
		formData.append('case', 'mon');
		
		var str = $('#btnExcelUpload').val();
		index = 0;

		if (str.substring(str.lastIndexOf(".") + 1) == "xls"
				|| str.substring(str.lastIndexOf(".") + 1) == "xlsx") {
			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				data : formData,
				url : '<c:url value="bs/salesPlanAdmExcelUpload"/>',
				processData : false,
				contentType : false,
				cache : false,
				success : function(res) {
					urlData = res.data;

					$('#monSalesPlanAdmTable').DataTable().clear().draw();
					$('#monSalesPlanAdmTable').DataTable().ajax.reload(function(){});

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
	
	//숫자만 입력하게 처리
	$(document).on('keyup',"input[name=salesPlanQty]", function(event){
		var preInWhsQtyData = $(this).val();
		   
		if (!((event.which >= 96 && event.which <= 105) || (event.which >= 48 && event.which <= 57) || event.which == 110 || event.which == 188 || event.which == 190 || event.which == 8 || event.which == 9)) {

			$('.number-float0').on("blur keyup", function() {
				$(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '' ) );
			}); 
			
			toastr.warning('숫자만 입력해주세요.');
			$(this).val("0");
			$(this).select();
			event.preventDefault();
			return false;
		}
		
		$(this).val(rmDecimal($(this).val().replace(/,/g,'')));
	});
	
	
	//날짜 형식 변환
	function beforeDateFormat(beforeM, year, month) {
		// 매개변수 유효성 검사
		if (beforeM < 0 || isNaN(beforeM)) {
			console.error("beforeM은 양수여야 합니다.");
			return "";
		}
		  
		const beforeDate = new Date(year, month - 1);
		beforeDate.setMonth(beforeDate.getMonth() - beforeM);
		
		const yyyy = beforeDate.getFullYear();
		const mm = String(beforeDate.getMonth() + 1).padStart(2, "0");
		const result = yyyy + mm;
		
		return result;
	}
	
	//전체체크박스 클릭시
	$('#checkBoxAll').on('click', function(){
		$('input:checkbox[name=checkBox]').prop("checked", $(this).prop("checked"));
	});
	
</script>
<script>
      $(document).ready(function(){
          setDateBox();
      }); 
    // select box 연도 , 월 표시
    function setDateBox(){
        // 발행 뿌려주기
        $("#YEAR").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+5); y++){
            $("#YEAR").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '년' +'</option>');
        }

        
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#MONTH").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
        	$("#MONTH").append('<option value="'+(i<10?'0'+i:i)+'" '+(i==mon?'selected':'')+'>'+i+'월'+'</option>'); 
        }
    }
</script>

</body>
</html>
