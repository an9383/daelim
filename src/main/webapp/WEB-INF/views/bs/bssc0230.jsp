<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<%@include file="../layout/body-top.jsp" %>

<!-- .page-wrapper -->
<div class="page-wrapper" id="page-wrapper">
	<!--header ============================================================== -->
	<header class="page-title-bar row">
		<nav aria-label="breadcrumb" class="breadcrumb-padding">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">영업관리</a></li>
				<li class="breadcrumb-item active">매입, 매출 집계</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<div class="row">
						<input class="form-control float-left mr-2 ml-1" style="width:10rem;" type="month" id="searchMonth">
						<button type="button" class="btn btn-primary float-left" id="btnSearch">조회</button>
						<label style="margin-left: 45rem;" class="input-label-sm">&#60;단위 : 천 원&#62;</label>
					</div>
					<div class="row" style="margin-bottom: -16px;">
						<div style="float:left;margin-top: 1px;min-width: 12%;">
							<table class="table table-bordered mt-1 ml-2" style="min-width:30%;font-size: 13px;">
								<tr class="thead-light">
									<th class="text-center" style="letter-spacing:1rem;">매 출</th>
								</tr>
							</table>
						</div>
						<div style="float:left;">
							<table class="table table-bordered mt-1" style="min-width:80%;border: 2px solid;margin-left: 39%;font-size: 13px;">
								<colgroup>
									<col width="13%">
									<col width="20%">
									<col width="13%">
									<col width="20%">
									<col width="13%">
									<col width="20%">
								</colgroup>
								<tr class="thead-light">
									<th class="text-center" style="min-width:65px;">사출</th>
									<td class="text-right" style="min-width:130px;" id="outputCost001"></td>
									<th class="text-center" style="min-width:65px;">봉제</th>
									<td class="text-right" style="min-width:130px;" id="outputCost002"></td>
									<th class="text-center" style="min-width:65px;">합계</th>
									<td class="text-right" style="min-width:130px;" bgcolor=#FFE5CC id="totalOutputCost"></td>
								</tr>
							</table>
						</div>
					</div>
					<table id="outWhsListTable" class="table table-bordered">
						<thead style="position: sticky; top: 0;" data-sot-top="2">
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="row" style="margin-bottom: -16px;">
					<div style="float:left;margin-top: 1px;min-width: 12%;font-size: 13px;">
						<table class="table table-bordered mt-1 ml-2" style="min-width:30%;">
							<tr class="thead-light">
								<th class="text-center" style="letter-spacing:1rem;">매 입</th>
							</tr>
						</table>
					</div>
					<div style="float:left;">
						<table class="table table-bordered mt-1" style="min-width:80%;border: 2px solid;margin-left: 39%;font-size: 13px;">
							<colgroup>
								<col width="13%">
								<col width="20%">
								<col width="13%">
								<col width="20%">
								<col width="13%">
								<col width="20%">
							</colgroup>
							<tr class="thead-light">
								<th class="text-center" style="min-width:65px;">사출</th>
								<td class="text-right" style="min-width:130px;" id="inputCost001"></td>
								<th class="text-center" style="min-width:65px;">봉제</th>
								<td class="text-right" style="min-width:130px;" id="inputCost002"></td>
								<th class="text-center" style="min-width:65px;">합계</th>
								<td class="text-right" style="min-width:130px;" bgcolor=#CCE5FF id="totalInputCost"></td>
							</tr>
						</table>
					</div>
				</div>
				<table id="inWhsListTable" class="table table-bordered">
					<!-- <thead style="position: sticky; top: 0;left:0;" data-sot-top="2" data-sot-left="3"> -->
					<thead>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>

		</div>
		<!-- /.left-list -->
	</div>
	<!-- /.row -->
</div>
<!-- / #main  -->

<%@include file="../layout/bottom.jsp" %>
<style>
.tr_highlight_row tr:hover {
	background-color: #ECFFB3;
}
/* 
#inWhsListTable thead {
	position: sticky; 
	left: 0;
}
 */
table#inWhsListTable thead { position: sticky; top: 0; z-index: 1;}
table#inWhsListTable th:first-child { position: sticky; left: 0; }

table#outWhsListTable thead { position: sticky; top: 0; z-index: 1;}
table#outWhsListTable th:first-child { position: sticky; left: 0; }
/* 
table#inWhsListTable th:nth-child(2) { position: sticky; left: 132px; }
table#inWhsListTable tbody th:nth-child(3){ position: sticky; left: 224px;}
table#inWhsListTable thead th:nth-child(3){ position: sticky; left: 224px;}
table#inWhsListTable tbody th:nth-child(4){ position: sticky; left:386px;}
table#inWhsListTable thead th:nth-child(4){ position: sticky; left:386px;}
 */
