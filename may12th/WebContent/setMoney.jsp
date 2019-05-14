<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<%@ include file="header.jsp" %>
<h1>충전 페이지</h1>
<table border="1">
	<tr><th>현재 보유금액 </th><th>10,000 메소</th></tr>
	<tr><th>충전할 금액 입력 </th><th><input type="text"></th></tr>
	<tr><th colspan="2"><input type="submit" value="충전하기"><input type="button" value="취소" onclick="history.back()"></th></tr>
</table>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>