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
<%

String uid = (String)session.getAttribute("name");

if(uid!=null){

out.print("<script>");
out.print("alert('"+uid+"님 환영합니다.')");
out.print("</script>");
%>
<h1>회원들만의 페이지</h1>
<table style="border:1px solid black;text-align:center;">
<tr>
<td>아이디</td><td>비밀번호</td><td>이름</td><td>주소</td><td>전화번호</td>
</tr>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);

String sql = "select * from members";
PreparedStatement pstm = conn.prepareStatement(sql);
ResultSet rs = pstm.executeQuery();

while(rs.next()){
	out.print("<tr>"+"<td>"+ rs.getString("id")+"</td>" );
	out.print( "<td>"+ rs.getString("pwd") +"</td>" );
	out.print( "<td>"+ rs.getString("name") +"</td>" );
	out.print( "<td>"+ rs.getString("addr") +"</td>" );
	out.print( "<td>"+ rs.getString("tel")+ "</td>"+"</tr>" );	
}

%>
</table>

<input type="button" value="로그아웃" onclick="location.href='./logout.jsp'">
<input type="button" value="계정정보" onclick="location.href='./showInfo.jsp?id=<%=uid%>'">


<%}else{
	response.sendRedirect("./login.jsp");	
}%>

</body>
</html>