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


<link re="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">


<script type="text/javascript"
	src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript"
	src="http://www.prepbootstrap.com/Content/js/gridData.js"></script>
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
                    
                    <li class="dropdown user-dropdown">
                        <c:choose>
							<c:when test="${sessionScope.userid != null }">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i> ${sessionScope.userid} 님<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="myInfo.jsp"><i class="fa fa-user"></i> 마이페이지</a></li>
							<li class="divider"></li>
							<li><a href="logout.jsp"><i class="fa fa-power-off"></i> 로그아웃</a></li>
						</ul>
							
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
						</c:choose>
                    </li>
                </ul>
            </div>
        </nav>
        <hr/>        
		<fmt:requestEncoding value="utf-8"/>
		<jsp:useBean id="dao" class="board.totoDAO" />
		<c:set var="userid" value="test1" scope="session"/>	
		<!-- 페이지  -->
		<c:set var="totalPage" value="${dao.totalPage() }"/>
		<fmt:parseNumber var="number" integerOnly="true" value="${totalPage/10}"/> <!-- 정수로만 표현 -->
		<c:set var="pageCnt" value="${number + 1}"/>
		<c:choose>
			<c:when test="${param.start == null }">
				<c:set var="start" value="${1}"/>
			</c:when>
			<c:otherwise>
				<c:if test="${param.start != 1 }">
					<c:set var="start" value="${((param.start-1) * 10) +1}" />
				</c:if>		
			</c:otherwise>
		</c:choose>
		<c:set var="end" value="${start + 9}"/>
        <div class="container">
            <div class="row">
                <div class="text-center">
                    <h1>자유 게시판</h1>
                </div>
                <br>       
                <div class="col-lg-12">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i class="fa fa-bar-chart-o"></i>  Board list </h3>
                        </div>
                        <div class="panel-body">
                            <div>
                            	<c:choose>
									<c:when test="${sessionScope.userid eq '' || sessionScope.userid eq null}">
										<script>
											alert("로그인 후 사용할 수 있습니다~~");
											location.href="login.jsp";
										</script>
									</c:when>
									<c:otherwise>
										 <div style="text-align: center;">
	                          		 		<table class="table">
	                          		 		<tr>
	                          		 				<td>번호</td><td>등록자</td><td>제목</td><td>등록날짜</td><td>조회수</td>
	                          		 		</tr>		  								
									<!-- 운영자 공지글 -->
									<c:forEach var="gmDTO" items="${dao.gmList() }">
									<fmt:formatDate value="${gmDTO.savedate}" pattern="yyyy-MM-dd" var="today"/>
										<tr>
										<td>공지</td> <td>${gmDTO.name}</td><td><a href="content_view_gm2.jsp?userId=${sessionScope.userid}&chk=${0}&num=${gmDTO.num}">${gmDTO.title}</a></td>
										<td><c:out value="${today }"/></td> <td>${gmDTO.hit}</td>
										</tr>		
									</c:forEach>
									
									<c:forEach items="${dao.list(start, end)}" var="dto">
									<fmt:formatDate value="${dto.savedate}" pattern="yyyy-MM-dd" var="today"/>
										<tr>						
										<td>${dto.id}</td><td>${dto.name}</td><td> <a href="content_view2.jsp?id=${dto.id}&userId=${dto.name}&chk=${0}">${dto.title}</a></td><td> ${today}</td><td> ${dto.hit}</td>					
										</tr>
									<input type="hidden" name="idgroup" value="${dto.idgroup }">
									<input type="hidden" name="step" value="${dto.step}">
									<input type="hidden" name="indent" value="${dto.indent }">
									<input type="hidden" name="userdId" value="${sessionScope.userid}">
									</c:forEach>
																		
										<c:choose>
											<c:when test="${param.start ==null}">
												<c:set var="start" value="1"/>
											</c:when>
											<c:otherwise>
												<c:set var="start" value="${param.start}"/>
											</c:otherwise>
										</c:choose>
										</table>
										</div>		
										<div style="text-align: right; word-spacing: 30px;">
										<c:choose>
											<c:when test="${start >1 }">
												<button onclick="location.href='list2.jsp?start=${start-1}'">이전</button>
											</c:when>
											<c:otherwise>
												<button disabled="disabled">이전</button>
											</c:otherwise>
										</c:choose>
										<c:forEach begin="1" end="${pageCnt}" step="1" var="cnt">
													<a href="list2.jsp?start=${cnt}">[${cnt}]</a>
										</c:forEach>												
										<c:choose>
											<c:when test="${start < pageCnt }">
												<button onclick="location.href='list2.jsp?start=${start+1}'">다음</button>
											</c:when>
											<c:otherwise>
												<button disabled="disabled">다음</button>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${sessionScope.userid eq 'Manager'}">
												<a href="write_view_gm2.jsp">공지글작성</a>
											</c:when>
											<c:otherwise>
												<a href ="write_view2.jsp">글작성</a>
											</c:otherwise>			
										</c:choose>
										
										</div>
											<form action="searchList2.jsp">
											<input type="text" name="search" placeholder="검색할 제목을 입력하세요">&nbsp;&nbsp;<input style="color: black;" type="submit" value="검색">
						 					</form>					
							</c:otherwise>
						</c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        
            </div>
        </div>
	<footer>
	<jsp:include page="./footer.jsp"/>
	</footer>
</body>
</html>