.th2 { position: sticky; left: 132px;}
.th3 { position: sticky; left: 224px;}
.th4 { position: sticky; left:386px;}
</style>
<script>
	let currentHref = "bssc0230";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","매입, 매출 집계"); 

	$('#searchMonth').val(moment().format('YYYY-MM'));

	//월달력 조회
	let inWhsListTable = $('#inWhsListTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '33vh',
		scrollX : true,
		pageLength : 20000,
		columns : [
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
	    	let api = this.api();
	    	$('.dataTables_scrollBody').css({
	    		'overflow-y': 'scroll'		
		    });
	    	//api.draw();
	    },
	});

	//월달력 조회
	let outWhsListTable = $('#outWhsListTable').DataTable({
		dom:  "<'row'<'col-sm-12 col-md-5'l><'col-sm-12 col-md-7'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,		
		paging : false,
		searching : false,
		info : false,
		ordering : false,
		processing : false,
		autoWidth : false,
		lengthChange : false,
		scrollY : '33vh',
		scrollX : true,
		pageLength : 20000,
		columns : [
		],
		order: [],
	    buttons: [],
	    drawCallback: function() {
	    	let api = this.api();
	    	$('.dataTables_scrollBody').css({
	    		'overflow-y': 'scroll'		
		    });
	    	//api.draw();
	    },
	});

	$('#btnSearch').on('click', function() {
		$('#my-spinner').show();
		setTimeout(function(){
			monthChange();
		},150)
		
    });	

	window.onload = function(){
		monthChange();
	}
		
	function monthChange() {
		
		//월별 공휴일 목록 조회
	    $.ajax({
			url: '<c:url value="io/dayList"/>',
            type: 'GET',
            data: {					
            	'searchMonth'	:	function(){return moment($('#searchMonth').val()).format('YYYYMM');}
            },
            async : false,
            beforeSend: function() {
                $('#my-spinner').show();
            },
            success: function (res) {
                if(res.result == 'ok') {
                    //테이블 헤드에 날짜 입력-------------------------------------------------------------------------
	                let dayList = res.dayList;
	                $('#inWhsListTable thead').empty();
	        		$('#outWhsListTable thead').empty();
	                $('#inWhsListTable tbody').empty();
	    			$('#outWhsListTable tbody').empty();
	                dateLineInsert(dayList.length);
	                for(var i=0;i<dayList.length;i++) {
		                let dayName = '';
		                if(dayList[i].weekend=='1') {
		                	dayName = '일';
		                	$('#inDay'+(i+1)).css('color','red');
		                	$('#outDay'+(i+1)).css('color','red');
						} else if(dayList[i].weekend=='2') {
							dayName = '월';
						} else if(dayList[i].weekend=='3') {
							dayName = '화';
						} else if(dayList[i].weekend=='4') {
							dayName = '수';
						} else if(dayList[i].weekend=='5') {
							dayName = '목';
						} else if(dayList[i].weekend=='6') {
							dayName = '금';
						} else {
							dayName = '토';
							$('#inDay'+(i+1)).css('color','red');
							$('#outDay'+(i+1)).css('color','red');
						}
		                let date = parseInt(dayList[i].whsDate.substring(6));
						$('#inDay'+(i+1)).text(date + '일(' + dayName + ')');
						$('#outDay'+(i+1)).text(date + '일(' + dayName + ')');
		            }
					//테이블 바디에 거래처, 메인 별 데이터 입력---------------------------------------------------------------
					let monthPurchaseDealCorpMainList = res.monthPurchaseDealCorpMainList;
					dataLineInsert(monthPurchaseDealCorpMainList, 'input', dayList.length);
					let monthPurchaseList = res.monthPurchaseList;
					dataInsert(monthPurchaseList, 'input');

					let monthSalesDealCorpMainList = res.monthSalesDealCorpMainList;
					dataLineInsert(monthSalesDealCorpMainList, 'output', dayList.length);
					let monthSalesList = res.monthSalesList;
					dataInsert(monthSalesList, 'output');
                } else {
                    toastr.error(res.message);
                }
                $('#my-spinner').hide();
            }
		});
	}

	//테이블 헤드 표시
	function dateLineInsert(value) {
		let html1 = '<tr>';
		html1 += '<th class="text-center align-middle" style="min-width:120px;" bgcolor="#CCE5FF">업체명</th>';
		html1 += '<th class="text-center align-middle th2" style="min-width:80px;" bgcolor="#CCE5FF">구분</th>';
		html1 += '<th class="text-center align-middle th3" style="min-width:150px;" bgcolor="#CCE5FF">매입품목</th>';
		html1 += '<th class="text-center align-middle th4" style="min-width:50px;" bgcolor="#CCE5FF">합계</th>';
		let html2 = '<tr>';
		html2 += '<th class="text-center align-middle" style="min-width:120px;" bgcolor="#FFE5CC">업체명</th>';
		html2 += '<th class="text-center align-middle th2" style="min-width:80px;" bgcolor="#FFE5CC">구분</th>';
		html2 += '<th class="text-center align-middle th3" style="min-width:150px;" bgcolor="#FFE5CC">매출품목</th>';
		html2 += '<th class="text-center align-middle th4" style="min-width:50px;" bgcolor="#FFE5CC">합계</th>';
		
		for(let i = 1; i<=value; i++) {
			html1 += '<th class="text-center" id="inDay'+i+'" style="min-width:50px;" bgcolor="#CCE5FF"></th>';
			html2 += '<th class="text-center" id="outDay'+i+'" style="min-width:50px;" bgcolor="#FFE5CC"></th>';
		}
		html1 += '</tr>';
		html2 += '</tr>';
		$('#inWhsListTable thead').append(html1);
		$('#outWhsListTable thead').append(html2);
		//dateLineTable.draw();
	}

	//테이블 거래처, 구분 표시
	function dataLineInsert(data, value, dateCount) {
		if(value=='input') {
			if(data.length==0) {
				let html = '<tr><th colspan="3'+data.length+'" class="text-center" style="min-width:100px;">데이터가 없습니다.</th></tr>';
				$('#inWhsListTable tbody').append(html);
			} else {
				let sumHtml = '<tr><th bgcolor="white" class="text-center" style="font-size: 12px;font-weight: 600;" colspan="3">합계</th>';
				sumHtml += '<th bgcolor="white" class="text-right th4" style="font-size: 12px;font-weight: 600;" id="totalInWhsCost"></th>';
				for(let i = 0; i<data.length; i++) {
					let html = '<tr>';
					html += '<th bgcolor="white" class="text-center" style="min-width:120px;">'+data[i].dealCorpNm+'</th>';
					if(data[i].mainGubun=='001') {
						html += '<th bgcolor="white" class="text-center th2" style="min-width:80px;max-width:80px;">사출</th>';
					} else {
						html += '<th bgcolor="white" class="text-center th2" style="min-width:80px;max-width:80px;">봉제</th>';
					}
					html += '<th bgcolor="white" class="text-center th3" id="itemCd_'+data[i].dealCorpCd+'_' +data[i].mainGubun+'" style="min-width:150px;max-width:150px;">'+data[i].itemNm+' 외</th>';
					html += '<th bgcolor="white" class="text-right th4" id="dealCorpTotalInWhsCost_'+data[i].dealCorpCd+'_' +data[i].mainGubun+'"></th>';
					for(let j = 1; j<=dateCount; j++) {
						if(i==0) {
							sumHtml += '<th bgcolor="white" class="text-right" id="totalInWhsCost'+ '_' + j + '" style="min-width:50px;font-size: 12px;font-weight: 600;"></th>';
						}
						html += '<th bgcolor="white" class="text-right" id="inWhsCost_'+data[i].dealCorpCd+'_' +data[i].mainGubun+ '_' + j + '" style="min-width:50px;"></th>';
					}
					if(i==0) {
						sumHtml += '</tr>';
						$('#inWhsListTable thead').append(sumHtml);
					}
					html += '</tr>';
					$('#inWhsListTable tbody').append(html);
				}
			}
		} else {
			if(data.length==0) {
				let html = '<tr>';
				html += '<th colspan="3'+data.length+'" class="text-center" style="min-width:100px;">데이터가 없습니다.</th></tr>';
				$('#outWhsListTable tbody').append(html);
			} else {
				let sumHtml = '<tr>';
				sumHtml += '<th bgcolor="white" class="text-center" style="font-size: 12px;font-weight: 600;" colspan="3">합계</th>';
				sumHtml += '<th bgcolor="white" class="text-right th4" style="font-size: 12px;font-weight: 600;" id="totalOutWhsCost"></th>';
				for(let i = 0; i<data.length; i++) {
					let html = '<tr>';
					html += '<th bgcolor="white" class="text-center" style="min-width:120px;">'+data[i].dealCorpNm+'</th>';
					if(data[i].mainGubun=='001') {
						html += '<th bgcolor="white" class="text-center th2" style="min-width:80px;">사출</th>';
					} else {
						html += '<th bgcolor="white" class="text-center th2" style="min-width:80px;">봉제</th>';
					}
					html += '<th bgcolor="white" class="text-center th3" id="itemCd_'+data[i].dealCorpCd+'_' +data[i].mainGubun+'" style="min-width:100px;">'+data[i].itemNm+' 외</th>';
					html += '<th bgcolor="white" class="text-right th4" id="dealCorpTotalOutWhsCost_'+data[i].dealCorpCd+'_' +data[i].mainGubun+'"></th>';
					for(let j = 1; j<=dateCount; j++) {
						if(i==0) {
							sumHtml += '<th bgcolor="white" class="text-right" id="totalOutWhsCost'+ '_' + j + '" style="min-width:50px;font-size: 12px;font-weight: 600;"></th>';
						}
						html += '<th bgcolor="white" class="text-right" id="outWhsCost_'+data[i].dealCorpCd+'_' +data[i].mainGubun+ '_' + j + '" style="min-width:50px;"></th>';
					}
					if(i==0) {
						sumHtml += '</tr>';
						$('#outWhsListTable thead').append(sumHtml);
					}
					html += '</tr>';
					$('#outWhsListTable tbody').append(html);
				}
			}
		}
	}

	//테이블 금액 표시
	function dataInsert(data, value) {
		if(value=='input') {
			let inputCost001 = 0;
			let inputCost002 = 0;
			for(let i = 0; i<data.length; i++) {
				if(data[i].mainGubun!=null) {
					let intWhsDate = parseInt(data[i].whsDate.substring(6));
					let inWhsCost = 0;
					if(data[i].inWhsCost!=null) {
						inWhsCost = parseFloat(Math.floor(data[i].inWhsCost/1000));
					}
					if(data[i].mainGubun=='001') {
						inputCost001 = inputCost001 + inWhsCost;
					}
					if(data[i].mainGubun=='002') {
						inputCost002 = inputCost002 + inWhsCost;
					}
					$('#inWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun+ '_' + intWhsDate).text(addCommas(rmDecimal(inWhsCost)));
					if($('#totalInWhsCost_'+intWhsDate).text()=='') {
						$('#totalInWhsCost_'+intWhsDate).text(addCommas(inWhsCost));
					} else {
						$('#totalInWhsCost_'+intWhsDate).text(addCommas(parseInt(uncomma($('#totalInWhsCost_'+intWhsDate).text())) + inWhsCost));
					}
					if($('#dealCorpTotalInWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text()=='') {
						$('#dealCorpTotalInWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text(addCommas(inWhsCost));
					} else {
						$('#dealCorpTotalInWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text(addCommas(parseInt(uncomma($('#dealCorpTotalInWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text())) + inWhsCost));
					}
				}
			}
			
			$('#inputCost001').text(addCommas(inputCost001));
			$('#inputCost002').text(addCommas(inputCost002));
			$('#totalInputCost').text(addCommas((inputCost001 + inputCost002)));
			$('#totalInWhsCost').text(addCommas((inputCost001 + inputCost002)));
		} else {
			let outputCost001 = 0;
			let outputCost002 = 0;
			for(let i = 0; i<data.length; i++) {
				if(data[i].mainGubun!=null) {
					let intWhsDate = parseInt(data[i].whsDate.substring(6));
					let outWhsCost = 0;
					if(data[i].outWhsCost!=null) {
						outWhsCost = parseFloat(Math.floor(data[i].outWhsCost/1000));
					}
					if(data[i].mainGubun=='001') {
						outputCost001 = outputCost001 + outWhsCost;
					}
					if(data[i].mainGubun=='002') {
						outputCost002 = outputCost002 + outWhsCost;
					}
					$('#outWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun+ '_' + intWhsDate).text(addCommas(rmDecimal(outWhsCost)));
					if($('#totalOutWhsCost_'+intWhsDate).text()=='') {
						$('#totalOutWhsCost_'+intWhsDate).text(addCommas(outWhsCost));
					} else {
						$('#totalOutWhsCost_'+intWhsDate).text(addCommas(parseInt(uncomma($('#totalOutWhsCost_'+intWhsDate).text())) + outWhsCost));
					}
					if($('#dealCorpTotalOutWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text()=='') {
						$('#dealCorpTotalOutWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text(addCommas(outWhsCost));
					} else {
						$('#dealCorpTotalOutWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text(addCommas(parseInt(uncomma($('#dealCorpTotalOutWhsCost'+'_'+data[i].dealCorpCd+'_'+data[i].mainGubun).text())) + outWhsCost));
					}
				}
			}
			$('#outputCost001').text(addCommas(outputCost001));
			$('#outputCost002').text(addCommas(outputCost002)); 
			$('#totalOutputCost').text(addCommas((outputCost001 + outputCost002)));
			$('#totalOutWhsCost').text(addCommas((outputCost001 + outputCost002)));
		}
	}
	
</script>

</body>
</html>
