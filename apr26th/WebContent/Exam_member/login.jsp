<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#container{display:flex; flex-direction:column; align-items: center;}
#container>div{text-align:center;width:50%;height:70%;}
</style>
</head>
<body>
<header>
<jsp:include page="../Exam_default/header.jsp"/>
</header>

<div id="container">

<div>
<h2>로그인 페이지 입니다.</h2>
</div>

<div>
<form action="./loginchk.jsp" method="get">
<input type="text" name="id" placeholder="아이디"><br>
<input type="text" name="pwd" placeholder="비밀번호"><br>
<a href="#">회원가입</a><input type="submit" value="로그인">
</form>
</div>

</div>


<footer>
<jsp:include page="../Exam_default/footer.jsp"/>
</footer>
</body>
</html>