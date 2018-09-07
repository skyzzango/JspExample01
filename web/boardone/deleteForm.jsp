<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-07
  Time: 오후 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>글 삭제</h3><br>
	<form name="deleteForm" action="deleteProc.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="num" value="<%= num %>">
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password" class="form-control" name="password" id="password" placeholder="비밀번호 입력" required>
		</div>
		<input class="btn btn-danger" type="submit" value="삭제">
		<input class="btn btn-info" type="button" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"
		       value="취소">
	</form>
</div>
</body>
</html>
