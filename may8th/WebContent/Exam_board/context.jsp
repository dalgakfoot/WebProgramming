<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{width:70%;}
#container{text-align: center;}
</style>
</head>
<body>
<header>
<jsp:include page="../Exam_default/header_loginsuc.jsp"/>
</header>
<!-- 제목 클릭시 보여지는 글의 내용  -->
<fmt:requestEncoding value="utf-8"/>
	<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
	
	
	<c:set var="dto" value="${dao.context(param.num) }"/>
	
	<c:set var="id" value="${sessionScope.name }"/>
	<c:set var="dtoid" value="${dto.id }"/>
	
	<%
	
	String saveDir = application.getRealPath("fileUpDown");
	File dir = new File(saveDir);

	%>
	
	
	${dao.count(param.num) }
<div id="container">
<div>
<table border=1>
	<tr>
	<th>작성자</th><th>${dto.id }</th>
	<th>조회수</th><th>${dto.count }</th>
	</tr>
	<tr>
	<th>작성일</th><th>${dto.pdate }</th>
	<th>다운로드</th><th>
	<a href="http://localhost:8080/may7th/FileDown?fileName=${dto.filename}">${dto.filename}</a>
	<%-- ${dto.filename } --%></th>
	<tr>
	<tr>
	<th>제목</th><th colspan="3">${dto.title }</th>
	</tr>
	<tr>
	<th>문서내용</th><th colspan="3">${dto.content }</th>
	</tr>
	<tr>
	<td colspan="4" align="left">
	<button onclick="location.href='./list.jsp?start=1'">목록</button>
	<c:choose>
	<c:when test= "${id == dtoid}" >
	<form name="update" action="./update.jsp">
	<button name="up" value="true" onclick="document.upload.submit()">수정</button>
	<input type="hidden" name="num" value="${param.num }">
	<button name="del" value="true" onclick="document.upload.submit()">삭제</button>
	</form>
	</c:when>
	<c:otherwise>
	
	</c:otherwise>
	</c:choose>
	</td>

</table>
</div>
</div>

<footer>
	<jsp:include page="../Exam_default/footer.jsp"/>
	</footer>

</body>
</html>