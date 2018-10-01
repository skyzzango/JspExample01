<%@ page import="eltag.Customer" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-16
  Time: 오후 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	Customer customer = new Customer();
	customer.setName("홍길동");
	customer.setEmail("hong@naver.com");
	customer.setPhone("010-1234-1234");
	request.setAttribute("customer", customer);

	Map<String, String> map = new HashMap<>();
	map.put("name", "말리부");
	map.put("maker", "쉡보레");
	request.setAttribute("car", map);
%>
<html lang="ko">
<head>
	<%@include file="../partials/head.html" %>
	<title>EL Example</title>
</head>
<body>
<%@include file="../partials/nav.html" %>
<div class="starter-template" style="background-size: auto">
	<div class="container col-9">
	<h3>El 표기 01</h3><br>
		<ul class="list-group">
			<li class="list-group-item">이름 : ${customer.name}</li>
			<li class="list-group-item">메일 : ${customer.email}</li>
			<li class="list-group-item">전화 : ${customer.phone}</li>
		</ul>
		<br>
		<ul class="list-group">
			<li class="list-group-item">자동차 : ${car.name}</li>
			<li class="list-group-item">제조사 : ${car.maker}</li>
		</ul>
	</div>
</div>
</body>
</html>
