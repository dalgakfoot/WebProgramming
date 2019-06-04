package com.dal.board;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import com.dal.constant.Constant;

public class BoardDAO {

	public JdbcTemplate template;

	public BoardDAO() {
		template = Constant.template;
	}

	public void write(BoardDTO dto) {

		String sql = "insert into jun4th_board(num,id,title,content,hit)"+
				"values(number_board.nextval,?,?,?,0)";


		

		template.update(sql, ps->{
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
		});

	}

	public ArrayList<BoardDTO> list() {

		String sql = "select * from jun4th_board order by num desc";
		ArrayList<BoardDTO> arr = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		return arr;


	}

	public BoardDTO read(String num) {
		hit(num);
		String sql = "select * from jun4th_board where num ='"+num+"'";
		BoardDTO dto = template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		return dto;
			
	}
	
	public void hit(String num) {
		
		String sql = "update jun4th_board set hit = hit+1 where num ='"+num+"'";
		template.update(sql);
		
	}
	
	public int count() {
		
		String sql = "select count(*) from jun4th_board";
		int count = template.queryForObject(sql, Integer.class);
		return count;
		
		
	}

	




}
