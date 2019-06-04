package com.dal.service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.dal.dao.UserDAO;

public class Regist implements Service {

	@Override
	public int execute(Model model) {
		
		int count = 0;
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		UserDAO dao = new UserDAO();
		count = dao.regist(id,pwd);
		
		return count;
		
	}

}
