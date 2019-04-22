<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
td{border:1px solid black;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%

if(application.getAttribute("view")==null){
	application.setAttribute("view", "0");
}

%>


<table style="border:1px solid black;">
<tr>
<td>제목</td>
<td>조 회 수</td>
</tr>
<tr>
<td><a href="./result.jsp">안녕하세요</a></td>
<td><%out.print(application.getAttribute("view"));%>
</table>



</body>
</html>