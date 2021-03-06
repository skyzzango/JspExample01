<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 7:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>My Board</title>
</head>
<%
	if (session.getAttribute("loginId") == null) {
		response.sendRedirect("../memberone/login.jsp");
	}
	int num = 0;
	int ref = 1;
	int step = 0;
	int depth = 0;
	try {
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			step = Integer.parseInt(request.getParameter("step"));
			depth = Integer.parseInt(request.getParameter("depth"));
		}
%>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>글쓰기 화면</h3><br>
	<form action="writeProc.jsp" method="post" name="writeForm" onsubmit="return writeSave()">
		<input type="hidden" name="num" value="<%= num %>">
		<input type="hidden" name="ref" value="<%= ref %>">
		<input type="hidden" name="step" value="<%= step %>">
		<input type="hidden" name="depth" value="<%= depth %>">

		<div class="form-group row">
			<label for="staticWriter" class="col-sm-1 col-form-label">작성자</label>
			<div class="col-sm-5">
				<input type="text" name="writer" class="form-control-plaintext" id="staticWriter"
				       value="<%=session.getAttribute("loginId")%>" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-1 col-form-label">이메일</label>
			<div class="col-sm-5">
				<input type="text" name="email" class="form-control-plaintext" id="staticEmail"
				       value="email@example.com" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
			<div class="col-sm-5">
				<% if (request.getParameter("num") == null) { %>
				<input type="text" name="subject" class="form-control" id="inputTitle" placeholder="제목">
				<% } else { %>
				<input type="text" name="subject" class="form-control" id="inputTitle" value="[답변]">
				<% } %>
			</div>
		</div>

		<div class="form-group row">
			<label for="content" class="col-sm-1 col-form-label">내용</label>
			<div class="col-sm-5">
				<textarea class="form-control" name="content" id="content" rows="13"></textarea>
			</div>
		</div>

		<div class="form-group row">
			<label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
			<div class="col-sm-5">
				<input type="password" name="password" class="form-control" id="inputPassword" placeholder="비밀번호 입력">
			</div>
		</div>

		<div class="custom-file" style="width: 25rem">
			<input type="file" class="custom-file-input" id="customFile">
			<label class="custom-file-label" for="customFile">Choose file</label>
		</div>

		<div class="form-group" style="width: 25rem">
			<label for="exampleFormControlFile1"></label>
			<input type="file" class="form-control-file" id="exampleFormControlFile1">
		</div>

		<div>
			<button type="submit" class="btn btn-primary">글쓰기</button>
			<button type="reset" class="btn btn-primary">다시 작성</button>
			<button type="button" class="btn btn-primary" onclick="location.href='list.jsp'">목록</button>
		</div>
	</form>
</div>
</body>
<% } catch (Exception e) {
	e.printStackTrace();
} %>
</html>
