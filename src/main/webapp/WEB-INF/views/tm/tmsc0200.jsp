<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<%@include file="../layout/top.jsp" %>

<body>
<!-- .app -->
<div class="app pda_mo_wrap" style="display: flex;flex-direction: column;height: 100%;">
	<header class="pda_mo_hd">
		<a href="<c:url value="tmsc0100"/>" class="float-left"><img class="p-2" src="/resources/assets/images/mo_home_wh.png"></a> <a href="/tmsc0200"><p class="mo_main_title">구매</p></a>
	</header>
	<div class="mo_sortbox">
		<div class="main_btn_list row">
			<ul class="">
				<li><div><a href="<c:url value="tmsc0060"/>"><img src="/resources/assets/images/pda_list_img1.png"> <h6 class="pda_list_name">자재입고</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0070"/>"><img src="/resources/assets/images/pda_list_img2.png"> <h6 class="pda_list_name">자재출고</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0110"/>"><img src="/resources/assets/images/pda_list_img2.png"> <h6 class="pda_list_name">개별출고</h6></a></div></li>
				<li><div><a href="<c:url value="tmsc0150"/>"><img src="/resources/assets/images/pda_list_img2.png"> <h6 class="pda_list_name">자재입고(승인)</h6></a></div></li>
			</ul>
		</div>
	</div>
</div>
<!-- /.app -->

<script>
	$(document).attr("title","PDA Main");
</script>

</body>