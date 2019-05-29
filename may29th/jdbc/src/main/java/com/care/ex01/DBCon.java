package com.care.ex01;

import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;

public class DBCon implements EnvironmentAware{
	private String ip;
	private Environment env;
	
	@Override
	public void setEnvironment(Environment environment) {
		// TODO Auto-generated method stub
		System.out.println("setEnvironment ½ÇÇà");
		setEnv(environment);
		System.out.println("env : "+env);
		setIp(env.getProperty("dbc.ip"));
	}
	
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Environment getEnv() {
		return env;
	}
	public void setEnv(Environment env) {
		this.env = env;
	}
	
	
	
	
	
}










