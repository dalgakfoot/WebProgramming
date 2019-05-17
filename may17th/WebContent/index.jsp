<%@page import="gameDB.GameDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


<link re="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>

</head>


<body>

	<jsp:useBean id="dao" class="gameDB.GameDAO" />
	<jsp:useBean id="dto" class="gameDB.GameDTO" />
	<c:set var="arr" value="${dao.win() }" />
	<%
					SimpleDateFormat formatter = new SimpleDateFormat("HHmm");
					String today = formatter.format(new java.util.Date());
				%>

	<%
					ArrayList<GameDTO> arr = new ArrayList<>();
					arr = dao.win();
					int tod = Integer.parseInt(today);
				%>

	<%
					for (GameDTO g : arr) {
						if (dao.poo(g.getGame_time()) <= tod) {
							//승리팀 계산 하고,
							//데이터베이스 접근하고 업데이트 해라.

							float a = g.getTeama_winratio();
							float b = g.getTeamb_winratio();

							float mother = a + b;

							float teama = a / mother;
							double win = Math.random();
							String winner = null;

							if (win <= teama) {
								dao.winUpdate(g.getTeamA(), g.getId());
							} else {
								dao.winUpdate(g.getTeamB(), g.getId());
							}

						}
					}
				%>
	
	<c:choose>
	
	<c:when test="${sessionScope.userid!=null }">

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
					<li class="selected"><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li><a href="list2.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
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
		</c:when>
		<c:otherwise>
		<c:redirect url="login.jsp"/>
		</c:otherwise>
		</c:choose>

		<div id="page-wrapper">
			<!-- <div class="row">
				<div class="col-lg-12">
					<h1>
						메인페이지 <small>Main page</small>
					</h1>

				</div>
			</div> -->
			<div class="row">
				<div class="col-lg-12">
					<c:choose>
						<c:when test="${sessionScope.userid==null }">
							<jsp:include page="./login.jsp" />
						</c:when>
						<c:otherwise>
							<jsp:include page="./welcome.jsp" />
						</c:otherwise>
					</c:choose>


				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">



					<jsp:include page="./game_index.jsp" />


				</div>
			</div>
			<div class="row">
				<div class="col-lg-12"><jsp:include page="./game_result.jsp" /></div>

			</div>
		</div>

		<!-- /#wrapper -->
	</div>







</body>
</html>

