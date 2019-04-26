<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="yellow">
	이 파일은 yellow.jsp입니다.<br>
	브라우저에 배경색이 빨간색으로 나타날까요?<br>
	노란색으로 나타날까요?<hr>
<jsp:forward page="red.jsp"></jsp:forward>
</body>
</html>