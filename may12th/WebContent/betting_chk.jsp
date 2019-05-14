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
<jsp:useBean id="dao" class="bettingDB.bettingDAO"/>
<jsp:useBean id="dto" class="bettingDB.bettingDTO"/>
<jsp:setProperty property="*" name="dto"/>

${dao.bettingUp(dto) }
<c:redirect url="game3.jsp"/>

</body>
</html>