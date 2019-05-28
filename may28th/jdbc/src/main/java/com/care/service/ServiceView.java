package com.care.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.controller.DAO;
import com.care.controller.DTO;

public class ServiceView implements ServiceImplement {

	

	@Override
	public int execute(Model model) {
		DAO dao = new DAO();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String id = request.getParameter("id");
		DTO dto = dao.view(id);
		
		model.addAttribute("dto",dto);
		
		return 0;
	}
	
	
	
	
}
