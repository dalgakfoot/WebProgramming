<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
<table style="border:1px solid black;text-align:center;">
<tr>
<td>학번</td><td>이름</td><td>국어</td><td>영어</td><td>수학</td>
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	String id="jsp", pwd="1234";
	Connection conn = DriverManager.getConnection(url, id, pwd);
	
	String sql="select * from student";
	PreparedStatement pstm = conn.prepareStatement(sql);
	ResultSet rs = pstm.executeQuery();
	

	while(rs.next()){
	System.out.print("rs 시작");
	out.print("<tr>"+"<td>"+ rs.getString("id")+"</td>" );
	out.print( "<td>"+"<a href='value.jsp?id="+rs.getString("id") +"'>"+rs.getString("name")+"</a>"+"</td>" );
	out.print( "<td>"+ rs.getString("kor") +"</td>" );
	out.print( "<td>"+ rs.getString("eng") +"</td>" );
	out.print( "<td>"+ rs.getString("mat")+ "</td>"+"</tr>" );	
}

%>



</table>
 
</body>
</html>