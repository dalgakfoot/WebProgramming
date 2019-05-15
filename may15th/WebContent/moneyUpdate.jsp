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
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
${dao.updateMoney(sessionScope.userid,param.inputMoney ) }

<script type="text/javascript">
	alert("충전이 완료되었습니다!")
	location.href = "index.jsp";
</script>
</body>
</html>