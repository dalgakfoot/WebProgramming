<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 해당하는 class의 객체를 id란 이름으로 만든다.  -->
<jsp:useBean id="mb" class="members.MemberDTO"/>
<b>자바 빈 객체 생성 후 저장된 정보 출력하기</b>
이름 : <%=mb.getName() %><br>
아이디 : <%=mb.getId() %><br>
<%
	mb.setName("망함"); mb.setId("a1234");
%>
<b>정보 변경 후 내용 출력하기</b>
이름 : <%=mb.getName() %><br>
아이디 : <%=mb.getId() %><br>

</body>
</html>