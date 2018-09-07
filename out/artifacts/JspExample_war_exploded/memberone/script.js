function loginCheck(request, response) {
	const loginId = session.getAttribute("loginId");
	if (loginId == null) {
		response.sendRedirect("login.jsp");
	}
}

function loginInputCheck() {
	if (!loginForm.id.value) {
		alert("아이디를 입력해 주세요.");
		loginForm.id.focus();
		return false;
	}
	if (!loginForm.password.value) {
		alert("비밀번호를 입력해 주세요.");
		loginForm.password.focus();
		return false;
	}
}

function idCheck(id) {
	if (id == "") {
		alert("아이디를 입력해주세요.");
		document.regFrom.id.focus();
	} else {
		const popWidth = 450;
		const popHeight = 450;
		const winHeight = document.body.clientHeight; // 현재창의 높이
		const winWidth = document.body.clientWidth; // 현재창의 높이
		const winX = window.screenLeft; // 현재창의 x좌표
		const winY = window.screenTop; // 현재창의 y좌표
		const popX = winX + (winWidth - popWidth) / 2;
		const popY = winY + (winHeight - popHeight) / 2;
		url = "idCheck.jsp?id=" + id;
		window.open(url, "post", "left=" + popX + ", top=" + popY + ", width=" + popWidth + ", height=" + popHeight);
	}
}

function inputCheck() {
	if (regForm.id.value == "") {
		alert("아이디를 입력해 주세요.");
		regForm.id.focus();
		return false;
	}
	if (regForm.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		regForm.password.focus();
		return false;
	}
	if (regForm.password2.value == "") {
		alert("비빌번호 확인을 입력해 주세요.");
		regForm.password2.focus();
		return false;
	}
	if (regForm.password.value != regForm.password2.value) {
		alert("비빌번호가 일치 하지 않습니다.");
		regForm.password2.focus();
		return false;
	}
	if (regForm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		regForm.email.focus();
		return false;
	}
	const str = regForm.email.value;
	const atPos = str.indexOf('@');
	const atLastPos = str.lastIndexOf('@');
	const dotPos = str.indexOf('.');
	const spacePos = str.indexOf(' ');
	const commaPos = str.indexOf(',');
	const emailSize = str.length;
	if (atPos > 1 &&
		atPos == atLastPos &&
		dotPos > 3 &&
		spacePos == -1 &&
		commaPos == -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < emailSize) {
	} else {
		alert('E-Mail 주소 형식이 잘못 되었습니다.\n다시 입력해 주세요!');
		regForm.email.focus();
		return false;
	}
	regForm.submit();
}

function updateCheck() {
	if (modifyForm.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		modifyForm.password.focus();
		return;
	}
	if (modifyForm.password2.value == "") {
		alert("비빌번호 확인을 입력해 주세요.");
		modifyForm.password2.focus();
		return;
	}
	if (modifyForm.password.value != modifyForm.password2.value) {
		alert("비빌번호가 일치 하지 않습니다.");
		modifyForm.password2.focus();
		return;
	}
	if (modifyForm.email.value == "") {
		alert("이메일을 입력해 주세요.");
		modifyForm.email.focus();
		return;
	}

	const str = modifyForm.email.value;
	const atPos = str.indexOf('@');
	const atLastPos = str.lastIndexOf('@');
	const dotPos = str.indexOf('.');
	const spacePos = str.indexOf(' ');
	const commaPos = str.indexOf(',');
	const emailSize = str.length;
	if (atPos > 1 &&
		atPos == atLastPos &&
		dotPos > 3 &&
		spacePos == -1 &&
		commaPos == -1 &&
		atPos + 1 < dotPos &&
		dotPos + 1 < emailSize) {
	} else {
		alert('E-Mail 주소 형식이 잘못 되었습니다.\n다시 입력해 주세요!');
		modifyForm.email.focus();
		return;
	}
	modifyForm.submit();
}

function checkIt() {
	if (!myForm.password.value) {
		alert("비밀번호를 입력하지 않았습니다.");
		myForm.password.focus();
		return false;
	}
}
