package com.care.controller04;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.member.Member;

@org.springframework.stereotype.Controller
public class Controller {

	@RequestMapping("/index")
	public String index() {
		return "quiz01/index";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		if(id.equals("h")) {
			if(pwd.equals("1")) {
				return "redirect:OK";
			}else {
				return "redirect:NO";
			}
		}
		
		return "redirect:login";
		
	}
	
	@RequestMapping("/OK")
	public String OK(Model model) {
		return "quiz01/OK";
	}
	
	@RequestMapping("/inform")
	public String inform(Member member,Model model) {
		int cnt=0;
		ArrayList<String> arr = new ArrayList<String>();
		arr.add(member.getName());
		arr.add(member.getAge());
		arr.add(member.getAddr());
		
		for(String a : arr) {
			if(a.equals("")) {
				cnt++;
			}
		}
		
		if(cnt>0) {
			return "redirect:OK";
		}
		
		
		model.addAttribute("member", member);
		
		
		return "quiz01/result";
	}
	
	
	
}
