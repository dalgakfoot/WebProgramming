<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- core를 사용하기 위해 설정  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jstl02.jsp</h3>
	<c:out value="hello world!"/>
	<hr>
	c:set var ="변수 이름" value ="지정할 값 " scope="{page|request|session|application}" <br>
	<hr>
	<c:set var="num" value="hello world!"/>
	<c:out value="${num}"/>
	<br>
	<c:set var="num1">
	안녕하세요 만나서 반갑습니다
	</c:set>
	<c:out value="${num1 }"/><br>
	
	jstl: <c:out value="${num1 }"/><br>
	el : ${num1 }<br>
	<%
		String s = "jstl test 입니다!";
	
	%>
	표현식 : <%=s %><br>
	스크립트릿 : <%out.print(s); %>
	<br><br>
	<c:set var ="num2" value="<%=s %>"/>
	표현식 el : ${num2 }<br>
	<hr>
	<h3>c:if 태그</h3>
	<%
		String s1 = "jstl test 입니다!";
	
	%>
	
	<c:set var ="num3" value="<%=s%>"/>
	<c:if test = '${num3=="jstl test 입니다!"}'>
		<b>참 입니다.</b>
	</c:if>
	<hr>
	<h3>c:forEach 태그</h3>
	<%
		String[] name= {"고길동","고구마","고스톱","고도리"};
	
	%>
	<c:set var="values" value ="<%=name %>"/>
	<c:forEach var="st" items="${ values }">
		${st }<br>
	</c:forEach>
	<hr>
	
	c:import url="": jsp가 실행 될 때 url로 명기된 해당 페이지를 text로 읽어와 해당 페이지에 합친다.<br>
	c:redirect url="" : 리다이렉트
	<h3>변수 삭제</h3>
	c:remove var="name" 동일한 이름의 변수 모두 삭제 <br>
	c:remove var="name" scope="page" : scope 지정된 변수 삭제
	<hr>
	
	<c:set var="name" value="홍길동"/>
	<c:choose>
		<c:when test="${name eq '홍길동' }">
			홍길동과 같습니다.
			</c:when>
		<c:when test="${name == '김개똥' }">
			김개똥과 같습니다.
			</c:when>
		<c:otherwise>
			else 문구 입니다.
			</c:otherwise>
		</c:choose>	
	
	
	</body>
</html>