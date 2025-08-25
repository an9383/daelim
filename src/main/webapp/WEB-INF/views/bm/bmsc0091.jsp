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
				<li class="breadcrumb-item"><a href="#">기준정보관리</a></li>
				<li class="breadcrumb-item active">불량유형관리(봉제)</li>
			</ol>
		</nav>
	</header>
	<!-- #main============================================================== -->
	<div class="container-fluid" id="main">
		<div class="row table-wrap-hid">
			<!--======================== .left-list ========================-->
			<div class="left-list left-sidebar" id="left-list"
				style="width: 59%;">
				<div class="card">
					<div class="open-arrow" id="arrowLeft">
						<button id="left-width-btn" onclick="openrNav()"
							class="btn btn-primary input-sub-search" type="button">
							<i class="mdi mdi-arrow-left"></i>
						</button>
					</div>
					<!-- .table-responsive -->
					<div class="table-responsive">
						<table id="baseInfoFtTable" class="table table-bordered">
							<colgroup>
								<col width="7%">
								<col width="18%">
								<col width="17%">
								<col width="25%">
								<col width="13%">
								<col width="20%">
							</colgroup>
							<thead class="thead-light">
								<tr>
									<th>No.</th>
									<th>불량코드</th>
									<th class="text-center">불량유형구분</th>
									<th>불량유형명</th>
									<th>사용여부</th>
									<th>비고</th>
								</tr>
							</thead>
						</table>
					</div>
					<!-- /.table-responsive -->
				</div>
			</div>
			<!-- /.left-list -->

			<!--======================== .right-sidebar 등록,수정 ========================-->
			<div class="right-list right-sidebar" id="myrSidenav"
				style="width: 40%;">
				<div class="card mb-2" id="formBox">
					<!--오른쪽 등록 부분 상단 버튼 영역-->
					<div class="card-body col-sm-12">
						<div class="rightsidebar-close">
							<a href="javascript:void(0)" id="left-expand"
								class="closebtn float-right" onclick="closerNav()"><i
								class="mdi mdi-close"></i></a>
						</div>
						<button type="button" class="btn btn-primary d-none float-right" id="btnSave">저장</button>
						<button type="button" class="btn btn-danger float-right mr-1" id="btnDel">삭제</button>
						<button type="button" class="btn btn-warning float-right mr-1" id="btnEdit">수정</button>
						<button type="button" class="btn btn-primary float-right mr-1" id="btnAdd">등록</button>
					</div>
					<form id="form">
						<div class="table-responsive">
							<table class="table table-lg table-bordered mb-2">
								<colgroup>
									<col width="20%">
									<col width="30%">
									<col width="20%">
									<col width="30%">
								</colgroup>
								<tr>
									<th>*불량코드</th>
									<td><input type="text" class="form-control" id="baseInfoCd" name="baseInfoCd" placeholder="자동채번" style="text-align:center;" disabled></td>
									<th>*불량유형구분</th>
									<td><select class="custom-select" id="baseInfoGubun" name="baseInfoGubun" onChange="baseInfoGubunChange()"></select></td>
								</tr>
								<tr>
									<th>*불량유형명</th>
									<td><input type="text" class="form-control"
										style="max-width: 100%" id="baseInfoNm" name="baseInfoNm"></td>
									<th>*사용여부</th>
									<td><select class="custom-select" id="useYn" name="useYn"></select></td>
								</tr>
								<tr id="etc4Tr" class="d-none">
									<th>사용공정</th>
									<td>
										<div class="row">
											<div class="input-sub m-0" style="width: 80%;">
												<input type="hidden" class="form-control" id="etc4" disabled>
												<input type="text" class="form-control" id="etc4Nm" disabled>
												<button type="button" id="btnEtc4" class="btn btn-primary input-sub-search"
													onClick="etc4SelectInCorpCd()">
													<span class="oi oi-magnifying-glass"></span>
												</button>
											</div>
											<div class="ml-1" style="width: 5%;">
												<button type="button" id="etc4Delete" class="btn closeBtn" onclick="$('#etc4').val(''); $('#etc4Nm').val('');">
													<i class="mdi mdi-close"></i>
												</button>
											</div>
										</div>
									</td>
									<td colspan="2"><span style="color: red;">★ 사용공정 선택하지 않을 시 공통으로 사용</span></td>
								</tr>
								<tr>
									<th>비고</th>
									<td colspan="3"><input type="text" class="form-control"
										id="baseInfoDesc" name="baseInfoDesc" style="min-width:100%"></td>
								</tr>
							</table>
						</div>
					</form>
				</div>
				<table class="table table-bordered mt-5 d-none" id="changeHisTable">
					<colgroup>
						<col width="20%">
						<col width="30%">
						<col width="20%">
						<col width="30%">
					</colgroup>
					<tr>
						<th>변경내역</th>
						<td colspan='3'><input type="text" class="form-control" style="max-width: 100%"
							id="changeHis" maxlength="20"></td>
					</tr>
				</table>
			</div>
			<!-- ===/.right-sidebar 등록,수정===  -->
		</div>
		<!-- /.row -->
	</div>
	<!-- / #main  -->
	
	<!-- 품목정보관리 - 작업장 모달 시작-->
	<div class="modal fade bd-example-modal-lg" id="etc4PopUpModal" tabindex="-1" role="dialog" aria-labelledby="etc4PopUpModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
	      		<div class="modal-header">
	        		<h5 class="modal-title" id="etc4PopUpLabel">공정 조회</h5>
	        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          			<span aria-hidden="true">&times;</span>
	       			</button>
	      		</div> 
	      		<div class="modal-body">
	      			<hr class="text-secondary">	         
	        			<table id="etc4PopUpTable" class="table table-bordered">
	                   		<thead class="thead-light">
		                   		<tr>
									<th style="width : 20%">공정코드</th>
									<th style="width : 80%">공정명</th>
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
	<!-- 품목정보관리 - 작업장 모달 종료-->
