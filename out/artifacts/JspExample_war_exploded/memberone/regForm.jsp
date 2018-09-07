<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-04
  Time: 오후 4:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Register Form</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>회원 가입 화면</h3><br>
	<form name="regForm" action="regProc.jsp" method="post" style="width: 20rem" onsubmit="return inputCheck()">
		<div class="form-row align-items-center">
			<div class="col-sm-8 my-1">
				<label for="inputId" class="sr-only">아이디</label>
				<input type="text" class="form-control" name="id" id="inputId" placeholder="아이디 입력">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary mb-2" onclick="idCheck(this.form.id.value)">중복 확인</button>
			</div>
		</div>
		<div class="form-group">
			<label for="password">비밀번호</label>
			<input type="password"
			       class="form-control" name="password" id="password" aria-describedby="helpPw1" placeholder="비밀번호 입력">
			<small id="helpPw1" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="password2">비밀번호 확인</label>
			<input type="password"
			       class="form-control" name="password2" id="password2" aria-describedby="helpPw2"
			       placeholder="비밀번호 재입력">
			<small id="helpPw2" class="form-text text-muted">Help text</small>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<input type="email"
			       class="form-control" name="email" id="email" aria-describedby="helpEmail" placeholder="이메일 입력">
			<small id="helpEmail" class="form-text text-muted">Help text</small>
		</div>
		<button type="submit" class="btn btn-primary">가입</button>
		<button type="reset" class="btn btn-primary">다시 입력</button>
	</form>
</div>

<form class="needs-validation" novalidate>
	<div class="form-row">
		<div class="col-md-4 mb-3">
			<label for="validationCustom01">First name</label>
			<input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark"
			       required>
			<div class="valid-feedback">
				Looks good!
			</div>
		</div>
		<div class="col-md-4 mb-3">
			<label for="validationCustom02">Last name</label>
			<input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="Otto"
			       required>
			<div class="valid-feedback">
				Looks good!
			</div>
		</div>
		<div class="col-md-4 mb-3">
			<label for="validationCustomUsername">Username</label>
			<div class="input-group">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroupPrepend">@</span>
				</div>
				<input type="text" class="form-control" id="validationCustomUsername" placeholder="Username"
				       aria-describedby="inputGroupPrepend" required>
				<div class="invalid-feedback">
					Please choose a username.
				</div>
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="col-md-6 mb-3">
			<label for="validationCustom03">City</label>
			<input type="text" class="form-control" id="validationCustom03" placeholder="City" required>
			<div class="invalid-feedback">
				Please provide a valid city.
			</div>
		</div>
		<div class="col-md-3 mb-3">
			<label for="validationCustom04">State</label>
			<input type="text" class="form-control" id="validationCustom04" placeholder="State" required>
			<div class="invalid-feedback">
				Please provide a valid state.
			</div>
		</div>
		<div class="col-md-3 mb-3">
			<label for="validationCustom05">Zip</label>
			<input type="text" class="form-control" id="validationCustom05" placeholder="Zip" required>
			<div class="invalid-feedback">
				Please provide a valid zip.
			</div>
		</div>
	</div>
	<div class="form-group">
		<div class="form-check">
			<input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
			<label class="form-check-label" for="invalidCheck">
				Agree to terms and conditions
			</label>
			<div class="invalid-feedback">
				You must agree before submitting.
			</div>
		</div>
	</div>
	<button class="btn btn-primary" type="submit">Submit form</button>
</form>

<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function () {
		'use strict';
		window.addEventListener('load', function () {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			const forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			const validation = Array.prototype.filter.call(forms, function (form) {
				form.addEventListener('submit', function (event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>

</body>
</html>
