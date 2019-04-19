<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="getMethod.jsp">
	<h3>get 전송 방식</h3>
		<input type="text" name="test"><br>
		<input type="text" name="test1"><br>
		<input type="text" name="test2"><br>
		
		<input type="submit" value="전송"><br>
	</form>
	  
	  <hr>
	  
	 <form action="postMethod.jsp" method="post">
	 	<h3>post 전송 방식</h3>
		<input type="text" name="id" placeholder="아이디"><br>
		<input type="text" name="pwd" placeholder="비밀번호"><br>
		
		
		<input type="submit" value="전송"><br>
	 
	 
	</form>
</body>
</html>