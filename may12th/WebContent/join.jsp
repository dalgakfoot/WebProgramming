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
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<jsp:useBean id="dto" class="loginDB.joinDTO"/>
<jsp:setProperty property="*" name="dto"/>

<%-- ${dao.insertMember(dto,param.id)} --%>
<c:set var="all" value="${dao.joinMember() }"/>

<%
String userId = (String)request.getAttribute("id");
%>

<c:set var="joincheck" value="${dao.insertMember(dto,param.id)}" />


<c:choose>
<c:when test="${joincheck  eq -1 }">
 <script type="text/javascript">
 alert("가입축하!");
location.href = "login.jsp";
 </script>
</c:when>
<c:when test="${param.id =='' || param.pwd =='' }">
<script type="text/javascript">
alert("모두 입력해 주세요~");
location.href = "myPage.jsp";
</script>
</c:when>
<c:otherwise>
 <script type="text/javascript">
 alert("중복된아이디");
 location.href = "myPage.jsp";
 </script>
</c:otherwise>
</c:choose>





</body>
</html>