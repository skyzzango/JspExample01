<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-04
  Time: 오후 4:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Login Form</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>로그인 화면</h3><br>
	<form name="loginForm" action="loginProc.jsp" method="post" style="width: 20rem" onsubmit="return loginInputCheck()">
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text"
			       class="form-control" name="id" id="id" aria-describedby="helpId" placeholder="아이디 입력">
			<small id="helpId" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password"
			       class="form-control" name="password" id="password" aria-describedby="helpPw" placeholder="비밀번호 입력">
			<small id="helpPw" class="form-text text-muted">Help text</small>
		</div>
		<button type="submit" class="btn btn-primary">로그인</button>
		<button type="button" class="btn btn-primary" onclick="window.location='regForm.jsp'">회원가입</button>
	</form>
</div>

<div class="dropdown-menu">
	<form class="px-4 py-3">
		<div class="form-group">
			<label for="exampleDropdownFormEmail1">Email address</label>
			<input type="email" class="form-control" id="exampleDropdownFormEmail1" placeholder="email@example.com">
		</div>
		<div class="form-group">
			<label for="exampleDropdownFormPassword1">Password</label>
			<input type="password" class="form-control" id="exampleDropdownFormPassword1" placeholder="Password">
		</div>
		<div class="form-check">
			<input type="checkbox" class="form-check-input" id="dropdownCheck">
			<label class="form-check-label" for="dropdownCheck">
				Remember me
			</label>
		</div>
		<button type="submit" class="btn btn-primary">Sign in</button>
	</form>
	<div class="dropdown-divider"></div>
	<a class="dropdown-item" href="#">New around here? Sign up</a>
	<a class="dropdown-item" href="#">Forgot password?</a>
</div>

</body>
</html>
