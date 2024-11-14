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
		<a href="<c:url value="/tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0250"><p class="mo_main_title">출하요청</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">출하일자</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input class="form-control-md" type="date" id="apDate"/>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">거래처</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="hidden" class="form-control" id="poCorpCd" name="ordCorpCd">
						<input type="text" class="form-control-md" id="poCorpNm" name="ordCorpNm" style="min-width:100%" disabled>
						<button type="button" class="btn btn-primary input-sub-search-md" name="btnPoCorpCd" onClick="selectPoCorpCd()">
							<span class="oi oi-magnifying-glass" style="font-size: 15px"></span>
						</button>
					</div>
				</div>
				<div class="col-12 row p-1">
					<div class="col-3 mo_sort_title">LOT NO</div>
					<div class="form-group input-sub col-9 m-0 p-0">
						<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
						<button type="button" class="btn btn-primary input-sub-search-md" id="btnLotNo" name="btnLotNo" onClick="selectLotNo()">
							<span class="oi oi-magnifying-glass" style="font-size: 15px"></span>
						</button>
					</div>
				</div>
				
	</div>
	<!--==버튼영역-->
	<div class="mo_btnbox pl-2 pr-2">
				<div class="float-left">
					<button type="button" class="btn btn-danger float-right" id="btnDelete" disabled>라인삭제</button>
					<button type="button" class="btn btn-danger float-right mr-2" id="btnAllDelete" disabled>전체삭제</button>
				</div>
				<div class="float-right">
					<button type="button" class="btn btn-success float-right mr-1" disabled id="btnSave">요청</button>
					<!-- <button type="button" class="btn btn-secondary float-right" id="btnCancel">취소</button> -->
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
					<table id="barcodeDtlTable" class="table table-bordered">
						<colgroup>
							<col width="10%">
							<col width="35%">
							<col width="35%">
							<col width="20%">
						</colgroup>
						<thead class="thead-light">
							<tr>
								<th>No.</th>
								<th>생산LOT NO</th>
								<th>품번</th>
								<th>출고요청수량</th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="table-responsive">
					<table id="barcodeViewTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th style="min-width: 220px">품번</th>
								<th class="text-center-th" style="min-width: 80px">출고요청수량</th>
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
					<div class="mo_roll mr-4">
						<!-- <label>합계</label><span class="mo_sum_font_lg" id="rowCount">0</span> <label>Roll</label> -->
					</div>
					<div class="mo_kg">
						<!-- <span class="mo_sum_font_lg" id="count">0</span> <label>개수</label> -->
					</div>
				</div>
			</div>	
	</footer>
	<!-- LOT NO 조회 모달 시작 -->
	<div class="modal fade" id="lotNoPopupModal" tabindex="-1" role="dialog" aria-labelledby="lotNoPopupModal" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="lotNoPopupLabel">LOT NO 조회</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
			      	<hr class="text-secondary">	         
		                <table id="lotNoPopupTable" class="table table-bordered">
		                	<colgroup>
		                		<col width="5%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
								<col width="20%">
							</colgroup>	
		                    <thead class="thead-light">
			                    <tr>
			                    	<th class="text-center"><input type="checkbox" id="btnAllCheck"></th>
			                    	<th class="text-center">LOT NO</th>
			                    	<th class="text-center">품번</th>
			                    	<th class="text-center">생산일자</th>
			                    	<th class="text-center">수량</th>
			                   </tr>
		                    </thead>
						</table>
		 			<hr class="text-secondary"> 
			    </div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnItemAdd">품목추가</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- LOT NO 조회 모달 끝 -->
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>
<%@include file="../layout/bottom.jsp" %>
<script>

	$(document).attr("title","출하요청");
	let menuAuth = 'tmsc0250';
	var serverDateFrom = "${serverDateFrom}"
	var serverDateTo = "${serverDateTo}"
	var serverDate = "${serverDate}"
	var userNm = "${userNm}"
	var userNumber = "${userNumber}"
	var barcodeNo = null;
	var apGubun = 'PA';
	var barcodeNoVal = null;
	var count = 0;
	var pairQty = null;
	let itemCusVal = null;

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	
	$('#apDate').val(serverDate);
	$('#barcodeNo').focus();

	$.fn.dataTable.ext.errMode = 'none';
	let barcodeDtlTable = $('#barcodeDtlTable').on( 'error.dt', function ( e, settings, techNote, message ) {}).DataTable({
		language : lang_kor,		
		paging : false,
		info : false,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		searching : false,
		scrollY : "200px",
		pageLength : 20,
		ajax : {
			url : '<c:url value="bs/deliveryOrderAdmReset"/>',
			type : 'GET',
			data : {
				//'startDate'  : function(){return serverDateFrom.replace(/-/g,'')},
				//'endDate'    : function(){return serverDateTo.replace(/-/g,'')},
				//'barcodeNo'  :  function(){return barcodeNoVal},
				}	
		},	
		rowId : 'lotNo',
		columns : [ 
			{ //No.
				render : function(data, type, row, meta) {
					return meta.row+ meta.settings._iDisplayStart+ 1;
				}, 'className' : 'text-center'
			},
			{ data : 'lotNo', 'className' : 'text-center' },
			{ data : 'itemCd', 'className' : 'text-center' },
			{// 출고요청수량
				data : 'fairQty', 'className' : 'text-center',
				render : function(data, type, row, meta){
					if ( data != null ) {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="fairQty" value="'+rmDecimal(data)+'" placeholder="'+rmDecimal(data)+'" onkeyup="numberFormat(this, \'int\')">';
					} else {
						return '<input type="text" class="form-control" style="max-width:100%; text-align:right;" name="fairQty" value="" onkeyup="numberFormat(this, \'int\')">';	
					}
				}
			},
		],
        columnDefs: [
	    ], 
	    order: [
	    	[0, 'desc'] //바코드 스캔 시 맨 위에 행이 추가되도록 구현
	    ],
	});
	
	let barcodeViewTable = $('#barcodeViewTable').on( 'error.dt', function ( e, settings, techNote, message ) {
		}).DataTable({
			language : lang_kor,		
			paging : false,
			info : false,
			ordering : false,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			searching : false,
			scrollY : "110px",
			pageLength : -1,
			ajax : {
				url : '<c:url value="bs/deliveryOrderAdmReset"/>',
				type : 'GET',
				data : {
					//'startDate'  : function(){return serverDateFrom.replace(/-/g,'')},
					//'endDate'    : function(){return serverDateTo.replace(/-/g,'')},
					//'barcodeNo'  :  function(){return barcodeNoVal},
					}	

			},	
			rowId : 'itemSeq',
			columns : [ 
					{data : 'itemCd','className' : 'text-center'},
					{data : 'fairQty',
						render : function(data, type, row, meta) {
							if ( data != null ) {
								return '<span name="fairQty">'+rmDecimal(data)+'</span>';
							} else {
								return '';
							}
						}, 'className' : 'text-right'
					},
			],
	        columnDefs: [
		    ], 
		    order: [
		    ],
		});

	var lineCheck = false;
    $('#barcodeDtlTable tbody').on('click', 'tr', function () {
        if ( $(this).hasClass('selected') ) {
            $(this).removeClass('selected');
            lineCheck = false;
        }	
        else {
        	$('#barcodeDtlTable').DataTable().$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
            lineCheck = true;
        }
    });

 	
  	//바코드 스캔시
	$("#barcodeNo").keypress(function (e) {
	    if (e.which == 13){
	    	let check = true;
	    	if ( $('#poCorpCd').val() == "" ) {
	    		toastr.warning('거래처를 선택해주세요.');
				$('#btnPoCorpCd').focus();
				check = false;
				return false;
		    }
	    	if(!$.trim($('#barcodeNo').val())){
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check = false;
				return false;
			}
	    	
	    	//이미 추가한 바코드인지 확인
			if($('#barcodeDtlTable').DataTable().rows().count()!=0) {
				$('#barcodeDtlTable tbody tr').each(function(index, item) {
					if(barcodeDtlTable.row(index).data().lotNo==$('#barcodeNo').val()){
						$('#barcodeNo').focus();
						$('#barcodeNo').select();
						toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
						check = false;
						return false;
					}
				});
			}
	    	
	        if (check) {
	        	$('#my-spinner').show(function(){
	        		let barcodeNoArr = new Array();
					let barcodeList = ''; // 선입선출 조건 추가
					let i = '0';
					if ( $('#barcodeDtlTable').DataTable().rows().count() != 0 ) {
						$('#barcodeDtlTable tbody tr').each(function(index, item) {
							barcodeNoArr[i]=barcodeDtlTable.row(index).data().lotNo;
							i++;
							
							// 선입선출 조건 추가
							if (index == 0) {
								barcodeList += "'" + barcodeDtlTable.row(index).data().lotNo + "'";
							} else {
								barcodeList +=  ", '" + barcodeDtlTable.row(index).data().lotNo + "'";
							}
							////
						});
					}
					
				 	$.ajax({
		            	url: '<c:url value="po/pdaLotNoScan"/>',
		                type: 'GET',
		                async : false, // 중복 입력을 막기 위해 비동기로 설정해야 함
		                data: {
		                	'menuAuth'	 	: function(){ return menuAuth; },
		                	'ordLotNo'  	: function(){ return $('#barcodeNo').val(); },
		                	'poCorpCd'  	: function(){ return $('#poCorpCd').val(); },
		                	'barcodeNoArr'	: function(){ return barcodeNoArr; },
		                	'barcodeList'	: function(){ return barcodeList; }, //선입선출 조건 추가
		                },
		                success: function (res) {
		                    let data = res.data;
		                    if (res.result == 'ok') {
			                    $('#barcodeDtlTable').DataTable().row.add({
			    	    			'lotNo'		: data.ordLotNo,
			    	    			'itemSeq' 	: data.itemSeq,
			    	    			'itemCd'	: data.itemCd,
			    	    			'fairQty'	: data.fairQty,
			    				}).draw(false);
			    				let rowAdd = '';

			    				//view 테이블에 같은 품번이면 수량 더하기 아니면 행 추가
			    				if($('#barcodeViewTable').DataTable().rows().count()!=0) {
				    				//같은 품번이 있는지 확인 없으면 추가
			    					$('#barcodeViewTable tbody tr').each(function(index, item) {
			    						if ( barcodeViewTable.row(this).data().itemSeq == data.itemSeq ) {
				        					$('span[name=fairQty]').eq(index).text(rmDecimal(parseFloat($('span[name=fairQty]').eq(index).text().replace(/,/g,'')) + parseFloat(data.fairQty)));
						        			rowAdd = 'ok';
				        				}
				        			});
				        			if(rowAdd =='') {
				        				$('#barcodeViewTable').DataTable().row.add({
					    	    			'lotNo'		: data.ordLotNo,
					    	    			'itemSeq' 	: data.itemSeq,
					    	    			'itemCd'	: data.itemCd,
					    	    			'fairQty'	: rmDecimal(data.fairQty),
					    				}).draw(false);
					        		}
			    				} else {
			    					$('#barcodeViewTable').DataTable().row.add({
				    	    			'lotNo'		: data.ordLotNo,
				    	    			'itemSeq' 	: data.itemSeq,
				    	    			'itemCd'	: data.itemCd,
				    	    			'fairQty'	: rmDecimal(data.fairQty),
				    				}).draw(false);
				    			}
				    			$('#btnSave').attr('disabled', false);
				    			$('#btnDelete').attr('disabled', false);
				    			$('#btnAllDelete').attr('disabled', false);
		                        toastr.success("추가되었습니다.");
		                        $('#barcodeNo').val('');
		                    } else if(res.result=="fail"){
		                    	toastr.warning(res.message);
		                    	$('#barcodeNo').select();
		                    } else if(res.result=="fifo"){
		                    	$('#fifoBtnModal').modal('show');
		                    } else if(res.result == 'error') {
		                    	toastr.warning(res.message, '', {timeOut: 5000});
		                    }  
			             },
			        });
				 	
				 	$('#my-spinner').hide();
	        	});
	        }
	    }
	});


	//라인삭제 버튼 클릭시
	$('#btnDelete').on('click', function() {
		if ( $('#barcodeDtlTable').DataTable().rows().count() == 0 ) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		if (!lineCheck) {
			toastr.warning("라인을 선택해 주세요.");
			return false;
		}
		
		let fairQtyVal = +$('#barcodeDtlTable').DataTable().row('.selected').node().querySelector('td [name=fairQty]').value.replace(/,/g,'');
		$('#barcodeViewTable tbody tr').each(function(index, item) {
			let thisFairQty = +$(this).find('td span[name=fairQty]').text().replace(/,/g,'');
			if ( barcodeViewTable.row(this).data().itemSeq == $('#barcodeDtlTable').DataTable().row('.selected').data().itemSeq ) {
				if ( thisFairQty - fairQtyVal <= 0 ) {
					$('#barcodeViewTable').DataTable().row(this).remove().draw();
				} else {
					$(this).find('td span[name=fairQty]').text( rmDecimal( thisFairQty - fairQtyVal ));
				}
				$('#barcodeDtlTable').DataTable().row('.selected').remove().draw();				
			}
		});
		lineCheck = false;
	});

	$('#btnAllDelete').on('click',function() {
		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		$('#barcodeDtlTable').DataTable().clear().draw();
		$('#barcodeViewTable').DataTable().clear().draw();

		$('#btnSave').attr('disabled', true);
		$('#btnDelete').attr('disabled', true);
		$('#btnAllDelete').attr('disabled', true);
	});
  	
  	
	// 출하요청
	$('#btnSave').on('click',function() {
		let check = true;
		let dataArray = new Array();

		if ( $('#poCorpCd').val() == '' ) {
			toastr.warning("거래처를 선택해 주세요.");
			$('#my-spinner').hide();
			return false;
		}
		if ( $('#barcodeDtlTable').DataTable().rows().count() == 0 ) {
			toastr.warning("등록할 데이터가 없습니다.");
			$('#my-spinner').hide();
			return false;
		}

		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=fairQty]').val().replace(/,/g, '')*1 <= 0 ) {
				toastr.warning("출고요청수량을 입력해주세요.");
				$(this).find('td input[name=fairQty]').focus();
				check = false;
				return false;
			}
			if ( $(this).find('td input[name=fairQty]').val().replace(/,/g, '')*1 > $(this).find('td input[name=fairQty]').attr('placeholder').replace(/,/g, '')*1 ) {
				toastr.warning("출고요청수량을 " + $(this).find('td input[name=fairQty]').attr('placeholder').replace(/,/g, '') + "개 이하로 입력해주세요.");
				$(this).find('td input[name=fairQty]').focus();
				check = false;
				return false;
			}
			
			let rowData = new Object();
			rowData.outputDate = $('#apDate').val().replace(/-/g,'');
			rowData.poCorpCd = $('#poCorpCd').val();
			rowData.lotNo = barcodeDtlTable.row( this ).data().lotNo;
			rowData.itemSeq = barcodeDtlTable.row( this ).data().itemSeq;
			rowData.targetQty = $(this).find('td input[name=fairQty]').val().replace(/,/g, '');
	        dataArray.push(rowData);
		});
		
		if (check) {
			$.ajax({
				url : '<c:url value="bs/deliveryOrderAdmPdaCreate"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$('#my-spinner').show();
				},
				success : function(res) {				
					if ( res.result == 'ok' ) {
						$('#btnAllDelete').attr('disabled', true);
	                	$('#btnDelete').attr('disabled', true);
	                	$('#btnSave').attr('disabled', true);                    
						toastr.success('출하요청되었습니다.');
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeViewTable').DataTable().clear().draw();
						$('#poCorpCd').val('');
						$('#poCorpNm').val('');
					} else if ( res.result == 'fail' ) {
						toastr.warning(res.message);
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide();
				}
			});
		}
	});

	//발주처 팝업 시작
   	var dealCorpPopUpTable4;
   	function selectPoCorpCd(){	   	
		if(dealCorpPopUpTable4 == null || dealCorpPopUpTable4 == undefined)	{
			dealCorpPopUpTable4 = $('#dealCorpPopUpTable4').DataTable({	
				dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
					+ "<'row'<'col-sm-12'tr>>"
					+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				async : false,
				pageLength : 10,
				ajax : {
					url : '<c:url value="/bm/dealCorpDataList"/>',
					type : 'GET',
					data : {
						'dealGubun' : function(){return '001'},
					},
				},
				rowId : 'dealCorpSeq',
				columns : [ 
				{
					data : 'dealCorpNm'
				}, 
				{
					data : 'dealCorpCd'
				}, 
				{
					data : 'presidentNm'
				}, 
				{
					data : 'repreItem'
				}, 
				{
					data : 'corpNo'
				} 
				],
				columnDefs : [ {
					"defaultContent" : "-",
					"targets" : "_all",
					"className" : "text-center"
				} ],
				order : [ [ 1, 'asc' ] ],
				buttons : [],
			});

		    $('#dealCorpPopUpTable4 tbody').on('click', 'tr', function () {
		    	let data = dealCorpPopUpTable4.row( this ).data();
				$('#poCorpCd').val(data.dealCorpCd);
				$('#poCorpNm').val(data.dealCorpNm);
                $('#dealCorpPopUpModal4').modal('hide');
                
                itemCusVal = data.dealCorpCd;
			});
		}else{
			$('#dealCorpPopUpTable4').DataTable().ajax.reload(function() {});
		}
		$('#dealCorpPopUpModal4').modal('show');		
   	} 

	
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
	
  	//바코드 검색 팝업 시작
	let lotNoPopupTable;
	function selectLotNo() {
		if ( $('#poCorpCd').val() == "" ) {
    		toastr.warning('거래처를 선택해주세요.');
			$('#btnPoCorpCd').focus();
			return false;
	    } else {
	    	if ( lotNoPopupTable == null || lotNoPopupTable == undefined ) {
				lotNoPopupTable = $('#lotNoPopupTable').DataTable({
					dom : "<'row'<'col-sm-12 col-md-6'><'col-sm-12 col-md-6'f>>"
							+ "<'row'<'col-sm-12'tr>>"
							+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
					language : lang_kor,
					paging : false,
					info : true,
					ordering : true,
					processing : true,
					autoWidth : false,
					scrollX : false,
					lengthChange : true,
					async : false,
					pageLength : -1,
					scrollY : "45vh",
					ajax : {
						url : '<c:url value="/wm/lotNoList"/>',
						type : 'GET',
						data : {
							'mainGubun' : function(){ return '001'; }, //사출
							'itemCus' 	: function(){ return itemCusVal; },
						},
					},
					rowId : 'barcodeNo',
					columns : [ 
						{//체크박스
							render : function(data, type, row, meta){
								return '<input type="checkbox" class="" name="check" data-barcodeNo="'+row['barcodeNo']+'" data-itemCd="'+row['itemCd']+'" data-itemSeq="'+row['itemSeq']+'" data-remainQty="'+row['remainQty']+'" >';
							}, 'className' : 'text-center'
						}, 
						{ data : 'barcodeNo', 'className' : 'text-center' }, //LOT NO
						{ data : 'itemCd', 'className' : 'text-center' }, //품번
						{//생산일자
							data : 'inDate',
							render : function(data, type, row, meta) {
								return data != null && data != '' ? moment(data).format('YYYY-MM-DD') : '';
							}, 'className' : 'text-center'
						}, 
						{ 
							data : 'remainQty',
							render : function(data, type, row, meta) {
								return data != null && data != '' ? rmDecimal(data):'0';
							}, 'className' : 'text-right'
					 	}, //생산수량
					],
					columnDefs : [],
					order : [],
					buttons : [],
				});
			   
			}else{
				$('#lotNoPopupTable').DataTable().ajax.reload(function() {
					lotNoPopupTable.draw();
				});
			}

	    	setTimeout(function(){
	    		lotNoPopupTable.draw();
		    },200)
	    	
			$('#lotNoPopupModal').modal('show');
		}
	}

	//품목 상단 전체선택 
	$('#btnAllCheck').on('click',function(){
		if ($('#btnAllCheck').is(":checked")) {
			$('#lotNoPopupTable').DataTable().$('input[name=check]').prop('checked',true);
			$('#lotNoPopupTable tbody tr').addClass('selected');
		} else {
			$('#lotNoPopupTable').DataTable().$('input[name=check]').prop('checked',false);
			$('#lotNoPopupTable tbody tr').removeClass('selected');
		}
	});

	//품목추가 버튼 클릭 시 
	$('#btnItemAdd').on('click',function(){
		let check = true;
		let added = false; // 메시지 표시 확인 변수

		$('#lotNoPopupTable tbody tr td input[name=check]:checked').each(function(index, item) {
			//중복체크
			let seq1 = $(this).attr('data-barcodeNo');
			if ( barcodeDtlTable.data().count() > 0 ) {
				$('#barcodeDtlTable tbody tr').each(function() {
					let seq2 = barcodeDtlTable.row(this).data().lotNo;
					if ( seq1 == seq2 ) {
						toastr.warning(seq2 + "는 이미 등록된 LOT NO입니다.");
						check = false;
						return false;
					} else {
						check = true;
					}
				});
			}  
			
			//픔목 하단 테이블 행 추가
			if (check) {
				barcodeNoVal = $(this).attr('data-barcodeNo');
				itemCdVal  = $(this).attr('data-itemCd');
				itemSeqVal = $(this).attr('data-itemSeq');
				pairQty = $(this).attr('data-remainQty');
				
				$('#barcodeDtlTable').DataTable().row.add({
					'lotNo' : barcodeNoVal,
					'itemSeq' : itemSeqVal,
					'itemCd': itemCdVal,
					'fairQty': pairQty}).draw(false); 
				let rowAdd = '';
				//view 테이블에 같은 품번이면 수량 더하기 아니면 행 추가
   				if ( $('#barcodeViewTable').DataTable().rows().count() != 0 ) {
    				//같은 품번이 있는지 확인 없으면 추가
   					$('#barcodeViewTable tbody tr').each(function(index3, item3) {
        				if ( barcodeViewTable.row(this).data().itemSeq == itemSeqVal ) {
        					$('span[name=fairQty]').eq(index3).text(rmDecimal(parseFloat($('span[name=fairQty]').eq(index3).text().replace(/,/g,'')) + parseFloat(pairQty)));
		        			rowAdd = 'ok';
        				}
        			});
        			if ( rowAdd == '' ) {
        				$('#barcodeViewTable').DataTable().row.add({
	    	    			'lotNo'		: barcodeNoVal,
	    	    			'itemSeq' 	: itemSeqVal,
	    	    			'itemCd'	: itemCdVal,
	    	    			'fairQty'	: rmDecimal(pairQty),
	    				}).draw(false);
	        		}
   				} else {
   					$('#barcodeViewTable').DataTable().row.add({
    	    			'lotNo'		: barcodeNoVal,
    	    			'itemSeq' 	: itemSeqVal,
    	    			'itemCd'	: itemCdVal,
    	    			'fairQty'	: rmDecimal(pairQty),
    				}).draw(false);
    			}

   				added = true; // 행이 추가되었음을 표시
			}
		});
		
		if (added) {
	        toastr.success("추가되었습니다.");
	    }

		$('#btnAllCheck').prop('checked', false);	//전체선택 해제
		$('#lotNoPopupModal').modal('hide');

		$('#btnSave').attr('disabled', false);
		$('#btnDelete').attr('disabled', false);
		$('#btnAllDelete').attr('disabled', false);
	});

	//품목조회 팝업창 행 클릭 시
	$(document).on('click', '#lotNoPopupTable tbody tr', function () {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
			$(this).find('input[name=check]').prop('checked', false);
		} else {
			$(this).addClass('selected');
			$(this).find('input[name=check]').prop('checked',true);
		}
	});
	
	//출고요청수량 값 변경 시 합계수량 변경되는 코드
	$(document).on('keyup', 'input[type=text][name=fairQty]', function () {
		let itemSeqVal = barcodeDtlTable.row($(this).closest('tr')).data().itemSeq;
		let fairQtyVal = 0;
		
		$('#barcodeDtlTable tbody tr').each(function() {
			if ( barcodeDtlTable.row(this).data().itemSeq == itemSeqVal ) {
				fairQtyVal += $(this).find('td input[name=fairQty]').val().replace(/,/g, '')*1;
			}
		});
	
		$('#barcodeViewTable tbody tr').each(function(idx) {
			if ( barcodeViewTable.row(this).data().itemSeq == itemSeqVal ) {
				$('span[name=fairQty]').eq(idx).text(rmDecimal(fairQtyVal));
			}
		});
	});
	
</script>

</body>
</html>
