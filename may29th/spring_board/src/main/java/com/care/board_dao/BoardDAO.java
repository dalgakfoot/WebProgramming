package com.care.board_dao;


import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.care.board_dto.BoardDTO;
import com.care.template.Constant;

public class BoardDAO {

	

	
	
	private JdbcTemplate template;
	
	public BoardDAO() {
		template = Constant.template;
	}
	
	
	public ArrayList<BoardDTO> list(){
		String sql = "select * from mvc_board order by idgroup desc, step asc";
		ArrayList<BoardDTO> list = (ArrayList<BoardDTO>)template.query(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		
		return list;
	}
	
	
	public void write(final String name, final String title, final String content) {	
		String sql = "insert into mvc_board(id,name,title,content,hit,idgroup,step,indent)"+
		"values(mvc_board_seq.nextval,?,?,?,0,mvc_board_seq.currval,0,0)";
		
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, name);
				ps.setString(2, title);
				ps.setString(3, content);
				
			}
			
			
		});
		
	}
	
	public BoardDTO read(String id) {
	
		BoardDTO dto = null;
		String sql = "select * from mvc_board where id ="+id;
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		return dto;
		
	}
	
	public void upHit(final String id) {
		
		String sql = "update mvc_board set hit = hit+1 where id = ?";
		
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
				
			}
		});
		
		
	}
	
	public void update(final String id, final String name, final String title, final String content) {
		
		String sql = "update mvc_board set name=?, title=?, content=? where id = ?";
		template.update(sql, new PreparedStatementSetter(){

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, name);
				ps.setString(2, title);
				ps.setString(3, content);
				ps.setString(4, id);
				
			}
			
		});
		
		
		
	}
	
	public void delete(String id) {
		String sql = "delete mvc_board where id ="+id;
		template.update(sql);
		
	}
	
	private void replyShape(final BoardDTO dto) {
		String sql = "update mvc_board set step=step+1 where idgroup=? and step>?";
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, dto.getIdgroup());
				ps.setInt(2, dto.getStep());
			}
			
		});
	}
	
	public void reply(final BoardDTO dto) {
		replyShape(dto);
		String sql = "insert into mvc_board(id,name,title,content,idgroup,step,indent)"+"values(test_board_seq.nextval,?,?,?,?,?,?)";
		template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getTitle());
				ps.setString(3, dto.getContent());
				ps.setInt(4, dto.getIdgroup());
				ps.setInt(5, dto.getStep());
				ps.setInt(6, dto.getIndent());
				
			}
		});
	}
	
	public BoardDTO reply_info(String id) {
		
		BoardDTO dto = null;
		String sql = "select * from mvc_board where id ="+id;
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<BoardDTO>(BoardDTO.class));
		
		return dto;
		
	}
	
	
	
}
