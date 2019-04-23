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
	session.invalidate(); 
	//추가코드 쿠키 삭제.
	Cookie cookie = new Cookie("myCookie","myCookie");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	%>
	<script>
		alert("로그 아웃 되었습니다.");
		location.href="login.jsp";
	</script>
</body>
</html>









