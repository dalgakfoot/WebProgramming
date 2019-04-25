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
String tel = request.getParameter("tel");

Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);
String sql = "update members set pwd=?, name=?, addr=?, tel=? where id='"+uid+"'";
PreparedStatement pstm = conn.prepareStatement(sql);
pstm.setString(1, upwd);
pstm.setString(2, name);
pstm.setString(3, addr);
pstm.setString(4, tel);

int chk = pstm.executeUpdate();

if(chk==1){%>
<script>
alert('회원 정보 수정 완료')
location.href="./main.jsp"
</script>
<%} %>
</body>
</html>