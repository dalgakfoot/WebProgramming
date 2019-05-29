package com.care.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.care.template.Constant;

public class DAO {

//	private String driver = "oracle.jdbc.driver.OracleDriver";
//	private String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
//	private String user = "jsp";
//	private String pw = "1234";
//	private Connection con;
//	private PreparedStatement ps;
//	private ResultSet rs;
	
	
	private JdbcTemplate template;
	
	
	public DAO() {
		template = Constant.template;
		
//		try {
//			Class.forName(driver);
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
	}
	
	public ArrayList<DTO> select() {
		
		String sql = "select * from test_jdbc";
		ArrayList<DTO> arr = (ArrayList<DTO>)template.query(sql, new BeanPropertyRowMapper<DTO>(DTO.class));
		
		return arr;
		
		
//		
//		try {
//			
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				DTO dto = new DTO();
//				dto.setId(rs.getInt("id"));
//				dto.setName(rs.getString("name"));
//				arr.add(dto);
//			}
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return arr;
		
	}
	
	public void insert(final String id, final String name) {
		
		String sql = "insert into test_jdbc(id, name) values (?,?)";
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, id);
				ps.setString(2, name);
				
			}
			
		});
		
		
		
//		try {
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			ps.setString(1, id);
//			ps.setString(2, name);
//			ps.executeUpdate();
//			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
	}
	
	public void update(final int id, final String name) {
		
		String sql = "update test_jdbc set name = ? where id = ?";
		
//		template.update(sql, ps->{
//			ps.setString(1, name);
//			ps.setInt(2, id);
//		});
		
		template.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, name);
				ps.setInt(2, id);
				
			}
		});
		
		
		
//		try {
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			ps.setString(1, name);
//			ps.setInt(2, id);
//			ps.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
	}
	
	public void delete(String id) {
		
//		String sql = "delete test_jdbc where id = ?";
		
		String sql = "delete from test_jdbc where id="+id;
		template.update(sql);
		
//		try {
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			ps.setString(1, id);
//			ps.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
	}
	
	public DTO view(String id) {
		
		DTO dto = null;
//		String sql = "select * from test_jdbc where id = ?";
		String sql = "select * from test_jdbc where id ="+id;
		dto = template.queryForObject(sql, new BeanPropertyRowMapper<DTO>(DTO.class));
		return dto;		
//		try {
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			ps.setString(1, id);
//			rs = ps.executeQuery();
//			
//			if(rs.next()) {
//				dto = new DTO();
//				dto.setId(rs.getInt("id"));
//				dto.setName(rs.getString("name"));
//				
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	
		
		
	}
	
	
	
}
