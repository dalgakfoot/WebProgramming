<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>

div>div{display:flex;}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="./view.jsp" method="post">
<div style="text-align:center; padding-top:50px;">

<div>
이름 : <input type="text" name="name" style="height:20px;">
</div>
<div>
소개 : <textarea name="intro"></textarea>
</div>

<div>
<fieldset>
<legend>연령조사</legend>
<input type="radio" name="age" value="10대">10대<input type="radio" name="age" value="20대">20대
<input type="radio" name="age" value="30대">30대<input type="radio" name="age" value="40대">40대
</fieldset>
</div>

<div>
<fieldset>
<legend>취미조사</legend>
<input type="checkbox" name="hobby" value="책읽기">책읽기<input type="checkbox" name="hobby"  value="춤추기">춤추기<input type="checkbox" name="hobby"  value="멍때리기">멍때리기
</fieldset>
</div>

<div>
<input type="submit" value="전송">
</div>
</div>
</form>
</body>
</html>