package com.care.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.controller.DAO;
import com.care.controller.DTO;

public class ServiceList implements ServiceImplement {

	@Override
	public int execute(Model model) {
		
		DAO dao = new DAO();
		ArrayList<DTO> arr = dao.select();
		model.addAttribute("arr", arr);
		return 0;
	}

}
