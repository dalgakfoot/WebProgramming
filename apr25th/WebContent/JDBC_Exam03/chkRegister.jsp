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
request.setCharacterEncoding("utf-8");

String uid = request.getParameter("id");
String upwd = request.getParameter("pwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String phone = request.getParameter("phone");

int result=9;

Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);

String sql= "insert into members (id,pwd,name,addr,tel)"+" values ("+"'"+uid+"','"+pwd+"','"+name+"','"+addr+"','"+phone+"')";
String sql1= "select count(*) from members where id='"+uid+"'";
PreparedStatement pstm = conn.prepareStatement(sql1);
ResultSet rs = pstm.executeQuery();
while(rs.next()){
	result=rs.getInt("count(*)");
}

System.out.print(result);
if(result==0){

pstm = conn.prepareStatement(sql);
int result1 = pstm.executeUpdate();

if (result1==1) {session.setAttribute("name", uid);
%>
	<script>
	alert('회원가입을 축하합니다.')
	location.href="./main.jsp"
	</script>
<%}}else{%>
	<script>
	alert('중복된 아이디 입니다. 다시 시도해주세요')
	location.href="./register.jsp"
	</script>

<%} %>





</body>
</html>