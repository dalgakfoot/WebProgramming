<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% String jsp = "jsp"; %>

<%= jsp %>
<h1><% out.print(jsp); %> START</h1>
<h1><% out.print(jsp); %> END</h1>


</body>
</html>