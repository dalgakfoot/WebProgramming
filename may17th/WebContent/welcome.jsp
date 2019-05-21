<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
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


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
</head>
<body>

	<fmt:requestEncoding value="utf-8" />

	<div id="page-wrapper">

		<jsp:useBean id="dao" class="loginDB.joinDAO" />
		
		<c:set var="view" value="${dao.viewInfo(sessionScope.userid) }" />
		
	
		<div class="col-xs-12">
			<h2></h2>
			<div class="panel panel-success">
				<div class="panel-heading"
					style="text-align: center; font-size: 25px;">KGITBANK 토토에 오신걸 환영 합니다.</div>
					
				<div class="panel-body">


					<div align="center">
						<table class="table table-striped"
							style="height: 20px; width: 400px;">
							<tr>
								<td colspan="4"><a href="myInfo.jsp">${sessionScope.userid }님</a> 환영합니다!</td>
							</tr>
							<tr>
								<th>보유머니 : <a href="setMoney.jsp">${view.gameMoney }</a></th>
							</tr>
							<tr style="text-align: center;">
								<th colspan="2"><a href="mybet.jsp" onclick="window.open(this.href,'배팅현황','width=600, height=400'); return false">배팅현황</a></th>
								<th colspan="2"><a href="logout.jsp">로그아웃</a></th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		</div>
</body>
</html>