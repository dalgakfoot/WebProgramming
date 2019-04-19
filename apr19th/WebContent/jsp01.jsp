<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 01</title>
<% int a= 10; int b= 20; int sum=a+b; %>

</head>
<body>



<h1>자바 명령어로 덧셈 연산</h1>
<h2><%out.print(a);%>+<%out.print(b);%>=<%out.print(sum);%></h2>
<h2><%= a+"+"+b+"="+sum %> jsp 표현식</h2>


</body>
</html>