<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
<table>
<form action="login_chk">
<tr>
<td>아이디</td>
<td><input type="text" name="id">
</td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="pwd">
</td>
</tr>
<tr>
<td colspan="2">
<input type="submit" value="로그인">
<button type="button" onclick="history.back()">뒤로가기</button>
</td>
</form>
</table>
</body>
</html>