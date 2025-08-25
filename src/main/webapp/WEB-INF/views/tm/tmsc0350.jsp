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
		<a href="<c:url value="/tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0350"><p class="mo_main_title">협력사출고</p></a>
	</header>
	<!--====-sortbox-->
	<div class="mo_sortbox">
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">출하일자</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input class="form-control-md" type="date" id="outputDate" />
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">출고처</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="hidden" class="form-control" id="poCorpCd">
				<input type="text" class="form-control-md" id="poCorpNm" style="min-width:100%" disabled>
				<button type="button" class="btn btn-primary input-sub-search-md" id="btnPoCorpCd" name="btnPoCorpCd" onClick="selectPoCorpCd()">
					<span class="oi oi-magnifying-glass" style="font-size: 15px"></span>
				</button>
			</div>
		</div>
		<div class="col-12 row p-1">
			<div class="col-3 mo_sort_title">LOT NO</div>
			<div class="form-group input-sub col-9 m-0 p-0">
				<input type="text" class="form-control-md" id="barcodeNo" inputmode="none" placeholder="스캐너만 입력">
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
			<button type="button" class="btn btn-success float-right mr-1" disabled id="btnSave">출고</button>
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
								<th>LOT NO</th>
								<th>품번</th>
								<th>출고수량</th>
							</tr>
						</thead>
					</table>
				</div>
				
				<div class="table-responsive">
					<table id="barcodeViewTable" class="table table-bordered table-td-center">
						<thead class="thead-light">
							<tr>
								<th class="d-none">No.</th>
								<th style="min-width: 220px">품번</th>
								<th class="text-center-th" style="min-width: 80px">출고수량</th>
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
</div>
<!-- /.app -->
<script type="text/javascript" src="/resources/assets/javascript/pages/calendar.js"></script>

