<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 12:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../partials/loginCheck.jsp" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Login</title>
	<%
		String loginId = (String) session.getAttribute("loginId");
	%>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>로그인 성공 여부</h3><br>
	<%
		if (loginId != null) {
			%>
	<h5><%= loginId %>님 환영합니다.</h5>
	<div class="btn-group" role="group" aria-label="button">
		<button type="button" onclick="location.href='logoutForm.jsp'" class="btn btn-primary">로그아웃</button>
	</div>
	<%
		} else {
	%>
		<script>
			alert("정상적인 접근이 아닙니다. 로그인 해 주세요.");
			location.href = "login.jsp";
		</script>
	<%
		}
	%>
</div>
</body>
</html>
