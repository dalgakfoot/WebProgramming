<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>paramResearch.jsp 페이지 입니다</h3>
<%
	response.setCharacterEncoding("utf-8");
	
	String seasonArr[] = request.getParameterValues("season");
	out.println("당신이 좋아하는 계절 : ");
	for(String season : seasonArr){
		out.println(season+" ");
	}

%>
<hr>
<h3>jstl 태그</h3>
<c:forEach items="${paramValues.season}" var="season">
	${season}
	</c:forEach>	



</body>
</html>