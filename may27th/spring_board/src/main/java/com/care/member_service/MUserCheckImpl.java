package com.care.member_service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;
import com.care.member_dto.MemberDTO;

public class MUserCheckImpl implements MemberService {

		public int execute(Model model) {
			
			Map<String, Object> map = model.asMap();
			HttpServletRequest request = (HttpServletRequest)map.get("request");
			// 위는 무조건 거쳐야 하는 과정임
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			MemberDAO dao = new MemberDAO();
			
			return dao.userCheck(id,pwd);
			
			
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
