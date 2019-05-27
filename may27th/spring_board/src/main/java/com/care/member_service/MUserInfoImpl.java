package com.care.member_service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_dto.MemberDTO;

public class MUserInfoImpl implements MemberService {

	
	@Override
	public int execute(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MemberDTO> info() {
		
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberDTO> arr = dao.userInfo();
		return arr;
		
	}

	@Override
	public MemberDTO select(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
