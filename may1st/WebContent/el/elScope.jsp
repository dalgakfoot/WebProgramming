<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>elScope.jsp 페이지</h3>
	<%
	pageContext.setAttribute("name","page man");
	request.setAttribute("name", "request man");
	session.setAttribute("name", "session man");
	application.setAttribute("name", "application man");
	%>
	
	name : ${name }<p/><!-- 가장 작은 범위의 속성을 받아올 수 있음.  -->
	page 속성 : ${pageScope.name }<p/>
	request 속성 : ${requestScope.name }<p/>
	session 속성 : ${sessionScope.name }<p/>
	application 속성 : ${applicationScope.name }<p/>
	<a href="scopeTest.jsp">이동</a>
	
	
</body>
</html>