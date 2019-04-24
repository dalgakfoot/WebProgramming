<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uid = request.getParameter("id");
String upwd = request.getParameter("pwd");


Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);
String sql1 = "select * from members where id='"+uid+"'";
PreparedStatement pstm = conn.prepareStatement(sql1);
int check = pstm.executeUpdate();
ResultSet rs = pstm.executeQuery();
String uname=null;

%>

<% if(check==0){%>
<script>
alert('일치하는 아이디가 없습니다.')
location.href="./login.jsp"
</script>
<%}%>

<% if(check==1) {
	String chkpwd=null;
	if(rs.next()){
	chkpwd=rs.getString("pwd");
	uname=rs.getString("name");
	}
	if(chkpwd.equals(upwd)){
	session.setAttribute("name", uid);
	
	%>
	<script>
	location.href="./main.jsp";
	</script> 
	
<%}else{%>
	<script>
	alert('비밀번호가 다릅니다.');
	location.href="./login.jsp";
	</script>
	<% }}%>






</body>
</html>