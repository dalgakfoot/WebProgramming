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
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
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
				<div class="panel-heading">
				<h3 class="panel-title">
						<i class="fa fa-bar-chart-o"></i> 오늘의 경기 일정
					</h3>
				
				</div>



				<div class="panel-body">
					<table class="table">
						<tr>
							<th>경기ID</th>
							<th>경기시간</th>
							<th>HOME</th>
							<th>HOME 승률</th>
							<th>AWAY</th>
							<th>AWAY 승률</th>
							<th>승리팀</th>

							<%
								ArrayList<GameDTO> test = new ArrayList<>();
								test = dao.select();

								for (GameDTO g : test) {

									out.print("<tr>" + "<th>" + g.getId() + "</th>");
									out.print("<th>" + g.getGame_time() + "</th>");
									out.print("<th>" + g.getTeamA() + "</th>");
									out.print("<th>" + g.getTeama_winratio() + "</th>");
									out.print("<th>" + g.getTeamB() + "</th>");
									out.print("<th>" + g.getTeamb_winratio() + "</th>");
									out.print("<th>" + g.getWin() + "</th>");

									if (dao.foo(g.getId()).equals("경기 시작 전 입니다.")) {
										out.print("<th>" + "<button class='btn btn-primary' onclick=" + "window.open('betting.jsp?id=" + g.getId()
												+ "','배팅하기','width=430,height=500,location=no,status=no,scrollbars=yes');>배팅하기</button></th>");
									} else {

										out.print("<th>" + "<button class='btn btn-warning' disabled>경기 종료</button>" + "</th>");
									}

								}
							%>
						
					</table>
				</div>
			</div>



		</div>
		<jsp:include page="./footer.jsp" />
	</div>
</body>
</html>
