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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<fmt:requestEncoding value="utf-8"/>

<jsp:include page="./header_login.jsp"/>

<div align="center">
		<jsp:useBean id="dao" class="gameDB.GameDAO"/>
		<jsp:useBean id="dto" class="gameDB.GameDTO"/>
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
			out.print("<th>"+"<button onclick="+"location.href='betting.jsp?id="+g.getId()+"'>배팅하기</button></th>");
			}else{
				
				out.print("<th>"+"<button disabled>배팅하기</button>"+"</th>");
			}
			
			
		}
		
		%>
		

		
		</table>
		
		<hr/>
		
		
		
	</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>