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
	<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="pagingtestBoard.TestDAO" />
	<c:set var="listDto" value="${dao.list() }" />
	<c:set var="paginglist" value="${dao.getTotalPage(param.start) }"/>

	<c:set var="totalPage" value="${dao.getTotalPagea() }" />

	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록날짜</th>
			<th>조회수</th>
		</tr>
		<c:choose>
			<c:when test="${listDto.size()!=0 }">
				<c:forEach var="dto" items="${paginglist }">
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
			<td colspan="4" align="right">
				<!-- 이전 버튼 기능  --> <c:choose>
					<c:when test="${param.start==null}">
						<c:set var="start" value="1" />
					</c:when>
					<c:otherwise>
						<c:set var="start" value="${param.start }" />
					</c:otherwise>
				</c:choose> <c:choose>
					<c:when test="${start>1 }">
						<button onclick="location.href='list.jsp?start=${start-1}'">이전</button>
					</c:when>
					<c:otherwise>
						<button disabled="disabled">이전</button>
					</c:otherwise>
				</c:choose> 
				<!-- 이전 버튼 기능 끝  --> 
				<!-- 페이지 숫자 출력 기능  --> <c:forEach begin="1" end="${totalPage}" step="1" var="cnt">
					<a href="list.jsp?start=${cnt }">[${cnt}]</a>
				</c:forEach> 
				<!-- 페이지 숫자 출력 기능 끝  --> 
				<c:choose>
					<c:when test="${start<totalPage}">
						<button onclick="location.href='list.jsp?start=${start+1}'">다음</button>
					</c:when>
					<c:otherwise>
						<button disabled="disabled">다음</button>
					</c:otherwise>
				</c:choose> 
				${start} / ${totalPage }
				<button type="button" onclick="location.href='regForm.jsp'">등록</button>
			</td>
		</tr>
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
				
				<!-- sql = select rownum from paging : paging 테이블의 열 번호 출력 -->
				<!-- sql = select a.num from (select * from paging order by num desc)a where num between 1 and 3;
					paging 테이블을 num내림차순으로 정렬한 모든 값을 a로 지정하고 a속 num중 num이 1~3인 값을 출력
				 -->
			
	</table>
</body>
</html>