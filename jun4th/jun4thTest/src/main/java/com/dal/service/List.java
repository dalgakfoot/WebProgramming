package com.dal.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.dal.board.BoardDAO;
import com.dal.board.BoardDTO;

public class List implements Service {

	@Override
	public int execute(Model model) {
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> arr = dao.list();
		model.addAttribute("list", arr);
		return 0;
	}

}
