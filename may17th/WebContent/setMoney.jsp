<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style type="text/css">
.pad {
	padding-left: 40px;
}
</style>
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

<style>
input {
	color: black;
}
</style>

</head>
<body>



	<jsp:useBean id="dao" class="loginDB.joinDAO" />
	<c:set var="money" value="${dao.viewInfo(sessionScope.userid) }" />


	<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">KGITBANK 토토</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul id="active" class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i class="fa fa-bullseye"></i>
							Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li class="selected"><a href="setMoney.jsp"><i
							class="fa fa-globe"></i> 머니충전</a></li>
					<li><a href="list2.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
					<li><a href="ranking.jsp"><i class="fa fa-list-ol"></i> 랭킹</a></li>
					<!--<li><a href="forms.html"><i class="fa fa-list-ol"></i>
							Forms</a></li>
					<li><a href="typography.html"><i class="fa fa-font"></i>
							Typography</a></li>
					<li><a href="bootstrap-elements.html"><i
							class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
					<li><a href="bootstrap-grid.html"><i class="fa fa-table"></i>
							Bootstrap Grid</a></li> -->
					<li><img src="./tototo.gif" width="200" height="400"></li>
				</ul>
				<ul class="nav navbar-nav navbar-right navbar-user">

					<li class="dropdown user-dropdown"><c:choose>
							<c:when test="${sessionScope.userid != null }">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i> ${sessionScope.userid} 님<b
									class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="myInfo.jsp"><i class="fa fa-user"></i>
											마이페이지</a></li>
									<li class="divider"></li>
									<li><a href="logout.jsp"><i class="fa fa-power-off"></i>
											로그아웃</a></li>
								</ul>

							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose></li>
					<li class="divider-vertical"></li>
					<li></li>
				</ul>
			</div>
		</nav>

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1>
						머니충전페이지 <small>승부예측 인생한길</small>
					</h1>
					<div class="alert alert-dismissable alert-warning">
						<button data-dismiss="alert" class="close" type="button">&times;</button>
						Welcome to the 머니충전! <br /> 다른 사이트와는 차별화된 건전하게 즐기는 승부예측게임! 먹튀 걱정
						없는 공식인증 사이트!
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<h3 class="panel-title">$$머니 충전$$</h3>
						</div>

						<div class="panel-body" align="center">
							<form action="moneyUpdate.jsp">
								<table class="table" style="width: 500px; height: 150px;">
									<tr>
										<th class="pad">현재 보유금액</th>
										<th class="pad">${money.gameMoney}</th>
									</tr>
									<tr>
										<th class="pad">충전할 금액 입력</th>
										<th>
											<div class="form-group">
												<input class="form-control" name="inputMoney"
													style="color: black;">
												<!-- 둥근 입력 텍스트 -->
											</div>
										</th>
									</tr>
									<tr>
										<th><input type="submit"
											class="form-control btn btn-primary" style="width: 100px;"
											value="충전하기"></th>
										<th><input type="button" value="취소"
											class="form-control btn btn-primary" style="width: 100px;"
											onclick="history.back()"></th>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>





	<%-- <form action="moneyUpdate.jsp">
<table border="1">
	<tr><th>현재 보유금액 </th><th>${money.gameMoney }</th></tr>
	<tr><th>충전할 금액 입력 </th><th><input type="text" name="inputMoney"></th></tr>
	<tr><th colspan="2"><input type="submit" value="충전하기"><input type="button" value="취소" onclick="history.back()"></th></tr>
</table>
</form> --%>
	<%@ include file="footer.jsp"%>

</body>
</html>