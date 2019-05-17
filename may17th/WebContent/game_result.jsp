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



	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-comment"></i> 경기 결과
					</h3>
				</div>
				<div class="panel-body">
					<c:choose>
						<c:when test="${arr.size()!=0 }">
							<table class="table">
								<c:set var="j" value="0" />
								<c:forEach var="i" begin="0" end="${arr.size()-1}">

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
						</c:when>
						<c:otherwise>
							<h1>최근 경기결과가 존재하지 않습니다.</h1>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
					<%-- <div align="center">
		<hr>
		<h4>최근 경기결과</h4>
		<c:choose>
		<c:when test="${arr.size()!=0 }">
		
		<table>
			<c:set var="j" value="0" />
			<c:forEach var="i" begin="0" end="${arr.size()-1}">

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
		</c:when>
		<c:otherwise>
		<h1>최근 경기결과가 존재하지 않습니다.</h1>
		</c:otherwise>
		</c:choose>
		<br>
		

	</div> --%>
</body>
</html>