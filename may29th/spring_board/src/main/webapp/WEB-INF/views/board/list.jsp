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
<h1>게시판</h1>
</div>


<div align="center">
<table border="1">
<tr>
<th>번호</th><th>이름</th><th>제목</th><th>날짜</th><th>조회수</th><th>group</th><th>step</th><th>indent</th>
</tr>
<c:forEach var="dto" items="${list}">
<tr>
<th>${dto.id}</th><th>${dto.name}</th>

<th><c:forEach begin="1" end="${dto.indent }">-></c:forEach>
<a href="board_read?id=${dto.id}">${dto.title}</a></th>
<th>${dto.savedate}</th><th>${dto.hit}</th><th>${dto.idgroup}</th><th>${dto.step}</th><th>${dto.indent}</th>
</tr>
</c:forEach>

<tr>
<th colspan="8" align="left"><a href="board_write">글작성</a></th>
</tr>

</table>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>