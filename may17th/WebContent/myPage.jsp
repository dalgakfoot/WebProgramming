<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Dark Admin</title>

    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/local.css" />

    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script> 

      <style>

        div {
            padding-bottom:20px;
        }

    </style>
</head>

<body>
<form action="join.jsp" method="get">
    <div id="wrapper" >

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">KGITBANK 토토</a>
			</div>
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul id="active" class="nav navbar-nav side-nav">
					<li class="selected"><a href="index.jsp"><i
							class="fa fa-bullseye"></i> Home</a></li>
					<li><a href="index.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
					<li><a href="index.jsp"><i class="fa fa-globe"></i>
							머니충전</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
							자유게시판</a></li>
					<li><a href="index.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
					<li><a href="index.jsp"><i class="fa fa-list-ol"></i>
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


       <div>
        <div class="row text-center">
            <h2>회원등록</h2>
        </div>
        <div>
            <label for="firstname" class="col-md-2">
                ID:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="id" id="id" placeholder="Insert ID">
            </div>
            
        </div>        
      
        <div>
            <label for="password" class="col-md-2">
                Password:
            </label>
            <div class="col-md-9">
                <input type="password" class="form-control" name="pwd" id="pwd" placeholder="Insert Password">
                <p class="help-block">
                    Min: 6 characters (Alphanumeric only)
                </p>
            </div>
            
        </div>
        <div>
            <label for="password" class="col-md-2">
                Password check:
            </label>
            <div class="col-md-9">
                <input type="password" class="form-control" name="chkPwd" id="chkPwd" placeholder="Insert Password Check">
                <p class="help-block">
                </p>
            </div>
             
        </div>
        <div>
            <label class="col-md-2">
               Tel:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" id="phoneNo" name="phoneNo" placeholder="Insert Tel">
                
            </div>
             
        </div>
        <div>
            <label class="col-md-2">
                Address:
            </label>
            <div class="col-md-9">
                <input type="text" class="form-control" name="addr" id="addr" placeholder="Insert address">
              
            </div>
             
        </div>
        <div>
            <label class="col-md-2">
                Game Money:
            </label>
            <div class="col-md-9">
                <input type="text"  class="form-control" name="gameMoney" id="gameMoney" placeholder="Add game money">
                
            </div>
             
        </div>
        <div>
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
            
                
            </div>            
        </div>
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-10">
 
        <input type="submit" value="Register" class="btn btn-info">
		<input type="button" onclick="history.back()"  class="btn btn-info" value="취소">&nbsp;&nbsp;   
            </div>
        </div>
    </div>  
    
    </div>
</form>
</body>
</html>
