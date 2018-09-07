<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 12:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="dao" class="memberone.MemberDao"/>
<jsp:useBean id="dto" class="memberone.MemberDto"/>
<jsp:setProperty name="dto" property="*"/>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Update Process</title>
	<%
		request.setCharacterEncoding("UTF-8");
		String loginId = (String) session.getAttribute("loginId");
		dto.setId(loginId);
		dao.memberUpdate(dto);
	%>
	<meta http-equiv="refresh" content="3; url = main.jsp">
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>회원 정보가 수정 되었습니다.</h3><br>
	<h5>3초 후에 로그인 페이지로 이동합니다.</h5>
</div>
</body>
</html>
