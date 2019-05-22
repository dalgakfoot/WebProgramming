package com.care.controller01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {

	@RequestMapping("index")
	public String memberIndex(Model model) {
		
		model.addAttribute("index","기본페이지 입니다.");
		
		return "/member/index";
		
	}
	
	@RequestMapping(value="/login")
	public ModelAndView memberLogin() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("login","로그인 페이지 입니다");
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value="logout")
	public String memberLoginOut() {
		return "member/logout";
	}
	
	
}
