<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>getMethod 입니다.</h1>
	
	<p>입력 값(test)  : <%= request.getParameter("test")  %>
	<p>입력 값(test1) : <%= request.getParameter("test1") %>
	<p>입력 값(test2) : <%= request.getParameter("test2") %>
	
</body>
</html>