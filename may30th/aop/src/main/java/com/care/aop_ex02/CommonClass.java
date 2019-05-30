package com.care.aop_ex02;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
@Aspect
public class CommonClass {

	@Around("within(com.care.aop_ex02.*)")
	// ��Ű�� ������ �ִ� ��� ����� ���� �Ǹ�
	public void commonAop(ProceedingJoinPoint joinpoint) {
		try {
			System.out.println("--���� ��� ����--");
			joinpoint.proceed();
			System.out.println("--���� ��� ����--");
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}
	
	@Before("execution(* com.care.aop_ex02.CoreClass.test())")
	// Ư�� �޼��尡 ������ �Ǹ� �� ���� ����
	public void beforeAdvice() {
		System.out.println("�ٽ� ��� ���� �� ����Ǵ� �޼ҵ�");
	}
	
	
}

/*
 Pointcut�� ������ �� ����ϴ� ǥ�������� Aspectj ������ ����Ѵ�.
  
 1. public void �� ��� get �޼ҵ� ���� �Ű����� ( . . ) 0�� �̻��� ��� ��
 	=>excution(public void get*(..)
 
 2. com.care.aop_ex01��Ű�� & com.care.spring.ex07 ���� ��Ű���� �Ķ���� �� ���� ��� �޼ҵ�
 	=>excution(* com.care.spring.ex07..*.*())
 
 3. com.care.aop_ex01.CoreClass ���� ��� �޼ҵ�
 	=>excution(* com.care.spring.ex07.CoreClass.*())
 
 4. com.care.aop_ex01��Ű�� ���� ��� �޼ҵ�
 	=>within(com.care.spring.ex07.*)
 
 5. com.care.aop_ex01��Ű�� �� ���� ��Ű�� �ȿ� �ִ� ��� �޼���
 	=>within(com.care.spring.ex07..*)
 
 6. com.care.aop_ex01.CoreClass ���� ��� �޼���
 	=>within(com.care.spring.ex07.CoreClass)
 
 
 */
