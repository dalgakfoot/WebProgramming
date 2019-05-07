<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>fileName.jsp 페이지</h1>

<c:forEach var="fileName" items="${fName }">
	<a href="FileDown?fileName=${fileName }">${fileName }</a>
</c:forEach>


</body>
</html>