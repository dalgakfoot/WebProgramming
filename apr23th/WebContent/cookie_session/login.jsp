<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="index.jsp" %><!-- 추가 코드 -->
<%if(session.getAttribute("loginUser")==null){%>
	<form method="post" action="chkUser.jsp">
		<input type="text" name="id" placeholder="아이디"><br>
		<input type ="text" name="pwd" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form>
<%}else{
	out.print(session.getAttribute("loginUser")+"님 로그온 상태입니다."); %>
	<button type="button" onclick="location.href='main.jsp'">
		main페이지
	</button>
<%}%>
</body>
</html>









