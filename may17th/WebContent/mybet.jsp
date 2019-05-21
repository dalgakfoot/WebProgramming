<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 

<!DOCTYPE html>
<html>
<head>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - Dark Admin</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/local.css" />

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<!-- you need to include the shieldui css and js assets in order for the charts to work -->
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<link id="gridcss" rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />

<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>

</head>
<body>
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<c:set var="arr" value="${dao.myBet(sessionScope.userid)}"/>

<c:choose>
<c:when test="${arr.size()!=0 }">
<table class="table">
	<tr>
	<th>경기id</th><th>배팅한 팀</th><th>배팅 금액</th>
	</tr>
	<c:forEach var="dto" items="${arr}">
	<tr>
	<th>${dto.id }</th><th>${dto.team}</th><th>${dto.money }</th>
	</tr>
	</c:forEach>
</table>
</c:when>
<c:otherwise>

<h1>배팅 전적이 없으시네요!</h1>

</c:otherwise>


</c:choose>
<div align="right" style="padding-right: 10px;">
<input type="button" class="btn btn-primary" onclick="window.close()" value="닫기">
</div>
</body>
</html>