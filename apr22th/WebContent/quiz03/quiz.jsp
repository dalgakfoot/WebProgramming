<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
td{border:1px solid black;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div style="text-align:center;">
<h2>설문 조사</h2>
<form action="./view.jsp" method="post">
<table style="border:1px solid black;">
<tr>
<td>이름:</td>
<td><input type="text" name="name">
</td></tr>

<tr>
<td>성별:</td>
<td><input type="radio" name="gender" value="남자">남자
	<input type="radio" name="gender" value="여자">여자</td>
</tr>

<tr>
<td>좋아하는 계절:</td>
<td><input type="checkbox" name="fav" value="봄">봄<input type="checkbox" name="fav" value="여름">여름
<input type="checkbox" name="fav" value="겨울">봄<input type="checkbox" name="fav" value="겨울">겨울
</td>
</tr>

<tr>

<td><input type="submit" value="전송"></td>
<td><input type="reset" value="취소"></td>
</tr>

</table>
</form>


</div>


</body>
</html>