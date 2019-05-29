package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.controller.DAO;

public class ServiceUpdate implements ServiceImplement {

	public int execute(Model model) {
		
		DAO dao = new DAO();
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		int temp = Integer.parseInt(id);
		
		
		dao.update(temp,name);
		
		return 0;
	}
	
}
