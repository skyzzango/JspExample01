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
	int count;
	BoardDao dbPro = BoardDao.getInstance();
	count = dbPro.getArticleCount(); // 전체 글 수
	int pageSize = 20; // 한페이지에 보여지는 글 수
	int totalPage = count / pageSize;
	if (count % pageSize > 0) {
		totalPage++;
	}
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum.equals("0")) {
		pageNum = "1";
	}

	int currentPage = Integer.parseInt(pageNum);

	if (currentPage > totalPage) {
		currentPage = totalPage;
	}

	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;

	int number;
	List<BoardDto> articleList = null;
	if (count > 0) {
		articleList = dbPro.getArticlesPage(startRow, pageSize);
	}
	number = count - (currentPage - 1) * pageSize;
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">

	<h4>게시글 목록 (전체 글: <%= count %>)</h4><br>
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
				<%
					int wid = 0;
					if (article.getDepth() > 0) {
						wid = 5 * (article.getDepth()); %>
						<img src="../images/level.gif" width="<%= wid %>" alt="level">
						<img src="../images/re.gif" alt="re">
				<% } else { %>
						<img src="../images/level.gif" width="<%= wid %>" alt="level">
				<% } %>
				<a class="btn btn-link" href="content.jsp?num=<%= article.getNum() %>&pageNum=<%=currentPage%>"
				   role="button"><%= article.getSubject() %>
				</a>
				<%
					if (article.getReadcount() >= 20) { %>
				<img src="../images/hot.gif" class="img-fluid" alt="hot">
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
		<% } %>
		</tbody>
	</table>
	<%
		if (count > 0) {
			int pageBlock = 5;
			int imsi = count % pageSize == 0 ? 0 : 1;
			int pageCount = count / pageSize + imsi;
			int startPage = ((currentPage -1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount){ endPage = pageCount;}
			if (startPage > pageBlock) { %>
				<button type="button" class="btn btn-primary" onclick="location.href='list.jsp?pageNum=<%=startPage-pageBlock%>'">[이전]</button>
			<% }
			for (int i = startPage; i <= endPage; i++) { %>
				<button type="button" class="btn btn-primary" onclick="location.href='list.jsp?pageNum=<%=i%>'">[<%=i%>]</button>
			<% }
			if (endPage < pageCount) { %>
				<button type="button" class="btn btn-primary" onclick="location.href='list.jsp?pageNum=<%=startPage+pageBlock%>'">[다음]</button>
			<% }
		} %>
</div>
</body>
</html>
