<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="board.totoDAO"/>
<jsp:useBean id="dto" class="board.totoDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="list" value="${dao.modifyView(param.id)}" />

<div align="center">
<form action="modify.jsp">
	<input type="hidden" name="id" value="${param.id}">
<table border="1">
	<tr>
		<th>Nick</th><th><input type="text" name="name" value="${list.name }"></th>
	</tr>
	<tr>
		<th>제목</th><th><input type="text" name="title" value="${list.title }"></th>
	</tr>
	<tr>
		<th>내용</th><th><input type="text" name="content" value="${list.content }"></th>
	</tr>
</table>
	<input type="submit" value="수정완료"> <input type="button" onclick="history.back()" value="취소">
</form>
</div>
</body>
</html>