<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.util.Scanner" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지시자</title>
</head>
<body>
	<%
	
	System.out.print("2개의 정수를 입력하세요");
	int num1 = new Scanner(System.in).nextInt();
	int num2 = new Scanner(System.in).nextInt();
	
	out.print("두 정수의 합 : ");
	out.print(num1+num2);
	
	
	
	%>
</body>
</html>