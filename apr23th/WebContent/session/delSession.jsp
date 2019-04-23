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
	//session.removeAttribute("age"); //현재 아이디 세션 만 종료

	//session.setMaxInactiveInterval(5); //5초 후 모든 세션 종료
	
	session.invalidate(); //즉시 모든 세션 종료
	
%>
<br><br><a href="getSession.jsp">getSession(세션 확인)이동</a>
<br><br><a href="setSession.jsp">setSession(세션 생성)이동</a>


</body>
</html>