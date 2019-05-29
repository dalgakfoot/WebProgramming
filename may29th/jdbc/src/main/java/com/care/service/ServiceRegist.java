package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.controller.DAO;

public class ServiceRegist implements ServiceImplement {

	@Override
	public int execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		DAO dao = new DAO();
		dao.insert(id, name);
		return 0;
	}

}
