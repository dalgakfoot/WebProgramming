<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <% if(session.getAttribute("regi")=="regi") {%> --%>
	<c:choose>
		<c:when test="${sessionScope.regi=='regi' }">
			<jsp:useBean id="member" class="members.MemberDTO" />
			<jsp:useBean id="dao" class="members.MemberDAO" />
			<jsp:setProperty property="*" name="member" />

			<c:set var="memberCheck" value="${dao.memberCheck(member.getId())}" />
			<c:choose>
				<c:when test="${memberCheck==0}">
					<%
						dao.memberRegister(member);
					%>
					<script>
						alert('회원가입을 축하드립니다.');
						location.href = './login.jsp'
					</script>
				</c:when>
				<c:when test="${memberCheck==1}">
					<%System.out.print("중복"); %>
					<script>
						alert('아이디가 중복 됩니다.');
						location.href='./register.jsp'
					</script>
					
				</c:when>
			</c:choose>
		</c:when>
		<c:otherwise>
			<%response.sendRedirect("./register.jsp");%>
		</c:otherwise>
	</c:choose>



	<%-- <%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");

member.setId(id); member.setPwd(pwd); member.setName(name);
member.setAddr(addr); member.setTel(tel);

int memberCheck = dao.memberCheck(id);

if(memberCheck==0){
	
	System.out.println(member.getId()+" "+member.getPwd());
	dao.memberRegister(member);
	
	%>
	
	
	
	<script>
	alert('회원가입을 축하드립니다.');
	location.href='./login.jsp'
	</script>

<% }else{%>

	<script>
	alert('아이디가 중복됩니다. 다시 입력해주세요');
	location.href='./register.jsp';
	</script>
<%} session.invalidate(); %>
<%}else{response.sendRedirect("./register.jsp");}%> --%>
</body>
</html>