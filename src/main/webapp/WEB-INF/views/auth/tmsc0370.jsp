<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<%@include file="../layout/top.jsp" %>
<body  style="background: white;">

<!-- /.app -->
<div class="app pda_mo_wrap">
	<main>
		<!-- <div id="messageBox" class="alert alert-danger has-icon d-none"	role="alert">
			<div class="alert-icon">
				<span class="fa fa-info"></span>
			</div>
			<h5>오류</h5>
			<span id="message"></span>
		</div> -->
		<div class="container-fluid" id="main" style="background: white;">
			<div class="text-center p-5 mt-5">
				<img src="<c:url value='/resources/assets/images/logo/daerim_logo.jpg'/>" style="width: 255px; height: auto;">
			</div>
			<div class="mt-4 p-4">
				<form class="login-form" id="loginForm">
					<div class="mb-4">
						<select style="max-width: 100%;background: #3d8ee530;" id="prcssIdx" class="form-control-lg"></select>
					</div>
					<div class="mb-3">
						<input style="max-width: 100%;background: #3d8ee530;" type="text" id="inputUser" class="form-control-lg" placeholder="아이디">
					</div>
					<div class="mb-2 form-password">
						<input style="max-width: 100%;background: #3d8ee530;" type="password" id="inputPassword" class="form-control-lg" placeholder="비밀번호">
					</div>
					<div class="mb-4" style="
						    text-align: center;
						    border-radius: 10px;
						    padding: 5px;
						">
						<span id="message" style="font-weight: 400;font-size: small;color: red;"></span>
					</div>
					<div class="form-mb mt-5">
						<button class="login_btn1 btn btn-lg btn-block" type="submit" style="background: #3d3ee5!important">로그인</button>
					</div>
					<div class="form-mb mt-2">
						<a href="/resources/assets/file/hygino-release.apk">
							<button class="login_btn1 btn btn-lg btn-block" style="background: #6f70e5!important">
								 모바일 APP 다운로드
							</button>
						</a>
					</div>
				</form>
			</div>
		</div>
	</main>
</div>
<!-- /.app -->
    
<%@include file="../layout/script.jsp" %>

<script>
	const currentPage = "login";
	$('#loginForm').parsley();

	//공통코드 설정
	const prcssCodeList = new Array();
	<c:forEach items = "${prcssCode}" var="info">
	var json = new Object();
	json.baseCd = `${info.prcssCd}|${info.prcssType}|${info.lowerPrcssCd}|${info.prcssSeq}`;
	json.baseNm = "${info.prcssNm}";
	prcssCodeList.push(json);
	</c:forEach>
	
	selectBoxAppend(prcssCodeList, "prcssIdx", "", "");
	////공통코드 설정 끝
	
	$("#loginForm").submit(function(e) {
		e.preventDefault(e);
		$.ajax({
			type : 'POST',
			url : '<c:url value="/auth/loginPrcss"/>',
			dataType : 'json',
			data : {
				'departmentCd' 	: function(){ return $('#prcssIdx').val(); },
				'userId' 		: function(){ return $('#inputUser').val(); },
				'userPw' 		: function(){ return $('#inputPassword').val(); },
			},
			beforeSend : function() {
				$('.btn-login').addClass('d-none');
				$('.btn-loading').removeClass('d-none');
			},
			success : function(res) {
				if (res.result === 'ok') {
					$(location).attr('href', '<c:url value="/tmsc0371"/>');
				} else {
					$('#password').val('');
					$('#message').text(res.message);
					$('#messageBox').removeClass('d-none');
				}
			},
			complete : function() {
				$('.btn-login').removeClass('d-none');
				$('.btn-loading').addClass('d-none');
			}
		});
	});
	
</script>
</body>
</html>
