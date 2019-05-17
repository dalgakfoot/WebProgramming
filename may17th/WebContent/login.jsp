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

	<div id="page-wrapper">
		<form action="checkLogin.jsp">
			<div align="center">


				<div class="container">
					<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
						<div class="panel panel-success">
							<div class="panel-heading">
								<div class="panel-title">KGITBANK 토토</div>
							</div>
							<div class="panel-body">

								<div>
									<input type="text" class="form-control" id="id" name="id"
										placeholder="Username" autofocus>
								</div>
								<div>
									<input type="password" class="form-control" id="pwd" name="pwd"
										placeholder="Password">
								</div>
								<div align="center">
									<br>
									<input type="submit" class="form-control btn btn-primary" value="로그인">
									<br> <br>
									<input type="button" onclick="location.href='myPage.jsp'"
										class="btn btn-warning" value="회원가입">
									<input type="button" onclick="location.href='findId.jsp'"
										class="btn btn-warning" value="아이디 찾기">
									<input type="button" onclick="location.href='findPwd.jsp'"
										class="btn btn-warning" value="비밀번호찾기">

								</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</form>
		<!-- /#page-wrapper -->
	</div>
</body>
</html>
