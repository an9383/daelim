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
				<li class="breadcrumb-item"><a href="#">경영정보관리</a></li>
				<li class="breadcrumb-item active">매출현황</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list" id="left-list" style="overflow-y: hidden;">
				<div class="card">
					<div class="row">
						<select id="searchYear" class="select custom-select" style="max-width: 70px;"></select>
						<button type="button" class="btn float-left ml-1" style="color: white; background: #00066a;" id="btnSearch">현황조회</button>
						<label style="margin-left: auto;" class="input-label-sm">&#60;단위 : 천 원&#62;</label>
					</div>
					<div class="row" style="height: 340px;margin-top: 10px;">
						<div class="d-flex align-items-center justify-content-center" style="flex: 0 0 auto;height:100%;width:100%;">
							<div style="position:relative;height:100%;width:100%;" id="monthSalesDiv">
								<canvas id="monthSales"></canvas>
							</div>
						</div>
					</div>
					<div class="row" style="margin-bottom: -16px;">
						<div style="float:left;margin-top: 1px;min-width: 12%;">
							<table class="table table-bordered mt-1 ml-2" style="min-width:30%;font-size: 13px;visibility: hidden;"> <!-- 단위 위치 변경됨 2023.10.11 -->
								<tr class="thead-light">
									<th class="text-center" style="letter-spacing:1rem;">단위 : 천 원</th>
								</tr>
							</table>
						</div>
						<%-- <div style="float:left;">
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
									<td class="text-right" style="min-width:130px;" id="outputCost001">0</td>
									<th class="text-center" style="min-width:65px;">봉제</th>
									<td class="text-right" style="min-width:130px;" id="outputCost002">0</td>
									<th class="text-center" style="min-width:65px;">합계</th>
									<td class="text-right" style="min-width:130px;" bgcolor=#FFE5CC id="totalOutputCost">0</td>
								</tr>
							</table>
						</div> --%>
					</div>
					<table id="outWhsListTable" class="table table-bordered">
						<thead>
							<tr>
								<th class="text-center align-middle" style="min-width:120px;background-color:#ffe5cc;color:black; font-size: 0.8rem;">총매출</th>
								<th class="text-center align-middle sales1" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales2" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales3" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales4" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales5" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales6" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales7" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales8" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales9" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales10" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales11" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle sales12" style="min-width:50px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
								<th class="text-center align-middle salesTotal" style="min-width:80px;background-color:#ffe5cc;color:black; font-size: 0.8rem;"></th>
							</tr>
							<tr style="background-color: #efefef;">
								<th class="text-center align-middle" style="min-width:120px;">납품처</th>
								<th class="text-center align-middle" style="min-width:50px;">1월</th>
								<th class="text-center align-middle" style="min-width:50px;">2월</th>
								<th class="text-center align-middle" style="min-width:50px;">3월</th>
								<th class="text-center align-middle" style="min-width:50px;">4월</th>
								<th class="text-center align-middle" style="min-width:50px;">5월</th>
								<th class="text-center align-middle" style="min-width:50px;">6월</th>
								<th class="text-center align-middle" style="min-width:50px;">7월</th>
								<th class="text-center align-middle" style="min-width:50px;">8월</th>
								<th class="text-center align-middle" style="min-width:50px;">9월</th>
								<th class="text-center align-middle" style="min-width:50px;">10월</th>
								<th class="text-center align-middle" style="min-width:50px;">11월</th>
								<th class="text-center align-middle" style="min-width:50px;">12월</th>
								<th class="text-center align-middle" style="min-width:80px;">합계</th>
							</tr>
						</thead>
					</table>
				</div>

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
</style>
<script>
	let currentHref = "bssc0232";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "매출현황"); 

	let dt = new Date();
	let dtYear = dt.getFullYear();
	$(document).ready(function(){
		$('#searchYear').append("<option value=''>년도</option>");
		for ( var x = 2022; x<=dtYear+50; x++ ) {
			$('#searchYear').append('<option value="' + x + '"' + (x==dtYear?'selected':'')+'>'+ x + '년도'+'</option>');
		}
		makeGraph($('#searchYear').val());
		outWhsListTable.ajax.reload();
	})

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
		scrollY : '28vh',
		scrollX : true,
		pageLength : -1,	
		scrollCollapse: true,
		ajax : {
			url : '<c:url value="io/dealCorpMonthSalesList"/>',
			type : 'GET',
			data : {
				'outputDate' : function(){return $('#searchYear').val();}
			}
		}, 
		rowId : '',
		columns : [
			{ //납품처
				data : 'dealCorpNm', className : 'text-center'
			},
			{ //1월
				data : 'inMon01', className : 'text-center inMon01',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //2월
				data : 'inMon02', className : 'text-center inMon02',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //3월
				data : 'inMon03', className : 'text-center inMon03',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //4월
				data : 'inMon04', className : 'text-center inMon04',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //5월
				data : 'inMon05', className : 'text-center inMon05',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //6월
				data : 'inMon06', className : 'text-center inMon06',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //7월
				data : 'inMon07', className : 'text-center inMon07',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //8월
				data : 'inMon08', className : 'text-center inMon08',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //9월
				data : 'inMon09', className : 'text-center inMon09',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //10월
				data : 'inMon10', className : 'text-center inMon10',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //11월
				data : 'inMon11', className : 'text-center inMon11',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //12월
				data : 'inMon12', className : 'text-center inMon12',
				render : function(data, type, row, meta) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					}else{
						return '-';
					}
				}
			},
			{ //합계
				data : 'inSum', className : 'text-center inSum',
				render : function(data) {
					if(data!=null){
						return rmDecimal(parseInt(data/1000));
					} else {
						return '-';
					}
				}
			},
		],
		order: [],
		buttons: [
			'copy', 'excel', 'print'
		],
	    drawCallback: function() {
			$('#outWhsListTable tbody').css('font-weight','bold');

			let api = this.api();
			let data = api.data();
			let head = $('.dataTables_scrollHead');
			let dataArray = api.rows({page:'current'}).data().toArray();
			
			//월별 총매출 계산
			let sales = Array(12).fill('-'); // sales1, sales2, ..., sales12

		    let allValuesAreDash = true; // 빈 값인지 확인하는 변수

		    for (let i = 0; i < dataArray.length; i++) {
		        for (let j = 0; j < 12; j++) {
		            const columnName = `inMon\${String(j + 1).padStart(2, '0')}`;
		            const value = $('#outWhsListTable tbody').find('tr').eq(i).find('td').filter(`.\${columnName}`).text().trim();
		            if (value !== '-') {
		                sales[j] = (sales[j] === '-' ? 0 : sales[j]) + parseInt(value.replace(/,/g, ''));
		                allValuesAreDash = false;
		            }
		        }
		    }

		    sales.forEach((value, index) => {
		        head.find(`.sales\${index + 1}`).text(value === '-' ? '-' : rmDecimal(value));
		    });

		    const salesTotal = allValuesAreDash ? '-' : sales.reduce((total, value) => (value === '-' ? total : total + value), 0);
		    head.find('.salesTotal').text(salesTotal === '-' ? '-' : rmDecimal(salesTotal));
	    }
	});
	
	//그래프 생성
	function makeGraph(thisYear){
		let monthSalesData = new Array();

		$.ajax({
			url : '<c:url value="io/dealCorpMonthSalesList"/>',
			type : 'GET',
			async : false,
			data : {
				'outputDate' : function() {return thisYear;}
			},
			success : function(res) {
				let data = res.data;
				
				let sales1 = 0;
				let sales2 = 0;
				let sales3 = 0;
				let sales4 = 0;
				let sales5 = 0;
				let sales6 = 0;
				let sales7 = 0;
				let sales8 = 0;
				let sales9 = 0;
				let sales10 = 0;
				let sales11 = 0;
				let sales12 = 0;
				let salesTotal = 0;

				let tempArr = new Array(13).fill(0);

				for(var i = 0; i<data.length;i++){
					sales1 += parseInt(data[i].inMon01/1000);
					sales2 += parseInt(data[i].inMon02/1000);
					sales3 += parseInt(data[i].inMon03/1000);
					sales4 += parseInt(data[i].inMon04/1000);
					sales5 += parseInt(data[i].inMon05/1000);
					sales6 += parseInt(data[i].inMon06/1000);
					sales7 += parseInt(data[i].inMon07/1000);
					sales8 += parseInt(data[i].inMon08/1000);
					sales9 += parseInt(data[i].inMon09/1000);
					sales10 += parseInt(data[i].inMon10/1000);
					sales11 += parseInt(data[i].inMon11/1000);
					sales12 += parseInt(data[i].inMon12/1000);
				}
				salesTotal = sales1 + sales2 + sales3 + sales4 + sales5 + sales6 + sales7 + sales8 
				+ sales9 + sales10 + sales11 + sales12;

// 				tempArr[0] = salesTotal; 그래프에서 합계 안보이도록 구현 - 2023.10.10
				tempArr[0] = sales1;
				tempArr[1] = sales2;
				tempArr[2] = sales3;
				tempArr[3] = sales4;
				tempArr[4] = sales5;
				tempArr[5] = sales6;
				tempArr[6] = sales7;
				tempArr[7] = sales8;
				tempArr[8] = sales9;
				tempArr[9] = sales10;
				tempArr[10] = sales11;
				tempArr[11] = sales12;

				monthSalesData[0] = tempArr;
			}
		});

		makeMonthSales(monthSalesData);
	}
	
	//매출현황
	function makeMonthSales(monthSalesData) {
		if (window.barChart) { //이미 차트가 존재하면 제거
		    window.barChart.destroy();
		}
		
	    const ctx = document.getElementById('monthSales');
	    window.barChart = new Chart(ctx, {
	        type: 'bar', // 막대그래프 타입
	        data: {
	            labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'], // monthSalesData[0] == 1월, monthSalesData[1] == 2월...
	            datasets: [{
	                label: '매출금액',
	                backgroundColor: '#00066a',
	                borderColor: '#00066a',
	                data: monthSalesData[0],
	                borderWidth: 4,
	            }]
	        },
	        options: {
	            responsive: true,
	            scales: {
	            	yAxes: [{ //y열 설정
	                    ticks: {
	                        beginAtZero: true,
	                        callback: function(value, index, values) {
	                            return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); //천단위 표시
	                        }
	                    }
	                }]
	            },
	            maintainAspectRatio: false,
	            plugins: {
		            autocolors: false,
	                legend: {
	                    display: false,
	                    position : 'top',
	                    labels: {
							font:{
								size: 20
							}
		                }
	                },
					datalabels : {
						display : true,
						anchor : 'end', 
						align : 'top',
						formatter: function (value, context) {
							return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "천원"; 
						},
		            }
	            },
	            tooltips: {
	                callbacks: {
	                    label: function(tooltipItem, data) { //그래프 콤마
	                        return tooltipItem.yLabel.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "천원"; 
	                	} 
	     	    	},
	     		},
	        }
	    });
	}


	//조회버튼 클릭
	$('#btnSearch').on("click", function(){
		outWhsListTable.ajax.reload();
		makeGraph($('#searchYear').val());
	})
	 
</script>

</body>
</html>
