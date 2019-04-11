id=prompt('아이디 입력');
// prompt(''); -> 입력창을 만들어서 띄워줌

if(id == 'test'){
	
	password=prompt('비밀번호 입력');
	if(password == "test"){
		location.href="JS15_login.html"
	}
	
	else {location.href="JS15_error.html"}
	
	
}else{ location.href="https://www.naver.com"}