<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 반복문</title>
</head>
<body>

	<%

	int sum=0;
	for(int i=0; i<=10;i++){
		sum+=i;
	}

%>

<input type="text" value="1~10 까지 합 : <%=sum %>"><br>




</body>
</html>