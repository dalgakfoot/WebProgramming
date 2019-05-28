package com.care.controller04;

import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	
	public static void main(String [] args) {
	
	Scanner input = new Scanner(System.in);
	String configLocation = "classpath:applicationCAR.xml";
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
	
	Car car = ctx.getBean("car",Car.class);
	
	while(true) {
		System.out.println("1.�ڵ�");System.out.println("2.�ӵ�");
		System.out.println("3.����");System.out.print(">>> : ");
		int num = input.nextInt();
		
		switch(num) {
		
		case 1 : { car.handle(); break;}
		case 2 : { car.speed(); break;}
		case 3 : { System.out.println("�����մϴ�."); return;}
		
		}
		
	}
	
	}
	
}
