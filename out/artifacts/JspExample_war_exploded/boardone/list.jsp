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
	if (session.getAttribute("loginId") == null) {
		response.sendRedirect("../memberone/login.jsp");
	}
	int totalCount;
	BoardDao dbPro = BoardDao.getInstance();
	totalCount = dbPro.getArticleCount(); // 전체 글 수
	int pageSize = 20; // 한페이지에 보여지는 글 수
	int totalPage = totalCount / pageSize;
	if (totalCount % pageSize > 0) {
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

	int startRow = (currentPage - 1) * pageSize;
	int endRow = currentPage * pageSize;

	int number;
	List<BoardDto> articleList = null;
	if (totalCount > 0) {
		articleList = dbPro.getArticlesPage(startRow, pageSize);
	}
	number = totalCount - (currentPage - 1) * pageSize;
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>게시판</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">

	<h4>게시글 목록 (전체 글: <%=totalCount%>)</h4><br>
	<a class="btn btn-primary" href="writeForm.jsp" role="button">글쓰기</a>
	<br><br>
	<table class="table table-hover" style="text-align: center">
		<thead>
		<tr>
			<th scope="col" id="num" onclick="">번 호</th>
			<th scope="col" id="title">제 목</th>
			<th scope="col" id="writer">작 성 자</th>
			<th scope="col" id="date">작 성 일</th>
			<th scope="col" id="count">조 회</th>
			<th scope="col" id="ip">I P</th>
		</tr>
		</thead>
		<tbody>
		<%
			if (articleList != null) {
				for (BoardDto article : articleList) { %>
					<tr onclick="location.href='content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>'">
						<th scope="row">
							<%= number-- %>
						</th>
						<td style="text-align: left">
							<% int wid = 0;
							if (article.getDepth() > 0) {
								wid = 5 * (article.getDepth()); %>
								<img src="../images/level.gif" width="<%=wid%>" alt="level">
								<img src="../images/re.gif" alt="re">
							<% } else { %>
								<img src="../images/level.gif" width="<%=wid%>" alt="level">
							<% } %>
								<%= article.getSubject() %>
							<% if (article.getReadcount() >= 20) { %>
								<img src="../images/hot.gif" class="img-fluid" alt="hot">
							<% } %>
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
				<% }
			} else { %>
				<tr>
					<th scope="row">게시판에 저장된 글이 없습니다.</th>
				</tr>
			<% } %>
		</tbody>
	</table>

	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<% if (totalCount > 0) {
				int pageBlock = 10;
				int imsi = totalCount % pageSize == 0 ? 0 : 1;
				int pageCount = totalCount / pageSize + imsi;
				int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
				int endPage = startPage + pageBlock - 1;
				if (endPage > pageCount) {
					endPage = pageCount;
				}
				if (startPage > pageBlock) { %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=1">First</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPage-pageBlock%>" tabindex="-1">Previous</a>
					</li>
				<% } else { %>
					<li class="page-item">
						<a class="page-link disabled" href="list.jsp?pageNum=1">First</a>
					</li>
					<li class="page-item">
						<a class="page-link disabled" href="list.jsp?pageNum=<%=startPage-pageBlock%>" tabindex="-1">Previous</a>
					</li>
				<% }
				for (int i = startPage; i <= endPage; i++) {
					if (i == currentPage) { %>
						<li class="page-item active"><a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a></li>
						<% continue;
					} %>
					<li class="page-item"><a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a></li>
				<% }
				if (endPage < pageCount) { %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=pageCount%>">Last</a>
					</li>
				<% } else { %>
					<li class="page-item disabled">
						<a class="page-link" href="list.jsp?pageNum=<%=startPage+pageBlock%>">Next</a>
					</li>
					<li class="page-item disabled">
						<a class="page-link" href="list.jsp?pageNum=<%=pageCount%>">Last</a>
					</li>
				<% }
			} %>
		</ul>
	</nav>
</div>
</body>
</html>
