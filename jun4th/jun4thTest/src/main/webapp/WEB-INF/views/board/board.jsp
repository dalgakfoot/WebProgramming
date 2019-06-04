<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h1>게시판</h1>
<table border="1">
<tr>
<td>글번호</td><td>작성자</td><td>제목</td><td>조회수</td>
</tr>
<c:forEach var="dto" items="${list}">
<tr>
<td>${dto.num }</td>
<td>${dto.id }</td>
<td><a href="read?num=${dto.num }">${dto.title}</a></td>
<td>${dto.hit }</td>
</tr>
</c:forEach>
<tr>
<td colspan="4" align="left">
${sessionScope.userId }

<c:if test="${sessionScope.userId!=null }">
<button onclick="location.href='write'">글쓰기</button>
</c:if>

<c:choose>
<c:when test="${sessionScope.userId==null }">
<button onclick="location.href='login'">로그인</button>
</c:when>
<c:otherwise>
<button onclick="location.href='logout'">로그아웃</button>
</c:otherwise>
</c:choose>
<button onclick="location.href='register'">회원가입</button>
</table>
</div>
</body>
</html>