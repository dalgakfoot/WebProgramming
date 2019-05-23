package com.care.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.member_service.MUserCheckImpl;
import com.care.member_service.MemberService;

@Controller
public class MemberConroller {
	
	private MemberService ms;
	
	
	
	@RequestMapping("/index")
	public String index() {
		return "member/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping(value= "user_check",method=RequestMethod.POST)
	public String user_check(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserCheckImpl();
		int result = ms.execute(model);
		if(result == 0) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", request.getParameter("id"));
			return "member/successLogin";
		}
		
		return "redirect:login";
		
		
	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userId")!=null) {
			session.invalidate();
		}
		return "redirect:index";
		
		
	}
	
	
}
