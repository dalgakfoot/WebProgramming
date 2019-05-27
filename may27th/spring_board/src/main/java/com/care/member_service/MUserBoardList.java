package com.care.member_service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_dto.BoardDTO;
import com.care.member_dto.MemberDTO;

public class MUserBoardList implements MemberService {

	@Override
	public int execute(Model model) {
		
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardDTO> arr = dao.list();
		model.addAttribute("list", arr);
		
		return 0;
	}

	@Override
	public ArrayList info() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberDTO select(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
