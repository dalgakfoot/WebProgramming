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
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<jsp:useBean id="dto" class="bettingDB.bettingDTO"/>
<jsp:useBean id="loginDAO" class="loginDB.joinDAO"/>
<jsp:useBean id="loginDTO" class="loginDB.joinDTO"/>

<jsp:setProperty property="*" name="dto"/>
<c:set var="user" value="${loginDAO.viewInfo(param.userid) }"/>

<c:choose>
<c:when test="${user.getGameMoney()-dto.getMoney()<0 }">
<script>
alert("배팅하신 금액이 보유금액을 초과했습니다. 다시 시도해주세요.");
history.back();
</script>
</c:when>

<c:otherwise>
${dao.bettingUp(dto) }
<c:redirect url="game3.jsp"/>
</c:otherwise>
</c:choose>
</body>
</html>