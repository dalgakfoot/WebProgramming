package com.care.ex01;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class Main {
	public static void main(String[] args) {
		GenericXmlApplicationContext ctx = 
							new GenericXmlApplicationContext();
		ConfigurableEnvironment env = ctx.getEnvironment();
		MutablePropertySources propertySources = 
											env.getPropertySources();
		try {
			propertySources.addLast(
			new ResourcePropertySource("classpath:dbc.properties"));
			System.out.println("처음 dbc.ip : "+env.getProperty("dbc.ip"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("로드(refresh()후 envsetter 자동 호출");
		ctx.load("applicationDBC.xml");
		ctx.refresh(); //자동으로 DBCon의 setEnvironment 실행
		DBCon dbconnect = ctx.getBean("dbc",DBCon.class);
		System.out.println("db ip : "+dbconnect.getIp());
		ctx.close();
	}
}





