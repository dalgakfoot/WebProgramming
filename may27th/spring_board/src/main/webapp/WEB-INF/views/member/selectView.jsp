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
<h1>${dto.id } 정보</h1>
<table>
<tr>
<th>아이디</th><th>${dto.id }</th>
</tr>
<tr>
<th>비밀번호</th><th>${dto.pwd }</th>
</tr>
</table>

</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>