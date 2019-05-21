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
		<h1 style="text-align: center;">�λ��� �ѹ�!!</h1>
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">KGITBANK ����</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul id="active" class="nav navbar-nav side-nav">
					<li class="selected"><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="index.jsp"><i class="fa fa-tasks"></i> �������</a></li>
					<li><a href="index.jsp"><i class="fa fa-globe"></i>
							�Ӵ�����</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
							�����Խ���</a></li>
					<li><a href="index.jsp"><i class="fa fa-font"></i> ����������</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
							��ŷ</a></li>
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
					<li style="width:1550px"><marquee direction="left"><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i>&nbsp;Welcome to the KGITBANK ����! 
�ٸ� ����Ʈ�ʹ� ����ȭ�� �����ϰ� ���� �ºο�������! ��Ƣ ���� ���� �������� ����Ʈ!&nbsp;<i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i></marquee></li>
					<li class="dropdown user-dropdown"><c:choose>
							<c:when test="${sessionScope.userid != null }">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i> ${sessionScope.userid} ��<b
									class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="myInfo.jsp"><i class="fa fa-user"></i>
											����������</a></li>
									<li class="divider"></li>
									<li><a href="logout.jsp"><i class="fa fa-power-off"></i>
											�α׾ƿ�</a></li>
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

		<form action="checkPwd.jsp">
			<div align="center">
				<table>
					<tr style="text-align: center">
						<td>���̵� �Է�: &nbsp;&nbsp;</td>
						<td><input type="text" name="id" placeholder="ID" class="form-control">
						</td>
						<td>&nbsp;<input type="submit" value="��й�ȣ ã��"
							class="btn btn-primary">
						</td>
					</tr>
				</table>
			</div>
		</form>
</body>
</html>