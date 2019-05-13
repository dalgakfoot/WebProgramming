<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.label
</style>
<script type="text/javascript">
	function pwchk() {
		pw1 = document.getElementById("pwd").value;
		pw2 = document.getElementById("chkPwd").value;
		if(pw1 == pw2){
			document.getElementById("label").innerHTML="일치!!";
		}else{
			document.getElementById("label").innerHTML="불일치!!";
			document.getElementById("pwd1").value="";
			document.getElementById("pwd2").value="";
		}
	}
</script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fmt:requestEncoding value="utf-8"/>

<div align="center">
	<h1>마이페이지</h1>
	<hr>
<form action="join.jsp" method="post">
<table border="1">
	<tr>
		<th>아이디</th><th><input type="text" name="id" id="id"></th>
	</tr>
	<tr>
		<th>비밀번호</th><th><input type="text" name="pwd" placeholder="1234" id="pwd"></th>
	</tr>
	<tr>
		<th>비밀번호 확인</th><th><input type="text" name="chkPwd " placeholder="1234" onchange="pwchk();"  id="chkPwd"> <label id="label">(*필수 체크)</label><br></th>
	</tr>
	<tr>
		<th>연락처</th><th><input type="text" name="phoneNo" placeholder="0107777" id="phoneNo"></th>
	</tr>
	<tr>
		<th>주소</th><th><input type="text" name="addr" placeholder="suwon" id="addr"></th>
	</tr>
	<tr>
		<th>보유머니</th><th>&nbsp;<input name="gameMoney" type="text" onclick="setMoney.jsp" id="gameMoney"></th>
	</tr>
	<tr>
		<th colspan="2">
		<input type="submit" value="가입완료">
		<input type="button" onclick="history.back()" value="취소">&nbsp;&nbsp;
		</th>
	</tr>
</table>
</form>
</div>
</body>
</html>