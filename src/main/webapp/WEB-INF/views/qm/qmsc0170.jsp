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
				<li class="breadcrumb-item"><a href="#">부적합관리</a></li>
				<li class="breadcrumb-item active">사출 부적합관리대장</li>
			</ol>
		</nav>
	</header>

	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="container-fluid overflow-hidden" id="main">
	
				<div class="row">
					<div class="p-0" style="width: 80%;">
						<div class="row p-0 mb-2" style="height:86vh;">
							<div class="col-md-12 p-1" style="background-color:#ffffff;">
								<table id="unfitAdmTable" class="table table-bordered tr_highlight_row">
									<colgroup>
										<col width="8%">
										<col width="10%">
										<col width="12%">
										<col width="12%">
										<col width="12%">
										<col width="10%">
										<col width="8%">
										<col width="8%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>발생일자</th>
											<th>차종</th>
											<th>부품명</th>
											<th>품번</th>
											<th id="lotNoTh">불량LOTNO</th>
											<th>불량내역</th>
											<th class="text-center">불량수</th>
											<th>부적합처리</th>
											<th>폐기일자</th>
											<th>비고</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
					<div class="p-0 pl-2" style="width: 20%;">
						<div class="row p-0" style="height:86vh;">
							<div class="col-md-12 p-1" style="background-color:#ffffff;">
								<table id="faultyListTable" class="table table-bordered" >
									<colgroup>
										<col width="70%">
										<col width="30%">
									</colgroup>
									<thead class="thead-light">
										<tr>
											<th>불량유형 명</th>
											<th class="text-center">TOTAL</th>
										</tr>
									</thead>
								</table>
								<table class="table table-bordered mt-4">
									<colgroup>
										<col width="50%">
										<col width="50%">
									</colgroup>
									<tbody>
										<tr style="font-size: 1.3rem;background: #346cb0;color: white;">
											<th class="text-center"><b>TOTAL</b></th>
											<th class="text-right" id="totalFaulty" ></th>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<style>
