<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		#wrap {display: flex;}
		#wrap div:first-child{width: 30%;}
		#wrap div:nth-child(2){width: 70%;}
	</style>
<title>Insert title here</title>
</head>
<body>

	<h1>경기일정</h1>
	<hr>
	<div id="wrap" align="center">
	<!-- <div>
			<ul>
				<li>오늘</li>
				<li>내일</li>
				<li>모레</li>
			</ul>
	</div> -->
	<div>
		<jsp:useBean id="dao" class="gameDB.GameDAO"/>
		<c:set var="arr" value="${dao.select() }"/>
		
		<table border="1">
		<tr>
		<td>경기ID</td><td>일자</td><td>시간</td><td>Away</td><td>Home</td><td>승리팀</td>
		<c:forEach var="g" items="${arr}">
		<tr>
		<td>${g.getId() }</td>
		<td>${g.getGame_date() }</td>
		<td>${g.getGame_time() }</td>
		<td>${g.getTeamA() }</td>
		<td>${g.getTeamB() }</td>
		<td>${g.getWin() }</td>
		</c:forEach>
		
		</table>
	</div>
</div>	
</body>
</html>