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
<jsp:useBean id="dao" class="board.BoardDAO"/>
<c:set var="dto" value="${dao.contentView(param.id) }"/>
<div align = "center">
<form action ="modify.jsp" method="post">
<input type="hidden" name="id" value="${dto.id }">
<table border="1">
	<tr>
		<td>번호</td><td>${dto.id }</td>
	</tr>
	<tr>
		<td>조회수</td><td>${dto.hit }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${dto.name }"></td>
	</tr>
	<tr>
	<td>제목</td><td><input type="text" name="title" value="${dto.title }"></td>
	</tr>
	<tr>
	<td>내용</td><td><textarea rows="10" name="content">${dto.content }</textarea></td>
	</tr>
	<tr><td colspan="2">
		<input type="submit" value="수정">&nbsp;&nbsp;
		<a href="list.jsp">목록 보기</a>&nbsp;&nbsp;
		<a href="delete.jsp?id=${dto.id}">삭제</a>&nbsp;&nbsp;
		<a href="reply_view.jsp?id=${dto.id}">답변</a>
		

</table>

</form>


</div>


</body>
</html>