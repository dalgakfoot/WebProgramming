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


<h3>id : <%= request.getParameter("id") %></h3><br>
<h3>pw : <%= request.getParameter("pwd") %></h3>



</body>
</html>