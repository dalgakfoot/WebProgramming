<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

index.jsp<br>

<%String index = (String)request.getAttribute("index"); %>

<h1>기본 페이지 입니다요</h1>
<h1>request : <%=index %></h1><br>

<a href="/controller01/login">로그인 페이지</a>&nbsp;<a href="/controller01/logout">로그아웃 페이지</a>

</body>
</html>