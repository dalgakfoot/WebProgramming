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
#text{width:90%;}
textarea{width:90%;height:400px;}
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="pagingtestBoard.TestDAO"/>
<c:set var="num" value="${param.num }"/>
<c:set var="dto" value="${dao.context(param.num) }"/>
<c:choose>
<c:when test="${param.up eq true}">
<form action="./updatechk.jsp">
<input type="hidden" name="num" value="${num }">
<div id="container">
<div>
<table border=1>
	<tr>
	<th>작성자</th><th>${dto.id }</th>
	<th>조회수</th><th>${dto.count }</th>
	</tr>
	<tr>
	<th>작성일</th><th>${dto.pdate }</th>
	<th>다운로드</th><th>${dto.filename}</th>
	<tr>
	<tr>
	<th>제목 수정</th><th colspan="3"><input type="text" id="text" name="title" value="${dto.title }" ></th>
	</tr>
	<tr>
	<th>문서내용 수정</th><th colspan="3"><textarea name="content">${dto.content }</textarea></th>
	</tr>
	<tr>
	<th colspan="4" align="left"><button type="button" onclick="history.back()">이전</button>
	<input type="submit" value="수정">
	</th>
	</tr>
</table>
</div>
</div>
</form>
</c:when>
<c:when test="${param.del eq true }">
<form action="./deletechk.jsp" name="del">
<input type="hidden" name="num" value="${num}">
<script>
document.del.submit();
</script>
</form>
</c:when>
</c:choose>
</body>
</html>