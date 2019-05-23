package com.care.controller03;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyController {

	@RequestMapping("/index")
	public String index() {
		return "redirect01/index";
	}
	
	@RequestMapping("/result")
	public String resultRedirect(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println("id : "+id);
		if(id.equals("abc")) {
			return "redirect:rsOK";
		}
		return "redirect:rsNO";
	}
	
	@RequestMapping("/rsOK")
	public String resultOK(Model model) {
		return "redirect01/rsOK";
	}
	
	@RequestMapping("/rsNO")
	public String resultNO(Model model) {
		return "redirect01/rsNO";
	}
	
	
}
