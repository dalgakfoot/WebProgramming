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
<script>

function modify(){
	var form = document.getElementById("form");
	form.submit();
}

function del(){
	var form = document.getElementById("form");
	form.action = "./deleteInfo.jsp"
	form.submit();
}

</script>
</head>
<body>
<%

String uid = request.getParameter("id");
String ida = null;
String pwda = null;
String name = null;
String addr = null;
String tel = null;

Class.forName("oracle.jdbc.driver.OracleDriver");
String url= "jdbc:oracle:thin:@192.168.19.128:1521:xe";
String id="jsp", pwd="1234";
Connection conn = DriverManager.getConnection(url, id, pwd);
String sql = "select * from members where id='"+uid+"'";

PreparedStatement pstm = conn.prepareStatement(sql);
ResultSet rs = pstm.executeQuery();

while(rs.next()){
	
	ida = rs.getString("id");
	pwda = rs.getString("pwd");
	name = rs.getString("name");
	addr = rs.getString("addr");
	tel = rs.getString("tel");
	
}

%>
<h1>회원 정보 수정 및 삭제</h1>
<form id="form" action="modifyInfo.jsp" method="post">
아이디 : <%out.print("<input type='text' name='id' value='"+ida+"' readonly><br>"); %>
비밀번호 : <%out.print("<input type='text' name='pwd' value='"+pwda+"'><br>"); %>
이름 : <%out.print("<input type='text' name='name' value='"+name+"'><br>"); %>
주소 : <%out.print("<input type='text' name='addr' value='"+addr+"'><br>"); %>
전화번호 : <%out.print("<input type='text' name='tel' value='"+tel+"'><br>"); %>
<button type="button" onclick="modify()">수정</button><button type="button" onclick="del()">삭제</button>
</form>






</body>
</html>