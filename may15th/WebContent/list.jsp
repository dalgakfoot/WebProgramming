<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="board.totoDAO" />
<header>
<jsp:include page="./header_login.jsp"/>
</header>
<!-- 페이지  -->
<c:set var="totalPage" value="${dao.totalPage() }"/>
<fmt:parseNumber var="number" integerOnly="true" value="${totalPage/10}"/> <!-- 정수로만 표현 -->
<c:set var="pageCnt" value="${number + 1}"/>
<c:choose>
	<c:when test="${param.start == null }">
		<c:set var="start" value="${1}"/>
	</c:when>
	<c:otherwise>
		<c:if test="${param.start != 1 }">
			<c:set var="start" value="${((param.start-1) * 10) +1}" />
		</c:if>		
	</c:otherwise>
</c:choose>
<c:set var="end" value="${start + 9}"/>


<%-- <c:set var="user" value="asd" scope="session"/>		 --%>	<!-- 임의 세션 -->
<c:choose>
	<c:when test="${sessionScope.userid eq '' || sessionScope.userid eq null}">
		<script>
			alert("로그인 후 사용할 수 있습니다~~");
			location.href="login.jsp";
		</script>
	</c:when>
	<c:otherwise>
		<div align="center">
		<table border="1">
			<caption><font size='6'>게시판</font></caption>
			<tr>
				<th>번호</th><th>등록자</th><th>제목</th><th>등록날짜</th><th>조회수</th>
			</tr>
			
			<!-- 운영자 공지글 -->
			<c:forEach var="gmDTO" items="${dao.gmList() }">
				<tr>
					<th>공지</th><th>${gmDTO.name}</th><th><a href="content_view_gm.jsp?userId=${sessionScope.userid}&chk=${0}&num=${gmDTO.num}">${gmDTO.title}</a></th>
					<th>${gmDTO.savedate }</th><th>${gmDTO.hit}</th>
				</tr>		
			</c:forEach>
			
			<c:forEach items="${dao.list(start, end)}" var="dto">
			<tr>
				<td>${dto.id}</td><td>${dto.name}</td>
				<td>
					<c:forEach begin="1" end="${dto.indent}">-></c:forEach>
				<a href="content_view.jsp?id=${dto.id}&userId=${dto.name}&chk=${0}">${dto.title}</a></td><td>${dto.savedate}</td>
				<td>${dto.hit }</td>		
			</tr>
			<input type="hidden" name="idgroup" value="${dto.idgroup }">
			<input type="hidden" name="step" value="${dto.step}">
			<input type="hidden" name="indent" value="${dto.indent }">
			<input type="hidden" name="userdId" value="${sessionScope.userid}">
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
				<c:choose>
					<c:when test="${param.start ==null}">
						<c:set var="start" value="1"/>
					</c:when>
					<c:otherwise>
						<c:set var="start" value="${param.start}"/>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${start >1 }">
						<button onclick="location.href='list.jsp?start=${start-1}'">이전</button>
					</c:when>
					<c:otherwise>
						<button disabled="disabled">이전</button>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${pageCnt}" step="1" var="cnt">
							<a href="list.jsp?start=${cnt}">[${cnt}]</a>
				</c:forEach>
						
				<c:choose>
					<c:when test="${start < pageCnt }">
						<button onclick="location.href='list.jsp?start=${start+1}'">다음</button>
					</c:when>
					<c:otherwise>
						<button disabled="disabled">다음</button>
					</c:otherwise>
				</c:choose>
					${start}/${ pageCnt }
				<a href ="write_view.jsp">글작성</a>
				
				<c:if test="${sessionScope.userid eq 'Manager'}">
					<a href="write_view_gm.jsp">공지글작성</a>
				</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="5" align="center">
					<form action="searchList.jsp">
					<input type="text" name="search" placeholder="검색할 제목을 입력하세요">&nbsp;&nbsp;<input type="submit" value="검색">
 					</form>
 				</td>
			</tr>
		</table>
		</div>
	</c:otherwise>
</c:choose>
	<footer>
	<jsp:include page="./footer.jsp"/>
	</footer>
</body>
</html>