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
<jsp:useBean id="member" class="members.MemberDTO"/>
<jsp:setProperty property="*" name="member"/>
<%-- <%

request.setCharacterEncoding("utf-8");

int result = 0;
member.setId(request.getParameter("id"));
member.setPwd(request.getParameter("pwd"));
member.setName(request.getParameter("name"));
member.setAddr(request.getParameter("addr"));
member.setTel(request.getParameter("tel"));

System.out.print(member.getId()+"\n");

result = dao.memberUpdate(member);
System.out.print(result);
if(result==1){%>

<script>
alert('회원정보 수정이 완료되었습니다.');
location.href='./memberInfo1.jsp?name=<%=member.getName()%>';
</script>

<%}else{%>
<script>
alert('오류 발생 관리자에게 문의하세요');
location.href="./memberInfo1.jsp";
</script>

<% }%> --%>

<% request.setCharacterEncoding("utf-8"); %>
<c:set var="result" value="${dao.memberUpdate(member)}"/>
<c:choose>
	<c:when test="${result==1}">
	<script>
	alert('회원정보 수정이 완료되었습니다.');
	location.href='./memberInfo1.jsp?name=${member.getName()}';
	</script>
	</c:when>
	<c:otherwise>
	<script>
	alert('오류발생 관리자에게 문의하세요');
	location.href="./memberInfo1.jsp"
	</script>
	</c:otherwise>
</c:choose>


</body>
</html>