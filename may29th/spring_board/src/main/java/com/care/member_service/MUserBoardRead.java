package com.care.member_service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.board_dto.BoardDTO;
import com.care.member_dto.MemberDTO;

public class MUserBoardRead implements MemberService {

	@Override
	public int execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		BoardDAO dao = new BoardDAO();
		
		BoardDTO dto = dao.read(id);
		dao.upHit(id);
		
		model.addAttribute("dto", dto);

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
