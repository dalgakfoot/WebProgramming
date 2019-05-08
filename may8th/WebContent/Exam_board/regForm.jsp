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
#container{text-align: center;}
#container>div{display: flex;padding-left: 10px;padding-bottom: 5px;}
div>h3{padding-right:10px;}
</style>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>

<c:set var="id" value="${name}"/>


<form action="../FileUpLoad" method="post" enctype="multipart/form-data">
	<h2>게시글 등록</h2>
	<div id="container">
	<input type="hidden" name="id" value="${id}">
	<div>
	<h3>제목</h3><input type="text" name="title" style="height:30px;">
	</div>
	<div>
	<h3>내용</h3><textarea name="content" style="height:200px;width:300px;"></textarea>
	</div>
	<div>
	<h3>파일첨부</h3><input type="file" name="filename">
	</div>
	<div>
	<input type="submit" value="글쓰기"><button type="button" onclick="location.href='list.jsp?start=1'">목록</button>
	</div>
	</div>
	<!-- <input type="text" name="title" placeholder="제목"><br>
	<input type="submit" value="등록"> -->

</form>





</body>
</html>