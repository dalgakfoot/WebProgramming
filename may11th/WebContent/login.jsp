<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {font-size: 12px;}
</style>
</head>
<body>

<fmt:requestEncoding value="utf-8"/>
<div align="center">
	<h1>인생은 한방!!</h1>
	<form action="checkLogin.jsp" method="post">
	<input style="width: 180px; height:25px;" type="text" id="id" name="id" placeholder="아이디"><br>
	<input style="width: 180px; height:25px;" type="text" id="pwd"  name="pwd" placeholder="비밀번호"><br>
	<p><input style="width: 180px; height: 40px;" type="submit" value="LOGIN"></p>
	<hr>
	</form>
	<table>
	<tr>
	<th><a href="myPage.jsp">회원가입</a></th><th><a href="findId.jsp">아이디 찾기</a></th><th><a href="findPwd.jsp">비밀번호찾기</a></th>
	</tr>
	</table>
</div>
</body>
</html>