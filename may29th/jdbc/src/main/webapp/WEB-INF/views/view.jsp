<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update" method="get">
<input type="hidden" name="id" value="${dto.id }"> 
<table>
<tr>
<th>번호</th><th><input type="text" value="${dto.id }" disabled="disabled"></th>
</tr>
<tr>
<th>이름</th><th><input type="text" value="${dto.name }" name="name"></th>
</tr>
<tr>
<th colspan="2" align="left">
<input type="submit" value="수정"><a href="list">목록보기</a><a href="delete?id=${dto.id }">삭제</a>

</table>
</form>
</body>
</html>