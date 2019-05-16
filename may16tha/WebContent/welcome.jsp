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
<c:set var="view" value="${dao.viewInfo(sessionScope.userid) }"/>
	<div class="row">
		<div class="col-lg-12">
		
		
			<h1><a href="myInfo.jsp">${sessionScope.userid } 님</a>환영합니다!</h1><p/>
			<p><a href="#">나의 배팅현황</a>&nbsp;&nbsp;&nbsp;&nbsp;보유머니 : <a href="setMoney.jsp">${view.gameMoney }</a></p>
			
			
		
		</div>
	</div>
</body>
</html>