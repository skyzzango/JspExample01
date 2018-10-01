<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-16
  Time: 오후 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.html" %>
	<title>El Example</title>
</head>
<body>
<%@include file="../partials/nav.html" %>
<div class="starter-template" style="background-size: auto">
	<div class="container-fluid col-9">
		<h3>El 표기 03 : 간단한 표현언어</h3><br>
		<h5>연산자를 사용한 예와 내장객체를 사용한 예</h5>
		<br>
		<table class="table">
			<thead>
			<tr>
				<th>표현식</th>
				<th>값</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td scope="row">\${ 2 + 5 }</td>
				<td>${ 2 + 5 }</td>
			</tr>
			<tr>
				<td scope="row">\${ 4 / 5 }</td>
				<td>${ 4 / 5 }</td>
			</tr>
			<tr>
				<td scope="row">\${ 5 div 6 }</td>
				<td>${ 5 div 6 }</td>
			</tr>
			<tr>
				<td scope="row">\${ 2 < 3 }</td>
				<td>${ 2 < 3 }</td>
			</tr>
			<tr>
				<td scope="row">\${ 2 gt 3 }</td>
				<td>${ 2 gt 3 }</td>
			</tr>
			<tr>
				<td scope="row">\${ 3.1 le 3.2 }</td>
				<td>${ 3.1 le 3.2 }</td>
			</tr>
			<tr>
				<td scope="row">\${ (5 > 3) ? 5 : 3 }</td>
				<td>${ (5 > 3) ? 5 : 3 }</td>
			</tr>
			<tr>
				<td scope="row">\${ header["host"] }</td>
				<td>${ header["host"] }</td>
			</tr>
			<tr>
				<td scope="row">\${ header["user-agent"] }</td>
				<td>${ header["user-agent"] }</td>
			</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>
