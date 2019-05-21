<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<jsp:useBean id="dto" class="loginDB.joinDTO"/>
<jsp:setProperty property="*" name="dto" />
<c:set var="chkphoneNo" value="${dao.ckFindId(param.phoneNo) }"/>

<c:if test="${chkphoneNo.size() == 0}">
<script type="text/javascript">
	alert("�ش��ϴ� ���̵� ã�� �� �����ϴ�.\n��ȭ��ȣ�� �ٽ� �Է����ּ���.");
	location.href="findId.jsp";
</script>
</c:if>

<c:forEach var="showId" items="${chkphoneNo }"> 
	<script>
	alert("����� ���̵�� ${showId.id} �Դϴ�.")
	location.href="login.jsp";
	</script>
</c:forEach>



</body>
</html>