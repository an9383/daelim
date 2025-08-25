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
				<li class="breadcrumb-item"><a href="#">경영정보관리</a></li>
				<li class="breadcrumb-item active">매입현황</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar-fix" id="left-list" style="width: 100%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<div class="table-responsive" >
						<table id="listTable" class="table table-bordered" style="width:100%">
							<colgroup>
								<col width="9%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th class="text-center align-middle" style="background: #e9f4ff; font-size: 0.8rem;">총매입</th>
									<th class="text-center align-middle purchase1" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase2" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase3" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase4" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase5" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase6" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase7" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase8" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase9" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase10" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase11" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchase12" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
									<th class="text-center align-middle purchaseTotal" style="background: #e9f4ff; color: blue; font-size: 0.8rem;"></th>
								</tr>
								<tr>
									<th class="text-center align-middle">거래처</th>
									<th class="text-center align-middle">1월</th>
									<th class="text-center align-middle">2월</th>
									<th class="text-center align-middle">3월</th>
									<th class="text-center align-middle">4월</th>
									<th class="text-center align-middle">5월</th>
									<th class="text-center align-middle">6월</th>
									<th class="text-center align-middle">7월</th>
									<th class="text-center align-middle">8월</th>
									<th class="text-center align-middle">9월</th>
									<th class="text-center align-middle">10월</th>
									<th class="text-center align-middle">11월</th>
									<th class="text-center align-middle">12월</th>
									<th class="text-center align-middle">합계</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="../layout/bottom.jsp" %>

<style>
.column-dealCorpNm {
	color: #363642;
	background-color: #f2f2f2;
}
</style>
<script>
	let currentHref = "bssc0234";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass('has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title", "매입현황"); 
	
	let serverDateFrom = "${serverDateFrom}";
	let serverDateTo = "${serverDateTo}";
	let serverMonthTo = moment(serverDateTo).format('YYYY');

	//공통코드 처리 시작
	let itemGubunCode = new Array(); //품목구분
	<c:forEach items="${itemGubun}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	itemGubunCode.push(json1);
	</c:forEach>

	let workEmerYnCode = new Array(); //긴급여부
	<c:forEach items="${workEmerYn}" var="info">
	var json1 = new Object();
	json1.baseCd = "${info.baseCd}";
	json1.baseNm = "${info.baseNm}";
	workEmerYnCode.push(json1);
	</c:forEach>
	//공통코드 처리 종료  
	
	//작업지시 생성 조회
	let listTable = $('#listTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5 mt-3 text-left'B><'col-sm-12 col-md-2 mt-2 text-center'><'col-sm-12 col-md-5 text-right'i>>",
		language : lang_kor,
		destroy : true,
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		pageLength : -1,
		scrollY: "67vh",
		ajax : {
			url : '<c:url value="io/dealCorpMatrlInList"/>',
			type : 'GET',
			data : {
				'inMonData' : function(){return serverMonthTo.replace(/-/g,'')},
			},
		},
		rowId : '',
		columns : [
			{//거래처
				data : 'dealCorpNm', className: 'text-center column-dealCorpNm',
				render : function(data,type,row,meta){
					if(data!=null){
						return data;
					}else{
						return '';
					}
				}
			},
			{//1월
				data : 'inMon01', "className": "text-center inMon01",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//2월
				data : 'inMon02', "className": "text-center inMon02",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//3월
				data : 'inMon03', "className": "text-center inMon03",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//4월
				data : 'inMon04', "className": "text-center inMon04",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//5월
				data : 'inMon05', "className": "text-center inMon05",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//6월
				data : 'inMon06', "className": "text-center inMon06",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//7월
				data : 'inMon07', "className": "text-center inMon07",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//8월
				data : 'inMon08', "className": "text-center inMon08",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//9월
				data : 'inMon09', "className": "text-center inMon09",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//10월
				data : 'inMon10', "className": "text-center inMon10",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//11월
				data : 'inMon11', "className": "text-center inMon11",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//12월
				data : 'inMon12', "className": "text-center inMon12",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			{//합계
				data : 'inSum', "className": "text-center inSum",
				render : function(data,type,row,meta){
					if(data!=null){
						return rmDecimal(data);
					}else{
						return '-';
					}
				}
			},
			
		],
		columnDefs: [],
	    drawCallback: function() {
	    	let api = this.api();
			let data = api.data();
			let head = $('.dataTables_scrollHead');
			let dataArray = api.rows({page:'current'}).data().toArray();
			
			//월별 총매출 계산
			let purchase = Array(12).fill('-'); // purchase1, purchase2, ..., purchase12

		    let allValuesAreDash = true; // 빈 값인지 확인하는 변수

		    for (let i = 0; i < dataArray.length; i++) {
		        for (let j = 0; j < 12; j++) {
		            const columnName = `inMon\${String(j + 1).padStart(2, '0')}`;
		            const value = $('#listTable tbody').find('tr').eq(i).find('td').filter(`.\${columnName}`).text().trim();
		            if (value !== '-') {
		                purchase[j] = (purchase[j] === '-' ? 0 : purchase[j]) + parseInt(value.replace(/,/g, ''));
		                allValuesAreDash = false;
		            }
		        }
		    }

		    purchase.forEach((value, index) => {
		        head.find(`.purchase\${index + 1}`).text(value === '-' ? '-' : rmDecimal(value));
		    });

		    const purchaseTotal = allValuesAreDash ? '-' : purchase.reduce((total, value) => (value === '-' ? total : total + value), 0);
		    head.find('.purchaseTotal').text(purchaseTotal === '-' ? '-' : rmDecimal(purchaseTotal));
		},
		order: [
	    ],
	    buttons: [
	    	'copy', 'excel', 'print'                                
	    ],
	   
	});
	
	//메인 테이블_length 변경
	let html1 = '';
	html1 +=  '<div class="row">&nbsp;&nbsp;';
	html1 += '<select class="custom-select" id="serverMonthTo" style="max-width:130px;"></select>&nbsp;&nbsp;';
	html1 += '<button type="button" class="btn btn-daerim" style="color: white; background: #00066a;" id="btnRetv">현황조회</button>';
	html1 += '</div>';

	$('#listTable_length').html(html1);
	// select box 년도 표시
	setDateBox('serverMonthTo');
    
	//조회 선택시
	$('#btnRetv').on('click', function() {
		serverMonthTo =  $('#serverMonthTo').val().replace(/-/g,'');
		
		$('#listTable').DataTable().ajax.reload(function(){});
    });


	function setDateBox(id){
	   let dt = new Date();
	   let com_year = dt.getFullYear();
	   // 발행 뿌려주기
	   $("#"+id+"").append("<option value=''>년도</option>");
	   // 올해 기준으로 -100년부터 +100년을 보여준다.
	   for(var y = (com_year-3); y <= (com_year+3); y++){
		   $("#"+id+"").append('<option value="'+ y +'"'+(y==com_year?'selected':'')+'>'+ y + '년도' +'</option>');
	   }
	}
	
</script>

</body>
</html>
