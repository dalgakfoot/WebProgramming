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
<%-- <%if(session.getAttribute("name")!=null) {%> --%>
<c:choose>
	<c:when test="${sessionScope.name!=null }">
<jsp:useBean id="dao" class="members.MemberDAO"/>
<%-- <jsp:useBean id="m" class="members.MemberDTO"/> --%>

<jsp:include page="../Exam_default/header_loginsuc.jsp"/>

<%-- <%

String name = request.getParameter("name");
m=dao.memberInfo(name);

%> --%>
<c:set var="name" value="${param.name}"/>
<c:set var="m" value="${dao.memberInfo(name)}"/>

<div style="text-align:center;">
<h2>개인 정보</h2>

<b>아 이 디</b> <%-- <%=m.getId() %> --%><c:out value="${m.getId()}"/><p/>
<b>비밀번호</b> <%-- <%=m.getPwd()%> --%><c:out value="${m.getPwd()}"/><p/>
<b>이 름</b> <%-- <%=m.getName() %> --%><c:out value="${m.getName()}"/><p/>
<b>주 소</b> <%-- <%=m.getAddr() %> --%><c:out value="${m.getAddr()}"/><p/>
<b>전화번호 </b><%-- <%=m.getTel() %> --%><c:out value="${m.getTel()}"/><p/>
<input type="button" value="수정" onclick="location.href='./update.jsp?name=${param.name}'">
<input type="button" value="삭제" onclick="location.href='./delete.jsp?name=${param.name}'">
</div>



<jsp:include page="../Exam_default/footer.jsp"/>
</c:when>
	<c:otherwise>
	<%response.sendRedirect("./login.jsp"); %>
	</c:otherwise>
</c:choose>
</body>

<%-- <%}else{response.sendRedirect("./login.jsp");}%> --%>

</html>