<%@include file="../layout/script.jsp" %>
<%@include file="../layout/bottom.jsp" %>
<script>

	$(document).attr("title","협력사출고");
	let menuAuth = 'tmsc0350';
	var serverDateFrom = "${serverDateFrom}"
	var serverDateTo = "${serverDateTo}"
	var serverDate = "${serverDate}"
	var itemCdVal = null;
	var itemSeqVal = null;
	var itemCusVal = null;
	var userNm = "${userNm}"
	var userNumber = "${userNumber}"
	var barcodeNo = null;
	var apGubun = 'PA';
	var barcodeNoVal = null;
	var count = 0;
	var pairQty = null;

	var userId = "${userId}";		// 로그인 사용자 정보
	var menuUrl = "${menuUrl}";		// 메뉴 경로
	
	$('#outputDate').val(serverDate);
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
			{ render : function(data, type, row, meta) { return meta.row+ meta.settings._iDisplayStart+ 1; }, 'className' : 'text-center' }, //No.
			{ data : 'lotNo', 'className' : 'text-center' },
			{ data : 'itemCd', 'className' : 'text-center' },
			{
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
			ordering : true,
			processing : true,
			autoWidth : false,
			lengthChange : false,
			searching : false,
			scrollY : "110px",
			pageLength : 20,
			ajax : {
				url : '<c:url value="bs/deliveryOrderAdmReset"/>',
				type : 'GET',
				data : {}	
			},	
			rowId : 'itemSeq',
			columns : [ 
				{
					render : function(data, type, row, meta) {
						return meta.row+ meta.settings._iDisplayStart+ 1;
					},
					'className' : 'text-center'
				},
				
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
		        {"targets": [0], "visible" : false}
		    ], 
		    order: [
			    [0, 'desc']
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
		if (e.which == 13) {
			let check = true;
	    	if ( !$.trim($('#barcodeNo').val()) ) {
				toastr.warning('바코드를 스캔해주세요.');
				$('#barcodeNo').focus();
				check = false;
				return false;
			}
			
	    	//이미 추가한 바코드인지 확인
			if ( check && ($('#barcodeDtlTable').DataTable().rows().count() != 0) ) {
				$('#barcodeDtlTable tbody tr').each(function(index, item) {
					if ( barcodeDtlTable.row(index).data().lotNo == $('#barcodeNo').val() ) {
						$('#barcodeNo').focus();
						$('#barcodeNo').select();
						toastr.warning("이미 추가된 바코드입니다. 확인해주세요.");
						check = false;
						return false;
					}
				});
			} 

	        if (check) {
				var barcodeNoArr = new Array();
				let barcodeList = ''; // 선입선출 조건 추가
				var i = '0';
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
			
				if (check) {
				 	$.ajax({
		            	url: '<c:url value="io/supplyOutCreate"/>',
		                type: 'GET',
		                async:false,
		                data: {
		                	'barcodeNo'		: function(){ return $('#barcodeNo').val(); },
		                	'barcodeList'	: function(){ return barcodeList; }, 
		                },
		                success: function (res) {
		                    if (res.result == 'ok') {
		                    	let data = res.data;
		                    	$('#barcodeDtlTable').DataTable().row.add({
		                    		'lotNo' 	: data[0].barcodeNo,
		                    		'itemSeq' 	: data[0].itemSeq,
		                    		'itemCd' 	: data[0].spCd,
		                    		'fairQty' 	: data[0].realQty,
		                    		'locCd' 	: data[0].locationCd,
		                    		'locNo' 	: data[0].locationNo,
		                    	}).draw(false);


		                    	let rowAdd = '';

			    				//view 테이블에 같은 품번이면 수량 더하기 아니면 행 추가
			    				if ( $('#barcodeViewTable').DataTable().rows().count() != 0 ) {
				    				//같은 품번이 있는지 확인 없으면 추가
			    					$('#barcodeViewTable tbody tr').each(function(index, item) {
				    					console.log("index:"+index)
				    					console.log(" barcodeViewTable.row(this).data().itemSeq:"+ barcodeViewTable.row(this).data().itemSeq)
				    					console.log(" data.itemSeq:"+ data[0].itemSeq)
				    					
				        				if ( barcodeViewTable.row(this).data().itemSeq == data[0].itemSeq ) {
				        					$('span[name=fairQty]').eq(index).text(rmDecimal(parseFloat($('span[name=fairQty]').eq(index).text().replace(/,/g,'')) + parseFloat(data[0].realQty)));
						        			rowAdd = 'ok';
				        				}
				        			});
				        			if ( rowAdd == '' ) {
				        				$('#barcodeViewTable').DataTable().row.add({
					    	    			'lotNo'		: data[0].barcodeNo,
					    	    			'itemSeq' 	: data[0].itemSeq,
					    	    			'itemCd'	: data[0].spCd,
					    	    			'fairQty'	: rmDecimal(data[0].realQty),
					    				}).draw(false);
					        		}
			    				} else {
			    					$('#barcodeViewTable').DataTable().row.add({
				    	    			'lotNo'		: data[0].barcodeNo,
				    	    			'itemSeq' 	: data[0].itemSeq,
				    	    			'itemCd'	: data[0].spCd,
				    	    			'fairQty'	: rmDecimal(data[0].realQty),
				    				}).draw(false);
				    			}

		                    	
		                    	$('#btnSave').attr('disabled', false);
				    			$('#btnDelete').attr('disabled', false);
				    			$('#btnAllDelete').attr('disabled', false);
				    			$('#barcodeNo').val('');
		                        toastr.success(res.message);
		                        
		                    } else if ( res.result == "fail" ) {
		                    	toastr.warning(res.message);
		                    	$('#barcodeNoScan').select();
		                    	$('#barcodeNo').focus();
								$('#barcodeNo').select();
		                    	
			                } else {
			                	toastr.error(res.message, '', {timeOut: 5000});
				            }
			             },
			             complete:function(){
			             }
			        });
				}
			}
		}
	});


  	//라인삭제 버튼
	$('#btnDelete').on('click',function() {

		if($('#barcodeDtlTable').DataTable().rows().count()==0) {
			toastr.warning("삭제할 데이터가 없습니다.");
			return false;
		}
		
		if(lineCheck == false) {
			toastr.warning("라인을 선택해 주세요.");
			return false;
		}
		
		$('#barcodeViewTable tbody tr').each(function(index, item) {
			if(barcodeViewTable.row( this ).data().itemSeq==$('#barcodeDtlTable').DataTable().row('.selected').data().itemSeq){
				if(parseFloat($('span[name=fairQty]').eq(index).text()) - parseFloat($('#barcodeDtlTable').DataTable().row('.selected').data().fairQty)==0) {
					$('#barcodeViewTable').DataTable().row(this).remove().draw();	
				} else {
					$('span[name=fairQty]').eq(index).text(rmDecimal(parseFloat($('span[name=fairQty]').eq(index).text().replace(/,/g,'')) - parseFloat($('#barcodeDtlTable').DataTable().row('.selected').data().fairQty)));
				}
				$('#barcodeDtlTable').DataTable().row('.selected').remove().draw();				
			}
		});
		lineCheck = false;
	});

	//전체삭제 버튼
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
  	
  	
	// 협력사출고
	$('#btnSave').on('click', function(){
		let check = true;
		let dataArray = new Array();
		
		if ( $('#poCorpCd').val() == '' ) {
			toastr.warning("출고처를 선택해 주세요.");
			$('#my-spinner').hide();
			check = false;
			return false;
		}
		if ( $('#barcodeDtlTable').DataTable().rows().count() == 0 ) {
			toastr.warning("등록할 데이터가 없습니다.");
			$('#my-spinner').hide();
			check = false;
			return false;
		}

		$('#barcodeDtlTable tbody tr').each(function(index, item){
			if ( $(this).find('td input[name=fairQty]').val().replace(/,/g, '')*1 <= 0 ) {
				toastr.warning("출고수량을 입력해주세요.");
				$(this).find('td input[name=fairQty]').focus();
				check = false;
				return false;
			}
			if ( $(this).find('td input[name=fairQty]').val().replace(/,/g, '')*1 > $(this).find('td input[name=fairQty]').attr('placeholder').replace(/,/g, '')*1 ) {
				toastr.warning("출고수량을 " + $(this).find('td input[name=fairQty]').attr('placeholder').replace(/,/g, '') + "개 이하로 입력해주세요.");
				$(this).find('td input[name=fairQty]').focus();
				check = false;
				return false;
			}
			
			var rowData = new Object();
			rowData.outputDate = $('#outputDate').val().replace(/-/g,'');
			rowData.poCorpCd = $('#poCorpCd').val();
			rowData.lotNo = barcodeDtlTable.row(this).data().lotNo;
			rowData.itemSeq = barcodeDtlTable.row(this).data().itemSeq;
			rowData.targetQty = $(this).find('td input[name=fairQty]').val().replace(/,/g, '');
			rowData.locCd = barcodeDtlTable.row(this).data().locCd;
			rowData.locNo = barcodeDtlTable.row(this).data().locNo;
	        dataArray.push(rowData);
		});
		
		if (check) {
			$.ajax({
				url : '<c:url value="bs/deliveryOrderAdmPda0350Create"/>',
				type : 'POST',
				datatype: 'json',
				data: JSON.stringify(dataArray),
				contentType : "application/json; charset=UTF-8",
				beforeSend : function() {
					$('#my-spinner').show(); //로딩중 모달 시작
				},
				success : function(res) {
					if (res.result == 'ok') {
						$('#btnAllDelete').attr('disabled', true);
	                	$('#btnDelete').attr('disabled', true);
	                	$('#btnSave').attr('disabled', true);
						toastr.success('협력사출고 되었습니다.');
						$('#barcodeDtlTable').DataTable().clear().draw();
						$('#barcodeViewTable').DataTable().clear().draw();
						$('#poCorpCd').val('');
						$('#poCorpNm').val('');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					$('#my-spinner').hide(); //로딩중 모달 끝
				}
			});
		}
		
	});

	//출고처 팝업 시작
   	var dealCorpPopUpTable4;
   	function selectPoCorpCd() {
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
						'dealArr' : function(){return ['001','002']},
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
		    	var data = dealCorpPopUpTable4.row( this ).data();
				$('#poCorpCd').val(data.dealCorpCd);
				$('#poCorpNm').val(data.dealCorpNm);
				itemCusVal = data.dealCorpCd;
                $('#dealCorpPopUpModal4').modal('hide');
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
	
	//출고수량 값 변경 시 합계수량 변경되는 코드
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
<

/html>
