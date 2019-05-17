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
<jsp:useBean id="dao" class="board.totoDAO" />
<c:choose>
	<c:when test="${param.userId eq 'Manager'}">
		${dao.write_save_gm(param.title, param.content) }
	</c:when>
	<c:otherwise>
		${dao.write_save(param.name, param.title, param.content)}
	</c:otherwise>	
</c:choose>	
<c:redirect url="list2.jsp"/>
</body>
</html>