<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
</head>
<body>
<div id="wrapper">

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">KGITBANK 토토</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="active" class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li class="selected"><a href="list2.jsp"><i class="fa fa-list-ol"></i>
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
        <hr/>
       
		<fmt:requestEncoding value="utf-8"/>
<div align="center">
<form action="write_save2.jsp" method="post">
	<table class="table" >
		<tr align="center" >
			<td width="10%" style="border-right: 1px solid gray; ">이름</td><td width="60%" style="color:skyblue; font-size: 14pt;">${sessionScope.userid}</td>
		</tr>
		<tr align="center">
			<td style="border-right: 1px solid gray;">제목</td><td style="color: black;"><input type="text" name="title" size="100"></td>
		</tr>
		<tr align="center">
			<td style="padding-top: 85px; border-right: 1px solid gray;">내 용</td><td style="color: black;"><textarea name="content" rows="10" cols="100"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="right" style="padding-right: 40px;">
				 <a href="list2.jsp" style="text-decoration: none; font-size: 12pt; color: skyblue;">목록으로 가기</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				 <input class="btn btn-primary" type="submit" value="글저장">
				<input type="hidden" name="userId" value="${sessionScope.userid}">	
			</td>
		</tr>
	</table>	
</form>
</div>
</body>
</html>