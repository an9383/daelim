<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<% 
	String adminCheck = session.getAttribute("adminCheck").toString();
%>
<%@include file="../layout/body-top.jsp" %>

<div class="page-wrapper" id="page-wrapper">

<!-- 일괄등록 모달시작 -->
<div class="modal fade bd-example-modal-lg" id="faultyOrdBatchModal" tabindex="-1" role="dialog" aria-labelledby="faultyOrdBatchModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="faultyOrdBatchLabel">공정불량 일괄등록</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<form id="formList">
      		<div class="modal-body">
      			<hr class="text-secondary">	         
       			<table id="faultyOrdBatchTable" class="table table-bordered">
       				<colgroup>
       					<col width="20%">
       					<col width="30%">
       					<col width="20%">
       					<col width="30%">
       				</colgroup>
                  		<thead class="thead-light">
                   		<tr>
							<th>공정</th>
							<td><select class="custom-select" id="prcssBatchOption" onChange="prcssBatchOnchange()" style="min-width:100%;"></select></td>
							<th>품번</th>
							<td>
								<div class="row">
									<div class="input-sub m-0" style="min-width: 100%">
										<input type="hidden" class="form-control" id="listItemCd">
										<input type="text" class="form-control" id="itemFind" style="min-width:100%;" disabled>
										<button type="button" class="btn btn-primary input-sub-search" id="" onClick="itemBatchOnchange();">
											<span class="oi oi-magnifying-glass"></span>
										</button>
									</div>
								</div>
							</td>
                   		</tr>
                  		</thead>
				</table>
				<hr class="text-secondary">
				<div class="modal-body">
				<div class="">
		        	<button class="btn btn-success float-right" type="button" id="btnBatchApply">적용</button>
    				<select class="custom-select float-right mr-1" id="useYnBatchOption" name="useYnBatchOption"></select>
   					<button class="btn btn-primary mr-1" type="button" id="btnBatchSave">저장</button>
		      	</div>
	        		<table id="prcssFaultyOrdDtlBatchTable" class="table table-bordered">
	                	<thead class="thead-light">
							<tr>
								<th>불량순서</th>
							    <th>불량유형명</th>
							    <th>불량코드</th>
							    <th>사용유무</th>
						    </tr>
						</thead>
					</table>
				    <hr class="text-secondary"> 
      			</div>
      		</div>
      		</form>
    	</div>
  	</div>
</div>
<!-- 품목 코드 모달 시작-->
<div class="modal fade bd-example-modal-lg" id="itemPopUpModal" tabindex="-1" role="dialog" aria-labelledby="itemPopUpModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
      		<div class="modal-header">
        		<h5 class="modal-title" id="itemPopUpLabel">품목조회</h5>
        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          			<span aria-hidden="true">&times;</span>
       			</button>
      		</div> 
      		<div class="modal-body">
      			<hr class="text-secondary">	         
        			<table id="itemPopUpTable" class="table table-bordered">
                   		<thead class="thead-light">
	                   		<tr>
	                   			<th style="width : 7%">
	                   				<input type="checkbox" id="itemCheckAll" style="width: 1.2rem; height: 1.2rem;">
	                   			</th>
	                   			<th style="width : 8%">CODE</th>
								<th style="width : 22%">ITEM</th>
								<th style="width : 33%">구분</th>
								<th style="width : 15%">차종</th>
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
<!-- 품목 코드 모달 종료-->
  <!--header ============================================================== -->
    <header class="page-title-bar row">
	     <nav aria-label="breadcrumb" class="breadcrumb-padding">
		      <ol class="breadcrumb">
			       <li class="breadcrumb-item">
			         <a href="#">기준정보관리</a>
			       </li>
		       <li class="breadcrumb-item active">공정불량관리(봉제) </li>
		      </ol>
	     </nav>
    </header> 

	<div class="container-fluid" id="main">
    	<div class="row table-wrap-hid">	
            <!--======================== .left-list ========================-->
   			<div class="left-list left-60" id="left-60" style="width:60%;">
            	<div class="card">                  
                	<div class="table-responsive">
	                	<table id="prcssFaultyOrdAdmTable" class="table table-bordered" style="text-align:center">
	                        <thead class="thead-light">
		                        <tr>
		                          <th style="max-width:30px;">No.</th> 
	                              <th style="max-width:70px;">공정</th> 
	                              <th style="max-width:100px;">품번</th>            
	                              <th style="max-width:100px;">품명</th>        
	                              <th style="max-width:100px;">등록유무</th>                       
	                            </tr>
	                        </thead>
	                    </table>
	                </div>
	            </div>
	        </div>
	        <!-- /.page-section -->
	  	
	    	<!-- 사이드 페이지 -->
			<div class="right-list right-40" id="myrSidenav" style="width:39%;">
	        	<div class="card" id="formBox">  
					<div class="table-responsive">
				    	<table id="prcssFaultyOrdDtlTable" class="table table-bordered" style="text-align:center">
							<thead class="thead-light">
								<tr>
									<th>불량순서</th>
								    <th>불량유형명</th>
								    <th>불량코드</th>
								    <th>사용유무</th>
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

