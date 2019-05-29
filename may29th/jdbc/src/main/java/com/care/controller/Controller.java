package com.care.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.service.ServiceDelete;
import com.care.service.ServiceImplement;
import com.care.service.ServiceList;
import com.care.service.ServiceRegist;
import com.care.service.ServiceUpdate;
import com.care.service.ServiceView;

@org.springframework.stereotype.Controller
public class Controller {

	ServiceImplement si;
	
	
	@RequestMapping("list")
	public String list(Model model) {
		
		si = new ServiceList();
		si.execute(model);
		return "list";
	}
	
	@RequestMapping("register")
	public String regist() {
		return "register";
	}
	
	@RequestMapping("regist")
	public String regist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		si = new ServiceRegist();
		si.execute(model);
		return "redirect:list";
		
	}
	
	@RequestMapping(value="update", method=RequestMethod.GET)
	public String update(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		si = new ServiceUpdate();
		si.execute(model);
		return "redirect:list";
		
	}
	
	
	@RequestMapping(value="view", method=RequestMethod.GET)
	public String view(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		si = new ServiceView();
		si.execute(model);
		return "view";
		
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(HttpServletRequest request, Model model) {
		
		model.addAttribute("request",request);
		si = new ServiceDelete();
		si.execute(model);
		return "redirect:list";
		
	}
	
}
