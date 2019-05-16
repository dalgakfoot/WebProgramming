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

<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>

</head>
<body>
	<%-- <div id="container">

<header>
<nav>
<c:choose>
<c:when test="${sessionScope.userid!=null }">
<jsp:include page="./header_login.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="./header.jsp"/>
<%@include file="./header.jsp" %>
</c:otherwise>
</c:choose>
</nav>
</header>
<div id="container2" style="display:flex;">
<article id="article1">

<jsp:include page="./game_index.jsp"/>




</article>
<article id="article2">

<c:choose>
<c:when test="${sessionScope.userid==null }">
<jsp:include page="./login.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="./welcome.jsp"/>
</c:otherwise>
</c:choose>
</article>
</div>

<div id="container3">
<article id="article3">
<div id="div3" align="center">
<jsp:include page="./game_result.jsp"/>
</div>
</article>
</div>


<footer>
<jsp:include page="./footer.jsp"/>
</footer>




</div><!-- container div 끝  --> --%>
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
					<li class="selected"><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Dashboard</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i>
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
				<div class="col-lg-12"><jsp:include page="./game_result.jsp"/></div>
				
			</div>
		</div>

	<!-- /#wrapper -->
	</div>





	

</body>
</html>

