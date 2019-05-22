package com.care.controller02;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.member.Member;

@Controller
public class MyController {

	@RequestMapping(value = "index")
	public String memberIndex() {
		return "/member03/index";
	}

	
	  @RequestMapping(value = "result") public String
	  memberResult02(@RequestParam("name") String name, @RequestParam("age") String
	  age,
	  
	  @RequestParam("addr") String addr, Model model) {
	  
	  Member member = new Member(); member.setName(name); member.setAge(age);
	  member.setAddr(addr);
	  
	  model.addAttribute("member", member);
	  
	  return "/member03/result";
	  
	  }
	 
	/*
	 * @RequestMapping(value="/result") public String memberResult(@ModelAttribute("member") Member member) { 
	 * return "/member03/result"; }
	 * 
	 * @RequestMapping(value="/result") public String memberResult(Member member,Model model) {
	 *  model.addAttribute("member", member); 
	 *  return "/member03/result"; }
	 */
	 

}
