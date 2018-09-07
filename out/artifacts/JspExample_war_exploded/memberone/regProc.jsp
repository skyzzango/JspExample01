<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-04
  Time: 오후 6:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="dao" class="memberone.MemberDao"/>
<jsp:useBean id="dto" class="memberone.MemberDto"/>
<jsp:setProperty name="dto" property="*"/>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>회원 가입 확인</title>
	<%
		request.setCharacterEncoding("UTF-8");
		boolean flag = dao.memberInsert(dto);
	%>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>가입 확인</h3><br>
	<%
		if (flag) {
	%>
	<h5>회원 가입을 축하 드립니다.</h5><br>
	<button type="button" class="btn btn-primary" onclick="window.location='login.jsp'">로그인</button>
	<%
	} else {
	%>
	<h5>다시 입력 하여 주십시오.</h5><br>
	<button type="button" class="btn btn-primary" onclick="window.location='regForm.jsp'">돌아가기</button>
	<%
		}
	%>
</div>
</body>
</html>
