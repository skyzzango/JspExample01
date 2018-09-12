<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-12
  Time: 오후 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>전송 결과</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>전송 결과 페이지</h3><br>
	<%
		request.setCharacterEncoding("UTF-8");
		String savePath = "/fileUpload/upload";
		String encType = "UTF-8";
		ServletContext context = session.getServletContext();
		String path = context.getRealPath("fileUpload/upload");
		System.out.println(path);
		Enumeration<String> initParameterNames = getServletConfig().getInitParameterNames();
	%>
</div>
</body>
</html>
