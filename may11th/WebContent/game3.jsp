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

<jsp:include page="./header.jsp"/>

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
			out.print("<td>"+"<button>배팅하기</button>"+"</td>");
			}else{
				out.print("<td>"+"<button disabled>배팅하기</button>"+"</td>");
			}
			
			
		}
		
		%>
		
		
		
		
		
		
		
		</table>
		
		<hr/>
		
		
		
	</div>
	<jsp:include page="./footer.jsp"/>
</body>
</html>