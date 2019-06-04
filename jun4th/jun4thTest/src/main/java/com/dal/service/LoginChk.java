package com.dal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.dal.dao.UserDAO;

public class LoginChk implements Service {

	@Override
	public int execute(Model model) {
		UserDAO dao = new UserDAO();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		int count = dao.login(id, pwd);
		if(count==1) {
			return 1;
		}
		return 0;
	}

}
