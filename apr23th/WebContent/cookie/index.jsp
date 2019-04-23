<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 style="color:skyblue;">CARE LAB</h1>
<h3>저희 사이트에 방문해주셔서 감사합니다.</h3>

<%
	Cookie cookie = new Cookie("testCookie","myCookie");
						     /* 쿠키의 name , 쿠키의 value */
	cookie.setMaxAge(10);
	/* 쿠키의 유효시간 : 5초 */
	response.addCookie(cookie);
%>
<%
	boolean bool =false;
	Cookie[] cookieArr = request.getCookies();
	for(Cookie c : cookieArr){
		out.print("id : "+c.getName()+"<br>");
		out.print("value : "+c.getValue()+"<br>");
		if(c.getName().equals("testCookie")){
			bool = true;
		}
	}

%>
<%if(bool==false) {%>
	<script>
	window.open("popup.jsp","",
			"width=300, height=200, top=500, left=500");
	
</script>

<% }%>


</body>
</html>