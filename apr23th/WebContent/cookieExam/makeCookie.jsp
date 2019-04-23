<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie cookie = new Cookie("testCookie","myCookie");
	cookie.setMaxAge(5);
	response.addCookie(cookie);

%>

<script>window.close();</script>
</body>
</html>