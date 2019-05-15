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
<div align="center">
<%@ include file="header_login.jsp" %>
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<c:set var="money" value="${dao.viewInfo(sessionScope.userid) }"/>

<h1>충전 페이지</h1>
<form action="moneyUpdate.jsp">
<table border="1">
	<tr><th>현재 보유금액 </th><th>${money.gameMoney }</th></tr>
	<tr><th>충전할 금액 입력 </th><th><input type="text" name="inputMoney"></th></tr>
	<tr><th colspan="2"><input type="submit" value="충전하기"><input type="button" value="취소" onclick="history.back()"></th></tr>
</table>
</form>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>