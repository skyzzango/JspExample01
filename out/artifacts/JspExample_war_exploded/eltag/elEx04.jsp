<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-16
  Time: 오후 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setAttribute("name", "홍길동");
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.html" %>
	<title>El Example</title>
</head>
<body>
<%@include file="../partials/nav.html" %>
<div class="starter-template" style="background-size: auto">
	<div class="container-fluid col-9">
		<h3>El 표기 04 : 기본 객체 사용</h3><br>
		<ul class="list-group">
			<li class="list-group-item">요청 URI : ${ pageContext.request.requestURI }</li>
			<li class="list-group-item">request 의 name 속성 : ${ requestScope.name }</li>
			<li class="list-group-item">code 파라미터 : ${ param.code }</li>
		</ul>
	</div>
</div>
</body>
</html>
