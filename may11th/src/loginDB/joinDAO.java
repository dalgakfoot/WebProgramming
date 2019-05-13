package loginDB;

import java.lang.reflect.Executable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class joinDAO {
//	String url = "jdbc:oracle:thin:@192.168.115.145:1521:xe";
	String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public joinDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<joinDTO> joinMember(){
		String sql = "select * from join";
		ArrayList<joinDTO> arrDto = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				joinDTO dto = new joinDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setPhoneNo(rs.getString("phoneNo"));
				dto.setAddr(rs.getString("addr"));
				dto.setGameMoney(rs.getInt("gameMoney"));
				arrDto.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arrDto;
		
		
	}
	
	public int insertMember(joinDTO dto,String id) {
		String sql = "insert into join (id,pwd,phoneNo,addr,gameMoney)"
				+ "values(?,?,?,?,?)";
		
		
		System.out.println(dto + "디티오");
		int check = 0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			
			check = checkId(id);
			
			if(check == 0) { //아이디가 중복되지 않으면 0
				check = -1;
			}else {
				return check;
			}
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getPhoneNo());
			ps.setString(4, dto.getAddr());
			ps.setInt(5, dto.getGameMoney());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(rs != null) rs.close();  if(ps != null) ps.close();  if(con != null) con.close();
			} catch (SQLException e) { }
		}
		return check;
	}


	private int checkId(String id) {
		int records = 0;      
		String sql = "select count(*) from join where id=? ";
		try {
		    con = DriverManager.getConnection(url,user,pwd);
		    ps=con.prepareStatement(sql);
		    ps.setString(1, id);
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()) {
		    records = rs.getInt(1);
		    }
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		return records;
		}
	
	public int userCheck(String id,String pwd){
		String sql = "select * from join where id=?";
		int chk=-1;
		try {
			con = DriverManager.getConnection(url,user,this.pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){ 
					chk = 0; }
				else{ 
					chk = 1; }
				}

		} catch (SQLException e) {	e.printStackTrace(); }
		return chk;	
	}
	
	public ArrayList<joinDTO> ckFindId(String no) {
		System.out.println(no);
		String sql ="select id from join where phoneNo=? ";
		ArrayList<joinDTO> showId = new ArrayList<joinDTO>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, no);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				joinDTO dto = new joinDTO();
				dto.setId(rs.getString("id"));
				showId.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(showId);

		return showId;
		
	}
	
	public ArrayList<joinDTO> ckFindPwd(String id){
		String sql ="select pwd from join where id=? ";
		ArrayList<joinDTO> arrdto = new ArrayList<joinDTO>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				joinDTO dto = new joinDTO();
				dto.setPwd(rs.getString("pwd"));
				arrdto.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arrdto;

	}
	


}
