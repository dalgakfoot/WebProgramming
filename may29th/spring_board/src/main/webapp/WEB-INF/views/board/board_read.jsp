<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/header.jsp"/>

<div align="center">
<form action="update">
<input type="hidden" name="id" value="${dto.id }">
<table border="1">
<tr>
<th>번호</th><th>${dto.id }</th>
</tr>
<tr>
<th>조회수</th><th>${dto.hit }</th>
</tr>
<tr>
<th>이름</th><th><input type="text" name="name" value="${dto.name}"></th>
</tr>
<tr>
<th>제목</th><th><input type="text" name="title" value="${dto.title }"></th>
</tr>
<tr>
<th>내용</th><th><textarea name="content">${dto.content }</textarea></th>
</tr>
<tr>
<th colspan="2" align="left"><input type="submit" value="수정"><a href="list">목록보기</a>&nbsp;
<a href="delete?id=${dto.id}">삭제</a>&nbsp;<a href="reply_view?id=${dto.id}">답변</a>
</th>
</tr>
</table>
</form>
</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>