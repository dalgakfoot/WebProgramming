package bettingDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class bettingDAO {
	private String url ="jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;




	public bettingDAO() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public int sumB(int id) {

		String sql = "select count(teamb) from GAME_INFO,BETTING where GAME_INFO.TEAMB = BETTING.TEAM and game_info.id=?";
		int sumb = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if(rs.next()) {
				sumb = rs.getInt(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return sumb;
	}
	public int sumA(int id) {

		String sql = "select count(teama) from GAME_INFO,BETTING where GAME_INFO.TEAMA = BETTING.TEAM and game_info.id=?";
		int suma = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if(rs.next()) {
				suma = rs.getInt(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return suma;
	}

	public void bettingUp(bettingDTO b) {

		String sql = "insert into betting(id,team,money,userid)"+"values(?,?,?,?)";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, b.getId());
			ps.setString(2, b.getTeam());
			ps.setInt(3, b.getMoney());
			ps.setString(4, b.getUserid());

			ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}



	public ArrayList<bettingDTO> winner(int id, String win) {

		ArrayList<bettingDTO> arr = new ArrayList<>();
		String sql = "select userid from betting where id=? and team=?";

		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, win);

			rs = ps.executeQuery();

			while(rs.next()) {
				bettingDTO dto = new bettingDTO();
				dto.setUserid(rs.getString("userid"));

				arr.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return arr;


	}

	public int sum(int id) {

		String sql = "select sum(money) from betting where id = ?";
		int sum = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();

			if(rs.next()) {
				sum = rs.getInt("sum(money)");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
		}finally {
		
		try {
			rs.close();
			ps.close();
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
		}
		return sum;


	}


	public void give(int id,int size,int sum,String userid) {
		
		
		
		int giveMoney = sum/size;
		String sql = "update join set gamemoney=gamemoney+"+giveMoney+" where id='"+userid+"'";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
		//	ps.setString(1, userid);
			ps.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		
		}finally {
			try {
				
				ps.close();
				con.close();
				
			}catch (Exception e) {
				e.printStackTrace();
				// TODO: handle exception
			}
		}
	}


}
