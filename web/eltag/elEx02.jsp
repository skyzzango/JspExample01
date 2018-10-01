<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="eltag.Customer" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-16
  Time: 오후 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	List<String> singer = new ArrayList<>();
	singer.add("에이핑크");
	singer.add("여자친구");
	request.setAttribute("singer", singer);

	Customer[] customer = new Customer[2];
	customer[0] = new Customer();
	customer[0].setName("홍길동");
	customer[0].setEmail("hong@naver.com");
	customer[0].setPhone("011-123-4567");
	customer[1] = new Customer();
	customer[1].setName("이순신");
	customer[1].setEmail("shin@naver.com");
	customer[1].setPhone("010-1111-1111");
	request.setAttribute("customer", customer);
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.html" %>
	<title>El Example</title>
</head>
<body>
<%@include file="../partials/nav.html" %>
<div class="starter-template" style="background-size: auto">
	<div class="container-fluid col-9">
		<h3>El 표기 02</h3><br>
		<ul class="list-group">
			<li class="list-group-item">${singer[0]}, ${singer[1]}</li>
		</ul>
		<br>
		<ul class="list-group">
			<li class="list-group-item">이름 : ${customer[0].name}</li>
			<li class="list-group-item">메일 : ${customer[0].email}</li>
			<li class="list-group-item">전화 : ${customer[0].phone}</li>
		</ul>
		<br>
		<ul class="list-group">
			<li class="list-group-item">이름 : ${customer[1].name}</li>
			<li class="list-group-item">메일 : ${customer[1].email}</li>
			<li class="list-group-item">전화 : ${customer[1].phone}</li>
		</ul>
	</div>
	<br>
</div>
</body>
</html>
