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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	String id="jsp", pwd="1234";
	Connection conn = DriverManager.getConnection(url, id, pwd);
	String sql = "select * from student where id="+request.getParameter("id");
	PreparedStatement pstm = conn.prepareStatement(sql);
	ResultSet rs = pstm.executeQuery();
	
	
	
%>
<h1>인적 사항</h1>

<%
while(rs.next()){
	out.print("<h3>");
	out.print("학번 : "+rs.getString("id")+"<br>");
	out.print("이름 : "+rs.getString("name")+"<br>");
	out.print("국,영,수 :"+rs.getString("kor")+",");
	out.print(rs.getString("eng")+",");
	out.print(rs.getString("mat"));
	out.print("</h3>");
	
}

%>

<input type="button" onclick="location.href='main.jsp'" value="뒤로">

</body>
</html>