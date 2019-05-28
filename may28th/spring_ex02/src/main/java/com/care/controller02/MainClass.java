package com.care.controller02;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		String configLocation = "classpath:applicationST.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(configLocation);

		STBean stBean = ctx.getBean("stb", STBean.class);

		 System.out.println("�̸� : "); stBean.setName(input.next());
		 System.out.println("���� : "); stBean.setAge(input.nextInt());
		 

		stBean.nameP();
		stBean.ageP();
	}

}