</div>
<!-- /.page-wrapper -->

<%@include file="../layout/bottom.jsp" %>

<script>
	$("#left-width-btn").click(function() {
		{
			$("#left-list").animate({
				width : "59%"
			}, 200);
			$("#arrow-left").animate({
				display : "none"
			}, 200);
		}

		state = !state;
	});

	let currentHref = "bmsc0091";
	let currentPage = $('.' + currentHref).attr('id');

	$('#' + currentPage).closest('.has-child', 'li').addClass(
			'has-open has-active');
	$('#' + currentPage).closest('.menu-item').addClass('has-active');
	$(document).attr("title","불량유형관리(봉제)"); 
	let viewIdx;
	let sideView = 'add';
	uiProc(true);
	var tableIdx=null;
	let baseInfoCd ='';

	
	//공통코드 처리 시작      
	var useYnCode = new Array(); // 상태여부
	var baseInfoType = "FT";
	<c:forEach items="${useYn}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	useYnCode.push(json);
	</c:forEach>
	
	var baseInfoGubunCode = new Array(); // 불량유형구분
	<c:forEach items="${baseInfoGubun}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	baseInfoGubunCode.push(json);
	</c:forEach>
	
	var etc1 = new Array(); // 우선순위
	<c:forEach items="${etc1}" var="info">
	var json = new Object();
	json.baseCd = "${info.baseCd}";
	json.baseNm = "${info.baseNm}";
	etc1.push(json);
	</c:forEach>
	//공통코드 처리 종료   

	//선택박스 처리
	selectBoxAppend(useYnCode, "useYn", "", "");
	selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
	selectBoxAppend(etc1, "etc1", "", "2");

	$('#saveBtnModalY').on('click', function() {
		uiProc(true);
		$('#btnSave').addClass('d-none');
		$('#btnAdd').attr('disabled', false);
		$('#btnEdit').attr('disabled', false);
		$('#btnDel').attr('disabled', false);
		$('#changeHisTable').addClass('d-none');
		$('#changeHis').val('');
	});

	$("#dealCorpNm").attr("disabled", true);

	// 목록
	let baseInfoFtTable = $('#baseInfoFtTable').DataTable({
		dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
				+ "<'row'<'col-sm-12'tr>>"
				+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'p>>B",
		language : lang_kor,
		paging : true,
		info : true,
		ordering : true,
		processing : true,
		autoWidth : false,
		lengthChange : false,
		pageLength : 20,
		ajax : {
			url : '<c:url value="bm/baseInfoFtList"/>',
			type : 'GET',
			data : {
				'etc1' : '002'
			},
		},
		rowId : 'baseInfoSeq',
		columns : [
			{ //No.
				render : function(data, type, row, meta) {
					return meta.row + meta.settings._iDisplayStart + 1;
				}
			},
			{ data : 'baseInfoCd', 'className' : 'text-center' }, //불량코드
			{ data : 'baseInfoGubunNm', 'className' : 'text-center' }, //불량유형구분 
			{ data : 'baseInfoNm', 'className' : 'text-center' }, //불량유형명
			{ data : 'useYnNm', 'className' : 'text-center' }, //사용여부
			{ data : 'baseInfoDesc', 'className' : 'text-center' }, //비고
		],
		order : [],
		buttons : [ 'copy', {
			extend : 'excel',
			title : '불량유형관리(봉제)'
		}, 'print' ],
		columnDefs : []
	});
	
	// 보기
	$('#baseInfoFtTable tbody').on('click','tr',function() {

		if ($('#btnSave').attr('class') == 'btn btn-primary float-right') {
			$('#saveBtnModal').modal('show');
			console.log("등록중입니다.");
			return false;
		}

		if ($(this).hasClass('selected')) {
			//$(this).removeClass('selected');
		} else {
			$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}

		tableIdx = $('#baseInfoFtTable').DataTable().row(this).index();
		
		baseInfoSeq = baseInfoFtTable.row(this).data().baseInfoSeq;
		baseInfoCd = baseInfoFtTable.row(this).data().baseInfoCd;
		$('#formBox').removeClass('d-none');
		$('#btnSave').addClass('d-none'); // 저장버튼
		$('#btnEdit').attr('disabled', false); //수정버튼
		$('#btnDel').attr('disabled', false); //수정버튼
		
		//선택 행 데이터 불러오기
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtRead"/>',
			type : 'GET',
			data : {
				'baseInfoType' : baseInfoType,
				'baseInfoSeq' : baseInfoSeq
			},
			success : function(res) {
				let data = res.data;
				sideView = 'edit';
				$('#form input[name="baseInfoCd"]').val(data.baseInfoCd);
				$('#form input[name="baseInfoNm"]').val(data.baseInfoNm);
				$('#form input[name="baseInfoDesc"]').val(data.baseInfoDesc);
				
				if ( data.baseInfoGubun === '003' ) {
					$('#etc4Tr').removeClass('d-none');
					$('#etc4').val(data.etc4);
					$('#etc4Nm').val(data.etc4Nm);
				} else {
					$('#etc4Tr').addClass('d-none');
					$('#etc4').val('');
					$('#etc4Nm').val('');
				}
				

				//선택박스 처리
				selectBoxAppend(useYnCode, "useYn", data.useYn, "");
				selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", data.baseInfoGubun, "");
				selectBoxAppend(etc1, "etc1", data.etc1, "2");
				
				gubunVal = baseInfoFtTable.row(tableIdx).data().baseInfoGubun;
			}
		});
		
	});
	
	// 등록폼
	$('#btnAdd').on('click', function() {
		sideView = 'add';
		$('#form').each(function() {
			this.reset();
		});
		
		//선택한 행 취소
		$('#baseInfoFtTable').DataTable().$('tr.selected').removeClass('selected');
		
		//설비코드 중복체크
		/* $('#equipCdCheck').val("false"); */
		$('#btnCheck').attr("disabled", false);
		$('#btnDel').attr("disabled", false);
		//화면처리        
		uiProc(false);
		
		//셀렉트박스 처리
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
		selectBoxAppend(etc1, "etc1", "", "2");

		//선택박스처리
		$('#useYn option[value="001"]').attr('selected', 'selected');
		$('#baseInfoGubun option[value="001"]').attr('selected', 'selected');
		$('#etc1 option[value=""]').attr('selected', 'selected');

		$('#etc4Tr').addClass('d-none');
		$('#etc4').val('');
		$('#etc4Nm').val('');
		
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnEdit').attr('disabled', true); //수정버튼
		$('#btnDel').attr('disabled', true); //삭제버튼
		$('#btnSave').removeClass('d-none'); // 등록버튼
	});

	// 수정폼
	$('#btnEdit').on('click', function() {
		if (sideView != 'edit') {
			toastr.warning("수정할 목록을 선택해 주세요!");
			return false;
		}
		uiProc(false);
		//수정관련 기능(검사코드는 수정 불가)
		$('#baseInfoCd').attr('disabled', true);

		$('#btnAdd').attr('disabled', true);
		$('#btnDel').attr('disabled', true);
		$('#viewBox').addClass('d-none');
		$('#formBox').removeClass('d-none');
		$('#btnSave').removeClass('d-none');
		$('#changeHisTable').removeClass('d-none');
	});
	
	//삭제폼
	$('#btnDel').on('click', function() {
		if (sideView == 'add') {
			toastr.warning("삭제할 목록을 선택해 주세요.");
			return false;
		}

		
		$.ajax({
			url : '<c:url value="/bm/baseInfoAdmFTDelExp"/>',
			type : 'POST',
			data :{
				'baseInfoCd' : function(){return baseInfoCd;}
			},
			beforeSend : function(){
				$('#my-spinner').show();
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					$('#deleteSmallModal').modal('show');
				}else if (res.result == 'fail') {
					toastr.warning('이미 사용중인 불량유형은 삭제할 수 없습니다.')
				}else {
					toastr.error(res.message);
				}

				$('#my-spinner').hide();
			}
		});
		
	});


	$('#btnDeleteY').on('click',function(){
		
		sideView = 'add';
		
		$.ajax({
			url : '<c:url value="/bm/baseInfoFtDataDelete"/>',
			type : 'POST',
			data :{
				'baseInfoSeq' : function(){return baseInfoSeq;}
			},
			success : function(res) {
				let data = res.result;
				if (res.result == 'ok') {
					toastr.success('삭제되었습니다.');
					$('#baseInfoFtTable').DataTable().ajax.reload(function() {});
				}else {
					toastr.error(res.message);
				}
			}
		});
		
		$('#form').each(function(){this.reset();});
		selectBoxAppend(useYnCode, "useYn", "", "");
		selectBoxAppend(baseInfoGubunCode, "baseInfoGubun", "", "");
		selectBoxAppend(etc1, "etc1", "", "2");

		$('#deleteSmallModal').modal('hide');
	})
	
	
	// 저장 처리
	$('#btnSave').on('click', function() {

		//입력값 검사
		if (!$.trim($('#baseInfoNm').val())) {
			toastr.warning('불량유형명을 입력해주세요.');
			$('#baseInfoNm').focus();
			return false;
		}

		let url = '<c:url value="/bm/baseInfoFtCreate"/>';
		if (sideView == "edit") {
			url = '<c:url value="/bm/baseInfoFtUpdate"/>';
		} else {
			baseInfoSeq = "";
		}

		$.ajax({
			url : url,
			type : 'POST',
			async : false,
			data : {
				'baseInfoSeq' : baseInfoSeq,
				'baseInfoType' : baseInfoType,
				'baseInfoCd' : $('#baseInfoCd').val(),
				'baseInfoNm' : $('#baseInfoNm').val(),
				'baseInfoDesc' : $('#baseInfoDesc').val(),
				'baseInfoGubun' : $('#baseInfoGubun option:selected').val(),
				'etc1' : '002', //사출/봉제
				'etc3' : '',
				'etc4' : $('#etc4').val(), //공정
				'useYn' : $('#useYn option:selected').val()
			},
			beforeSend : function() {
			},
			success : function(res) {
				let data = res.data;
				if (res.result == 'ok') {
					$('#baseInfoFtTable').DataTable().ajax.reload(function(){});
					uiProc(true);
					$('#btnSave').addClass('d-none');
					if (sideView == "edit") {
						toastr.success('수정되었습니다.');
					} else {
						toastr.success('등록되었습니다.');
					}

					$('#btnAdd').attr('disabled', false);
					$('#btnEdit').attr('disabled', false);
					$('#btnDel').attr('disabled', false);
					$('#baseInfoFtTable').DataTable().ajax.reload();
				} else {
					toastr.error(res.message);
				}
			},
			complete : function() {
			}
		});
		
		if (sideView == "edit" && !(!$.trim($('#changeHis').val()))) {
			let url = '/sm/systemChangeLogCreate';

			$.ajax({
				url : url,
				type : 'POST',
				async : false,
				data : {
					'changeHis'  : $('#changeHis').val(),
					'menuPath'  : currentHref,
				},
				success : function(res) {
					let data = res.data;
					if (res.result == 'ok') {
						toastr.success('변경내역이 등록되었습니다.');
						$('#changeHisTable').addClass('d-none');
						$('#changeHis').val('');
					} else {
						toastr.error(res.message);
					}
				},
				complete : function() {
					
				}
			});
		}else{
			$('#changeHisTable').addClass('d-none');
		}
		
	});
	
	//화면 설정
	function uiProc(flag) {
		$("#baseInfoNm").attr("disabled", flag);
		$("#baseInfoDesc").attr("disabled", flag);
		$("#useYn").attr("disabled", flag);
		$("#baseInfoGubun").attr("disabled", flag);
		$("#etc1").attr("disabled", flag);
		$("#btnEtc4").attr("disabled", flag);
		$("#etc4Delete").attr("disabled", flag);
	}
	
	//작업장 팝업 시작
	let etc4PopUpTable;
	function etc4SelectInCorpCd() {
		$('#etc4PopUpModal').modal('show');
		
		if (etc4PopUpTable == null || etc4PopUpTable == undefined) {
			etc4PopUpTable = $('#etc4PopUpTable').DataTable({
				dom : "<'row'<'col-sm-12 col-md-6'l><'col-sm-12 col-md-6'f>>"
						+ "<'row'<'col-sm-12'tr>>"
						+ "<'row'<'col-sm-12 col-md-5'i><'col-sm-12 col-md-7'>>B",
				language : lang_kor,
				paging : true,
				info : true,
				ordering : true,
				processing : true,
				autoWidth : false,
				scrollX : false,
				lengthChange : true,
				pageLength : -1,
				scrollY : '40vh',
				select: {
		            style: 'multi'
		        },
				ajax : {
					url : '<c:url value="/bm/prcssItemWorkplace"/>',
					type : 'GET',
					data : {
						'prcssGubun' : '002',
						'prcssType' : '001'
					},
				},
				columns : [ 
					{ data : 'prcssCd', "className" : "text-center" }, //공정코드
					{ data : 'prcssNm', "className" : "text-center" }, //공정명
				],
				columnDefs : [],
				order : [ [ 0, 'asc' ] ],
				buttons : [],
			});
			
			let html2 = '<div class="row">';
			html2 += '<button type="button" class="btn btn-primary" id="btnEtc4Select">선택</button>'
			html2 += '</div>';

			$('#etc4PopUpTable_length').html(html2);

			//선택 버튼 클릭시
			$('#btnEtc4Select').on('click', function() {
				if ( etc4PopUpTable.rows('.selected').data().length > 0 ) {
					let selectedRows = etc4PopUpTable.rows('.selected');
					let dealCorpNmVal = selectedRows.data().pluck('prcssNm').toArray()[0];
					dealCorpNmVal += selectedRows.data().length > 1 ? ' 외 ' + ( selectedRows.data().length - 1 ) + '개' : '';
					$('#etc4Nm').val(dealCorpNmVal);
					
					$('#etc4').val(selectedRows.data().pluck('prcssCd').toArray());
					
					$('#etc4PopUpModal').modal('hide');
				} else {
					toastr.warning('항목을 선택해주세요.');
				}
			});
			
		} else {
			$('#etc4PopUpTable').DataTable().ajax.reload(function(){});
		}

		setTimeout(function(){
			etc4PopUpTable.draw();
		},150);
		
		$('#etc4PopUpTable').on('draw.dt', function () {
			// 이벤트 핸들러 함수에서 코드를 작성합니다.
			etc4PopUpTable.rows().every(function() {
			    const rowData = this.data();
			    const etc4DataArr = $('#etc4').val().split(',');

			    const prcssCdArr = rowData.prcssCd.split(',');

			    if (etc4DataArr.some(val => prcssCdArr.includes(val))) {
			    	this.select();
				}
			});
		});
	}
	
	function baseInfoGubunChange(){
		if ( $('#baseInfoGubun').val() === '003' ) {
			$('#etc4Tr').removeClass('d-none');
		} else {
			$('#etc4Tr').addClass('d-none');
			$('#etc4').val('');
			$('#etc4Nm').val('');
		}
	}
	
</script>

</body>
</html>
