<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>(getSession.jsp)세션에 설정한 값 가져오기</h3>

<%
	String id = (String)session.getAttribute("id");
	String age = (String)session.getAttribute("age");
	String key = (String)session.getAttribute("key");

%>

id : <%= id %><bR>
age : <%= age %><br>
key : <%= key %><br>

<a href="setSession.jsp">setSession(세션 생성) 이동</a><br><br>
<a href="delSession.jsp">delSession(세션 삭제) 이동</a>



</body>
</html>