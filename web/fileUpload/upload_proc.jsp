<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><%--
  Created by IntelliJ IDEA.
  User: skyzz
  Date: 2018-09-12
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="ko">
<head>
	<%@include file="../partials/head.jsp" %>
	<title>업로드 처리</title>
</head>
<body>
<%@include file="../partials/nav.jsp" %>
<div class="starter-template" style="background-size: auto">
	<h3>업로드 처리 페이지</h3><br>
	<%
		request.setCharacterEncoding("UTF-8");
		String savePath = "fileUpload/upload"; // 다운받는 경로 설정
		int uploadFileSizeLimit = 5 * 1024 * 1024; // 파일 최대크기 5M으로 제한
		String encType = "UTF-8"; // char 인코딩 방식

		ServletContext context = request.getSession().getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		System.out.println("서버상의 실제 디렉토리");
		System.out.println(uploadFilePath);
		try {
			MultipartRequest multi = new MultipartRequest(
					request, // request 객체
					uploadFilePath, // 서버 상의 실제 데이터
					uploadFileSizeLimit, // 최대 업로드 파일크기
					encType, // 인코딩 타입
					new DefaultFileRenamePolicy()
			);
			// UploadFile 이름은 input 태그의 name 과 동일한 이름을 사용한다.
			String fileName = multi.getFilesystemName("uploadFile");
			if (fileName == null) {
				System.out.println("파일 업로드 실패");
			} else {
				out.println("<br> 작성자 : " + multi.getParameter("writer"));
				out.println("<br> 제목 : " + multi.getParameter("subject"));
				out.println("<br> 파일명 : " + fileName);
			}
		} catch (Exception e) {
			System.out.println("예외 발생: " + e);
			e.printStackTrace();
		}
	%>
</div>
</body>
</html>
