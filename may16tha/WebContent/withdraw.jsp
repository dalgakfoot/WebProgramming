<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">

<form action="final.jsp" method="get">
	<table border="1">
		<tr><th colspan="4">회원탈퇴</th></tr>
		<tr><th>사유</th><th><input type="radio" name="reason">노잼<input type="radio" name="reason">개인사유<input type="radio" name="reason">^0^</th></tr>
		<tr><th>비고</th><th colspan="3"><textarea rows="5" cols="20" name="write"></textarea></th></tr>
		<tr><th><input type="submit" value="회원탈퇴"></th></tr>
	</table>
	</form>
</div>
</body>
</html>
