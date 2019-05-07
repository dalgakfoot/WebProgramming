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
<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
<c:set var="type" value="${param.search}"/>
<c:set var="text" value="${param.text }"/>
<c:set var="searchList" value="${dao.search(type,text)}"/>

<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>
		<c:choose>
		<c:when test="${searchList.size()!=0 }">
		<c:forEach var="dto" items="${searchList }">
		<tr>
			<td>${dto.num }</td>
						<td><a href="count.jsp?num=${dto.num}"> ${dto.title }</a></td>
						<td>${dto.pdate}</td>
						<td>${dto.count }</td>
					</tr>
		</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
					<th colspan="4">등록된 정보가 없습니다.</th>
				</tr>
			</c:otherwise>
		</c:choose>
		<tr>
			<td colspan="4" align="left">
			<form action="search.jsp">
			<select name="search">
				<option value="title">제목</option>
				<option value="num">번호</option>
			</select>
			<input type="text" name="text">
			<input type="submit" value="검색">
			</form>
			<button type="button" onclick="location.href='list.jsp?start=1'">목록 이동</button>
			</td>
		
		
</table>

</body>
</html>