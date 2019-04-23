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
	if(session.getAttribute("loginUser")==null) {
		response.sendRedirect("login.jsp");
	} else{
		out.print(session.getAttribute("loginUser"));
		out.print("님 안녕하세요! <br>");
		out.print("저희 홈페이지에 방문해 주셔서 감사합니다. <br>");
		out.print("즐거운 시간 되세요~ <br>");
		out.print("<form method='post' action='logout.jsp'>");
		out.print("<input type='submit' value='로그아웃'>");
		
		out.print("<input type='button' value='로그인페이지'"+
						"onclick='location.href=\"login.jsp\"'>");
		
		out.print("</form>");
	}
%>
</body>
</html>










