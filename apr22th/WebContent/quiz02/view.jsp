<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<p>이름 : <%=request.getParameter("name") %></p>
<p>소개 : <%=request.getParameter("intro") %></p>
<p>나이 : <%=request.getParameter("age") %></p>

<%
	String[] hobby = request.getParameterValues("hobby");
	out.print("<p>취미 : ");
	for(int i = 0; i<hobby.length;i++){
		out.print(hobby[i]+"&nbsp;");
	}

%>
	<br>
	<b>for each문 사용</b>
	<br>
<%
	for (String s: hobby){
		out.print(s+"&nbsp;");
	}
	
%>

<hr>
<b>request.getParameterNames() 메서드 사용</b><br>
<%
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String name= (String)paramEnum.nextElement();
		out.print(name+"<br>");
	}

%>

<b><a href='javascript:history.go(-1)'>다시 작성</a></b><br>
<b><a href='javascript:history.back()'>다시 작성</a></b>




</body>
</html>