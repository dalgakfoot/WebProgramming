<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>범주</h3>
page : 하나의 JSP 페이지를 처리할때 사용되는 영역<br>
request : 하나의 요청을 처리할 때 사용되는 영역<br>
session : 하나의 브라우저와 관련된 영역<br>
application : 하나의 웹 애플리케이션과 관련된 영역<br>
<hr>
<h1>범주 알아보기</h1>
<%
pageContext.setAttribute("name","page man");
request.setAttribute("name","request man");
session.setAttribute("name","session man");
application.setAttribute("name","application man");

out.print("firstPage.jsp<br>");
out.print("하나의 페이지 속성:"+pageContext.getAttribute("name")+"<br>");
out.print("하나의 요청 속성:"+request.getAttribute("name")+"<br>");
out.print("하나의 세션 속성:"+session.getAttribute("name")+"<br>");
out.print("하나의 애플리케이션 속성:"+application.getAttribute("name")+"<br>");

/* .forward : 다른 페이지로 바로 연결시킴 */
/* request.getRequestDispatcher("secondPage.jsp").forward(request, response);
 */
%>
<a href="secondPage.jsp">secondPage</a>
<hr>

<h1>문자열을 숫자로, 숫자를 문자열로 처리하기</h1>
<%
	String str="1000";
	String result;
	int num=123;
	int sum=0;
	
	sum = num+ Integer.parseInt(str);
	out.print("sum : "+ sum+"<br>");
	result = str + Integer.toString(num);
	out.print("result : "+result);

%>

</body>
</html>