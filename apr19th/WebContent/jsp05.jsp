<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>
<%! 
	public int abs(int n){
	   if(n < 0)
		   n=-n;
	   return n;
	}
	public int sumFunc(int sum,int cnt){
		for(int i=1;i<=cnt;i++)
			sum+=i;
		return sum;
	}
%> 
<%= "a02 => "+a02+"의 절대값 : "+abs(a02) %><br>
<%=  "b02 => "+b02%>의 절대값 : <%=abs(b02) %><br>
<%="1부터 10까지의 합 : "+sumFunc(sum02,cnt02) %><br>

<p/>
1 ~ 10 까지의 합을 구하는 함수를 만드시오.<br>
단, 메소드에서는 매개변수로 값을 받고, return 으로 값을 돌려준다<br>
(메소드부(연산만), 출력부 2단계로 나눠서 표현 한다)<br>

<%! 
    int a02=5, b02=-5;
	int sum02=0,cnt02=10;   
%> 


</body>
</html>