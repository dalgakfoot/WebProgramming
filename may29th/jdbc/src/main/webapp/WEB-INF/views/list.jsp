<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
<th>번호</th><th>이름</th>
</tr>
<c:forEach var="dto" items="${arr}">
<tr>
<th>${dto.id }</th>
<th><a href="view?id=${dto.id}">${dto.name }</a></th>
</tr>
</c:forEach>
<tr>
<th colspan="2" align="left"><a href="register">등록</a></th>
</tr>

</table>

</body>
</html>