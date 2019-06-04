package com.dal.schedule;

import com.dal.board.BoardDAO;

public class Scheduler {

	BoardDAO dao = new BoardDAO();
	
	public void schedule() {
		int count = dao.count();
		System.out.println("±Û °¹¼ö : "+count);
	}
	
}
