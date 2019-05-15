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
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<jsp:useBean id="gameDao" class="gameDB.GameDAO"/>

<c:set var="dto" value="${gameDao.too(param.id) }"/>

<div align="center">

<h1>배팅창</h1>
	<table border="1">
		<tr><th></th><th>HOME</th><th>AWAY</th></tr>
		<tr>
			<th>팀명</th><th>${dto.getTeamA()}</th>
			<th>${dto.getTeamB()}</th>
		</tr>
		<tr>
			<th>승률</th><th>${dto.getTeama_winratio()}</th>
			<th>${dto.getTeamb_winratio()}</th>
		</tr>
		<tr>
			<th>배팅현황</th><th>${dao.sumA(param.id) }</th>
			<th>${dao.sumB(param.id) }</th>
		</tr>
	</table>
	<br><br>
	<form action="betting_chk.jsp" method="post">
	<input type="hidden" value="${param.id }" name="id">
	<input type="hidden" value="${sessionScope.userid}" name="userid">
	<table border="1">
		<tr>
			<th>배팅할 팀 선택</th>
			<th><input type="radio" name="team" value="${dto.getTeamA()}">${dto.getTeamA()} <input type="radio" name="team" value="${dto.getTeamB() }">${dto.getTeamB() }
			</th>
		</tr>
		<tr>
			<th>배팅할 금액 입력</th>
			<th><input type="text" name="money"></th>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="배팅하기"></th>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>