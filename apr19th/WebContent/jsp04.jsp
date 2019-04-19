<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exam01</title>
</head>
<body>

<%
	int sum=0;
	for(int i=1;i<=100;i++){
		sum+=i;
	}

	int even=0;
	int odd=0;
	for(int i=1;i<=100;i++){
		if(i%2==0){
			even+=i;
		}else{
			odd+=i;
		}
	}
	
	
%>

	<p>1 + 2 + 3 + .... + 100 = <%= sum %></p>
	<p>1~100까지의 짝수의 합 : <%= even %></p>
	<p>1~100까지의 홀수의 합 : <%= odd %></p>





</body>
</html>