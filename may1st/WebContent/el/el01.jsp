<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%="표현식 출력" %><br>
	<%out.print("스크립트릿 출력"); %><br> ${"표현식 언어 el 출력"}
	<br>
	<hr>
	정수형 : ${10 }
	<br> 실수형 : ${5.6 }
	<br> 문자열형 : ${"홍길동" }
	<br> 논리형 : ${true }
	<br> null값 : ${null }
	<br>
	<!-- 결과 화면을 공백으로 처리 -->
	${5+2}
	<br>
	<!-- 연산자도 표현 가능 -->
	<hr>
	<H1>연산자들</H1>

	\${5+2 }: ${5+2 }
	<br> \${5-2 }: ${5-2 }
	<br> \${5*2 }: ${5*2 }
	<br> \${5/2 }: ${5 / 2}
	<br> \${5/2 }: ${5 div 2 }
	<br> \${5%2 }: ${5 % 2}
	<br> \${5%2 }: ${5 mod 2 }
	<br> \${(5>2) || (5<2)} : ${(5>2) || (5>2)} => \${false or true} :
	${false or true}
	<br> \${(5>2) && (5>2)} : ${(5>2) && (5>2)} => \${false and true}
	: ${false and true}
	<br> \${ !(5>2) } : ${ !(5>2) } => \${ not false} : ${ not false }
	<br> \${5 ==2 } : ${5==2 } ==> \${5 eq 5 } : ${5 eq 5 }
	<br> \${5 !=2 } : ${5!=2 } ==> \${5 ne 5 } : ${5 ne 5 }
	<br> \${5<2 } : ${5 <2 } ==> \${5 lt 2 } : ${5 lt 2 }
	<br> \${5>2 } : ${5 >2 } ==> \${5 gt 2 } : ${5 gt 2 }
	<br> \${5<=2 } : ${5 <=2 } ==> \${5 le 2 } : ${5 le 2 }
	<br> \${5<=2 } : ${5 <=2 } ==> \${5 ge 2 } : ${5 ge 2 }
	<br>



</body>
</html>