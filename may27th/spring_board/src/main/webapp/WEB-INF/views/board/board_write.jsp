<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {width:60%; }
input[type="text"] {width:95%;}
textarea {width:95%; height:300px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div align="center">

<form action="write">
<table border="1">
<tr>
<th>이름</th><th><input type="text" name="name"></th>
</tr>
<tr>
<th>제목</th><th><input type="text" name="title"></th>
</tr>
<tr>
<th>내용</th><th><textarea rows="3" cols="6" name="content"></textarea></th>
</tr>
<tr>
<th colspan="2" align="left"><input type="submit" value="저장"><a href="list">목록보기</a></th>
</tr>
</table>
</form>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>