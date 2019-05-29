package com.care.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.care.member_dto.MemberDTO;
import com.care.member_service.MUserBoardDelete;
import com.care.member_service.MUserBoardList;
import com.care.member_service.MUserBoardRead;
import com.care.member_service.MUserBoardReply;
import com.care.member_service.MUserBoardReply_view;
import com.care.member_service.MUserBoardUpdate;
import com.care.member_service.MUserBoardWrite;
import com.care.member_service.MUserCheckImpl;
import com.care.member_service.MUserInfoImpl;
import com.care.member_service.MUserRegistChkImpl;
import com.care.member_service.MUserSelectImpl;
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
	
	@RequestMapping("memberinfo")
	public String memberInfo(Model model) {
		
		ms = new MUserInfoImpl();
		ArrayList<MemberDTO> arr = ms.info();
		model.addAttribute("userArr", arr);
		
		return "member/memberInfo";
		
	}
	
	
	@RequestMapping("register")
	public String register() {
		return "member/register";
	}
	
	
	
	@RequestMapping("regist")
	public String regist(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserRegistChkImpl();
		int result = ms.execute(model);
		if(result==1) {
			return "member/registFailed";
		}else {
			return "member/registSuccess";
		}
		
	}
	
	@RequestMapping(value="select",method=RequestMethod.GET)
	public String select(HttpServletRequest request, Model model) {
		ms = new MUserSelectImpl();
		String id = request.getParameter("id");
		MemberDTO dto = ms.select(id);
		model.addAttribute("dto", dto);
		return "member/selectView";
		
	}
	
	@RequestMapping("list")
	public String list(Model model) {
		ms = new MUserBoardList();
		ms.execute(model);
		return "board/list";
	}
	
	@RequestMapping("board_write")
	public String board_write() {
		return "board/board_write";
	}
	
	@RequestMapping("write")
	public String write(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserBoardWrite();
		ms.execute(model);
		return "redirect:list";
	}
	
	@RequestMapping(value="board_read",method=RequestMethod.GET)
	public String board_read(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserBoardRead();
		ms.execute(model);
		return "board/board_read";
		
	}
	
	@RequestMapping("update")
	public String update(HttpServletRequest request,Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserBoardUpdate();
		ms.execute(model);
		return "redirect:list";
		
	}
	
	@RequestMapping("delete")
	public String delete(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		ms = new MUserBoardDelete();
		ms.execute(model);
		return "redirect:list";	
	}
	
	@RequestMapping(value="reply_view",method=RequestMethod.GET)
	public String reply_view(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		ms = new MUserBoardReply_view();
		ms.execute(model);
		return "board/reply";
	}
	
	
	@RequestMapping(value="reply")
	public String reply(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		ms = new MUserBoardReply();
		ms.execute(model);
		return "redirect:list";
		
	}
	
	
	
	
}
