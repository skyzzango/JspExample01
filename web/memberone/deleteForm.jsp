<%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-06
  Time: 오후 12:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="../partials/loginCheck.jsp" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>Delete Form</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>회원 탈퇴</h3><br>
	<form name="myForm" action="deleteProc.jsp" method="post" style="width: 20rem">
		<div class="form-group">
			<label for="password">비빌번호 입력</label>
			<input type="password"
			       class="form-control" name="password" id="password" placeholder="비밀번호를 입력해 주세요." required>
		</div>
		<button type="button" onclick="window.location.href='main.jsp'" class="btn btn-info">취소</button>

		<!-- Button trigger modal -->
		<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter">
			Launch demo modal
		</button>

		<!-- Modal -->
		<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
		     aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						삭제 하시겠습니까 ?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>
