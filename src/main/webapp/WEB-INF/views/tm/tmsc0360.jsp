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
</style>
<!-- .app -->
<div class="app pda_mo_wrap" style="display: flex;flex-direction: column;height: 100%;">
	<header class="pda_mo_hd">
		<a href="<c:url value="/tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0330"><p class="mo_main_title">창고이동</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">이동일자</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input class="form-control-md" type="date" id="changeDate" />
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">Barcode NO</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="barcodeNo" inputmode="none">
			</div>
		</div>
	</div>
	<!--==버튼영역-->
	<div class="mo_btnbox pl-2 pr-2">
		<div class="float-left">
			<button type="button" class="btn btn-warning float-right mr-2" id="btnReset">초기화</button>
		</div>
		<div class="float-left">
			<button type="button" class="btn btn-danger float-right" id="btnDelete">라인삭제</button>
		</div>
		<div class="float-right">
			<button type="button" class="btn btn-primary float-right mr-2" id="btnSave">창고이동</button>
		</div>
	</div>
	<br>
	<!--==end==버튼영역-->
	<!--==end==-sortbox-->
	<main style="height: calc(100vh - 50px);overflow:auto;">
		<div class="container-fluid bg_wh" id="main" style="height: 100%;display: flex;flex-direction: column;">
			<!--table-->
			<!-- .table-responsive -->
			<div class="card" style="OVERFLOW-Y:auto; width:100%;">
				<div class="table-responsive">
					<table id="barcodeDtlTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<!-- <th>No.</th> -->
								<th style="min-width: 10px"><input type="checkbox" class="" id="checkAll" style="width:1.1rem;height:1.1rem;"></th>
								<th style="min-width: 90px">Barcode No</th>
								<th style="min-width: 80px">차종</th>
								<th style="min-width: 120px">품명</th>
								<th class="text-center-th" style="min-width: 45px">이동수량</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--==end==card-->
			<!--==end==table-->
		</div>
	</main>
	<footer class="p-2" style="margin-top: auto;">
			<div class="mo_sumbox">
				<button type="button" class="btn btn-warning float-left" id="btnKeyboard">자판 Off</button>
				<div class="row float-right">
					<div class="mo_kg">
						<span class="mo_sum_font_lg" id="count">0</span> <label>개수</label>
					</div>
				</div>
			</div>
	</footer>
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>
<%@include file="../layout/bottom.jsp"%>

