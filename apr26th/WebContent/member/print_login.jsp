<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
이전에 사용한 login페이지를 현재 페이지로 submit 해주세요.
<jsp:useBean id="mb" class="members.MemberDTO"/>
<!-- form 태그로 보내주는 값을 setProperty를 통해 useBean으로 만든 mb객체에 저장한다. -->
<jsp:setProperty property="*" name="mb"/><br>

id : <jsp:getProperty property="id" name="mb"/>
pwd : <jsp:getProperty property="pwd" name="mb"/>

id: <%=mb.getId() %>
pwd: <%=mb.getPwd() %>


</body>
</html>