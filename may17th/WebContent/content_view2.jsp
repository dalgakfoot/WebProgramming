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
<div id="wrapper">

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Back to Admin</a>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li><a href="index.html"><i class="fa fa-bullseye"></i> Dashboard</a></li>
                    <li class="selected"><a href="portfolio.html"><i class="fa fa-tasks"></i> Portfolio</a></li>
                    <li><a href="blog.html"><i class="fa fa-globe"></i> Blog</a></li>
                    <li><a href="signup.html"><i class="fa fa-list-ol"></i> SignUp</a></li>
                    <li><a href="register.html"><i class="fa fa-font"></i> Register</a></li>
                    <li><a href="timeline.html"><i class="fa fa-font"></i> Timeline</a></li>
                    <li><a href="forms.html"><i class="fa fa-list-ol"></i> Forms</a></li>
                    <li><a href="typography.html"><i class="fa fa-font"></i> Typography</a></li>
                    <li><a href="bootstrap-elements.html"><i class="fa fa-list-ul"></i> Bootstrap Elements</a></li>
                    <li><a href="bootstrap-grid.html"><i class="fa fa-table"></i > Bootstrap Grid</a></li>            
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    <li class="dropdown messages-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-envelope"></i> Messages <span class="badge">2</span> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-header">2 New Messages</li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li class="message-preview">
                                <a href="#">
                                    <span class="avatar"><i class="fa fa-bell"></i></span>
                                    <span class="message">Security alert</span>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li><a href="#">Go to Inbox <span class="badge">2</span></a></li>
                        </ul>
                    </li>
                    <li class="dropdown user-dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Steve Miller<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#"><i class="fa fa-user"></i> Profile</a></li>
                            <li><a href="#"><i class="fa fa-gear"></i> Settings</a></li>
                            <li class="divider"></li>
                            <li><a href="#"><i class="fa fa-power-off"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <hr/>
        <div class="panel-heading">
        	<h3 class="panel-title" align="center"> [Personal bulletin board] </h3>
        </div>
		<fmt:requestEncoding value="utf-8" />
	<jsp:useBean id="dao" class="board.totoDAO"/>
	<c:set var="dto" value="${dao.contentView(param.id,param.chk)}"/>
	<div align="center">
	<form action="modify.jsp" method="post">
		<input type="hidden" name="id" value="${dto.id }">

		<table class="table">
			<tr valign="middle">
				<td align="center">글 번호</td><td style="color: skyblue; font-size: 14pt;">${dto.id }</td><td align="center">조회수</td><td style="color: skyblue; font-size: 14pt;">${dto.hit}</td><td align="center">등록자</td><td style="color: skyblue; font-size: 14pt;">${dto.name}</td>
			</tr>

			<tr>
				<td align="center">제목</td><td colspan="5" style="color: skyblue; font-size: 14pt;" align="center">${dto.title}</td>
				
			</tr>
			<tr>
				<td style="height: 100px; padding-top: 40px;" align="center">내용</td>
				<td style="height: 100px; color: #FFFF8F; font-size: 13pt;" colspan="5" align="left">${dto.content}</td>
			</tr>
			<tr>
				<td colspan="6" style="word-spacing: 60px; padding-right: 50px" align="right">
				<a href="list2.jsp" style="font-size: 14pt; text-decoration: none;">목록보기</a>	
				<!-- 해당 세션과 아이디가 일치하면 수정기능 -->
				<c:if test="${param.userId eq sessionScope.userid}">
					<a href="modifyView2.jsp?id=${dto.id}" style="font-size: 14pt; text-decoration: none;">게시글수정</a>				
				</c:if>		
				<!-- 해당 세션과 아이디가 일치하면 삭제기능 -->
				<c:if test="${sessionScope.userid eq param.userId || sessionScope.userid eq 'Manager'}">
					<a href="delete2.jsp?num=${dto.id}&id=${dto.name}" style="font-size: 14pt; text-decoration: none; ">게시글삭제</a>
				</c:if>	
				</td>
			</tr>		
		</table>
		<hr>
</form>
	<h4>댓글내용</h4>		
	<div align="center">
	<c:import url="reply2.jsp?id=${dto.id}"/>	<!-- 댓글내용 -->
	</div>
	
		<form action="reply2" method="get">
			<table border="1">	
           <tr>
               <!-- 아이디-->
               <td width="150" align="center" style="color: skyblue; font-size: 14pt;">
                   ${sessionScope.userid}
               </td>
               <!-- 본문 작성-->             
               <td width="550" style="color: black;">
              	 <input type="hidden" name="id" value="${dto.id}">
              	 <input type="hidden" name="replyId" value="${sessionScope.userid }">
              	 <input type="hidden" name="userId" value="${param.userId}">
                 <textarea name="content" rows="4" cols="70" ></textarea>                                        
               </td>
               <!-- 댓글 등록 버튼 -->
               <td width="100">
                   <div style="text-align:center;">
                       <p><input style="color: black;" type="submit" value="댓글달기"></p>    
                   </div>
               </td>
           	</tr>    	 	  
  			</table>
  		</form>   
	</div>
</div>
	<footer>
	<jsp:include page="./footer.jsp"/>
	</footer>
</body>
</html>