<%@ page import="memberone.MemberDao" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오전 11:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	MemberDao dao = MemberDao.getInstance();
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	int check = dao.loginCheck(id, password);

	if (check == 1) { // 로그인 성공
		session.setAttribute("loginId", id);

		System.out.println("session in loginId: " + session.getAttribute("loginId"));
		response.sendRedirect("main.jsp");
	} else if (check == 0) { // 비밀번호 오류
%>
<script>
	alert("비밀번호가 틀렸습니다.");
	history.go(-1);
</script>
<%
} else { // 아이디 없음
%>
<script>
	alert("존재하지 않는 아이디 입니다.");
	history.go(-1);
</script>
<%
	}
%>