.td_top{
	vertical-align: top!important;
}
.tr_highlight_row tr:hover {
	background-color: #ECFFB3 !important;
}
</style>
<%@include file="../layout/bottom.jsp" %>
<script>
	let currentHref = "qmsc0170";
	let currentPage = $('.' + currentHref).attr('id');
	
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');    
	$(document).attr("title","사출 부적합관리대장"); 
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function(e){
		activeTab = $(e.target).text();
		console.log(activeTab);
	});
	
	let serverDate = "${serverDateTo}"
	
	let serverDateFrom =  moment().subtract('1','M').format('YYYY-MM-DD');
	let serverDateTo =  moment().format('YYYY-MM-DD');
	
	let unfitNo = '';
	let unfitGubun = '002';
	let unfitLot = '';
	let unfitIndex = '';
	let faultyCd = '';
	
	//공통코드 시작
	let unfitGubunArray = new Array();
	<c:forEach items="${unfitGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitGubunArray.push(json);
	</c:forEach>
	
	let unfitProcArray = new Array();
	<c:forEach items="${unfitProc}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	unfitProcArray.push(json);
	</c:forEach>
	////공통코드 끝
    
	//메인 테이블
	let unfitAdmTable = $('#unfitAdmTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-7'l><'col-sm-12 col-md-5'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'i><'col-sm-12 col-md-5'>>B",
		language : lang_kor,		
		paging : true,
		searching : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : -1,
		//ordering: false,
		ajax : {
			url : '<c:url value="qm/unfitAdmList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate'	: function(){ return serverDateFrom.replace(/-/g, ''); },
	           	'endDate'	: function(){ return serverDateTo.replace(/-/g, ''); },
	           	'unfitGubun': function(){ return unfitGubun; },
	        	'mainGubun'	: function(){ return '001'; },
			},
		},
		columns : [
			{ //발생일자
				data : 'inspectDate', name : 'rowspan', className : 'text-center',
				render : function(data, type, row, meta) {
					return data != null && data != '' ? moment(data).format("YYYY-MM-DD") : '';
				}
			}, 
			{ data : 'itemModelNm', name : 'rowspan', className : 'text-center' }, //차종
			{ data : 'itemNm', name : 'rowspan', className : 'text-center' }, //부품명
			{ data : 'itemCd', name : 'rowspan', className : 'text-center' }, //품번
			{ data : 'lotNo', name : 'rowspan', className : 'text-center' }, //불량LOTNO
			{ data : 'faultyDtl', className : 'text-center' }, //불량내역
			{ //불량수
				data : 'faultyQtySum', 'className' : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? rmDecimal(data) : '';
				}
			}, 
			{ //부적합처리
				data : 'unfitProc',
				render : function(data, type, row, meta) {
					return selectBoxHtml(unfitProcArray, "unfitProc", data, row, meta, meta.row);
				}
			}, 
			{ //폐기일자
				data : 'unfitDate',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="date" class="form-control" id="unfitDate'+meta.row+'" name="unfitDate" value="'+moment(data).format("YYYY-MM-DD")+'" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					} else {
						return '<input type="date" class="form-control" id="unfitDate'+meta.row+'" name="unfitDate" value="" onChange="unfitAdmCreate()" style="min-width : 100%;"/>';
					}
				}
			}, 
			{ //비고
				data : 'unfitDesc',
				render : function(data, type, row, meta){
					if(data != null){
						return '<input type="text" class="form-control" id="unfitDesc'+meta.row+'" name="unfitDesc" value="'+data+'" onChange="unfitAdmCreate()" style="min-width : 100%;" maxlength="128"/>';
					} else {
						return '<input type="text" class="form-control" id="unfitDesc'+meta.row+'" name="unfitDesc" value="" onChange="unfitAdmCreate()" style="min-width : 100%;" maxlength="128"/>';
					}
				}
			}, 
		],
		columnDefs : [
			 { targets : [0,1,2,3,4], className : 'td_top'}, 
		],
		rowsGroup : [ 'rowspan:name',[0,1,2,3,4,5] ],
		buttons : [ {
			extend : 'copy',
			title : '사출 부적합관리대장',
		}, {
			extend : 'excel',
			title : '사출 부적합관리대장',
		}, {
			extend : 'print',
			title : '사출 부적합관리대장',
		}, ],
	    order: [
	        [ 0, 'asc' ]
	    ],
	});
   
    
	//테이블 왼쪽 위 html
	let unfitHtml = '<div class="row">';
	//발생일자
	unfitHtml += '&nbsp;&nbsp;<label class="input-label-sm">발생일자</label><div class="form-group input-sub m-0 row">';
    unfitHtml += '<input class="form-control" type="date" id="startDate" max="9999-12-31"/>';
    unfitHtml += '</div>';
    unfitHtml += '&nbsp;&nbsp;~ &nbsp;<div class="form-group input-sub m-0 row">';
    unfitHtml += '<input class="form-control" type="date" id="endDate" max="9999-12-31"/>';
    unfitHtml += '</div>&nbsp;&nbsp;&nbsp;';
  	//구분
    unfitHtml += '<label class="input-label-sm">구분</label>';
	unfitHtml += '<div class="form-group input-sub m-0">';
	unfitHtml += '<select id="unfitGubunSelect" title="" class="select w80 col-12 custom-select">';
	unfitHtml += '</select></div>&nbsp;&nbsp;&nbsp;';
	unfitHtml += '<button type="button" class="btn btn-primary mr-1" id="btnRetv" onClick="btnRetvClick()">조회</button>';
	unfitHtml += '</div>';
    
	$('#unfitAdmTable_length').html(unfitHtml);
	selectBoxAppend(unfitGubunArray, "unfitGubunSelect", "002", "");
	$('#startDate').val(serverDateFrom);
	$('#endDate').val(serverDateTo);

	
	//조회 버튼 클릭시
	function btnRetvClick() {
		serverDateFrom =  $('#startDate').val();
		serverDateTo =  $('#endDate').val();
		unfitGubun =  $('#unfitGubunSelect').val();
		
		$('#unfitAdmTable').DataTable().ajax.reload(function(){});
		$('#unfitAdmTable_length').html(unfitHtml);
		selectBoxAppend(unfitGubunArray, "unfitGubunSelect", unfitGubun, "");
		$('#startDate').val(serverDateFrom);
		$('#endDate').val(serverDateTo);
		
		$('#faultyListTable').DataTable().ajax.reload(function(){return });
    };
    
	// 보기
	$('#unfitAdmTable tbody').on('click','tr',function() {
		unfitNo = unfitAdmTable.row(this).data().unfitNo;
		unfitLot = unfitAdmTable.row(this).data().lotNo;
		faultyCd = unfitAdmTable.row(this).data().faultyCd;
		unfitIndex = $('#unfitAdmTable').DataTable().row(this).index();
	});


	//불량유형별 소계 테이블
	let faultyListTable = $('#faultyListTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-3'><'col-sm-12 col-md-9'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-7'><'col-sm-12 col-md-5'>>",
		language : lang_kor,		
		paging : true,
		searching : false,
		info : true,
		ordering : false,
		processing : true,
		autoWidth : false,
		lengthChange : true,
		scrollY: '70vh',
		pageLength : -1,
		//ordering: false,
		ajax : {
			url : '<c:url value="qm/faultyTypeTotalList"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate'	: function(){ return serverDateFrom.replace(/-/g, ''); },
	           	'endDate'	: function(){ return serverDateTo.replace(/-/g, ''); },
	           	'unfitGubun': function(){ return unfitGubun; },
	           	'mainGubun'	: function(){ return '001'; },
			},
		},
		columns : [
			{ //불량유형 명
				data : 'faultyDtl', className : 'text-center',
				render : function(data, type, row, meta){
					return data != null ? '<span style="cursor: pointer;">'+data+'</span>' : '';
				}
			}, 
			{ //TOTAL
				data : 'faultyCnt', 'className' : 'text-right',
				render : function(data, type, row, meta) {
					return data != null ? '<span style="cursor: pointer;">'+rmDecimal(data)+'</span>' : '';
				}
			}, 
		],
		drawCallback: function(settings) {
			var api = this.api();
			
			let sum = 0;
			for(var i=0; i<api.data().count(); i++){
				sum += parseInt(api.row(i).data().faultyCnt.replace(/,/g,''));
			}

			$('#totalFaulty').text(addCommas(sum));
        },
	});

	// 보기
	$('#faultyListTable tbody').on('click','tr',function() {
		//불량cavity테이블
		if(unfitGubun=="002"){
			faultyCd = faultyListTable.row(this).data().faultyCd;

			var tr = $(this).closest('tr');
	        var row = faultyListTable.row( tr );
	        var idx = $.inArray( tr.attr('id'), detailRows );

	        if ( row.child.isShown() ) {
	            tr.removeClass( 'details' );
	            row.child.hide();
	 
	            // Remove from the 'open' array
	            detailRows.splice( idx, 1 );
	        }
	        else {
	            tr.addClass( 'details' );
	            row.child( format( row.data() ) ).show();
	 
	            // Add to the 'open' array
	            if ( idx === -1 ) {
	                detailRows.push( tr.attr('id') );
	            }
	        }
		}
	});

	//개발관리 상세내역 시작
	var detailRows = [];

	function format ( d ) {
		var cavityHtml = '';

		$.ajax({
			url : '<c:url value="qm/unfitFaultyRight001List"/>',
			type : 'GET',
			async : false,
			data : {
				'startDate': function() {return serverDateFrom.replace(/-/g, '');},
	           	'endDate': function() {return serverDateTo.replace(/-/g, '');},
	           	'mainGubun': function() {return "001"},
	           	'faultyCd' : function(){return faultyCd;}
			},
            async: false,
            success: function (res) {
                var data = res.data;
                if(res.result == 'ok') {
                    if(data.length>0){
                    	cavityHtml	 = '<table class="table table-bordered" style="background:#0275d81c;">';
                    	cavityHtml	+= '	<colgroup>';
                    	cavityHtml	+= '		<col width="70%">';
                    	cavityHtml	+= '		<col width="30%">';
                    	cavityHtml	+= '	</colgroup>';
                    	cavityHtml	+= '	<thead class="thead-light">';
                    	cavityHtml	+= '		<tr>';
                    	cavityHtml	+= '			<th style="background:#0275d86e;">품명</th>';
            			cavityHtml	+= '			<th style="background:#0275d86e;">수량</th>';
            			cavityHtml	+= '		</tr>';
               			cavityHtml	+= '	</thead>';
               			cavityHtml	+= '	<tbody>';
                        for(var i=0;i<data.length;i++) {
                        	cavityHtml	+= '		<tr>';
                        	cavityHtml	+= '			<td class="text-center-td">'+data[i].itemNm+'</td>';
                        	cavityHtml	+= '			<td class="text-right-td">'+rmDecimal(data[i].faultyQty)+'</td>';
                        	cavityHtml	+= '		</tr>';
                        }
                        cavityHtml	+= '	</tbody>';
                        cavityHtml	+= '</table>';
                    }
                } else {
                	toastr.error(res.message);
                }
            }
		});
		return cavityHtml;
	}
	//개발관리 상세내역 끝

    
	//부적합 등록, 수정
    function unfitAdmCreate() {
		$.ajax({
			url : '<c:url value="qm/unfitAdmCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'unfitNo' : unfitNo,
				'unfitGubun' : unfitGubun,
				'unfitLot' : unfitLot,
				'faultyCd' : faultyCd,
				'unfitProc'   : $('#unfitProc' + unfitIndex).val(),
				'unfitDate'   : $('#unfitDate' + unfitIndex).val().replace(/-/g,''),
				'unfitDesc'   : $('#unfitDesc' + unfitIndex).val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(res.addEditCheck == '등록'){
						toastr.success('등록되었습니다.');
					} else if(res.addEditCheck == '수정'){
						toastr.success('수정되었습니다.');
					}
					$('#unfitAdmTable').DataTable().ajax.reload(null, false);
				} else {
					toastr.error(res.message);
				}
			}
		});
    }
	
	//부적합처리 수정 시 폐기일자가 자동으로 등록, 삭제되도록 구현
    function unfitAdmProcCreate() {
		let tempUnfitDate = '';
		
		if (!$.trim($('#unfitDate' + unfitIndex).val())) {//폐기일자 값이 없으면
			tempUnfitDate = serverDate.replace(/-/g,'');
		} else {//폐기일자 값이 있으면
			tempUnfitDate = $('#unfitDate' + unfitIndex).val().replace(/-/g,'');
		}
		
		if (!$.trim($('#unfitProc' + unfitIndex).val())) {//부적합처리 값이 '-' 이면
			tempUnfitDate = '';
		}
		
		$.ajax({
			url : '<c:url value="qm/unfitAdmCreate"/>',
			type : 'POST',
			async : false,
			data : {
				'unfitNo' : unfitNo,
				'unfitGubun' : unfitGubun,
				'unfitLot' : unfitLot,
				'faultyCd' : faultyCd,
				'unfitProc'   : $('#unfitProc' + unfitIndex).val(),
				'unfitDate'   : tempUnfitDate,
				'unfitDesc'   : $('#unfitDesc' + unfitIndex).val(),
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					if(res.addEditCheck == '등록'){
						toastr.success('등록되었습니다.');
					} else if(res.addEditCheck == '수정'){
						toastr.success('수정되었습니다.');
					}
					$('#unfitAdmTable').DataTable().ajax.reload(null, false);
				} else {
					toastr.error(res.message);
				}
			}
		});
		
    }
	
	//셀렉트박스생성
	function selectBoxHtml(obj, id, sVal, row, meta, idx) {

		var shtml = "";

// 		if (btnDailyCheck == "") {
// 			shtml = '<select style="min-width : 100%" class="custom-select" name="'+ id +'" data-col="' + meta.col + '" disabled>';
// 		} else if (btnDailyCheck == "add" || btnDailyCheck == "edit") {
			shtml = '<select style="min-width : 100%" class="custom-select" id="'+ id + idx +'" name="'+ id +'" data-col="' + meta.col + '" onChange="unfitAdmProcCreate()">';
// 		}
		var option;
		option = "<option value=''>-</option>";
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"
						+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">"
						+ obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}

</script>
</body>
</html>
