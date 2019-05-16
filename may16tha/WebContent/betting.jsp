<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Elements - Dark Admin</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>       
</head>


<body>
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<jsp:useBean id="gameDao" class="gameDB.GameDAO"/>
<jsp:useBean id="userDao" class="loginDB.joinDAO"/>

<c:set var="dto" value="${gameDao.too(param.id) }"/>

<c:set var="user" value="${userDao.viewInfo(sessionScope.userid)}"/>

<!-- teama 투표수   -->
<c:set var="teama" value="${dao.sumA(param.id) }"/>
<c:set var="teamb" value="${dao.sumB(param.id) }"/>
<c:set var="total" value="${teama+teamb}"/>

<%-- <c:set var="ratioa" value="${teama/total*100 }"/>
<c:set var="ratiob" value="${teamb/total*100 }"/> --%>


<c:choose>
<c:when test="${total!=0}">
<fmt:parseNumber var="ratioa" integerOnly="true" value="${teama/total*100 }"/>
<fmt:parseNumber var="ratiob" integerOnly="true" value="${teamb/total*100 }"/> 
</c:when>
<c:otherwise>
<c:set var="ratioa" value="0"/>
<c:set var="ratiob" value="0"/>
</c:otherwise>
</c:choose>

<div align="center">

<h1>배팅창</h1>
	<table class="table">
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
			<th>배팅현황</th><th>${ratioa }%</th>
			<th>${ratiob }%</th>
		</tr>
	</table>
	<br><br>
	<form action="betting_chk.jsp" method="post">
	<input type="hidden" value="${param.id }" name="id">
	<input type="hidden" value="${sessionScope.userid}" name="userid">
	<table class="table">
		<tr>
			<th>배팅할 팀 선택</th>
			<th><input type="radio" name="team" value="${dto.getTeamA()}">${dto.getTeamA()} <input type="radio" name="team" value="${dto.getTeamB() }">${dto.getTeamB() }
			</th>
		</tr>
		<tr>
			<th>${sessionScope.userid }님의 보유 금액</th>
			<th>${user.getGameMoney() }</th>
		
		</tr>
		<tr>
			<th>배팅할 금액 입력</th>
			<th><input type="text" name="money"></th>
		</tr>
		<tr>
			<th colspan="2"><input class="btn btn-primary" type="submit" value="배팅하기"></th>
		</tr>
	</table>
	</form>
	</div>
</body>
</html>