package com.care.member_dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.member_dto.MemberDTO;

public class MemberDAO {

	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pw = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	private final int CHK_OK=0;
	private final int CHK_NO=1;
	
	
	
	public MemberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int userCheck(String id, String pwd) {
		String sql = "select * from member02 where id =?";
		
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					return CHK_OK;
				}
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return CHK_NO;
		
	}
	
	public ArrayList<MemberDTO> userInfo() {
		ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
		String sql = "select * from member02";
		
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO m = new MemberDTO();
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				arr.add(m);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return arr;
		
	}
	
	
	public int regist(String id, String pwd) {
		String sql = "insert into member02 (id,pwd) values (?,?)";
		int error = 0;
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			ps.executeUpdate();
			
		} catch (Exception e) {
			
			error++;
			
		}
		
		return error;
		
	}
	
	public MemberDTO select(String id) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from member02 where id = ?";
		try {
			con = DriverManager.getConnection(url, user, pw);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return dto;
		
	}
	
	
	
	
	
	
	
	
	
}
