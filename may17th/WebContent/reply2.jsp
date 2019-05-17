<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dashboard - Dark Admin</title>

<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="font-awesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/local.css" />

<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<!-- you need to include the shieldui css and js assets in order for the charts to work -->
<link rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/light-bootstrap/all.min.css" />
<link id="gridcss" rel="stylesheet" type="text/css"
	href="http://www.shieldui.com/shared/components/latest/css/dark-bootstrap/all.min.css" />


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
</head>
<body>

       
        <fmt:requestEncoding value="utf-8"/>
		<jsp:useBean id="dao" class="board.totoDAO"/>
		<jsp:useBean id="dto" class="board.totoDTO"/>
		<jsp:setProperty property="*" name="dto"/>		
		<c:forEach var="list" items="${dao.showReply(param.id)}">
			<div align="center">
			<table class="table" style="text-align: center;">
				<tr>
					<td style="width: 110px; ">아이디</td><td style="border-right:1px solid gray; width: 180px; color: skyblue; font-size: 14pt;">${list.userid }</td><td style="width: 150px;  ">내용</td><td style="border-right:1px solid gray; color: #FFFF8F; font-size: 13pt;">${list.content }</td><td style="width:100px;">등록날짜</td><td style="width: 300px; color: skyblue; font-size: 14pt;">${list.savedate }</td>
				</tr>
				<c:if test="${list.userid eq sessionScope.userid || sessionScope.userid eq 'Manager'}">
					<tr>
						<td colspan="6" align="right"><a href="reply_delete2.jsp?id=${param.id}&reply_num=${list.num}">댓글삭제</a></td>
					</tr>
				</c:if>
			</table>
			</div>
		</c:forEach>
			
</body>
</html>