package com.care.ex02;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class Main {
	public static void main(String[] args) {
		GenericXmlApplicationContext ctx = 
							new GenericXmlApplicationContext("classpath:applicationDBC02.xml");
		
		DBCon dbcon = ctx.getBean("dbc",DBCon.class);
		System.out.println("ip : "+dbcon.getIp());
		System.out.println("id : "+dbcon.getId());
		System.out.println("pw : "+dbcon.getPw());
		ctx.close();
		
		
	}
}





