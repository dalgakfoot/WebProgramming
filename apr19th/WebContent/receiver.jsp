<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>

	<h3>이전페이지 에서 보낸 값 : <%=request.getParameter("text") %></h3>
	<a href="webContent.jsp">webContent 이동</a>
	<a href="test1/test1.jsp">test1 이동</a>
	<a href="test1/test2/test2.jsp">test2 이동</a>
</body>
</html>