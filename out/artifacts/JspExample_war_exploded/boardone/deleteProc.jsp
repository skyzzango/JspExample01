<%@ page import="boardone.BoardDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-07
  Time: 오후 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String pass = request.getParameter("password");
	BoardDao dbPro = BoardDao.getInstance();
	int check = dbPro.deleteArticle(num, pass);
	if (check == 1) { %>
<meta http-equiv="refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>">
<% } else { %>
<script>
	alert("비밀번호가 맞지 않습니다.");
	history.go(-1);
</script>
<% }%>