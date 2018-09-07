<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="boardone.BoardDao" %>
<%@ page import="boardone.BoardDto" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-07
  Time: 오후 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	BoardDao dbpro = BoardDao.getInstance();
	BoardDto article = dbpro.getArticle(num);
	int ref = article.getRef();
	int step = article.getStep();
	int depth = article.getDepth();
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>글 내용 보기</h3><br>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글보기</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td>번호</td>
					<td colspan="2">
						<%= article.getNum() %>
					</td>
				</tr>
				<tr>
					<td>조회수</td>
					<td colspan="2">
						<%= article.getReadcount() %>
					</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2">
						<%= article.getWriter() %>
					</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td colspan="2">
						<%= article.getRegdate() %>
					</td>
				</tr>
				<tr>
					<td style="width: 20%">제목</td>
					<td colspan="2">
						<%= article.getSubject() %>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height: 200px; text-align: left;">
						<%= article.getContent() %>
					</td>
				</tr>
				</tbody>
			</table>
			<input class="btn btn-primary" type="button" value="수정"
			       onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="btn btn-primary" type="button" value="삭제"
			       onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
			<input class="btn btn-primary" type="button" value="목록"
			       onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'">
		</div>
	</div>
</div>
</body>
</html>
