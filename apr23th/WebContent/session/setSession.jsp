<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("id", "gildong");
	session.setAttribute("age", "23");
	session.setAttribute("key", "a23aa");
	
	
	
%>

<h1>세션이 설정 되었습니다 !!</h1>




<a href="getSession.jsp">getSession(세션 확인) 이동</a><br><br>
<a href="delSession.jsp">delSession(세션 삭제) 이동</a>
</body>
</html>