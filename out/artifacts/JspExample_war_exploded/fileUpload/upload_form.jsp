<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-12
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>파일 전송 폼</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>파일 전송 하기</h3><br>
	<form action="upload_proc.jsp" method="post" enctype="multipart/form-data">
		<div class="form-group row">
			<label for="staticWriter" class="col-sm-1 col-form-label">작성자</label>
			<div class="col-sm-5">
				<input type="text" name="writer" class="form-control-plaintext" id="staticWriter"
				       value="<%=session.getAttribute("loginId")%>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="uploadFile" class="col-sm-1 col-form-label">파일 첨부</label>
			<div class="col-sm-5">
				<input type="file" class="form-control-file" name="uploadFile" id="uploadFile" placeholder="파일">
			</div>
		</div>
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
			<div class="col-sm-5">
				<input type="text" name="subject" class="form-control" id="inputTitle" placeholder="제목">
			</div>
		</div>
		<div class="form-group row">
			<label for="content" class="col-sm-1 col-form-label">내용</label>
			<div class="col-sm-5">
				<textarea class="form-control" name="content" id="content" rows="13"></textarea>
			</div>
		</div>
		<div>
			<button type="submit" class="btn btn-primary">글쓰기</button>
			<button type="reset" class="btn btn-primary">다시 작성</button>
			<button type="button" class="btn btn-primary" onclick="location.href='list.jsp'">목록</button>
		</div>
	</form>
</div>
</body>
</html>
