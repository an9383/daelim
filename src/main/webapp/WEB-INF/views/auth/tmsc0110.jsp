<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>
<style>

</style>
<%@include file="../layout/top.jsp" %>

<body style="background: white;">

		<!-- /.app -->
		<div class="app pda_mo_wrap">
			<main>
				<div id="messageBox" class="alert alert-danger has-icon d-none"	role="alert">
					<div class="alert-icon">
						<span class="fa fa-info"></span>
					</div>
					<h5>오류</h5>
					<span id="message"></span>
				</div>
					<div class="container-fluid" id="main" style="background: white;">
						<div class="text-center p-5 mt-5">
							<img src="<c:url value='/resources/assets/images/logo/daerim_logo.jpg'/>" style="width: 255px; height: auto;">
						</div>
						<div class="p-4">
							<form class="login-form" id="loginForm">
								<div class="form-mb">
									<input style="max-width: 100%;background: #3d8ee530;" type="text" id="inputUser" class="form-control-lg" placeholder="아이디 ">
								</div>
								<div class="form-mb form-password">
									<input style="max-width: 100%;background: #3d8ee530;" type="password" id="inputPassword" class="form-control-lg" placeholder="비밀번호">
									<i class="fa fa-eye-slash fa-lg"></i>
								</div>
								
								<!-- 
			                    <div class="form-mb text-center mt-3">
			                      <div class="custom-control custobit
			                      m-control-inline custom-checkbox">
			                        <input type="checkbox" class="custom-control-input" id="rememberMe" name="rememberMe"> <label class="custom-control-label" for="rememberMe">자동 로그인</label>
			                      </div>
			                    </div>
			                     -->
			                    
								<div class="form-mb mt-4">
									<button class="login_btn1 btn btn-lg btn-block" type="submit" style="background: #3d3ee5!important">로그인</button>
									<!-- <button class="login_btn btn btn-lg btn-block">로그인</button> -->
								</div>
							</form>
							<!-- /.auth-form -->
							<div class="form-mb mt-6">
								<a href="/resources/assets/file/drauto.apk">
									<button class="login_btn1 btn btn-lg btn-block" style="background: #30318b!important">
										PDA APP 다운로드
									</button>
								</a>
							</div>
							<div class="form-mb mt-2">
								<a href="/resources/assets/file/hygino-release.apk">
									<button class="login_btn1 btn btn-lg btn-block" style="background: #6f70e5!important">
										 모바일 APP 다운로드
									</button>
								</a>
							</div>
						</div>
					</div>
			</main>
		</div>
		<!-- /.app -->
    
<%@include file="../layout/script.jsp" %>

<script>

	currentPage = "login";
	$('#loginForm').parsley();

	var loginUrl = '<c:url value="/tmsc0260"/>';

	$("#loginForm").submit(
			function(e) {
				e.preventDefault(e);
				//alert("login_ajax")
				$.ajax({
					type : 'POST',
					url : '<c:url value="/auth/login_ajax"/>',
					dataType : 'json',
					data : {
						userId : $('#inputUser').val(),
						userPw : $('#inputPassword').val(),
						rememberMe : $('input:checkbox[name="rememberMe"]').is(":checked"),
					},
					beforeSend : function() {
						$('.btn-login').addClass('d-none');
						$('.btn-loading').removeClass('d-none');
					},
					success : function(res) {
						if (res.result === 'ok') {
							$(location).attr('href', loginUrl);
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
