<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<%@ include file="header.jsp" %>
<h1>자유 게시판</h1>
<hr>
	<table border="1" style="padding: 50px, 0;">
		<tr><th colspan="2">제목</th><th>작성자</th><th>작성일</th><th>조회</th><th>좋아요</th></tr>
		<%-- <c:choose>
		<c:when test="">
		<c:forEach var="" items=""> --%>
		<tr><th>No.</th><th><a href="#">작성한 제목</a></th><th>작성한 작성자</th><th>작성한 작성일</th><th>작성한 조회수</th><th>좋아요 누른 수</th><tr>
		<%-- </c:forEach>
		</c:when>
		</c:choose>
		<c:otherwise> --%>
			<tr> <th colspan="6">등록된 게시글이 없습니다.</th></tr>
		<%-- </c:otherwise> --%>
		<tr><th colspan="6" align="right"><button type="button" onclick="location.href='#'">글쓰기</button></tr>
	</table>
	
	<form action="#">
	<input type="text"><input type="submit" value="검색">
	</form>

<hr>
<%@ include file="footer.jsp" %>
</div>
</body>
</html>