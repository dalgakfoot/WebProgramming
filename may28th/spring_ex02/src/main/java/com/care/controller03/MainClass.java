package com.care.controller03;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
	
	String configLocation = "classpath:applicationPC.xml";
	GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
	SaveClass sc = ctx.getBean("sc", SaveClass.class);
	
//	ArrayList<String> hobby = new ArrayList<String>();
//	HashMap<String, String> weather = new HashMap<String, String>();
//	hobby.add("����");hobby.add("����");
//	weather.put("����", "�̼����� ����");
//	weather.put("����", "����");	
	
	
//	sc.setName("ȫ�浿"); sc.setHobby(hobby); sc.setWeather(weather);
	sc.pcFunc();
	
	SaveClass sc1 = ctx.getBean("sc1", SaveClass.class);
	sc1.pcFunc();
	
	}
	
}
