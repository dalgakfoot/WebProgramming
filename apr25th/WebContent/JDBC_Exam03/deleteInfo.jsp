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

Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);
String sql = "delete from members where id='"+uid+"'";
PreparedStatement pstm = conn.prepareStatement(sql);
int chk = pstm.executeUpdate(); 

if(chk==1){%>
	<script>
	alert('회원 삭제 되었습니다.')
	location.href="./logout.jsp";
	</script>
<%}else{%>
	<script>
	alert('오류 발생');
	</script>
<%} %>


</body>
</html>