<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#wrap {
	display: flex;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="gameDB.GameDAO" />
	<c:set var="arr" value="${dao.select() }" />
	<div align="center">
		<h1>주요 경기일정</h1>
		<hr>

		<div>
			<table>
			<tr>
			<th>경기시간</th><th>HOME</th><th>(승률)</th><th></th><th>AWAY</th><th>(승률)</th>
			</tr>
			<tr>
			<th colspan="7"><hr></th>
			</tr>
			<c:set var="j" value="0" />
			<c:set var="test" value="true" />
				<c:forEach var="i" begin="0" end="${arr.size()-1}">
					
					<c:if test="${test eq true }">
					<c:if test="${dao.foo(arr.get(i).getId()) eq '경기 시작 전 입니다.'}">
						<tr>
							<th>${arr.get(i).getGame_time()}</th>
							<th>${arr.get(i).getTeamA()}</th>
							<th>(${arr.get(i).getTeama_winratio()})</th>
							<th>:</th>
							<th>${arr.get(i).getTeamB()}</th>
							<th>(${arr.get(i).getTeamb_winratio() })</th>
							<th><button>배팅하기</button></th>
						</tr>
					<c:set var="j" value="${j+1}"/>
				
			</c:if>
			</c:if>
					<c:if test="${j eq 4}">
					<c:set var="test" value="false"/>
					</c:if>
				</c:forEach>
			</table>
			<br>
			<br>
			<div align="right">
				<a href="./game3.jsp">더보기</a>
			</div>

		</div>
	</div>

</body>
</html>