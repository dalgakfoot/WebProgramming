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

<div>
		<jsp:useBean id="dao" class="gameDB.GameDAO"/>
		<jsp:useBean id="dto" class="gameDB.GameDTO"/>
		<c:set var="arr" value="${dao.win() }"/>
		
		
		
		<table border="1">
		<tr>
		<td>경기ID</td><td>경기시간</td><td>팀a 승률</td><td>팀b 승률</td>
		<c:forEach var="g" items="${arr}">
		<tr>
		<td>${g.getId() }</td>
		<td>${g.getGame_time() }</td>
		<td>${g.getTeama_winratio() }</td>
		<td>${g.getTeamb_winratio() }</td>
		</c:forEach>
		
		
		</table>
		
		<hr/>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm");
		String today = formatter.format(new java.util.Date());
		out.println(today);
		%>
		<hr/>
		<%
		ArrayList<GameDTO> arr = new ArrayList<>();
		arr = dao.win();
		dto = arr.get(1);
		
		out.println("현재 시간 : "+today);
		out.println("경기 시간 : "+dto.getGame_time());
		
		String test1 = today.split(":")[0];
		String test2 = today.split(":")[1];
		
		out.println("test1 : "+test1);
		out.println("test2 : "+test2);
		out.println("test1+test2 : "+test1+test2);
		
		
		
		
		
		
		
		if(today.equals(dto.getGame_time())){
			out.println("시간 같음");
		}else{
			out.println("시간 다름");
		} 
		
		/* 승리 팀 정하기 코드 */
		
		float a = dto.getTeama_winratio();
		float b = dto.getTeamb_winratio();
		
		float mother = a+b;
		
		float teama = a/mother;
		//float teamb = b/mother;
		
	
		out.println("a : "+a);
		out.println("b : "+b);
		
		out.println("teama: "+teama);
		//out.println("teamb: "+teamb);
		
	
		double win = Math.random();
		
		if(win<=teama){
			out.println("a가 이겨씀");
		}else{
			out.println("b가 이겨뜸");
		}
		
		
		
		
		%>
		
		
	</div>
</body>
</html>