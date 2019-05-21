<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register - Dark Admin</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/local.css" />

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<style>
div {
	padding-bottom: 20px;
}

#wrap {
	display: flex;
}
</style>
</head>
<body>

	<c:choose>
		<c:when test="${sessionScope.userid!='Manager' }">
			<jsp:useBean id="dao" class="loginDB.joinDAO" />
			<c:set var="viewInfo" value="${dao.viewInfo(sessionScope.userid)}" />

			<div align="center">
				<form action="infoUpdate.jsp" method="get">

					<div id="wrapper">
						<nav class="navbar navbar-inverse navbar-fixed-top"
							role="navigation">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target=".navbar-ex1-collapse">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="index.html">KGITBANK 토토</a>
							</div>
							<div class="collapse navbar-collapse navbar-ex1-collapse">
								<ul class="nav navbar-nav side-nav">
									<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li><a href="list2.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li class="selected"><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
					<li><a href="ranking.jsp"><i class="fa fa-list-ol"></i>
							랭킹</a></li>
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
					<li style="width:1550px"><marquee direction="left"><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i>&nbsp;Welcome to the KGITBANK 토토! 
다른 사이트와는 차별화된 건전하게 즐기는 승부예측게임! 먹튀 걱정 없는 공식인증 사이트!&nbsp;<i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i></marquee></li>
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

						<div>
							<div class="row text-center">
								<h2>나의 회원정보</h2>
							</div>
							<div>
								<%-- <table border="1">
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
</table> --%>


								<label for="firstname" class="col-md-2"> ID: </label>
								<div class="col-md-9">
									<input type="text" class="form-control" value="${viewInfo.id}"
										disabled="disabled" style="color:black;">
								</div>

							</div>
							<div>
								<label for="password" class="col-md-2"> Tel: </label>
								<div class="col-md-9">
									<input type="text" class="form-control" name="phoneNo"
										id="phoneNo" placeholder="${viewInfo.phoneNo}" style="color:black;">

								</div>

							</div>
							<div>
								<label for="firstname" class="col-md-2"> Address: </label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="addr" name="addr"
										placeholder="${viewInfo.addr}" style="color:black;">
								</div>

							</div>
							<div>
								<label for="firstname" class="col-md-2"> Game Money: </label>
								<div class="col-md-9" id="wrap">
									<input type="text" class="form-control"
										value="${viewInfo.gameMoney}" disabled="disabled"
										style="width: 80%; color:black;"><input type="button" value="머니충전"
										class="btn btn-info" onclick="location.href='setMoney.jsp'">
								</div>

							</div>
							
							<div class="row">
								<div class="col-md-2"></div>
								<div class="col-md-10" align="center">
									<button type="submit" class="btn btn-info">회원정보수정</button>
									<input type="button" onclick="window.open('./withdraw.jsp','회원탈퇴','width=600, height=400'); return false"
										class="btn btn-info" value="회원탈퇴">
									<input type="button" onclick="history.back()" class="form-control btn btn-primary" style="width: 100px;" value="뒤로가기">
								</div>
							</div>
						</div>
					</div>
				</form>
					
			</div>
			<footer>
				<jsp:include page="./footer.jsp" />
			</footer>
		</c:when>
		<c:otherwise>
			<c:redirect url="./adminPage.jsp" />
		</c:otherwise>
	</c:choose>
</body>
</html>