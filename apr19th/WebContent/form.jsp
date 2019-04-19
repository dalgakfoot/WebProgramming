<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul>
		<li>GET방식으로 값 전달하기
		<li><form action="receiver.jsp" method="get"><input type="text" name="text" placeholder="아무거나 입력하세요 ^^;"><input type="submit" value="쿼리 전송"> </form>
		<li>POST방식으로 값 전달하기
		<li><form action="receiver.jsp" method="post"><input type="text" name="text" placeholder="아무거나 입력하세요 ^^;"><input type="submit" value="쿼리 전송"></form>
	
	
	</ul>


</body>
</html>