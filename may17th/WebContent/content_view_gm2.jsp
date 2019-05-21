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
	<style type="text/css">
		a:hover {color: yellow;}
		
	</style>
</head>
<body>
<div id="wrapper">

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">KGITBANK 토토</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul id="active" class="nav navbar-nav side-nav">
					<li><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="./game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="setMoney.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li class="selected"><a href="list2.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
					<li><a href="ranking.jsp"><i class="fa fa-list-ol"></i>
							랭킹</a></li>
					<!--<li><a href="forms.html"><i class="fa fa-list-ol"></i>
							Forms</a></li>
					<li><a href="typography.html"><i class="fa fa-font"></i>
							Typography</a></li>
					<li><a href="bootstrap-elements.html"><i
							class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
					<li><a href="bootstrap-grid.html"><i class="fa fa-table"></i>
							Bootstrap Grid</a></li> -->
							<li><img src="./tototo.gif" width="200" height="400"></li>
				</ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
					<li style="width:1550px"><marquee direction="left"><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i>&nbsp;Welcome to the KGITBANK 토토! 
다른 사이트와는 차별화된 건전하게 즐기는 승부예측게임! 먹튀 걱정 없는 공식인증 사이트!&nbsp;<i class="fa fa-dollar"></i><i class="fa fa-dollar"></i><i class="fa fa-dollar"></i></marquee></li>
					<li class="dropdown user-dropdown"><c:choose>
							<c:when test="${sessionScope.userid != null }">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="fa fa-user"></i> ${sessionScope.userid} 님<b
									class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="myInfo.jsp"><i class="fa fa-user"></i>
											마이페이지</a></li>
									<li class="divider"></li>
									<li><a href="logout.jsp"><i class="fa fa-power-off"></i>
											로그아웃</a></li>
								</ul>

							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose></li>
					<li class="divider-vertical"></li>
					<li></li>
				</ul>
            </div>
        </nav>
        <hr/>
        
		<jsp:useBean id="dao" class="board.totoDAO"/>
		<c:set var="gmdto" value="${dao.contentView_gm(param.chk, param.userId, param.num)}"/>
		
		<form action="modify.jsp" method="post">
		<div class="panel-heading">
        	
        </div>
      
		<input type="hidden" name="num" value="${gmdto.num}">
		<table class="table">
			<tr valign="middle">
				<td align="center">글 번호</td><td style="color: skyblue; font-size: 14pt;">${gmdto.num}</td><td align="center">조회수</td><td style="color: skyblue; font-size: 14pt;">${gmdto.hit }</td><td align="center">등록자</td><td style="color: skyblue; font-size: 14pt;">Manager</td>
			</tr>

			<tr>
				<td align="center">제목</td><td colspan="5" style="color: skyblue; font-size: 14pt;" align="center">${gmdto.title}</td>
				
			</tr>
			<tr>
				<td style="height: 100px; padding-top: 40px;" align="center">내용</td>
				<td style="height: 100px; color: #FFFF8F; font-size: 13pt;" colspan="5" align="left">${gmdto.content}</td>
			</tr>
			<tr>
				<td colspan="6" style="word-spacing: 60px; padding-right: 50px" align="right">
				<a href="list2.jsp" style="font-size: 14pt; text-decoration: none;">목록보기</a>	
				<!-- 해당 세션과 아이디가 일치하면 수정기능 -->
				<c:if test="${sessionScope.userid eq 'Manager'}">
					<a href="modifyView2.jsp?num=${gmdto.num}" style="font-size: 14pt; text-decoration: none;">게시글수정</a>				
				</c:if>		
				<!-- 해당 세션과 아이디가 일치하면 삭제기능 -->
				<c:if test="${sessionScope.userid eq 'Manager'}">
					<a href="delete2.jsp?num=${gmdto.num}" style="font-size: 14pt; text-decoration: none; ">게시글삭제</a>
				</c:if>	
				</td>
			</tr>		
		</table>
		</form>
		</div>
			<footer>
				<jsp:include page="./footer.jsp" />
			</footer>
	
	
</body>
</html>