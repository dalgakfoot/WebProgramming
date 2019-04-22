<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String view = (String)application.getAttribute("view");
int viewa = Integer.parseInt(view);
viewa++;
view = Integer.toString(viewa);
System.out.println(view);
application.setAttribute("view",view); 

%>
<h1>게시글 입니다.</h1>
<h3>공지사항 입니다.</h3>
<p>
<h6>jsp application을 이용한<br>조회수 올리기 문제 입니다.
<a href="./quiz.jsp">돌아가기</a>
</h6>
</body>
</html>