<script>

	$(document).attr("title","창고이동");
	let menuAuth = 'tmsc0360';

	let serverDateFrom = "${serverDateFrom}"
	let serverDateTo = "${serverDateTo}"
	let serverDate = "${serverDate}"

	$('#changeDate').val(serverDate);
			
  	//모바일 자판 On/Off
	$('#btnKeyboard').on('click', function() {
		var inputmode = $('#barcodeNo').attr('inputmode');
		if ( inputmode == 'none') {
			$('#btnKeyboard').text("자판 On");
			$('#barcodeNo').attr('inputmode', 'text');
		} else if ( inputmode == 'text' ) {
			$('#btnKeyboard').text("자판 Off");
			$('#barcodeNo').attr('inputmode', 'none');
		}
	});


	$.fn.dataTable.ext.errMode = 'none';
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		language : lang_kor,		
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		searching : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="tm/barcodeUsePlaceChangeHistAdmRead"/>',
			type : 'GET',
			data : {}	
		},	
		rowId : 'lotNo',
		columns : [ 
			{
				render : function(data, type, row, meta) {
					return '<input type="checkbox" name="check" style="width:1.1rem;height:1.1rem;" data-barcodeNo='+row['barcodeNo']+'>';
				},orderable: false
			},
			{data : 'barcodeNo','className' : 'text-center'},
			{data : 'itemModelNm','className' : 'text-center'},
			{data : 'itemNm','className' : 'text-center'},
			{	data : 'changeQty',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{ data : 'metaRow', 'className' : 'd-none' }, // 바코드 스캔 시 맨 위에 행이 추가되도록 구현
		],
	    order: [ [5, 'desc'] ], // 바코드 스캔 시 맨 위에 행이 추가되도록 구현
	});

	// 바코드 스캔
	$('#barcodeNo').keypress(function(e){
		let check = true;
		let check2 = true;

		
		if ( e.keyCode == 13 ) { //엔터 키 클릭 시
			if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				$('#barcodeNo').val().select();
				check = false;
				return false;
			}
			//스캔시 이미 스캔한 데이터는 제외하고 선입선출 되도록 구현
			$('#barcodeDtlTable tbody tr').each(function(index, item) {
				if ( $(this).find('input[name=check]').attr('data-barcodeNo') == $('#barcodeNo').val() ) {
					toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
					$('#barcodeNo').select();
					check = false;
					check2 = false;
					return false;
				}
			});

			if (check2) {
			 	$.ajax({
	            	url: '<c:url value="tm/barcodeUsePlaceChangeHistAdmRead"/>',
	                type: 'GET',
	                async : false,
	                data: {
	                	'barcodeNo'		: function(){ return $('#barcodeNo').val(); },
	                },
	                success: function (res) {
	                    if (res.result == 'ok') {
	                    	let data = res.data;

	                    	let metaRow = $('#barcodeDtlTable').DataTable().rows().count() > 0 ? 
	                    			Math.max.apply(Math, $('#barcodeDtlTable').DataTable().rows().data().toArray().map(function(row) { return row.metaRow; })) + 1
		                    	: 0;
			                    	
	                    	$('#barcodeDtlTable').DataTable().row.add({
	                    		'barcodeNo' 	: data.barcodeNo,
	                    		'itemModelNm'	: data.itemModelNm,
	                    		'sachulSeq' 	: data.sachulSeq,
	                    		'bongjeSeq' 	: data.bongjeSeq,
	                    		'itemCd' 		: data.itemCd,
	                    		'itemNm' 		: data.itemNm,
                    			'itemGubun' 	: data.itemGubun,
	                    		'changeQty' 	: data.changeQty,
	                    		'sachulLocCd' 	: data.sachulLocCd,
	                    		'sachulLocNo' 	: data.sachulLocNo,
	                    		'bongjeLocCd' 	: data.bongjeLocCd,
	                    		'bongjeLocNo' 	: data.bongjeLocNo,
	                    		'bongjeGubun' 	: data.bongjeGubun,
	                    		'bongjeImportYn' 	: data.bongjeImportYn,
	                    		'metaRow'		: metaRow, //추가한 행이 맨 위에 생성되도록 구현
	                    	}).draw(false);

	                    	$('input[name=check]').eq(0).prop('checked',true)
			                $('#barcodeNo').select();
							$('#btnSave').removeClass('d-none');

							$('#count').text(barcodeDtlTable.data().count());
							toastr.success(res.message);
	                        
	                    } else if ( res.result == "fail" ) {
	                    	toastr.warning(res.message);
	                    	$('#barcodeNo').select();
		                } else {
		                	toastr.error(res.message, '', {timeOut: 5000});
			            }
		             },
		        });
			}
		}
	});


	// 모든 체크박스 선택
	$('#checkAll').on('click',function(){
		if($('#checkAll').prop("checked")){
			$('#barcodeDtlTable tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",true);
			});
		}else{
			$('#barcodeDtlTable tbody tr').each(function(index, item) {	
				$(this).find('input:checkbox[name=check]').prop("checked",false);
			});
		}
	});

	//초기화 버튼 클릭시
	$('#btnReset').on('click',function() {
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#changeDate').val(serverDate);
		$('#barcodeNo').val('');
		$('#count').text('0');
	});


	
	//라인삭제 버튼 클릭시
	$('#btnDelete').on('click',function() {
		let indexList = Array();
		let rowCount =  barcodeDtlTable.data().count()-1;
		$('#barcodeDtlTable tbody tr').each(function(index, item) {
			if($(this).find('input[name=check]').is(":checked")){
				
				console.log(index);
				console.log(parseInt(rowCount)-parseInt(index));
				indexList.push(parseInt(rowCount)-parseInt(index));
			}
		})

		$('#barcodeDtlTable').DataTable().rows(indexList).remove().draw();
		$('#count').text(barcodeDtlTable.data().count());
	});


	// 창고이동 처리
	$('#btnSave').on('click',function() {
		var dataArray = new Array();		
		var check=true;  	

		if($('#changeDate').val()=="") {
			toastr.warning('이동일자를 선택해주세요.');
			$('#my-spinner').hide();
			check=false;
			return false;
		} 
		
		if(!$('input[name=check]').is(':checked')) {
			toastr.warning('창고이동할 항목을 선택해주세요.');
			$('#my-spinner').hide();
			check=false;
			return false;
		} 

		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if($(this).find("input[name=check]").is(':checked')) {
				var rowData = new Object();

				rowData.barcodeNo = barcodeDtlTable.row( this ).data().barcodeNo;
				rowData.sachulSeq = barcodeDtlTable.row( this ).data().sachulSeq;
				rowData.bongjeSeq = barcodeDtlTable.row( this ).data().bongjeSeq;
				rowData.changeQty = barcodeDtlTable.row( this ).data().changeQty;

				rowData.changeDate = $('#changeDate').val().replace(/-/g,'');
				rowData.sachulLocCd = barcodeDtlTable.row( this ).data().sachulLocCd;
				rowData.sachulLocNo = barcodeDtlTable.row( this ).data().sachulLocNo;
				rowData.bongjeLocCd = barcodeDtlTable.row( this ).data().bongjeLocCd;
				rowData.bongjeLocNo = barcodeDtlTable.row( this ).data().bongjeLocNo;

				rowData.itemGubun = barcodeDtlTable.row( this ).data().itemGubun;
				rowData.bongjeGubun = barcodeDtlTable.row( this ).data().bongjeGubun;
				rowData.bongjeImportYn = barcodeDtlTable.row( this ).data().bongjeImportYn;
				
				
				dataArray.push(rowData);
				console.log(rowData)
			}
		});
		
		if(check == true){
			$.ajax({
				url : '<c:url value="tm/barcodeUsePlaceChangeHistAdmIns"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res) {				
					if (res.result == 'ok') {
						
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeNo').val("");
						toastr.success('창고이동 되었습니다.');
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

	

	
	
</script>

</body>
</html>
