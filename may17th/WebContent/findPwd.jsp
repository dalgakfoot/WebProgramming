<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Signup - Dark Admin</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/local.css" />

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<fmt:requestEncoding value="utf-8" />

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
				<a class="navbar-brand" href="index.html">Back to Admin</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i class="fa fa-bullseye"></i>
							HOME</a></li>
					<li><a href="game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="list.jsp"><i class="fa fa-globe"></i> 자유게시판</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-list-ol"></i>
							머니충전</a></li>
					<li class="selected"><a href="myInfo.jsp"><i
							class="fa fa-font"></i> 마이페이지</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right navbar-user">

					<li class="dropdown user-dropdown"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><i
							class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
							<li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
							<li class="divider"></li>
							<li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
						</ul></li>
				</ul>
			</div>
		</nav>

		<form action="checkPwd.jsp">
			<div align="center">
				<table>
					<tr style="text-align: center">
						<td>아이디 입력: &nbsp;&nbsp;</td>
						<td><input type="text" name="id" placeholder="ID" class="form-control">
						</td>
						<td>&nbsp;<input type="submit" value="비밀번호 찾기"
							class="btn btn-primary">
						</td>
					</tr>
				</table>
			</div>
		</form>
</body>
</html>