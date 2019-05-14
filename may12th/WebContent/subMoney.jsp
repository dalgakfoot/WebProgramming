<%@page import="bettingDB.bettingDTO"%>
<%@page import="java.util.ArrayList"%>
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
<%-- <c:set var="id" value="${param.id}"/>
<c:set var="win" value="${param.win}"/>
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<c:set var="winner" value="${dao.winner(id,win) }"/>
<c:set var="sum" value="${dao.sum(param.id) }"/>
<c:set var="size" value="${winner.size() }"/>



<c:forEach var="i" begin="0" end="${winner.size()-1">

${dao.give(param.id, winner.size(), winner.get(i).getUserid()) }

</c:forEach> --%>
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<fmt:requestEncoding value="utf-8"/>
<%
String temp = request.getParameter("id");

int id = Integer.parseInt(temp);
String win = request.getParameter("win");

ArrayList<bettingDTO> arr = dao.winner(id, win);
int sum = dao.sum(id);
int size = arr.size();

	out.println(id);
	out.println(size);
	out.println(sum);
	out.println(arr.get(0).getUserid());
	
	
	String userid = arr.get(0).getUserid();
	
	for(int i = 0; i<arr.size();i++){
	
		
		System.out.println("^^;");
		
		dao.give(id, size, sum, userid);
		
	}
	
	
	


%>








</body>
</html>