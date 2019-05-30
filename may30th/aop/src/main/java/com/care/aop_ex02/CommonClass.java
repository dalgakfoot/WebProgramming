package com.care.aop_ex02;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
@Aspect
public class CommonClass {

	@Around("within(com.care.aop_ex02.*)")
	// 패키지 하위에 있는 모든 기능이 실행 되면
	public void commonAop(ProceedingJoinPoint joinpoint) {
		try {
			System.out.println("--공통 기능 시작--");
			joinpoint.proceed();
			System.out.println("--공통 기능 종료--");
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	@Before("execution(* com.care.aop_ex02.CoreClass.test())")
	// 특정 메서드가 실행이 되면 그 전에 실행
	public void beforeAdvice() {
		System.out.println("핵심 기능 실행 전 실행되는 메소드");
	}
	
	
}

/*
 Pointcut을 지정할 때 사용하는 표현식으로 Aspectj 문법을 사용한다.
  
 1. public void 인 모든 get 메소드 포함 매개변수 ( . . ) 0개 이상의 모든 것
 	=>excution(public void get*(..)
 
 2. com.care.aop_ex01패키지 & com.care.spring.ex07 하위 패키지에 파라미터 가 없는 모든 메소드
 	=>excution(* com.care.spring.ex07..*.*())
 
 3. com.care.aop_ex01.CoreClass 안의 모든 메소드
 	=>excution(* com.care.spring.ex07.CoreClass.*())
 
 4. com.care.aop_ex01패키지 안의 모든 메소드
 	=>within(com.care.spring.ex07.*)
 
 5. com.care.aop_ex01패키지 및 하위 패키지 안에 있는 모든 메서드
 	=>within(com.care.spring.ex07..*)
 
 6. com.care.aop_ex01.CoreClass 안의 모든 메서드
 	=>within(com.care.spring.ex07.CoreClass)
 
 
 */
