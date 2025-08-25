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
		<a href="/tmsc0100" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0380"><p class="mo_main_title">현품표 조회</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox mb-0">
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">LOT NO</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="scanBarcodeNo" inputmode="none" placeholder="스캐너로 입력">
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">품명</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="itemNm" inputmode="none" disabled>
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">현재고수량</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="tmQty" inputmode="none" style="text-align: right" disabled>
			</div>
		</div>
	</div>
	<!--==end==-sortbox-->
	<main style="height: calc(100vh - 50px);overflow:auto;">
		<div class="container-fluid bg_wh" id="main" style="height: 100%;display: flex;flex-direction: column;">
			<!-- .table-responsive -->
			<div class="card" style="OVERFLOW-Y:auto; width:100%;">
				<div class="table-responsive">
					<table id="barcodeDtlTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th class="text-center text-rowrap">No.</th>
								<th class="text-center text-rowrap">구분</th>
								<th class="text-center text-rowrap">일자</th>
								<th class="text-center text-rowrap">수량</th>
								<th class="text-center text-rowrap">창고</th>
							</tr>
						</thead>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!--==end==card-->
		</div>
	</main>
	<footer class="p-2" style="margin-top: auto;">
			<div class="mo_sumbox">
				<button type="button" class="btn btn-warning float-left" id="btnKeyboard">자판 Off</button>
				<div class="row float-right">
					<div class="mo_roll mr-4">
						<!-- <label>합계</label><span class="mo_sum_font_lg" id="rowCount">0</span> <label>Roll</label> -->
					</div>
					<div class="mo_kg">
						<span class="mo_sum_font_lg" id="countBarcodeDtlTable">0</span> <label>개수</label>
					</div>
				</div>
			</div>
	</footer>
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>
<%@include file="../layout/bottom.jsp" %>

<script>
	$(document).attr("title", "현품표 조회");
	const MENU_AUTH = 'tmsc0380';

	const SERVER_DATE = "${serverDate}";
	const USER_NUMBER = "${userNumber}";
	const USER_NM = "${userNm}";
	
	let barcodeNoVal = ' '; //처음에 테이블 데이터 조회 안되도록 구현

	//바코드 목록조회
	let barcodeDtlTable = $('#barcodeDtlTable').DataTable({
		language : lang_kor,
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : true,
		autoWidth : false,
		scrollX : false,
		lengthChange : false,
		scrollY : "50vh",
		ajax : {
			url : '<c:url value="tm/stockPaymentAdmRead"/>',
			type : 'GET',
			data : {
				'barcodeNo' 		: function(){ return barcodeNoVal; },
				'setOrderRegDate'	: function(){ return 'Y'; },
			},
		},
		columns : [
			{//No.
				render: function(data, type, row, meta) {
					return meta.row + 1;
				}, 'className' : 'text-center text-nowrap'
			},
			{
				data : 'spGubunNm', 'className' : 'text-center text-nowrap',
				render: function(data, type, row, meta){
					if ( data != null && data === '입고' ) {
						return `<span style="color: blue">\${data}</span>`;
					} else if ( data != null && data === '출고' ) {
						return `<span style="color: red">\${data}</span>`;
					} else {
						return '';
					}
				}
			}, //구분
			{ //일자
				data : 'spDate', 'className' : 'text-center text-nowrap',
				render: function (data, type, row, meta) {
					return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
				}
			},
			{ //수량
				data : 'spQty', 'className' : 'text-right text-nowrap',
				render: function (data, type, row, meta) {
					return data != null && data != '' ? rmDecimal(data) : '';
				}
			},
			{ data : 'locationCdNm', 'className' : 'text-center text-nowrap' }, //창고
		 ],
		order : [],
	});
	
	// 바코드입력
	$('#scanBarcodeNo').keypress(function(e){
		if (e.keyCode == 13) {
			let check = true;
			if ( !$.trim($('#scanBarcodeNo').val()) ) {
				toastr.warning('바코드를 스캔해주세요.');
				$('#scanBarcodeNo').focus();
				$('#scanBarcodeNo').val().select();
				check = false;
				return false;
			}

			if (check) {
				barcodeNoVal = $('#scanBarcodeNo').val();
				$('#barcodeDtlTable').DataTable().ajax.reload(function(){
					if ( barcodeDtlTable.data().length > 0 ) {
						$('#itemNm').val(barcodeDtlTable.row(0).data().itemNm != null ? barcodeDtlTable.row(0).data().itemNm : '');
						toastr.success("바코드가 스캔되었습니다.");
					} else {
						$('#tmQty').val('');
						$('#itemNm').val('');
						toastr.warning("등록되지 않은 바코드입니다.");
					}
				});
			}
		}
	});
	
	// 테이블이 reload 될 때마다 이벤트 핸들러 함수 실행
	barcodeDtlTable.on('draw', function() {
		if ( barcodeDtlTable.row().length > 0 ) {
			let sumSpQty = 0;
			
			//변수에 barcodeDtlTable의 각 행의 spGubun 값이 '001'이면 spQty 값을 더하고 spGubun 값이 '002'이면 spQty 값을 뺀다.
			barcodeDtlTable.rows().every(function(rowIdx, tableLoop, rowLoop) {
				let data = this.data();
			    if (data.spGubun === '001') {
			    	sumSpQty += Number(data.spQty);
			    } else if (data.spGubun === '002') {
			    	sumSpQty -= Number(data.spQty);
			    }
			});
			
			$('#tmQty').val(sumSpQty >= 0 ? rmDecimal(sumSpQty) : 0);
		}
	});
	
	// barcodeDtlTable 테이블 행 카운트
	barcodeDtlTable.on('draw.dt', function() {
		let info = barcodeDtlTable.page.info();
		$('#countBarcodeDtlTable').text(info.recordsTotal);
	});
	
  	//모바일 자판 On/Off
	$('#btnKeyboard').on('click', function() {
		const inputmode = $('#scanBarcodeNo').attr('inputmode');
		if ( inputmode == 'none') {
			$('#btnKeyboard').text("자판 On");
			$('#scanBarcodeNo').attr('inputmode', 'text');
		} else if ( inputmode == 'text' ) {
			$('#btnKeyboard').text("자판 Off");
			$('#scanBarcodeNo').attr('inputmode', 'none');
		}
	});

</script>

</body>
</html>
