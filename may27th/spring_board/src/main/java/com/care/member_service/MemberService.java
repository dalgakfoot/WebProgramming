package com.care.member_service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.member_dto.MemberDTO;

public interface MemberService {

	public int execute(Model model);
	
	public ArrayList info();
	
	public MemberDTO select(String id);
		
}
