package com.care.member_service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_dto.MemberDTO;

public class MUserRegistChkImpl implements MemberService {

	@Override
	public int execute(Model model) {
		
		MemberDAO dao = new MemberDAO();
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		int result = dao.regist(id,pwd);
		
		if(result==0) {
			return 0;
		}
		return 1;
		
		
	}

	@Override
	public ArrayList info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO select(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	

}
