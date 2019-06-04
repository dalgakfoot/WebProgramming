package com.dal.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.dal.board.BoardDTO;
import com.dal.board.BoardDAO;

public class Read implements Service {

	@Override
	public int execute(Model model) {
		
		BoardDAO dao = new BoardDAO();
		Map<String, Object> map = model.asMap();
		String num = (String) map.get("num");
		BoardDTO dto = dao.read(num);
		model.addAttribute("dto", dto);
		return 0;
	}

	
}
