<%@ page import="java.sql.Timestamp" %>
<%@ page import="boardone.BoardDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="article" class="boardone.BoardDto">
	<jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	article.setRegdate(new Timestamp(System.currentTimeMillis()));
	article.setIp(request.getRemoteAddr());
	BoardDao dbPro = BoardDao.getInstance();
	dbPro.insertArticle(article);
	response.sendRedirect("list.jsp");
%>
