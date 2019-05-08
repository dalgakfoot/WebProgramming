<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
<c:set var="num" value="${param.num }"/>
<c:set var="title" value="${param.title }"/>
<c:set var="content" value="${param.content }"/>
<c:set var="result" value="${dao.update(title,content,num) }"/>

<c:choose>
<c:when test="${result eq 1 }">

<c:redirect url="./context.jsp?num=${num }"/> 
</c:when>
<c:otherwise>
<c:out value="${result }"/> 
</c:otherwise>
</c:choose>

</body>
</html>