package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	//  데이터베이스 접근 클래스
	private String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";
		ArrayList<MemberDTO> memberList = new ArrayList<>();
		try {
	
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString("id"));
				mb.setPwd(rs.getString("pwd"));
				mb.setName(rs.getString("name"));
				mb.setAddr(rs.getString("addr"));
				mb.setTel(rs.getString("tel"));

				memberList.add(mb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return memberList;

	}


	public int memberCheck(String uid, String upwd) {
		String id = uid;
		String pw = null;
		String sql = "select pwd from members where id='"+id+"'";
		try {
			
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				pw = rs.getString("pwd");
			}

			if(pw!=null) {
				if(pw.equals(upwd)) {System.out.println("1");return 1;}	
				else {System.out.println("0");return 0;}
				
			}else {
				System.out.println("-1");return -1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		System.out.println("-1");
		return -1;
		
	}
	
	
	public MemberDTO memberInfo(String name) {
		MemberDTO m = new MemberDTO();
		String sql = "select * from members where name='"+name+"'";
		try {
			
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				m.setId(rs.getString("id"));
				m.setPwd(rs.getString("pwd"));
				m.setName(rs.getString("name"));
				m.setAddr(rs.getString("addr"));
				m.setTel(rs.getString("tel"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return m;
		
	}
	
	public int memberDelete(String name) {
		int success = 0;
		String sql = "delete from members where name='"+name+"'";
		try {
			
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			success = ps.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return success;
	}
	
	
	public int memberRegister(MemberDTO m) {
		String sql = "insert into members (id,pwd,name,addr,tel) values ('"+m.getId()+"','"+m.getPwd()+"','"+m.getName()+"','"+m.getAddr()+"','"+m.getTel()+"')";
		
		int result=0;
		try {
		
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int memberCheck(String uid) {
		String id = uid;
		int result = 0;
		String sql = "select * from members where id='"+id+"'";
		try {
		
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();

			if(result==0) {
				return 0;
				
			}else {
				return 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
			return -1;
		
	}
	
	public int memberUpdate(MemberDTO member) {
		String sql = "update members set name=?, addr=?, tel=? where id=?";
		int result = 0;
		try {
		
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, member.getName());
			ps.setString(2, member.getAddr());
			ps.setString(3, member.getTel());
			ps.setString(4, member.getId());
			result = ps.executeUpdate();
			
			if(result == 0) {
				return 0;
			}else {
				return 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return -1;
	}
	
	
	


}
