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
<jsp:useBean id="dao" class="board.totoDAO"/>
<jsp:useBean id="dto" class="board.totoDTO"/>
<jsp:setProperty property="*" name="dto"/>

<c:choose>
	<c:when test="${sessionScope.userid eq 'Manager'}">
		${dao.modify_gm(param.name, param.title, param.content, param.num) }
	</c:when>
	<c:otherwise>
		${dao.modify(param.name, param.title, param.content, param.id)}
	</c:otherwise>
</c:choose>

<c:redirect url="list2.jsp"/>
</body>
</html>