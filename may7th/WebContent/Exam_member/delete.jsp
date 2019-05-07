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
<jsp:useBean id="dao" class="members.MemberDAO"/>
<jsp:include page="../Exam_default/header.jsp"/>
<%-- <%

session.invalidate();

String name = request.getParameter("name");

int success = dao.memberDelete(name);

if(success!=0){
	out.print("<h2>회원삭제완료</h2>");
}
%> --%>
<%session.invalidate();%>
<c:set var="name" value="${param.name}"/>
<c:set var="success" value="${dao.memberDelete(name)}"/>
<c:if test = '${success != 0 }'>
	<h2><c:out value="회원삭제완료"></c:out></h2>
</c:if>


<jsp:include page="../Exam_default/footer.jsp"/>
</body>
</html>