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
                    <li><a href="index.jsp"><i class="fa fa-bullseye"></i> HOME</a></li>
                    <li><a href="game3.jsp"><i class="fa fa-tasks"></i> 경기일정</a></li>
                    <li><a href="list.jsp"><i class="fa fa-globe"></i> 자유게시판</a></li>
                    <li><a href="setMoney.jsp"><i class="fa fa-list-ol"></i> 머니충전</a></li>
                    <li class="selected"><a href="myInfo.jsp"><i class="fa fa-font"></i> 마이페이지</a></li>
         
                </ul>
                <ul class="nav navbar-nav navbar-right navbar-user">
                    
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
