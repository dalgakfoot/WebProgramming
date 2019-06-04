<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>
<td>글 번호</td>
<td>${dto.num}</td>
</tr>

<tr>
<td>작성자</td>
<td>${dto.id }</td>
</tr>

<tr>
<td>제목</td>
<td>${dto.title }</td>
</tr>

<tr>
<td>내용</td>
<td><textarea disabled="disabled">${dto.content }</textarea></td>
</tr>

<tr>
<td colspan="2" align="left">
<button type="button" onclick="location.href='board'">
목록
</button>
</tr>

</table>
</body>
</html>