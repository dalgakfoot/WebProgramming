<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 	request.setCharacterEncoding("utf-8");
	String gender = request.getParameter("gender");
	System.out.print(gender);
	String result = null;


	if(gender.equals("1")){ result="남자";}
	else{result="여자";}
%>


<h3>입력하신 수는 <%=request.getParameter("number") %> 이고,</h3>
<h3>당신은 <%=result%>이군요</h3>



</body>
</html>