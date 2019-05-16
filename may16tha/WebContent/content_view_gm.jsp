<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8" />
<jsp:useBean id="dao" class="board.totoDAO"/>
<c:set var="gmdto" value="${dao.contentView_gm(param.chk, param.userId, param.num)}"/>
<div align="center">
<form action="modify.jsp" method="post">
	<input type="hidden" name="id" value="${dto.id }">
	${id }
	<table border="1">
			<tr>
				<td>번호</td><td>${gmdto.num }</td>
			</tr>
			<tr>
				<td>조회수</td><td>${gmdto.hit }</td>
			</tr>
			<tr>
				<td>등록자</td>
				<td>Manager</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${gmdto.title}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${gmdto.content}</td>
			</tr>
			<tr>
				<td colspan="2">
				<!-- 해당 세션과 아이디가 일치하면 수정기능 -->
				<c:if test="${sessionScope.userid eq 'Manager'}">
					<input type="button" value="수정" onclick="location.href='modifyView.jsp?id=${dto.id}'"> &nbsp;&nbsp;
				</c:if>		
				<a href="list.jsp">목록보기</a>&nbsp;&nbsp;	
				<!-- 해당 세션과 아이디가 일치하면 삭제기능 -->
				<c:if test="${sessionScope.userid eq 'Manager'}">
					<a href="delete.jsp?id=${dto.id}">삭제</a> &nbsp;&nbsp;
				</c:if>	
				</td>
			</tr>
		
		
	
	
		
	</table>
</form>		
	
</div>
</body>
</html>