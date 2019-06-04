package com.dal.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.dal.constant.Constant;

@Aspect
public class AOP {

	private JdbcTemplate template = Constant.template;
	String state = null;
	

	@After("execution(* com.dal.controller.HomeController.successLogin(..))")
	public void afterLogin() {
		
		ServletRequestAttributes sra =
				(ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		System.out.println("userid"+session.getAttribute("userId"));
		state = "로그인";
		String sql ="update jun4th_user set islogin = '"+state+"' where id='"+session.getAttribute("userId")+"'";
		template.update(sql);
		
	}
	
	@Before("execution(* com.dal.controller.HomeController.successLogout(..))")
	public void afterLogout() {
		ServletRequestAttributes sra =
				(ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = sra.getRequest();
		HttpSession session = request.getSession();
		state = "로그아웃";
		String sql ="update jun4th_user set islogin = '"+state+"' where id='"+session.getAttribute("userId")+"'";
		template.update(sql);
		session.invalidate();
		
	}
	
	
}
