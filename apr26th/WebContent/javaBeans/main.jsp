<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>main.jsp 페이지</h3>
	<%//@include file="jspInclude.jsp"%>
	<jsp:include page="jspInclude.jsp"/>
	<p class="cl">main이 씀 -<%//name %></p>
</body>
</html>