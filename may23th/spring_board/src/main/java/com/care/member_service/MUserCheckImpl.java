package com.care.member_service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.member_dao.MemberDAO;

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
}
