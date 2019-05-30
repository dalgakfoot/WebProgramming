package com.care.aop_ex01;

import org.springframework.context.support.GenericXmlApplicationContext;
/*
공통 기능 실행 시기를 결정
<aop:before> : 메소드 실행 전에 advice 실행
<aop:after-returnning> : 정상적으로 메소드 실행 후에 advice 실행
<aop:ater-throwing> : 메소드 실행중 예외 발생 시 advice 실행
<aop:after> : 메소드 실행중 예외가 발생 하여도 advice 실행
<aop:around> : 메소드 실행 전/후 및 예외 발생 시 advice 실행

보편적으로 before , around가 많이 사용됨.
 */

public class MainClass {

	public static void main(String[] args) {
		
		String path = "classpath:applicationAOP_01.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(path);
		CoreClass core = ctx.getBean("core", CoreClass.class);
		
		System.out.println("메인 시작");
		core.corePrint();
		System.out.println("메인 끝");
		ctx.close();
		
	}

}
