<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>paramValues.jsp 페이지 입니다</h3>
<form action="paramResearch.jsp">
	좋아하는 계절
	<input type="checkbox" name="season" value="spring">봄
	<input type="checkbox" name="season" value="summer">여름
	<input type="checkbox" name="season" value="fall">가을
	<input type="checkbox" name="season" value="winter">겨울<br>
	<input type="submit" value="전송">
</form>
</body>
</html>