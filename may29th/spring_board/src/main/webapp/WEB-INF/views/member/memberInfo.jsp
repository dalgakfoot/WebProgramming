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
<c:import url="../default/header.jsp"/>
<div align="center">

<table border="1">
<tr>
<th>아이디</th><th>비밀번호</th>
<c:forEach var="dto" items="${userArr}">
<tr>
<th><a href="select?id=${dto.id }">${dto.id }</a></th><th>${dto.pwd }</th>
</tr></c:forEach>
</table>

</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>