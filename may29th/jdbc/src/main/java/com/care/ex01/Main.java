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
			System.out.println("ó�� dbc.ip : "+env.getProperty("dbc.ip"));
		}catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("�ε�(refresh()�� envsetter �ڵ� ȣ��");
		ctx.load("applicationDBC.xml");
		ctx.refresh(); //�ڵ����� DBCon�� setEnvironment ����
		DBCon dbconnect = ctx.getBean("dbc",DBCon.class);
		System.out.println("db ip : "+dbconnect.getIp());
		ctx.close();
	}
}





