package com.care.controller03;

import java.util.ArrayList;
import java.util.HashMap;

public class PrintClass {

	public void print(String name,ArrayList hobby, HashMap weather) {
		System.out.println("�̸� : "+name);
		System.out.println("hobby0 : "+hobby.get(0));
		System.out.println("hobby1 : "+hobby.get(1));
		System.out.println("���� ���� : "+weather.get("����"));
		System.out.println("���� ���� : "+weather.get("����"));
		
			
	}
}
