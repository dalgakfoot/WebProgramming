<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(session.getAttribute("name")==null){
	response.sendRedirect("../Exam_default/index.jsp");
} 
%>
<header>
<jsp:include page="../Exam_default/header_loginsuc.jsp"/>
</header>

<div style="diplay:flex; flex-direction: column; justify-content:center; align-items: center;">
<h2>로그인 성공</h2>
</div>
<footer>
<jsp:include page="../Exam_default/footer.jsp"/>
</footer>
</body>
</html>