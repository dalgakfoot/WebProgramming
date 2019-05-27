package com.care.board_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.board_dto.BoardDTO;

public class BoardDAO {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pw = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public BoardDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<BoardDTO> list(){
		String sql = "select * from mvc_board order by idgroup desc, step asc";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public void write(String name, String title, String content) {	
		String sql = "insert into mvc_board(id,name,title,content,hit,idgroup,step,indent)"+
		"values(mvc_board_seq.nextval,?,?,?,0,mvc_board_seq.currval,0,0)";
		
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public BoardDTO read(String id) {
	
		BoardDTO dto = null;
		String sql = "select * from mvc_board where id = ?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	public void upHit(String id) {
		
		String sql = "update mvc_board set hit = hit+1 where id = ?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void update(String id, String name, String title, String content) {
		
		String sql = "update mvc_board set name=?, title=?, content=? where id = ?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, id);
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void delete(String id) {
		String sql = "delete mvc_board where id =?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private void replyShape(BoardDTO dto) {
		String sql = "update mvc_board set step=step+1 where idgroup=? and step>?";
		try {
			con=DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public void reply(BoardDTO dto) {
		replyShape(dto);
		String sql = "insert into mvc_board(id,name,title,content,idgroup,step,indent)"+"values(test_board_seq.nextval,?,?,?,?,?,?)";
		try {
			con=DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1);
			ps.setInt(6, dto.getIndent()+1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO reply_info(String id) {
		
		BoardDTO dto = null;
		String sql = "select * from mvc_board where id = ?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setHit(rs.getInt("hit"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}
	
	
	
}
