<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(session.getAttribute("name")!=null) {%>
<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:useBean id="member" class="members.MemberDTO"/>
<%
member = dao.memberInfo(request.getParameter("name"));
String id = member.getId();
String pwd = member.getPwd();
String name = member.getName();
String addr = member.getAddr();
String tel = member.getTel();
%>
<div>
<form action='./updateChk.jsp'>
아이디 <input type='text' name ='id' value="<%=id %>" placeholder="<%=id %>" readonly="readonly"> <br>
비밀번호 <input type='text' name= 'pwd' value="<%=pwd %>" placeholder="<%=pwd %>" readonly="readonly"> <br>
이름 <input type='text' name ='name' placeholder='<%=name %>'><br>
주소 <input type='text' name ='addr' placeholder='<%=addr %>'><br>
전화번호 <input type='text' name = 'tel' placeholder='<%=tel %>'><br>
<input type='submit' value='완료'><input type='reset' value='취소'>
</form>
</div>
<%}else{response.sendRedirect("./login.jsp");}%>
</body>
</html>