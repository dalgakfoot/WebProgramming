<%@page import="gameDB.GameDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
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
					<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li class="selected"><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
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

		<div id="page-wrapper">
			
			<div class="row">
				<div class="col-lg-12"><jsp:include page="./game4.jsp"/></div>
				
			</div>
		</div>

	<!-- /#wrapper -->
	</div>





	

</body>
</html>

<%-- <%@page import="gameDB.GameDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
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

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="./header_login.jsp"/>
<div id="wrapper">
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Admin Panel</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul id="active" class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Dashboard</a></li>
					<li class="selected"><a href="./game3.jsp"><i class="fa fa-tasks"></i>
							Portfolio</a></li>
					<li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
					<li><a href="signup.html"><i class="fa fa-list-ol"></i>
							SignUp</a></li>
					<li><a href="register.html"><i class="fa fa-font"></i>
							Register</a></li>
					<li><a href="timeline.html"><i class="fa fa-font"></i>
							Timeline</a></li>
					<li><a href="forms.html"><i class="fa fa-list-ol"></i>
							Forms</a></li>
					<li><a href="typography.html"><i class="fa fa-font"></i>
							Typography</a></li>
					<li><a href="bootstrap-elements.html"><i
							class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
					<li><a href="bootstrap-grid.html"><i class="fa fa-table"></i>
							Bootstrap Grid</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right navbar-user">
					<li class="dropdown messages-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-envelope"></i> Messages <span class="badge">2</span>
							<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li class="dropdown-header">2 New Messages</li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><i class="fa fa-bell"></i></span> <span
									class="message">Security alert</span>
							</a></li>
							<li class="divider"></li>
							<li class="message-preview"><a href="#"> <span
									class="avatar"><i class="fa fa-bell"></i></span> <span
									class="message">Security alert</span>
							</a></li>
							<li class="divider"></li>
							<li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
						</ul></li>
					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>

						</ul></li>
					<li class="divider-vertical"></li>
					<li>
						<form class="navbar-search">
							<input type="text" placeholder="Search" class="form-control">
						</form>
					</li>
				</ul>
			</div>
		</nav>
<div>
		<jsp:useBean id="dao" class="gameDB.GameDAO"/>
		<jsp:useBean id="dto" class="gameDB.GameDTO"/>
		<c:set var="arr" value="${dao.win() }"/>
		
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
		for(GameDTO g : arr){
			if(dao.poo(g.getGame_time())<=tod){
				//승리팀 계산 하고,
				//데이터베이스 접근하고 업데이트 해라.
				
				float a = g.getTeama_winratio();
				float b = g.getTeamb_winratio();
				
				float mother = a+b;
				
				float teama = a/mother;
				double win = Math.random();
				String winner = null;
				
				if(win<=teama){
					dao.winUpdate(g.getTeamA(), g.getId());
				}else{
					dao.winUpdate(g.getTeamB(), g.getId());
				}
				
				
			}
		}
		
		%>
		
		<table border="1">
		<tr>
		<th>경기ID</th><th>경기시간</th><th>HOME</th><th>HOME 승률</th><th>AWAY</th><th>AWAY 승률</th><th>승리팀</th>

		<% 
		
		ArrayList<GameDTO> test = new ArrayList<>();
		test = dao.select();
		
		for(GameDTO g : test){
			
			out.print("<tr>"+"<th>"+g.getId()+"</th>");
			out.print("<th>"+g.getGame_time()+"</th>");
			out.print("<th>"+g.getTeamA()+"</th>");
			out.print("<th>"+g.getTeama_winratio()+"</th>");
			out.print("<th>"+g.getTeamB()+"</th>");
			out.print("<th>"+g.getTeamb_winratio()+"</th>");
			out.print("<th>"+g.getWin()+"</th>");
			
			if(dao.foo(g.getId()).equals("경기 시작 전 입니다.")){
			out.print("<th>"+"<button onclick="+"window.open('betting.jsp?id="+g.getId()+"','배팅하기','width=430,height=500,location=no,status=no,scrollbars=yes');>배팅하기</button></th>");
			}else{
				
				out.print("<th>"+"<button disabled>배팅하기</button>"+"</th>");
			}
			
			
		}
		
		%>
		

		
		</table>
		
		<hr/>
		
		
		
	</div>
	<jsp:include page="./footer.jsp"/>
</div>
</body>
</html> --%>