<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>(userPage)사용자로 로그인 성공</h3>
비밀번호 : <%=request.getParameter("pwd") %><br>
사용자 : <%=request.getParameter("user") %><br>
아이디 : <%=request.getParameter("id") %><br>
param : <%=request.getParameter("name") %><br>
<a href='javascript:history.back()'>이전</a>
</body>
</html>