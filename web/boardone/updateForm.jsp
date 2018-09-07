<%@ page import="boardone.BoardDao" %>
<%@ page import="boardone.BoardDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-07
  Time: 오후 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	BoardDao dbPro = BoardDao.getInstance();
	BoardDto article = dbPro.updateGetArticle(num);
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>글 수정</h3><br>
	<form action="updateProc.jsp?num=<%=num%>&pageNum=<%=pageNum%>" method="post" name="writeForm">
		<input type="hidden" name="writer" value="<%= article.getWriter() %>">
		<div class="form-group row">
			<label for="staticWriter" class="col-sm-1 col-form-label">작성자</label>
			<div class="col-sm-5">
				<input type="text" name="writer" class="form-control-plaintext" id="staticWriter"
				       value="<%= article.getWriter() %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="staticEmail" class="col-sm-1 col-form-label">이메일</label>
			<div class="col-sm-5">
				<input type="text" name="email" class="form-control-plaintext" id="staticEmail"
				       value="<%= article.getEmail() %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputTitle" class="col-sm-1 col-form-label">제목</label>
			<div class="col-sm-5">
				<input type="text" name="subject" class="form-control-plaintext" id="inputTitle"
				       value="<%= article.getSubject() %>" required>
			</div>
		</div>
		<div class="form-group">
			<label for="exampleFormControlTextarea1">내용</label>
			<div class="col-sm-6">
				<textarea class="form-control" name="content" id="exampleFormControlTextarea1"
				          rows="13" required><%= article.getContent() %></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPassword" class="col-sm-1 col-form-label">비밀번호</label>
			<div class="col-sm-5">
				<input type="password" name="password" class="form-control" id="inputPassword" placeholder="비밀번호 입력" required>
			</div>
		</div>
		<div class="form-group">
			<label for="exampleFormControlFile1"></label>
			<input type="file" class="form-control-file" id="exampleFormControlFile1">
		</div>
		<div class="custom-file">
			<input type="file" class="custom-file-input" id="customFile">
			<label class="custom-file-label" for="customFile">Choose file</label>
		</div>
		<div>
			<button type="submit" class="btn btn-primary">수정</button>
			<button type="reset" class="btn btn-primary">다시 작성</button>
			<button type="button" class="btn btn-primary" onclick="location.href='list.jsp'">목록</button>
		</div>
	</form>
</div>
</body>
</html>
