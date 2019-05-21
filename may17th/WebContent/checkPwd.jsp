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
<c:set var="chkID" value="${dao.ckFindPwd(param.id) }"/>


<c:if test="${chkID.size() == 0}">
		<script type="text/javascript">
			alert("�ش��ϴ� ��й�ȣ�� ã�� �� �����ϴ�.\n���̵� �ٽ� �Է����ּ���.");
			location.href = "findPwd.jsp";
		</script>
	</c:if>
	<c:forEach var="showPwd" items="${chkID }">
		<script>
			alert("����� ��й�ȣ�� ${showPwd.pwd} �Դϴ�.");
			location.href = "login.jsp";
		</script>
	</c:forEach>


</body>
</html>