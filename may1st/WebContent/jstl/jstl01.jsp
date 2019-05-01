<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jstl01.jsp페이지</h3>
	<h2>JSTL - java standard tag library</h2>
	<p>JSTL은 EL과 함께 사용되는 태그 라이브러리를 의미한다.</p>
	<p>EL과 유사하게 코드를 간결하게 출력하기 위해서 사용된다.</p>
	<p><a href="https://tomcat.apache.org/taglibs/standard/">JSTL링크</a>
	로 접속하여, jstl 1.1 -> download ->binaries /-></p>
	<p>다운 받은 압축을 풀고 , jar 파일 두개를 ([root]/lib폴더에 jar 파일 두개를)
	webContent폴더 내부 web-lnf에 넣어주면 된다.</p>
	
	<hr>
	
	c:set => 변수에 값을 설정한다 <br>
	c:remove =>변수에 설정된 값을 제거한다<br>
	c:if => 조건에 따라 처리를 다르게 할 때 사용한다<br>
	c:choose => 여러 조건에 따라 처리를 다르게 할 때 사용한다<br>
	c:forEach => 반복 처리를 위해서 사용한다<br>
	c:forTokens => 구분자로 분리된 각각의 토큰을 처리할 때 사용한다<br>
	c:import => 외부의 자원을 rul을 지정하여 가져다 사용한다<br>
	c:redirect => 지정한 경로로 이동한다<br>
	c:url => url을 재작성한다<br>
	c:out => 데이터를 출력할 때 사용하는 태그로 표현식으로 대체할 수 있다. <br>
	c:catch => 예외처리에 사용한다<br>
	<hr>
	
	
</body>
</html>