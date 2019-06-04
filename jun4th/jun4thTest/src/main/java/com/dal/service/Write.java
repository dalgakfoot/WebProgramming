package com.dal.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.dal.board.BoardDAO;
import com.dal.board.BoardDTO;

public class Write implements Service {

	@Override
	public int execute(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		BoardDTO dto = new BoardDTO();
		dto.setId(request.getParameter("id"));
		dto.setTitle(request.getParameter("title"));
		dto.setContent(request.getParameter("content"));
		
		BoardDAO dao = new BoardDAO();
		dao.write(dto);
		return 0;
	}

	
	
}
