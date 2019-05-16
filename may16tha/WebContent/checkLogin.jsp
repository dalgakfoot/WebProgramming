<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<meta charset="UTF-8">
<body>
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<jsp:useBean id="dto" class="loginDB.joinDTO"/>
<jsp:setProperty property="*" name="dto" />
	<c:set var="result" value="${dao.userCheck(param.id, param.pwd)}" />
	<c:choose>
		<c:when test="${result == 0}">
			<c:set var="userid" value="${dto.id }" scope="session" />
			<c:redirect url="index.jsp" />
		</c:when>
		<c:when test="${result eq 1}">
			<script>alert("비밀번호가 일치하지 않습니다.."); history.back();</script>
		</c:when>
		<c:otherwise>
			<script>alert("등록되지 않은 아이디 입니다.."); history.back();</script>
		</c:otherwise>
	</c:choose>

</body>
</html>