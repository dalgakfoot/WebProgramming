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
넘어온 값은 param은,,,,
${param.phoneNo }
<jsp:useBean id="dao" class="loginDB.joinDAO"/>
<jsp:useBean id="dto" class="loginDB.joinDTO"/>
<jsp:setProperty property="*" name="dto" />
<c:set var="chkphoneNo" value="${dao.ckFindId(param.phoneNo) }"/>



<c:if test="${fn:length(chkphoneNo) == null } ">
아이디를 찾을 수 없습니다.
</c:if>
<c:forEach var="showId" items="${chkphoneNo }"> 
 당신의 아이디는 ${showId.id } 입니다. 
</c:forEach>



</body>
</html>