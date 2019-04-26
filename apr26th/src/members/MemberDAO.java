package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

		}catch(ClassNotFoundException e) {
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


}
