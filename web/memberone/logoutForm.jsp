<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../partials/loginCheck.jsp" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Logout</title>
	<%
		session.removeAttribute("loginId");
		System.out.println("session out loginId: " + session.getAttribute("loginId"));
	%>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>성공적으로 로그아웃 되었습니다.</h3><br>
	<a class="btn btn-info" href="login.jsp" role="button">로그인 페이지로 이동</a>
</div>
</body>
</html>
