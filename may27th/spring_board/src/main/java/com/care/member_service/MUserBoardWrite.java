package com.care.member_service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.board_dao.BoardDAO;
import com.care.member_dto.MemberDTO;

public class MUserBoardWrite implements MemberService {

	@Override
	public int execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardDAO dao = new BoardDAO();
		dao.write(name, title, content);
		
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
