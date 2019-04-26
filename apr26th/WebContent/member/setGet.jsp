<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="mb" class="members.MemberDTO"/>
<b>자바 빈 객체 생성 후 저장된 정보 출력하기</b>
이름 : <jsp:getProperty property="id" name="mb"/><p>
아이디 : <jsp:getProperty property="pwd" name="mb"/><p>

<b>정보 변경 후 내용 출력하기</b>
<jsp:setProperty property="id" name="mb" value="고길동"/>
<jsp:setProperty property="pwd" name="mb" value="gogogo"/>
이름 : <jsp:getProperty property="id" name="mb"/><p>
아이디 : <jsp:getProperty property="pwd" name="mb"/><p>
</body>
</html>