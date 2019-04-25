<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

function chk(){
	
var count = 0;
var id = document.getElementById("id").value;
var pwdchk = document.getElementById("pwdchk").value;
var pwd = document.getElementById("pwd").value;
var poo = document.getElementById("chk")
var form = document.getElementById("form");


if(id==""){
	alert('아이디는 필수 입력사항 입니다.')
	count++;
}else if(pwd==""){
	alert('비밀번호는 필수 입력사항 입니다.')
	count++;
}

if(pwd==pwdchk){
	poo.innerText="";
}else{
	poo.innerText="비밀번호 불일치";
	count++;
}

if(count==0){
	form.submit();
}


}



</script>
<body>
<form action="./chkRegister.jsp" method="post" id="form">
<input type="text" id="id" name="id" placeholder="아이디">(*필수 항목)<br>
<input type="text" id="pwd" name="pwd" placeholder="비밀번호">(*필수 항목)<br>
<div style="display:flex;">
<input type="text" id="pwdchk" name="pwdchk" placeholder="비밀번호 확인"><div id="chk"></div></div>
<input type="text" name="name" placeholder="이름"><br>
<input type="text" name="addr" placeholder="주소"><br>
<input type="text" name="phone" placeholder="전화번호"><br>
<button type="button" onclick="chk();">회원가입</button>

</form>


</body>
</html>