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

<c:forEach var="list" items="${dao.showReply(param.id)}">
	<table border="1">
	<tr>
		<td>아이디</td><td>${list.userid }</td>
	</tr>
	<tr>
		<td>내용</td><td>${list.content }</td>
	</tr>
	<tr>
		<td>날짜</td><td>${list.savedate }</td>
	</tr>
	<c:if test="${list.userid eq sessionScope.userid || sessionScope.userid eq 'Manager'}">
	<tr>
		<td colspan="2" align="right"><a href="reply_delete.jsp?id=${param.id}&reply_num=${list.num}">댓글삭제</a></td>
	</tr>
	</c:if>
</table>
</c:forEach>


</body>
</html>