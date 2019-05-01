<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
div {
	text-align: center;
}
</style>
</head>
<body>
	<%-- <%if(session.getAttribute("name")==null) {%> --%>
	<c:choose>
		<c:when test="${sessionScope.name==null}">
			<header><jsp:include page="header.jsp" /></header>
		</c:when>
		<c:otherwise>
			<%-- <%}else{%> --%>
			<header><jsp:include page="header_loginsuc.jsp" /></header>
		</c:otherwise>
	</c:choose>
	<%-- <%} %> --%>
	<div>
		<p>
			내 사전에 불가능은 없다.<br>불가능은 소극적인 자의 환영이며<br>비겁한 자의 도피처이다.<br>
			<br>-나폴레옹
		</p>
	</div>
	<footer><jsp:include page="footer.jsp" /></footer>
</body>
</html>