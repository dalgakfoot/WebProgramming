package com.care.member_service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_dto.MemberDTO;

public class MUserSelectImpl implements MemberService {

	@Override
	public int execute(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO select(String id) {
		// TODO Auto-generated method stub
		MemberDTO dto = new MemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto = dao.select(id);
		return dto;
		
	}

}
