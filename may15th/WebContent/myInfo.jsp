<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
<jsp:include page="./header_login.jsp"/>
</header>

<c:choose>
<c:when test="${sessionScope.userid!='Manager' }">
<jsp:useBean id="dao"  class="loginDB.joinDAO"/>
<c:set  var="viewInfo" value="${dao.viewInfo(sessionScope.userid)}" />

<div align="center">
<form action="infoUpdate.jsp" method="get">
<table border="1">
	<tr>
		<th>아이디</th><td>${viewInfo.id}</td>
	</tr>
	
	<tr>
		<th>연락처</th><th><input  type="text" name="phoneNo" value="${viewInfo.phoneNo }" id="phoneNo"></th>
	</tr>
	<tr>
		<th>주소</th><th><input type="text" name="addr" value="${viewInfo.addr }" id="addr"></th>
	</tr>
	<tr>
		<th>보유머니</th><td>${viewInfo.gameMoney}</td>
	</tr>
	<tr>
		<th colspan="2">
		<input type="submit" value="정보수정">
		<input type="button" onclick="history.back()" value="뒤로가기">&nbsp;&nbsp;
		</th>
	</tr>
</table>
	</form>
		<button onclick="location.href='withdraw.jsp'">회원탈퇴</button>
</div>
<footer>
<jsp:include page="./footer.jsp"/>
</footer>
</c:when>
<c:otherwise>
<c:redirect url="./adminPage.jsp"/>
</c:otherwise>
</c:choose>
</body>
</html>