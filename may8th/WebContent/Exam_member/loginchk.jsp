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
<jsp:useBean id="member" class="members.MemberDTO"/>
<jsp:useBean id="dao" class="members.MemberDAO"/>

<jsp:setProperty property="id" name="member"/>
<jsp:setProperty property="pwd" name="member"/>

<%-- <%
	int chk = dao.memberCheck(member.getId(), member.getPwd());
	
	if(chk==-1){%>
	
	<script>
	alert('등록되지 않은 아이디 입니다.')
	history.back();
	</script>
	
	
	<%}else if(chk==0) {%>
	
	<script>
	alert('비밀번호가 일치하지 않습니다.')
	history.back();
	</script>
	
	<%}else if(chk==1){
	session.setAttribute("name", member.getId());
	response.sendRedirect("./successLogin.jsp");
	}
	%> --%>
<c:set var="chk" value="${dao.memberCheck(member.getId(), member.getPwd())}"/>
<c:choose>
	<c:when test="${chk eq -1 }">
		<script>
		alert('등록되지 않은 아이디 입니다.')
		history.back();
		</script>
	</c:when>
	<c:when test="${chk eq 0 }">
		<script>
		alert('비밀번호가 일치하지 않습니다.')
		history.back();
		</script>
	</c:when>
	<c:when test="${chk eq 1 }">
		<%session.setAttribute("name", member.getId()); 
			response.sendRedirect("./successLogin.jsp");
		%>
	</c:when>
	</c:choose>
	
	
</body>
</html>