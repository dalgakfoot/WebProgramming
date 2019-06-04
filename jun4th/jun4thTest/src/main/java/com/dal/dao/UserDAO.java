package com.dal.dao;


import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.dal.constant.Constant;
import com.dal.userDTO.UserDTO;

public class UserDAO {

	public JdbcTemplate template;
	
	public UserDAO(){
		template = Constant.template;
	}
	
	public int regist(String id, String pwd) {
		int count = 0;
		String sql ="insert into jun4th_user(id,pwd) values(?,?)";
		try {
			template.update(sql, ps->{
				ps.setString(1, id);
				ps.setString(2, pwd);
			});
		} catch (Exception e) {
			count++;
		}
		return count;
	}
	
	public int login(String id, String pwd) {
		String sql = "select * from jun4th_user where id ='"+id+"'";
		UserDTO dto = (UserDTO) template.queryForObject(sql, new BeanPropertyRowMapper<UserDTO>(UserDTO.class));
		if(dto.getPwd().equals(pwd)) {
			return 0;
		}else {
			return 1;
		}
	
		
	}
	
	
}
