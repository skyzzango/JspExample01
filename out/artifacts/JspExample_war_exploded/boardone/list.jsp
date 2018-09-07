<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="boardone.BoardDto" %>
<%@ page import="boardone.BoardDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-07
  Time: 오후 7:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	int count = 0;
	int number = 0;
	List<BoardDto> articleList = null;
	BoardDao dbPro = BoardDao.getInstance();
	count = dbPro.getArticleCount(); // 전체 글 수
	if (count > 0) {
		articleList = dbPro.getArticles();
	}
	number = count;
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>게시글 목록 (전체 글: <%= count %>)</h3><br>

	<a class="btn btn-primary" href="writeForm.jsp" role="button">글쓰기</a>
	<br><br>
	<table class="table">
		<thead>
		<tr>
			<th id="num">번호</th>
			<th id="title">제목</th>
			<th id="writer">작성자</th>
			<th id="date">작성일</th>
			<th id="count">조회</th>
			<th id="ip">IP</th>
		</tr>
		</thead>
		<tbody>
		<%
			if (articleList != null) {
				for (BoardDto article : articleList) {
		%>
		<tr>
			<td scope="row">
				<%= number-- %>
			</td>
			<td>
				<a class="btn btn-link" href="content.jsp?num=<%= article.getNum() %>&pageNum=1"
				   role="button"><%= article.getSubject() %>
				</a>
				<%
					if (article.getReadcount() >= 20) { %>
				<img src="images/hot.gif" class="img-fluid" alt="hot">
				<% }
				%>
			</td>
			<td>
				<a class="btn btn-link" href="mailto:<%= article.getEmail() %>"
				   role="button"><%= article.getWriter() %>
				</a>
			</td>
			<td>
				<%= sdf.format(article.getRegdate()) %>
			</td>
			<td>
				<%= article.getReadcount() %>
			</td>
			<td>
				<%= article.getIp() %>
			</td>
		</tr>
		<%
			}
		} else { %>
		<tr>
			<td>게시판에 저장된 글이 없습니다.</td>
		</tr>
		<% }
		%>
		</tbody>
	</table>
	<%
		if (count == 0) {

		}
	%>
</div>
</body>
</html>
