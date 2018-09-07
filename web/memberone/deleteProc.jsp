<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 12:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../partials/loginCheck.jsp" %>
<jsp:useBean id="dao" class="memberone.MemberDao"/>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>회원 탈퇴</title>
	<%
		String id = (String) session.getAttribute("loginId");
		String password = request.getParameter("password");
		int check = dao.deleteMember(id, password);
	%>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<%
		if (check == 1) {
			session.invalidate();
	%>
	<meta http-equiv="refresh" content="3; url = login.jsp">
	<h3>탈퇴가 완료 되었습니다.</h3><br>
	<h5>3초 후에 로그인 페이지로 이동합니다.</h5>
	<%
	} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
</div>
</body>
</html>
