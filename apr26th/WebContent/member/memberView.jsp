<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="foo" class="members.MemberDAO"/>
<%

	ArrayList<MemberDTO> memberList = foo.memberView();
	for(MemberDTO m : memberList){
		out.print("id : "+m.getId()+"<br>");
		out.print("pwd : "+m.getPwd()+"<br>");
		out.print("name : "+m.getName()+"<br>");
		out.print("addr : "+m.getAddr()+"<br>");
		out.print("tel : "+m.getTel()+"<br>");
		out.print("<hr>");
	}

%>


</body>
</html>