function writeSave() {
	if (!writeForm.writer.value) {
		alert("작성자를 입력하세요.");
		writeForm.writer.focus();
		return false;
	}
	if (!writeForm.subject.value) {
		alert("제목을 입력하세요.");
		writeForm.subject.focus();
		return false;
	}
	if (!writeForm.content.value) {
		alert("내용을 입력하세요.");
		writeForm.content.focus();
		return false;
	}
	if (!writeForm.password.value) {
		alert("비밀번호를 입력하세요.");
		writeForm.password.focus();
		return false;
	}
}