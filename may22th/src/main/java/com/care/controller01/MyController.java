package com.care.controller01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MyController {

	@RequestMapping("index")
	public String memberIndex(Model model) {
		
		model.addAttribute("index","�⺻������ �Դϴ�.");
		
		return "/member/index";
		
	}
	
	@RequestMapping(value="/login")
	public ModelAndView memberLogin() {
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("login","�α��� ������ �Դϴ�");
		mv.setViewName("member/login");
		return mv;
	}
	
	@RequestMapping(value="logout")
	public String memberLoginOut() {
		return "member/logout";
	}
	
	
}
