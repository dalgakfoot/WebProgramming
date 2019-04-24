<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>(form.jsp) GET 방식으로 값 전달하기</h3>
<!-- form 태그를 쓰지않고 ?name=test1234&a=1234 등의 방법으로 값 전달 가능  -->
<input type="button" value="전송" onclick="location.href='getMethod.jsp?name=test1234'">
</body>
</html>