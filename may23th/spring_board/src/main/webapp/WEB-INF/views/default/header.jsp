<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul li{ display:inline; padding:0 10px;}
</style>
</head>
<body>

	<div align ="center">
		<h1 style="color:burlywood; font-size:60px; font-family:Gabriola;">
		CARE &nbsp; LAB
		</h1>
	</div>
	<div align ="right">
		<hr>
		<ul>
			<li><a href="index">HOME</a></li>
			<c:if test="${userId!=null }">
				<a href="logout">로그아웃</a>
			</c:if>
			<c:if test="${userId==null }">
				<a href="login">로그인</a>
			</c:if>
		</ul>
		<hr>
	</div>
</body>
</html>