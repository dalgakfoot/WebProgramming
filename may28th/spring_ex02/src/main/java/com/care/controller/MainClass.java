package com.care.controller;

import java.util.Scanner;



public class MainClass {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);

		 STBean stBean = new STBean();
		  
		 stBean.setSt(new Student());

		
		
		
		
		System.out.println("�̸� : ");
		stBean.setName(input.next());
		System.out.println("���� : ");
		stBean.setAge(input.nextInt());
		
		stBean.nameP();
		stBean.ageP();
	}
	
}
