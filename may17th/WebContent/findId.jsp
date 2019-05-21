<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>     
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup - Dark Admin</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>   
</head>

<body>
<fmt:requestEncoding value="utf-8"/>

  <div id="wrapper">
    <h1 style="text-align: center;">인생은 한방!!</h1>
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
					<li><a href="index.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="index.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li><a href="index.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
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

		<form action="ckFindId.jsp">
		<div  align="center">
		<table>
		<tr style="text-align: center;">
		<td>전화번호 입력 &nbsp; &nbsp;  </td> 
		<td> <input type="text" class="form-control" name="phoneNo"> </td>
		<td> &nbsp; <button type="submit" class="btn btn-primary">아이디 찾기</button></td>
		</tr>
		</table>
	</div>
		</form>
</body>
</html>