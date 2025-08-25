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
				<li class="breadcrumb-item"><a href="#">구매자재관리</a></li>
				<li class="breadcrumb-item active">수불부 현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list">
				<div class="card">
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="stockPaymentStatusTable" class="table table-bordered tr_highlight_row">
							<thead class="thead-light">
								<tr>
									<th class="text-center" rowspan='2' style="min-width: 70px;" name="itemCusTh">고객사</th>
									<th class="text-center" rowspan='2' style="min-width: 50px;">차종</th>
									<th class="text-center" rowspan='2' style="min-width: 100px;">품번</th>
									<th class="text-center" rowspan='2' style="min-width: 130px;">품명</th>
									<th class="text-center" rowspan='2' style="min-width: 60px;">단가</th>
									<th class="text-center" rowspan='2' style="min-width: 60px;">기초재고</th>
									<th class="text-center" colspan='6'>1월</th>
									<th class="text-center" colspan='6'>2월</th>
									<th class="text-center" colspan='6'>3월</th>
									<th class="text-center" colspan='6'>4월</th>
									<th class="text-center" colspan='6'>5월</th>
									<th class="text-center" colspan='6'>6월</th>
									<th class="text-center" colspan='6'>7월</th>
									<th class="text-center" colspan='6'>8월</th>
									<th class="text-center" colspan='6'>9월</th>
									<th class="text-center" colspan='6'>10월</th>
									<th class="text-center" colspan='6'>11월</th>
									<th class="text-center" colspan='6'>12월</th>
									<th class="text-center" colspan='6'>합계</th>
								</tr>
								<tr>
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 1월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 2월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 3월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 4월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 5월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 6월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 7월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 8월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 9월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 10월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 11월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 12월 -->
									<th class="text-center" style="min-width: 50px;" name="spImQtyTh">생산수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">출고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th>
									<th class="text-center" style="min-width: 50px;">재고수량</th>
									<th class="text-center" style="min-width: 50px;">금액</th> <!-- 합계 -->
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

	const currentHref = "iosc0330";
	const currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');  
	$(document).attr("title", "수불부 현황");
	
	const serverDate =  "${serverDate}";
	let stockYear = serverDate.substr(0,4);
	
	let mainGubunVal = '';
	let itemGubunVal = '001';
	
	let sumImQty = 0;
	let sumImCost = 0;
	let sumExQty = 0;
	let sumExCost = 0;
	let sumStockQty = 0;
	let sumStockCost = 0;
	
	let monthStart = 1;
	let monthLast = 12;
	
	//공통코드 처리 시작
	let mainGubunArray = new Array(); //구분
	<c:forEach items="${mainGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	mainGubunArray.push(json);
	</c:forEach>
	
	let itemGubunArray = new Array(); //품목
	<c:forEach items="${itemGubun}" var="info">
	if ( "${info.baseCd}" == '001' || "${info.baseCd}" == '004' ) {
		var json = new Object();
		json.baseCd = "${info.baseCd}";
		json.baseNm = "${info.baseNm}";
		itemGubunArray.push(json);
	}
	</c:forEach>
	//공통코드 처리 종료

	//수불부 현황 테이블
	let stockPaymentStatusTable = $('#stockPaymentStatusTable').DataTable({
		 dom: "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>" +
			"<'row'<'col-sm-12'tr>>" +
			"<'row'<'col-sm-12 col-md-6'i><'col-sm-12 col-md-6'>>B",
		language : lang_kor,		
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollX : true,
		fixedColumns : {
			leftColumns: 6
		},
		scrollY : "65vh",
		ajax : {
			url : '<c:url value="tm/stockPaymentStatusList"/>',
			type : 'GET',
			data : {
				'stockYear' : function(){return stockYear;},
				'mainGubun' : function(){return mainGubunVal;},
				'itemGubun' : function(){return itemGubunVal;},
			}
		},	
		rowId : '',
		columns : [ 
			{//공급사
				data : 'itemCus',
				render : function ( data, type, row, meta ) {
					sumImQty = 0;
					sumImCost = 0;
					sumExQty = 0;
					sumExCost = 0;
					sumStockQty = 0;
					sumStockCost = 0;
					
					if ( data != null ) {
						return data;
					} else {
						return '';
					}
				},
			},
			{//차종
				data : 'itemModel'
			},
			{//품번
				data : 'itemCd'
			},
			{//품명
				data : 'itemNm'
			},
			{//단가
				render : function ( data, type, row, meta ) {
					if ( itemGubunVal == '001' ) {
						return rmDecimal(row['exportCost']);
					} else if ( itemGubunVal == '004' ) {
						return rmDecimal(row['importCost']);
					} else {
						console.log("예상치 못한 오류가 발생했습니다.");
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//기초재고
				data : 'initStockQty',
				render : function ( data, type, row, meta ) {
					if (data != null) {
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			<c:forEach begin="1" end="12" step="1" varStatus="status">
		    {//생산수량(입고수량)
				data : 'spImQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumImQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//금액
				data : 'spImQty' + ${status.index},
				render : function ( data, type, row, meta ) {
					if ( itemGubunVal == '001' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumImCost += (data * row['exportCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['exportCost']).toFixed(2));
						} else {
							return '';
						}
					} else if ( itemGubunVal == '004' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumImCost += (data * row['importCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['importCost']).toFixed(2));
						} else {
							return '';
						}
					} else {
						console.log("예상치 못한 오류가 발생했습니다.");
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//출고수량
				data : 'spExQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumExQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//금액
				data : 'spExQty' + ${status.index},
				render : function ( data, type, row, meta ) {
					if ( itemGubunVal == '001' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumExCost += (data * row['exportCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['exportCost']).toFixed(2));
						} else {
							return '';
						}
					} else if ( itemGubunVal == '004' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumExCost += (data * row['importCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['importCost']).toFixed(2));
						} else {
							return '';
						}
					} else {
						console.log("예상치 못한 오류가 발생했습니다.");
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//재고수량
				data : 'spStockQty' + ${status.index}, 
				render : function ( data, type, row, meta ) {
					if (data != null) {
						if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
							sumStockQty += data * 1;
						}
						return rmDecimal(data);
					} else {
						return '';
					}
				},
				'className' : 'text-right'
			},
			{//금액
				data : 'spStockQty' + ${status.index},
				render : function ( data, type, row, meta ) {
					if ( itemGubunVal == '001' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumStockCost += (data * row['exportCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['exportCost']).toFixed(2));
						} else {
							return '';
						}
					} else if ( itemGubunVal == '004' ) {
						if (data != null) {
							if ( monthStart <= ${status.index} && ${status.index} <= monthLast ) {
								sumStockCost += (data * row['importCost']).toFixed(2) * 1;
							}
							return rmDecimal((data * row['importCost']).toFixed(2));
						} else {
							return '';
						}
					} else {
						console.log("예상치 못한 오류가 발생했습니다.");
						return '';
					}
				},
				'className' : 'text-right'
			},
			</c:forEach>
			{//생산수량(입고수량)
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumImQty);
				},
				'className' : 'text-right'
			},
			{//금액
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumImCost);
				},
				'className' : 'text-right'
			},
			{//출고수량
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumExQty);
				},
				'className' : 'text-right'
			},
			{//금액
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumExCost);
				},
				'className' : 'text-right'
			},
			{//재고수량
				render : function ( data, type, row, meta ) {
					return rmDecimal(sumImQty - sumExQty);
				},
				'className' : 'text-right'
			},
			{//금액
				render : function ( data, type, row, meta ) {
					return rmDecimal((sumImCost - sumExCost).toFixed(2));
				},
				'className' : 'text-right'
			},
		],
	    buttons: [
	    	'copy',
	    	{
            	extend: 'excel',
//             	title: '수불부 현황',
                exportOptions: {
//                  	columns: notHiddenArray	//원하는 값 지정
                	columns: ':visible',
                },
                footer: false,
                //excelCss
			    customize: function ( xlsx ) {
			        var sheet = xlsx.xl.worksheets['sheet1.xml'];
			        
			        //열 너비 설정
			        let col = $('col', sheet);
			 		col.each(function (idx) {
			 			if (idx > 5) {
			 				$(this).attr('width', 10);
			 			}
			 	    });

			        //굵게(2), 가운데 정렬(51)
			        $('row[r=3] c', sheet).attr( 's', '51' );
			        $('row[r=4] c', sheet).attr( 's', '2' );
			        
			      	//2번째 행 데이터 삭제
					$('row[r=2] c', sheet).remove();	

			      	//병합 하고자 하는 셀 지정 
			      	var mergeCells = $('mergeCells', sheet);

				    //rowspan
					mergeCells[0].appendChild( //고객사
						createNode( sheet, 'mergeCell', { attr: {ref: 'A3:A4'} } )
					);
					mergeCells[0].appendChild( //차종
						createNode( sheet, 'mergeCell', { attr: {ref: 'B3:B4'} } )
					);
					mergeCells[0].appendChild( //품번
						createNode( sheet, 'mergeCell', { attr: {ref: 'C3:C4'} } )
					);
					mergeCells[0].appendChild( //품명
						createNode( sheet, 'mergeCell', { attr: {ref: 'D3:D4'} } )
					);
					mergeCells[0].appendChild( //단가
						createNode( sheet, 'mergeCell', { attr: {ref: 'E3:E4'} } )
					);
					mergeCells[0].appendChild( //기초재고
						createNode( sheet, 'mergeCell', { attr: {ref: 'F3:F4'} } )
					);
					//rowspan
					
					//colspan
					let colspanCheck = $('#stockDateLast').val().substr(5,2)*1 - $('#stockDateStart').val().substr(5,2)*1 + 2; //일자종료 월 - 일자시작 월 + 2 (최소 2개 행 병합)
					switch (colspanCheck){
						case 13:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'CA3:CF3'} } )
							);
						case 12:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'BU3:BZ3'} } )
							);
						case 11:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'BO3:BT3'} } )
							);
						case 10:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'BI3:BN3'} } )
							);
						case 9:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'BC3:BH3'} } )
							);
						case 8:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'AW3:BB3'} } )
							);
						case 7:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'AQ3:AV3'} } )
							);
						case 6:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'AK3:AP3'} } )
							);
						case 5:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'AE3:AJ3'} } )
							);
						case 4:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'Y3:AD3'} } )
							);
						case 3:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'S3:X3'} } )
							);
						case 2:
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'M3:R3'} } )
							);
							mergeCells[0].appendChild(
								createNode( sheet, 'mergeCell', { attr: {ref: 'G3:L3'} } )
							);
					}
					//colspan
					
					//병합 하고자 하는 셀 지정 끝
			
					mergeCells.attr( 'count', mergeCells.attr( 'count' )+1 );
	                
	                function createNode( doc, nodeName, opts ) {
						var tempNode = doc.createElement( nodeName );
	                    if ( opts ) {
							if ( opts.attr ) {
	                        	$(tempNode).attr( opts.attr );
	                      	}
	   
	                      	if ( opts.children ) {
	                        	$.each( opts.children, function ( key, value ) {
	                          		tempNode.appendChild( value );
	                        	} );
	                      	}
	   
	                      	if ( opts.text !== null && opts.text !== undefined ) {
	                        	tempNode.appendChild( doc.createTextNode( opts.text ) );
	                      	}
	                    }
	                    return tempNode;
					}
			    },
			  	//excelCssEnd

			    //헤더 추가하는 부분
			    customizeData: function(data){
				    let gapCell = new Array();	//header만큼에 공백을 추가 해주는 부분
				    for(var i=0; i<data.header.length; i++){
				    	gapCell.push(' ');
		        	}

				 	//첫 번째 tr
				 	arrayTr1 = colspanGroupArray('stockPaymentStatusTable', 0, 'th', $('#stockPaymentStatusTable thead tr').eq(0).find('th').length, 6, 'Y', '');
				 	//두 번째 tr
				 	arrayTr2 = colspanGroupArray('stockPaymentStatusTable', 1, 'th', $('#stockPaymentStatusTable thead tr').eq(1).find('th').length, 6, 'N', arrayTr1);
				 	//세 번째 tr
				   	arrayTr3 = colspanGroupArray('stockPaymentStatusTable', 2, 'th', $('#stockPaymentStatusTable thead tr').eq(1).find('th').length, 6, 'empty', arrayTr2);
					
					//첫 번째 행에 헤더 부분 header개수만큼 늘리기 끝
					arrayRow1 = alignToTableSize( data.header.length, arrayTr1 );
					//두 번째 행에 헤더 부분 header개수만큼 늘리기 끝
					arrayRow2 = alignToTableSize( data.header.length, arrayTr2 );
					//세 번째 행에 헤더 부분 이미 header 개수만큼되어있음. 
					   
				    //거꾸로 감, 제일 위에가 제일 밑으로 감
			        let desc = [
			        	arrayRow2	//두 번째 행
				        , arrayRow1	//첫 번째 행
					];

			        //data.body.unshift(data.header);	//헤더 맨 아래 부분
// 			        data.body.unshift(arrayTr3);		//헤더 맨 아래 부분 (세 번째 행)
			        for (var i = 0; i < desc.length; i++) {
			            data.body.unshift(desc[i]);
			        };
			    }
            },
	    	'print'                                
	    ],
	    columnDefs : [ 
		    
		],
	});
	
    let html1 = '<div class="row">';
    
    html1 += '<label class="input-label-sm m-1">구분</label>'; 
	html1 += '<select class="custom-select" id="mainGubunBox"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
	
	html1 += '<label class="input-label-sm m-1">품목</label>';
	html1 += '<select class="custom-select" id="itemGubunBox"></select>&nbsp;&nbsp;&nbsp;&nbsp;';
	
    html1 += '<label class="input-label-sm m-1">일자</label>';
    html1 += '<input class="form-control" type="month" id="stockDateStart" style="width:100px;"/>';
    html1 += '&nbsp; ~ &nbsp;';
    html1 += '<input class="form-control" type="month" id="stockDateLast" style="width:100px;"/>&nbsp;&nbsp;&nbsp;&nbsp;';
	
	html1 += '<button type="button" class="btn btn-primary" id="btnRetv">조회</button>'
	
    html1 += '</div>';
	
	$('#stockPaymentStatusTable_length').html(html1);
	$('#stockDateStart').val(stockYear + '-01');
	$('#stockDateLast').val(stockYear + '-12');
	selectBoxAppend(mainGubunArray, "mainGubunBox", "", "1");
	selectBoxAppend(itemGubunArray, "itemGubunBox", "", "");

	// 조회버튼
	$('#btnRetv').on('click', function() {
		if ( $('#stockDateStart').val().substr(0, 4) != $('#stockDateLast').val().substr(0, 4) ) {
			toastr.warning('같은 연도 내에서만 조회 가능합니다.');
			$('#stockDateLast').focus();
			return false;
		}
		if ( $('#stockDateLast').val().replace(/-/g, '') - $('#stockDateStart').val().replace(/-/g, '') < 0 ) {
			toastr.warning("기간을 잘못 선택하였습니다.<br>다시 선택해 주세요.");
			$('#stockDateLast').focus();
			return false;
		}
		
		stockYear =  $('#stockDateStart').val().substr(0, 4);
		mainGubunVal =  $('#mainGubunBox').val();
		itemGubunVal =  $('#itemGubunBox').val();
		
		monthStart = $('#stockDateStart').val().substr(5, 2) * 1;
		monthLast = $('#stockDateLast').val().substr(5, 2) * 1;
		
		$('#stockPaymentStatusTable').DataTable().ajax.reload(function(){
			$('#my-spinner').show(function(){
				// 1. 테이블의 모든 열을 보이게 한다.
				spsTableVisible1(true);
				spsTableVisible2(true);
				spsTableVisible3(true);
				spsTableVisible4(true);
				spsTableVisible5(true);
				spsTableVisible6(true);
				spsTableVisible7(true);
				spsTableVisible8(true);
				spsTableVisible9(true);
				spsTableVisible10(true);
				spsTableVisible11(true);
				spsTableVisible12(true);
				
				// 2. stockDateStart의 값에 따라 열을 숨김 처리한다.
				switch (monthStart){
					case 12:
						spsTableVisible11(false);
					case 11:
						spsTableVisible10(false);
					case 10:
						spsTableVisible9(false);
					case 09:
						spsTableVisible8(false);
					case 08:
						spsTableVisible7(false);
					case 07:
						spsTableVisible6(false);
					case 06:
						spsTableVisible5(false);
					case 05:
						spsTableVisible4(false);
					case 04:
						spsTableVisible3(false);
					case 03:
						spsTableVisible2(false);
					case 02:
						spsTableVisible1(false);
				}
				
				// 3. stockDateLast의 값에 따라 열을 숨김 처리한다.
				switch (monthLast){
					case 01:
						spsTableVisible2(false);
					case 02:
						spsTableVisible3(false);
					case 03:
						spsTableVisible4(false);
					case 04:
						spsTableVisible5(false);
					case 05:
						spsTableVisible6(false);
					case 06:
						spsTableVisible7(false);
					case 07:
						spsTableVisible8(false);
					case 08:
						spsTableVisible9(false);
					case 09:
						spsTableVisible10(false);
					case 10:
						spsTableVisible11(false);
					case 11:
						spsTableVisible12(false);
				}
				$('#my-spinner').hide();
			});
		});
		
		// 테이블 th 명칭 변경
		if ( itemGubunVal == '001' ) { //제품
			$('th[name=itemCusTh]').text('고객사');
			$('th[name=spImQtyTh]').text('생산수량');
		} else if ( itemGubunVal == '004' ) { //자재
			$('th[name=itemCusTh]').text('공급사');
			$('th[name=spImQtyTh]').text('입고수량');
		} else {
			console.log("예상치 못한 오류가 발생했습니다.");
		}
		
    });
	
	//테이블 행 visible 변경
	function spsTableVisible1 (flag) { // 1월
		stockPaymentStatusTable.column(6).visible(flag);
		stockPaymentStatusTable.column(7).visible(flag);
		stockPaymentStatusTable.column(8).visible(flag);
		stockPaymentStatusTable.column(9).visible(flag);
		stockPaymentStatusTable.column(10).visible(flag);
		stockPaymentStatusTable.column(11).visible(flag);
	}
	function spsTableVisible2 (flag) { // 2월
		stockPaymentStatusTable.column(12).visible(flag);
		stockPaymentStatusTable.column(13).visible(flag);
		stockPaymentStatusTable.column(14).visible(flag);
		stockPaymentStatusTable.column(15).visible(flag);
		stockPaymentStatusTable.column(16).visible(flag);
		stockPaymentStatusTable.column(17).visible(flag);
	}
	function spsTableVisible3 (flag) { // 3월
		stockPaymentStatusTable.column(18).visible(flag);
		stockPaymentStatusTable.column(19).visible(flag);
		stockPaymentStatusTable.column(20).visible(flag);
		stockPaymentStatusTable.column(21).visible(flag);
		stockPaymentStatusTable.column(22).visible(flag);
		stockPaymentStatusTable.column(23).visible(flag);
	}
	function spsTableVisible4 (flag) { // 4월
		stockPaymentStatusTable.column(24).visible(flag);
		stockPaymentStatusTable.column(25).visible(flag);
		stockPaymentStatusTable.column(26).visible(flag);
		stockPaymentStatusTable.column(27).visible(flag);
		stockPaymentStatusTable.column(28).visible(flag);
		stockPaymentStatusTable.column(29).visible(flag);
	}
	function spsTableVisible5 (flag) { // 5월
		stockPaymentStatusTable.column(30).visible(flag);
		stockPaymentStatusTable.column(31).visible(flag);
		stockPaymentStatusTable.column(32).visible(flag);
		stockPaymentStatusTable.column(33).visible(flag);
		stockPaymentStatusTable.column(34).visible(flag);
		stockPaymentStatusTable.column(35).visible(flag);
	}
	function spsTableVisible6 (flag) { // 6월
		stockPaymentStatusTable.column(36).visible(flag);
		stockPaymentStatusTable.column(37).visible(flag);
		stockPaymentStatusTable.column(38).visible(flag);
		stockPaymentStatusTable.column(39).visible(flag);
		stockPaymentStatusTable.column(40).visible(flag);
		stockPaymentStatusTable.column(41).visible(flag);
	}
	function spsTableVisible7 (flag) { // 7월
		stockPaymentStatusTable.column(42).visible(flag);
		stockPaymentStatusTable.column(43).visible(flag);
		stockPaymentStatusTable.column(44).visible(flag);
		stockPaymentStatusTable.column(45).visible(flag);
		stockPaymentStatusTable.column(46).visible(flag);
		stockPaymentStatusTable.column(47).visible(flag);
	}
	function spsTableVisible8 (flag) { // 8월
		stockPaymentStatusTable.column(48).visible(flag);
		stockPaymentStatusTable.column(49).visible(flag);
		stockPaymentStatusTable.column(50).visible(flag);
		stockPaymentStatusTable.column(51).visible(flag);
		stockPaymentStatusTable.column(52).visible(flag);
		stockPaymentStatusTable.column(53).visible(flag);
	}
	function spsTableVisible9 (flag) { // 9월
		stockPaymentStatusTable.column(54).visible(flag);
		stockPaymentStatusTable.column(55).visible(flag);
		stockPaymentStatusTable.column(56).visible(flag);
		stockPaymentStatusTable.column(57).visible(flag);
		stockPaymentStatusTable.column(58).visible(flag);
		stockPaymentStatusTable.column(59).visible(flag);
	}
	function spsTableVisible10 (flag) { // 10월
		stockPaymentStatusTable.column(60).visible(flag);
		stockPaymentStatusTable.column(61).visible(flag);
		stockPaymentStatusTable.column(62).visible(flag);
		stockPaymentStatusTable.column(63).visible(flag);
		stockPaymentStatusTable.column(64).visible(flag);
		stockPaymentStatusTable.column(65).visible(flag);
	}
	function spsTableVisible11 (flag) { // 11월
		stockPaymentStatusTable.column(66).visible(flag);
		stockPaymentStatusTable.column(67).visible(flag);
		stockPaymentStatusTable.column(68).visible(flag);
		stockPaymentStatusTable.column(69).visible(flag);
		stockPaymentStatusTable.column(70).visible(flag);
		stockPaymentStatusTable.column(71).visible(flag);
	}
	function spsTableVisible12 (flag) { // 12월
		stockPaymentStatusTable.column(72).visible(flag);
		stockPaymentStatusTable.column(73).visible(flag);
		stockPaymentStatusTable.column(74).visible(flag);
		stockPaymentStatusTable.column(75).visible(flag);
		stockPaymentStatusTable.column(76).visible(flag);
		stockPaymentStatusTable.column(77).visible(flag);
	}
	////테이블 행 visible 변경
	
	//엑셀버튼 관련 함수//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//colspan 배열에 담기
	let triggerVal;//1행(위에서부터 2번째줄)에서 다음칸으로 넘어갈 때 사용되는 변수
	let gubunVal;//1행에서 FOR문을 실행하면서 upperHead(0행의 헤더)의 rowspan이 3인경우(꽉채운경우) 올라가는 보정치만큼 뺴주기위한 변수
	let lastRowCorrection;
	function colspanGroupArray( tableName, row, tDivision, trSize, notExistColspanValue, ghostYn, rowData){
	 	//tableName: 테이블 명
	 	//row: 계산하고자 하는  행(0번 부터)
	 	//tDivision: th or td 선택자
	 	//trSize: 계산하고자하는 행 크기
	 	//notExistColspanValue: 계산하고자 하는 행에 calspan이 존재하지 않는 컬럼 개수(앞에서 값으로만 판단, 중간 값은 사용 못함)
	 	//ghostYn: rowspan으로 합쳐진 값이 존재하는지 여부( Y, N ) / 추가로 empty는 colspan, rowspan없이 쭉 이어진 값 
		//berowData : 이전행 데이터 
		let berowData = rowData;
	 	let dt;
	 	let temporaryArray = new Array();
	 	let exceptionArray = new Array();	//empty에서만 사용
  		let temporaryObj = new Object();
    	let temporaryColspanSum = 0; 
    	triggerVal = notExistColspanValue;
    	gubunVal = 0;
    	lastRowCorrection = 0;
    	let thirdIdx = 0;
	 	if( ghostYn == 'Y'){
	 		for(var i = 0; i < trSize; i++) {
	 			dt = $('#'+tableName+' thead tr').eq(row).find( tDivision ).eq(i);
		   	    temporaryObj = new Object();
		   	    if( i < notExistColspanValue ){
		   	        temporaryObj.name = dt.text();
		   	        temporaryObj.colspan = i;
		   	     temporaryObj.rowspan = dt.attr('rowspan');
		   	        colspanSum = i;
		   	    } else {	
		   	        if( i == notExistColspanValue ) {
		   	            colspanSum += 1;
		   	        }
		   	        temporaryObj.name = dt.text();
		   	        temporaryObj.colspan = colspanSum;
					//if(dt.attr('rowspan') != '' && dt.attr('rowspan') != undefined){
						temporaryObj.rowspan = dt.attr('rowspan');
					//}
		   	     	temporaryObj.colspan = colspanSum;
		   	        
		   	        colspanSum += parseInt(  dt.attr('colspan') );
		   	    }
		   	 temporaryArray.push(temporaryObj);
		   	}
	 		return temporaryArray;
		} else if( ghostYn == 'N' ) {
			//console.log("for문 반복 횟수 : "+ ( trSize + notExistColspanValue ));
			for(var i=0; i <= ( trSize + notExistColspanValue ) + gubunVal ; i++) {
				
				if( triggerVal == berowData.length){
					triggerVal--;
				}
				//console.log("트리거값:"+triggerVal);
	 			dt = $('#'+tableName+' thead tr').eq(row).find( tDivision ).eq( (i-notExistColspanValue - gubunVal )  );
		   	    temporaryObj = new Object();
		   	    if(!dt.hasClass('d-none')){			   	    
			   	    if( dt.find('colspan') != 1 ) {

			   	    	if( i < notExistColspanValue ){
				   	        temporaryObj.name = '';
				   	        temporaryObj.colspan = i;

				   	        temporaryObj.realColspan = dt.attr('colspan');
				   	   	 	temporaryObj.realRowspan = dt.attr('rowspan');
				   	        colspanSum = i;
				   	    } else {
				   	        if( i == notExistColspanValue ) {
				   	            colspanSum += 1;
				   	        }
							var colVal;
							if ( triggerVal+1 < berowData.length){
								colVal = berowData[triggerVal+1].colspan-1;
							} else if ( triggerVal+1 == berowData.length ) {
								colVal = berowData[triggerVal].colspan-1;
				   	    	} else {
								toast.error("시스템 오류가 발생하였습니다. 에러코드 : ExcelGost-002")
					   	    }
							if( colVal > colspanSum){ //현재 열과 다음 열의 차이가 현재 그리고있는 열보다 작은 경우 -> 이전행의 헤더의 소분류를 그리고 있는중  									
							   	    temporaryObj.name = dt.text();
						   	        temporaryObj.colspan = colspanSum;	
						   	     	temporaryObj.upperHead = berowData[triggerVal].name;
						   	        temporaryObj.realColspan = dt.attr('colspan');
						   	   	 	temporaryObj.realRowspan = dt.attr('rowspan');
						   	    	colspanSum += parseInt(  dt.attr('colspan') );
							} else{ 
								if( berowData[triggerVal].rowspan < $('#'+tableName+' thead tr').length){									
									temporaryObj.name = dt.text();
							   	    temporaryObj.colspan = colspanSum;	
						   	     	temporaryObj.upperHead = berowData[triggerVal].name;
						   	        temporaryObj.realColspan = dt.attr('colspan');
						   	   	 	temporaryObj.realRowspan = dt.attr('rowspan');
							   		colspanSum += parseInt(  dt.attr('colspan') );
							   		triggerVal++;
							   		if( colspanSum == colVal){
							   			triggerVal++;
								   	}
								} else {
									temporaryObj.name = '';
									temporaryObj.rowspan = 3;
								    temporaryObj.colspan = colspanSum;
						   	     	temporaryObj.upperHead = berowData[triggerVal].name;
						   	        temporaryObj.realColspan = dt.attr('colspan');
						   	   	 	temporaryObj.realRowspan = dt.attr('rowspan');
									gubunVal++;
									triggerVal++;
									colspanSum++;
								}
		  
							}
				   	    }
					} else {
						temporaryObj.name = dt.text();
			   	        temporaryObj.colspan = colspanSum;
			   	        colspanSum += parseInt(  dt.attr('colspan') );
			   	        
					}
					//console.log(temporaryObj.name);
					temporaryArray.push(temporaryObj);
		   	    }
		   	}
		   	// console.log("구분값 : "+gubunVal);
			return temporaryArray;
		} else if( ghostYn == 'empty' ) {
			for(var i=0; i < /*( trSize + notExistColspanValue ) */berowData.length; i++) {
				dt = $('#'+tableName+' thead tr').eq( row ).find( tDivision ).eq( /* (i-notExistColspanValue) */thirdIdx  );
				if( i < notExistColspanValue ){
					exceptionArray[i+lastRowCorrection] = '';
			    } else if ( berowData[i].realRowspan == 1 && berowData[i].realColspan != 1 && berowData[i].rowspan != 3) {
					for( var q=0; q<berowData[i].realColspan;q++){
						dt = $('#'+tableName+' thead tr').eq( row ).find( tDivision ).eq( thirdIdx );
						exceptionArray[i+q+lastRowCorrection] = dt.text();
						//console.log("추가된 문구 : "+dt.text()+" 추가된 I+Q+보정치 : "+(i+q+lastRowCorrection));
						thirdIdx++;
					}	
					lastRowCorrection+=berowData[i].realColspan-1;		
			    	
			    } else{
			    	exceptionArray[i+lastRowCorrection] = '';
				}
			}
			return exceptionArray;
		} else {
			toastr.error("시스템 오류가 발생했습니다. - excelGhostError-A001");
			return false;
		}
	}
	
	//가공하고자 하는 행에 헤더 부분 header개수만큼 늘리기 끝
	function alignToTableSize( allDatalength, receivedArray ){
		//colspan된 배열을 가지고, 만들고자하는 길이 만클 데이터를 가공하는 곳
		//allDatalength: 전체 데이터 길이(이 개수만큼 배열이 생성됨)
		//receivedArray: 가공하고자하는 배열 값
		
		let temporaryIsCheck = true;	// brek 역할
		let temporaryArrayRow = new Array();
		
		for(var i=0; i<allDatalength; i++){
			temporaryIsCheck = true;
			
		    for(var j=0; j<receivedArray.length; j++){
		        switch (i){
		        case receivedArray[j].colspan:
		        	temporaryArrayRow.push(receivedArray[j].name);
		        temporaryIsCheck = false;
		            break;
		        default:
		            break;
		        }
		        
		    }
		    if(temporaryIsCheck){
		    	temporaryArrayRow.push(' ');
		    }
		}
		return temporaryArrayRow;
	}
	/////////////////////////////////////////////////////////////////////////////////////////////////////
	
</script>

</body>
</html>
