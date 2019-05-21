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

<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>

</head>
<body>

<div align="center">
		<jsp:useBean id="dao" class="gameDB.GameDAO"/>
		<jsp:useBean id="dto" class="gameDB.GameDTO"/>
		<jsp:useBean id="bet" class="bettingDB.bettingDAO"/>
		<%-- <c:set var="arr" value="${dao.win() }"/> --%>
		
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
		<nav class="navbar navbar-inverse navbar-fixed-top"
							role="navigation">
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target=".navbar-ex1-collapse">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="index.html">인생한길</a>
							</div>
							<div class="collapse navbar-collapse navbar-ex1-collapse">
								<ul class="nav navbar-nav side-nav">
									<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li><a href="signup.html"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li class="selected"><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
								</ul>
								<ul class="nav navbar-nav navbar-right navbar-user">
					
					<li class="dropdown user-dropdown">
					
					
					
					<c:choose>
							<c:when test="${sessionScope.userid != null }">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i> ${sessionScope.userid} 님<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="myInfo.jsp"><i class="fa fa-user"></i> 마이페이지</a></li>
							<li class="divider"></li>
							<li><a href="logout.jsp"><i class="fa fa-power-off"></i> 로그아웃</a></li>
						</ul>
							
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
					</li>
					<li class="divider-vertical"></li>
					<li>
						
					</li>
				</ul>
							</div>
						</nav>
		
		<table class="table">
		<tr>
		<td>경기ID</td><td>경기시간</td><td>팀a 승률</td><td>팀b 승률</td><td colspan="2">승리팀</td>

		<% 
		
		ArrayList<GameDTO> test = new ArrayList<>();
		test = dao.select();
		
		for(GameDTO g : test){
			
			out.print("<tr>"+"<td>"+g.getId()+"</td>");
			out.print("<td>"+g.getGame_time()+"</td>");
			out.print("<td>"+g.getTeama_winratio()+"</td>");
			out.print("<td>"+g.getTeamb_winratio()+"</td>");
			out.print("<td>"+g.getWin()+"</td>");
			
			if(dao.foo(g.getId()).equals("경기 시작 전 입니다.")){
				out.print("<td>"+"<button class='btn btn-warning' disabled>돈 분배하기</button>"+"</td>");
			
			}else if(bet.isgive(g.getId())==0){%>
				<%if(bet.iszero(g.getId())!=null){%>
				<!-- out.print("<td>"+"<button onclick=location.href="+"'../SubMoney?id="+g.getId()+"&win="+g.getWin()+"'>돈 분배하기</button></td>"); -->
				<td>
				<form action="Submoney" method="post">
				<input type="hidden" name="id" value="<%=g.getId()%>">
				<input type="hidden" name="win" value="<%=g.getWin()%>">
				<button type="submit" class='btn btn-primary' onclick="alert('돈 분배 완료')">돈 분배하기</button>
				
				</form>
				</td>
				<%} %>
			
		<%}else{%>
			<td><button class="btn btn-warning" disabled>돈 분배하기</button></td>
			
		<%}}%>
		
		
		
		

		
		</table>
		
		<hr/>
		
		
		
	</div>



<%@ include file="footer.jsp" %>
</body>
</html>