<script>   
	menuAuth = 'bmsc0092';
	let currentHref = 'bmsc0092';
	let currentPage = $('.' + currentHref).attr('id');
	$('#'+currentPage).closest('.has-child','li').addClass('has-open has-active');
	$('#'+currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","공정불량관리(봉제)");

	let prcssCdBatchVal = '';
	let prcssCdVal = '';
	let itemSeqVal = '';
	let regYnVal = '';

	let prcssCode = new Array();
	<c:forEach items="${prcssList}" var="info">
	var json = new Object();
	json.baseCd = "${info.prcssCd}";
	json.baseNm = "${info.prcssNm}";
	prcssCode.push(json);
	</c:forEach>

	selectBoxAppend(prcssCode, "prcssBatchOption", "", "2");

	let useYnCode = new Array();
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>

	selectBoxAppend(useYnCode, "useYnBatchOption", "", "");
	
	let regYnCode = new Array();
	<c:forEach items="${regYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	regYnCode.push(json);
	</c:forEach>
	
    // 상위목록
    let prcssFaultyOrdAdmTable = $('#prcssFaultyOrdAdmTable').DataTable({
    	dom : "<'row'<'col-sm-12 col-md-8'l><'col-sm-12 col-md-4'f>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
    	language : lang_kor,
        paging : true,
        info : true,
        ordering : true,
        processing : true,
        autoWidth : false,
        pageLength : -1,
        scrollY : '70vh',
        ajax : {
            url: '<c:url value="/bm/prcssFaultyOrdAdmlistAll"/>',
            type: 'GET',
            data: {
            	'prcssCd' : function(){ return prcssCdVal; },
            	'regYn'  : function() {return regYnVal;}
            },
        },        
        columns: [
            {
				render : function(data,type,row,meta){
					return meta.row+1;
				}
            },
        	{
        		data: 'prcssNm'
        	},
            {
        		data: 'itemCd'
        	},
            {
        		data: 'itemNm'
        	},
        	{
        		data: 'regYn',
        		render : function(data,type,row,meta){
					if(data!=null && data=="등록"){
						return '<span style="color:blue;">'+data+'</span>';
					}else{
						return '<span style="color:red;">'+data+'</span>';
					}
				}
        	},
        ],        
        order: [
        ],       
        buttons: [],
        columDefs : [
        ],
        drawCallback : function() {
        }
    });
    
    let html1 = '<div class="row">';
	html1 += '<label class="input-label-sm">공정</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="prcssOption" onChange="prcssOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<label class="input-label-sm">등록유뮤</label>';
	html1 += '<div class="form-group input-sub m-0">';
	html1 += '<select class="custom-select" id="regYnOption" onChange="regYnOnchange()">';
	html1 += '</select></div>&nbsp;&nbsp;&nbsp;';
	html1 += '<button class="btn btn-primary mr-1" type="button" id="btnBatch">일괄등록</button>';
	html1 += '</div>';

	$('#prcssFaultyOrdAdmTable_length').html(html1);
	selectBoxAppend(prcssCode, "prcssOption", "", "1");
	selectBoxAppend(regYnCode, "regYnOption", "", "1");
	
	let prcssOnchange = () =>{
		prcssCdVal = $('#prcssOption option:selected').val();
		prcssFaultyOrdDtlTable.clear().draw();
		$('#prcssFaultyOrdAdmTable').DataTable().ajax.reload();
	}

	let regYnOnchange = () =>{
		regYnVal = $('#regYnOption option:selected').val();
		prcssFaultyOrdDtlTable.clear().draw();
		$('#prcssFaultyOrdAdmTable').DataTable().ajax.reload();
	}

	
	$('#prcssFaultyOrdAdmTable tbody').on('click','tr',function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			$('#prcssFaultyOrdAdmTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		prcssCdVal = prcssFaultyOrdAdmTable.row(this).data().prcssCd;
		itemSeqVal = prcssFaultyOrdAdmTable.row(this).data().itemSeq;
		$('#prcssFaultyOrdDtlTable').DataTable().ajax.reload();
	});
	
	let prcssFaultyOrdDtlTable = $('#prcssFaultyOrdDtlTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        pageLength: -1,
        scrollY : "70vh",
   	    ajax: {
			url: '<c:url value="/bm/prcssFaultyOrdAdmlist"/>',
			type: 'GET',
 	        data: {
				'prcssCd'	: function(){ return prcssCdVal; },
 	   	        'itemSeq'	: function(){ return itemSeqVal; },
			}
		},
   	    rowReorder : {
   			dataSrc : 'faultyOrd'
   		},
		columns: [
			{
				data: 'faultyOrd',
				render : function(data, type, row, meta) {
					if(data==null){
						return meta.row+1;
					}else{
						return data;
					}
				},'className' : 'text-center'
			},
  	        {
				data: 'faultyNm'
			},
			{
				data: 'faultyCd'
			},
			{
				data : 'useYn',
				render : function(data, type, row, meta) {
					if(data==null){
						return selectBoxHtml2(useYnCode,"useYn", "001", row, meta, "");
					}else{
						return selectBoxHtml2(useYnCode,"useYn", data, row, meta, "");
					}
					
				},'className' : 'text-center'
					
			},
			
		],        
  	    order : [
			[ 0, 'asc' ]
  	    ],
		buttons : [],
		columnDefs: [
			{ orderable: true, className: 'reorder', targets: 1 },
  	    	{ orderable: false, targets: '_all' }
		],
		drawCallback : function() {
			$("#prcssFaultyOrdDtlTable_filter").find("label").addClass("m-0");
		}
	});
	
    var htmlSubMenu = '';
    //htmlSubMenu += '<button class="btn btn-success float-left mr-1" type="button" id="btnCapy">복사</button>';
    htmlSubMenu += '<button class="btn btn-success float-right" type="button" id="btnApply">적용</button>&nbsp;';
    htmlSubMenu += '<select class="custom-select float-right mr-1" id="useYnOption" name="useYnOption"></select>';
    htmlSubMenu += '<button class="btn btn-primary mr-1" type="button" id="btnSave">저장</button>&nbsp;';
    
	$('#prcssFaultyOrdDtlTable_length').html(htmlSubMenu);

	selectBoxAppend(useYnCode, "useYnOption", "", "");

	$('#btnApply').on('click',function(){
		$('#prcssFaultyOrdDtlTable input[name=check]:checked').each(function(index,item){
			$('select[name=useYn]').eq($(this).attr('data-index')).val($('#useYnOption').val());
		});
	})

	//저장버튼 클릭시
	$('#btnSave').on('click',function(){
		var dataArray = new Array();
   		
   		$('#prcssFaultyOrdDtlTable tbody tr').each(function(index,item){
			var rowData = new Object();
			
			rowData.faultyOrd = index+1;
			rowData.prcssCd = prcssCdVal;
			rowData.itemSeq = itemSeqVal;
			rowData.faultyCd = $(this).find('td').eq(2).text();
			rowData.useYn = $(this).find('td select[name=useYn] option:selected').val();
   			dataArray.push(rowData);
   	   	})

   	   	$.ajax({
			url : '<c:url value="bm/prcssFaultyOrdAdmCreate"/>',
			type : 'POST',
			datatype : 'json',
			data: JSON.stringify(dataArray),
			contentType : "application/json; charset=UTF-8",
			beforeSend : function(){
				//처리중..
				$('#my-spinner').show();
			},
			success : function(res){
				if (res.result == 'ok') {
					$('#my-spinner').hide();
					toastr.success("저장되었습니다.");

					$('#prcssFaultyOrdAdmTable').DataTable().ajax.reload();
					$('#prcssFaultyOrdDtlTable').DataTable().ajax.reload();
				}else{
					toastr.error(res.message);
				}
			}
   	   	})
   	});

	//일괄등록 버튼
	$('#btnBatch').on('click',function(){
		$('#itemFind').val('');
		$('#faultyOrdBatchModal').modal('show');

		$('#prcssFaultyOrdDtlBatchTable').DataTable().ajax.reload();
		setTimeout(function(){
			prcssFaultyOrdDtlBatchTable.draw();
		},150);
	});

	let prcssBatchOnchange = () =>{
		prcssCdBatchVal = $('#prcssBatchOption option:selected').val();
		prcssFaultyOrdDtlBatchTable.clear().draw();
		$('#prcssFaultyOrdDtlBatchTable').DataTable().ajax.reload();
	}

	let itemBatchOnchange = () =>{
		if ( prcssCdBatchVal != '' ) {
			$('#itemPopUpModal').modal('show');

			$('#itemPopUpTable').DataTable().ajax.reload();
			setTimeout(function(){
				itemPopUpTable.draw();
				itemPopUpTable.draw();
				$('#itemCheckAll').prop('checked', false);
			}, 300);
		} else {
			toastr.warning('공정을 선택해주세요.');
		}
		
	} 

	$('#btnBatchApply').on('click',function(){
		$('#prcssFaultyOrdDtlBatchTable input[name=check]:checked').each(function(index,item){
			$('select[name=useYnBatch]').eq($(this).attr('data-index')).val($('#useYnBatchOption').val());
		});
	})
	
	//저장버튼 클릭
	$('#btnBatchSave').on('click',function(){
		var dataArray = new Array();
		var check = true;

		if(itemCdList.length==0){
			toastr.warning('품번을 선택해주세요.');
			check = false;
			return false;
		}

		$.ajax({
			url : '<c:url value="bm/prcssFaultyOrdAdmBatchDelete"/>',
			type : 'POST',
			data: {
				'prcssCd' : function(){return prcssCdBatchVal},
				'itemSeqArr' : function(){return itemCdList},
			},
			async : false,
			success : function(res){
				if (res.result == 'ok') {
					console.log('삭제완료')
				}else{
					toastr.error(res.message);
				}
			}
   	   	}) 
		

		for(var i=0; i<itemCdList.length; i++){
			$('#prcssFaultyOrdDtlBatchTable tbody tr').each(function(index,item){
				var rowData = new Object();
				
				rowData.faultyOrd = index+1;
				rowData.prcssCd = prcssCdBatchVal;
				rowData.itemSeq = itemCdList[i];
				rowData.faultyCd = $(this).find('td').eq(2).text();
				rowData.useYn = $(this).find('td select[name=useYnBatch] option:selected').val();
	   			dataArray.push(rowData);
	   			console.log(dataArray);
	   	   	})
		}
   		
		if(check){
			$.ajax({
				url : '<c:url value="bm/prcssFaultyOrdAdmBatchCreate"/>',
				type : 'POST',
				datatype : 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function(){
					//처리중..
					$('#my-spinner').show();
				},
				success : function(res){
					if (res.result == 'ok') {
						$('#my-spinner').hide();
						toastr.success("저장되었습니다.");
						itemCdList = [];
						$('#faultyOrdBatchModal').modal('hide');
						$('#prcssFaultyOrdAdmTable').DataTable().ajax.reload();
						$('#prcssFaultyOrdDtlTable').DataTable().ajax.reload();
					}else{
						toastr.error(res.message);
					}
				}
	   	   	}) 
		}
   	   	
	})
	
	let prcssFaultyOrdDtlBatchTable = $('#prcssFaultyOrdDtlBatchTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        pageLength: -1,
        scrollY : "55vh",
   	    ajax: {
			url: '<c:url value="/bm/baseInfoAdmFTList"/>',
			type: 'GET',
 	        data: {
				'prcssCd'	: function(){ return prcssCdBatchVal; },
 	   	        //'itemSeq'	: function(){ return itemSeqVal; },
			}
		},
   	    rowReorder : {
   			dataSrc : 'faultyOrd'
   		},
		columns: [
			{
				data: 'faultyOrd',
				render : function(data, type, row, meta) {
					if(data==null){
						return meta.row+1;
					}else{
						return data;
					}
				},'className' : 'text-center'
			},
  	        {
				data: 'faultyNm','className' : 'text-center'
			},
			{
				data: 'faultyCd','className' : 'text-center'
			},
			{
				data : 'useYn',
				render : function(data, type, row, meta) {
					if(data==null){
						return selectBoxHtml2(useYnCode,"useYnBatch", "001", row, meta, "");
					}else{
						return selectBoxHtml2(useYnCode,"useYnBatch", data, row, meta, "");
					}
					
				},'className' : 'text-center'
					
			},
			
		],        
  	    order : [
			[ 0, 'asc' ]
  	    ],
		buttons : [],
		columnDefs: [
			{ orderable: true, className: 'reorder', targets: 1 },
  	    	{ orderable: false, targets: '_all' }
		],
		drawCallback : function() {
			$("#prcssFaultyOrdDtlBatchTable_filter").find("label").addClass("m-0");
		}
	});
	

	let itemPopUpTable = $('#itemPopUpTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-12'l>>"
			+ "<'row'<'col-sm-12'tr>>"
			+ "<'row'<'col-sm-12 col-md-8'i><'col-sm-12 col-md-4'>>",
		language: lang_kor,
        paging: true,
        info: true,
        ordering: true,
        processing: true,
        autoWidth: false,
        pageLength: -1,
        scrollY: "60vh",
        ajax : {
			url : '<c:url value="bm/itemPartAdmList"/>',
			type : 'GET',
			data : {
				'mainGubun' :  function(){return '002';},
				'itemGubunList' :  function(){return ['001','003']},
				'itemWorkplace' :  function(){return prcssCdBatchVal;},
			},
		},
   		columns : [ 
			{ //체크박스
				render : function ( data, type, row, meta ) {
					return '<input type="checkbox" name="itemCheck" style="width: 1.2rem; height: 1.2rem;">';
				}, orderable: false
			},
			{ data : 'itemCd' }, //CODE
			{ data : 'itemNm' }, //ITEM
			{ data : 'itemGubunNm' }, //구분
			{ data : 'itemModelNm' }, //차종
		],
		columnDefs : [ {
			"defaultContent" : "-",
			"targets" : "_all",
			"className" : "text-center"
		} ],
		order : [ [ 1, 'asc' ] ],
		buttons : [],
	});


	var htmlItem = '';
    htmlItem += '<button class="btn btn-primary mr-1" type="button" id="btnItemSelect">선택</button>&nbsp;';
    
	$('#itemPopUpTable_length').html(htmlItem);

	//전체선택 체크
	$('#itemCheckAll').change(function() {
		$('input:checkbox[name=itemCheck]').prop("checked", $(this).prop("checked"));
	})
	
	//품목조회 팝업창 상단 테이블 행 클릭 시
	$(document).on('click', '#itemPopUpTable tbody tr', function () {
		const checkbox = $(this).find('input[name="itemCheck"]');
	    checkbox.prop('checked', !checkbox.prop('checked'));
	});
	
	//체크박스 선택 시 중복체크 방지
	$(document).on('click', '#itemPopUpTable tbody tr input[name="itemCheck"]', function (event) {
	    event.stopPropagation();
	});

	//선택 버튼 클릭시
	let itemCdList = new Array();
	$('#btnItemSelect').on('click', function() {
	    itemCdList = [];
	    let itemCdVal = '';
	    let isFirstChecked = true;
	    
	    $('#itemPopUpTable tbody tr').each(function() {
	    	const checkbox = $(this).find('input[name="itemCheck"]');
	    	if (checkbox.prop('checked')) {
	        	const itemSeq = itemPopUpTable.row(this).data().itemSeq;
	        	itemCdList.push(itemSeq);
	        	
	        	if (isFirstChecked) { itemCdVal = itemPopUpTable.row(this).data().itemCd; isFirstChecked = false; }
	    	}
	    });
	    
		if ( itemCdList.length > 0 ) {
			itemCdVal += itemCdList.length > 1 ? ' 외 ' + ( itemCdList.length - 1 ) + '개' : '';
			$('#itemFind').val(itemCdVal);
			
			$('#itemPopUpModal').modal('hide');
		} else {
			$('#itemFind').val('');
			toastr.warning('항목을 선택해주세요.');
		}
	});


	//셀렉트박스생성
	function selectBoxHtml2(obj, id, sVal, row, meta) {
		
		var shtml = '<div class="row">' 
		shtml += '<input class="" type="checkbox" name="check" id="'+meta.row+'" data-index="'+meta.row+'" style="width: 20%;"/>';
		shtml += '<select class="custom-select" name="'+ id +'" data-col="' + meta.col + '" style="width: 80%;">';
		shtml += '</div>';

		var option;
		for (key in obj) {
			var tmp;
			if (obj[key].baseCd == sVal) {
				tmp = "<option value="+ obj[key].baseCd+ " selected>"+ obj[key].baseNm + "</option>";
			} else {
				tmp = "<option value="+obj[key].baseCd+">" + obj[key].baseNm + "</option>";
			}
			option += tmp;
		}
		var ehtml = '</select>';
		return shtml + option + ehtml;
	}
   	
</script>

</body>
</html>
