package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.controller.DAO;

public class ServiceDelete implements ServiceImplement {

	@Override
	public int execute(Model model) {

		DAO dao = new DAO();

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		
		dao.delete(id);


		return 0;
	}

}
