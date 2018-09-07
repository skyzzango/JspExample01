<%@ page import="memberone.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-04
  Time: 오후 6:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>ID 중복 체크</title>
	<%
		MemberDao dao = MemberDao.getInstance();
		String id = request.getParameter("id");
		boolean check = dao.idCheck(id);
	%>
</head>
<body>
<div class="starter-template" style="background-size: auto">
	<h3>아이디 중복 확인</h3><br>
	<h5>
		<%= id %>
		<%
			if (!check) {
				out.println("는 이미 존재하는 ID 입니다.");
			} else {
				out.println("는 사용 가능한 ID 입니다.");
			}
		%>
	</h5>
	<br>
	<input class="btn btn-secondary" type="button" onclick="self.close()" value="닫기">
</div>
</body>
</html>
