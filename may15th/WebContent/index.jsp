<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
a {padding-left: 10px;}
#nav {height:30px;}
#header {height:50px;}
#article1 {width:60%;}
#article2 {width:40%; border-left: 1px solid black;}
#article3 {width:100%;}

#div1 {width:100%; height:300px; border:1px solid black;}
#div2 {width:100%; height:300px; border:1px solid black;}
#div4 {border:1px solid black;}

#container3 {}

</style>
</head>
<body>
<div id="container">

<header>
<nav>
<c:choose>
<c:when test="${sessionScope.userid!=null }">
<jsp:include page="./header_login.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="./header.jsp"/>
</c:otherwise>
</c:choose>
</nav>
</header>
<div id="container2" style="display:flex;">
<article id="article1">

<jsp:include page="./game_index.jsp"/>




</article>
<article id="article2">

<c:choose>
<c:when test="${sessionScope.userid==null }">
<jsp:include page="./login.jsp"/>
</c:when>
<c:otherwise>
<jsp:include page="./welcome.jsp"/>
</c:otherwise>
</c:choose>
</article>
</div>

<div id="container3">
<article id="article3">
<div id="div3" align="center">
<jsp:include page="./game_result.jsp"/>
</div>
</article>
</div>


<footer>
<jsp:include page="./footer.jsp"/>
</footer>




</div><!-- container div 끝  -->




</body>
</html>