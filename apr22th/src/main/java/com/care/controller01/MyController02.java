package com.care.controller01;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MyController02 {

	@RequestMapping(value="member02/index")
	public String memberIndex(Model model) {
		return "/member02/index";
	}
	
	@RequestMapping(value="member02/result")
	public String memberResult01(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		
		model.addAttribute("name", name);
		model.addAttribute("age", age);
		
		return "/member02/result";
			
	}
	
	@RequestMapping(value = "/member02/result",method= RequestMethod.POST)
	public String memberResult02(@RequestParam("name") String name, @RequestParam("age") String age,
			@RequestParam("addr") String addr, Model model) {
		model.addAttribute("name", name); model.addAttribute("age", age);
		model.addAttribute("addr", addr);
		return "/member02/result";
		
		
	}
	
	
	
}
