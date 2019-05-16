<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head> 
<body>
<fmt:requestEncoding value="utf-8"/>
<div align="center">
${sessionScope.userid }
<form action="write_save.jsp" method="post">
	<table border="1">
		
		<tr>
			<td>이름</td><td><input type="hidden" name="name" value="${sessionScope.userid}" size="50">${sessionScope.userid}</td>
		</tr>
		<tr>
			<td>제목</td><td><input type="text" name="title" size="50"></td>
		</tr>
		<tr>
			<td>내용</td><td><textarea name="content" rows="10"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="hidden" name="userId" value="${sessionScope.userid}">
				<input type="submit" value="저장"> <a href="list.jsp">목록보기</a>
			</td>
		</tr>
	</table>	
</form>
</div>
</body>
</html>