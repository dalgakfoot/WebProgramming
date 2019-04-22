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
	String id= "1";
	String pwd="1";
	String name="홍길동";
	
	request.setCharacterEncoding("utf-8");
	
	
	if(id.equals(request.getParameter("id"))&&pwd.equals(request.getParameter("pwd"))){
		response.sendRedirect("./main.jsp");
	}else{
		response.sendRedirect("./loginform.jsp");
	}

%>
</body>
</html>