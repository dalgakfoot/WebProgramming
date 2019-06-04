<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<form action="write_save">
<table border="1">
<tr>
<td>글쓴이</td>
<td><input type="text" value="${sessionScope.userId }" disabled="disabled"></td>
<input type="hidden" value="${sessionScope.userId }" name="id">
</tr>
<tr>
<td>제목</td>
<td><input type="text" name="title"></td>
</tr>
<tr>
<td>내용</td>
<td><textarea name="content"></textarea></td>
</tr>
<tr>
<td colspan="2" align="left">
<input type="submit" value="저장">
</form>
<button type="button" onclick="location.href='board'">취소</button>
</td>
</tr>
</table>

</div>
</body>
</html>