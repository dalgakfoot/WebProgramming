<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td{border:1px solid black;}
</style>
</head>
<body>
<%-- <%if(session.getAttribute("name")!=null) {%> --%>
<c:choose>
<c:when test = "${sessionScope.name!=null}">
<jsp:include page="../Exam_default/header_loginsuc.jsp"/>
<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:useBean id="member" class="members.MemberDTO"/>

<%-- <%

ArrayList<MemberDTO> select = new ArrayList<MemberDTO>();
select = dao.memberView();
%> --%>
<c:set var="select" value="${dao.memberView()}"/>
<div style="text-align:center;">
<h2>회원 목록</h2>
<table style="border:1px solid black;">
<tr>
<td>이름</td><td>주소</td><td>전화번호</td>
</tr>
<%-- <%
/* "<a href='./memberinfo.jsp?"+m.getName()+">" */
for(MemberDTO m : select){
out.print("<tr>");
out.print("<td>"+"<a href='./memberInfo1.jsp?name="+m.getName()+"'>"+m.getName()+"</a>"+"</td>");
out.print("<td>"+m.getAddr()+"</td>"+"<td>"+m.getTel()+"</td>");
out.print("</tr>");		
}
%> --%>


<c:forEach var="member" items="${select}">
	<tr>
	<td><a href='./memberInfo1.jsp?name=${member.getName()}'><c:out value="${member.getName()}"/></a></td>
	<td><c:out value="${member.getAddr()}"/></td>
	<td><c:out value="${member.getTel()}"/></td>
	</tr>
</c:forEach>
</table>
</div>
<jsp:include page="../Exam_default/footer.jsp"/>
</c:when>
<%-- <%}else{response.sendRedirect("./login.jsp");}%> --%>
<c:otherwise>
	<%response.sendRedirect("./login.jsp"); %>
</c:otherwise>
</c:choose>
</body>
</html>