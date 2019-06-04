package com.dal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dal.constant.Constant;
import com.dal.service.List;
import com.dal.service.LoginChk;
import com.dal.service.Read;
import com.dal.service.Regist;
import com.dal.service.Service;
import com.dal.service.Write;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	public HomeController() {
		
		String config ="classpath:JDBC.xml";
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(config);
		Constant.template = ctx.getBean("template",JdbcTemplate.class);
		
	}
	
	public Service s;
	
	@RequestMapping("successLogin")
	public String successLogin() {
		return "redirect:board";
	}
	
	@RequestMapping("successLogout")
	public String successLogout() {
		return "redirect:board";
	}
	
	
	@RequestMapping("home")
	public String home() {
		return "test/home";
	}
	
	@RequestMapping("board")
	public String board(Model model) {
		s = new List();
		s.execute(model);
		return "board/board";
	}
	
	@RequestMapping("write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("write_save")
	public String write_save(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		s = new Write();
		s.execute(model);
		return "redirect:board";
		
	}
	
	@RequestMapping("login")
	public String login() {
		return "board/login";
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {		
		return "redirect:successLogout";
	}
	
	@RequestMapping("register")
	public String register() {
		return "board/register";
	}
	
	@RequestMapping("regist")
	public String regist(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		s = new Regist();
		int count = s.execute(model);
		
		if(count!=0) {
			return "board/regifailed";
		}
		return "board/board";
	}
	
	@RequestMapping("login_chk")
	public String login_chk(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		s = new LoginChk();
		int count = s.execute(model);
		
		if(count==0) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", request.getParameter("id"));
			return "redirect:successLogin";
		}
		
		return "board/loginfailed";
	}
	
	@RequestMapping(value="read", method=RequestMethod.GET)
	public String read(HttpServletRequest request, Model model) {
		
		String num = request.getParameter("num");
		model.addAttribute("num", num);
		s = new Read();
		s.execute(model);
		return "board/read";
		
	}
	
	
	
}
