<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	if (session.getAttribute("loginId") == null) {
%>
<script>
	alert("정상적인 접근이 아닙니다. 로그인 해 주세요.");
	location.href = "login.jsp";
</script>
<%
	}
%>
