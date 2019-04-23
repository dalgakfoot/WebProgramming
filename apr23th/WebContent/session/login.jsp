<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("loginUser")==null) {%>
<form action="chkUser.jsp" method="post">

	<input type="text" name="id" placeholder="아이디"><br>
	<input type="password" name="pwd" placeholder="비밀번호"><br>
	<input type="submit" value="로그인">
<%}else{
	out.print(session.getAttribute("loginUser")+"님 로그온 상태 입니다.");
}%> <button type="button" onclick="location.href='main.jsp'">main 페이지</button>

</form>
</body>
</html>