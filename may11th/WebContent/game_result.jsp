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
	<jsp:useBean id="dao" class="gameDB.GameDAO" />
	<c:set var="arr" value="${dao.goo() }" />
	<div align="center">
		<hr>
		<h4>최근 경기결과</h4>

		<table>
			<c:set var="j" value="0" />
			<c:forEach var="i" begin="0" end="4">

				<tr>
					<td>${arr.get(i).getGame_date() }</td>
					<td>${arr.get(i).getGame_time()}</td>
					<td>${arr.get(i).getTeamA() }</td>
					<td>vs</td>
					<td>${arr.get(i).getTeamB() }</td>
					<td>--></td>
					<td>${arr.get(i).getWin() }(이)가승리하였습니다.</td>
				</tr>
			</c:forEach>
		</table>
		
		
		<br>
		

	</div>

</body>
</html>