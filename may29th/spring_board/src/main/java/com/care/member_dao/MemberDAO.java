package com.care.member_dao;


import java.sql.PreparedStatement;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.care.member_dto.MemberDTO;
import com.care.template.Constant;

public class MemberDAO {


	
	private JdbcTemplate template;
	
	private final int CHK_OK=0;
	private final int CHK_NO=1;
	
	
	
	public MemberDAO() {
		template = Constant.template;
	}
	
	public int userCheck(String id, String pwd) {
		
		String sql = "select * from member02 where id ='"+id+"'";
		MemberDTO dto = template.queryForObject(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
		if(dto.getPwd().equals(pwd)){
			return CHK_OK;
		}else{
			return CHK_NO;
		}			
	}
	
	public ArrayList<MemberDTO> userInfo() {
		
		String sql = "select * from member02";
		ArrayList<MemberDTO> arr = (ArrayList<MemberDTO>)template.query(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));		
		return arr;
		
	}
	
	
	public int regist(final String id, final String pwd) {
		String sql = "insert into member02 (id,pwd) values (?,?)";
		int error = 0;
		try {
//			con = DriverManager.getConnection(url, user, pw);
//			ps = con.prepareStatement(sql);
//			ps.setString(1, id);
//			ps.setString(2, pwd);
//			ps.executeUpdate();
			template.update(sql, new PreparedStatementSetter() {
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					ps.setString(1, id);
					ps.setString(2, pwd);
				}
			});
			
		} catch (Exception e) {
			error++;
		}
	
		return error;	
	}
	
	public MemberDTO select(String id) {
		
		String sql = "select * from member02 where id ='"+id+"'";
		MemberDTO dto = template.queryForObject(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
		return dto;
		
	}
	
	
	
	
	
	
	
	
	
}
