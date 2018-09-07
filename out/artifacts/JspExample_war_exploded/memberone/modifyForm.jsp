<%@ page import="memberone.MemberDto" %>
<%@ page import="memberone.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-04
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../partials/loginCheck.jsp" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Modify Form</title>
	<%
		MemberDao dao = MemberDao.getInstance();
		String loginId = (String) session.getAttribute("loginId");
		MemberDto dto = dao.getMember(loginId);
	%>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>회원 정보 수정</h3><br>
	<form name="modifyForm" action="modifyProc.jsp" method="post" style="width: 20rem">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" class="form-control" name="id" id="id" aria-describedby="helpId" value="<%= dto.getId() %>">
			<small id="helpId" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password"
			       class="form-control" name="password" id="password" aria-describedby="helpPw1" value="<%= dto.getPassword() %>" required>
			<small id="helpPw1" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="password2">비밀번호 확인</label>
			<input type="password"
			       class="form-control" name="password2" id="password2" aria-describedby="helpPw2" value="<%= dto.getPassword() %>">
			<small id="helpPw2" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="email"
			       class="form-control" name="email" id="email" aria-describedby="helpEmail" value="<%= dto.getEmail() %>">
			<small id="helpEmail" class="form-text text-muted">Help text</small>
		</div>
		<button type="button" onclick="updateCheck()" class="btn btn-primary">수정</button>
		<button type="button" onclick="window.location='main.jsp'" class="btn btn-primary">취소</button>
		<button type="button" onclick="location.href='deleteForm.jsp'" class="btn btn-danger">회원탈퇴</button>
	</form>
</div>
</body>
</html>
