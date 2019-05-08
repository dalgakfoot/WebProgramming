<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.setAttribute("regi", "regi"); %>
<form action='./registerChk.jsp' method='get'>
<div>
아이디 : <input type='text' name='id'><br>
비밀번호 : <input type='text' name='pwd'><br>
이름 : <input type='text' name='name'><br>
주소 : <input type='text' name='addr'><br>
전화번호 : <input type='text' name='tel'><br>
<input type="submit" value='가입'><input type="reset" value='취소' onclick='location.href="./login.jsp"'>
</div>
</form>
</body>
</html>