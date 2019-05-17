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
		String sql = "select * from inform";
		ArrayList<joinDTO> arrDto = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				joinDTO dto = new joinDTO();
				dto.setId(rs.getString("userid"));
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
		String sql = "insert into inform (userid,pwd,phoneNo,addr,gameMoney)"
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
		String sql = "select count(*) from inform where userid=? ";
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
		String sql = "select * from inform where userid=?";
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

		} catch (SQLException e) {	e.printStackTrace(); }finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		return chk;	
	}

	public ArrayList<joinDTO> ckFindId(String no) {
		System.out.println(no);
		String sql ="select userid from inform where phoneNo=? ";
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
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		System.out.println(showId);

		return showId;

	}

	public ArrayList<joinDTO> ckFindPwd(String id){
		String sql ="select pwd from inform where userid=? ";
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
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		return arrdto;

	}

	public joinDTO viewInfo(String id) {
		System.out.println(id);
		String sql ="select * from inform where userid=? ";
		joinDTO dto = new joinDTO();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);

			rs = ps.executeQuery();

			if(rs.next()) {
				dto.setId(rs.getString("userid"));
				dto.setPhoneNo(rs.getString("phoneNo"));
				dto.setAddr(rs.getString("addr"));
				dto.setGameMoney(rs.getInt("gameMoney"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		return dto;
	}
	
	public void infoUpdate(joinDTO dto,String id) {
		
		String sql = "update inform set phoneNo=?,addr=? where userid=?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPhoneNo());
			ps.setString(2, dto.getAddr());
			ps.setString(3, id);
			ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		
	}
	
	public void delete(String id) {
		
		String sql = "delete from inform where userid =?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}

	}
	
	public void updateMoney(String userid,int gameMoney) {
		System.out.println(userid);
		System.out.println(gameMoney);
		String sql = "update inform set gameMoney=gameMoney+"+gameMoney+" where userid=?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, userid);
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		
	}
	
	
	public ArrayList<joinDTO> rank() {
		ArrayList<joinDTO> arr = new ArrayList<>();
		String sql = "select * from inform order by gameMoney desc";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				joinDTO dto = new joinDTO();
				dto.setId(rs.getString("userid"));
				dto.setGameMoney(rs.getInt("gamemoney"));
				arr.add(dto);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (ps != null) try { ps.close(); } catch(SQLException ex) {}
			if (con != null) try { con.close(); } catch(SQLException ex) {}
		}
		
		return arr;
		
	}
	
	
}
