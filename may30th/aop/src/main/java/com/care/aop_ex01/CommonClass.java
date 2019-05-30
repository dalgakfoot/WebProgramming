package com.care.aop_ex01;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;

public class CommonClass {

	public void commonAop(ProceedingJoinPoint joinpoint) {
		System.out.println("공통 기능 사용 프로세스 : "+joinpoint.getSignature().toShortString());
	
		try {
			System.out.println("==공통 기능 시작==");
			joinpoint.proceed();
			System.out.println("--공통 기능 종료 --");
		
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	
	public void beforeAdvice(JoinPoint joinPoint) {
		System.out.println("beforeAdvice() 핵심 기능 전 실행");
		
		
	}
	
}
