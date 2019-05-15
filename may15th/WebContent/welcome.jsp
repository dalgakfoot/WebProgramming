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
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<c:set var="view" value="${dao.viewInfo(sessionScope.userid) }"/>
	<div align="center">
		<table border="1">
			<tr>
				<td colspan="2"><a href="myInfo.jsp">${sessionScope.userid } 님</a>환영합니다!</td>
			</tr>
			<tr>
				<th><a href="#">나의 배팅현황</a></th>
				<th>보유머니 : <a href="setMoney.jsp">${view.gameMoney }</a></th>
			</tr>
			<tr>
				<th colspan="2"><a href="logout.jsp">로그아웃</a></th>
			</tr>
		</table>
	</div>
</body>
</html>