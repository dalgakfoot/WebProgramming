<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="board.totoDAO" />
<jsp:useBean id="dto" class="board.totoDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="searchList" value="${dao.searchList(param.search) }"/>


	<table border="1">
			<caption><font size='6'>게시판</font></caption>
			<tr>
				<th>번호</th><th>등록자</th><th>제목</th><th>등록날짜</th><th>조회수</th>
			</tr>
			<c:forEach var="list" items="${searchList }">
			<tr>
				<td>${list.id}</td><td>${list.name}</td>
				<td>
				<a href="content_view.jsp?id=${list.id}&userId=${user}&chk=${0}">${list.title}</a></td><td>${list.savedate }</td>
				<td>${list.hit }</td>		
			</tr>			
			</c:forEach>
			<tr><td colspan="5"> <input type="button" value="목록으로가기" onclick="location.href='list.jsp'"></td></tr>
	</table>
</body>
</html>