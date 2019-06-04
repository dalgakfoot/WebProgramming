<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<table>
<form action="regist">
<tr>
<td>아이디</td>
<td><input type="text" name="id"></td>
</tr>

<tr>
<td>비밀번호</td>
<td><input type="password" name="pwd"></td>
</tr>

<tr>
<td colspan="2" align="left">
<input type="submit" value="회원가입">
<button type="button" onclick="history.back()">취소</button>
</td>
</form>
</table>
</body>
</html>