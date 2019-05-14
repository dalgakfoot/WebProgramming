package gameDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GameDAO {

	private String url ="jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	private static int count;

	
	
	public GameDAO() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		}catch(Exception e) {
			e.printStackTrace();
		}
	}


	public ArrayList<GameDTO> select() {
		ArrayList<GameDTO> arr = new ArrayList();
		String sql = "select * from game_info";


		
		
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				
				GameDTO g = new GameDTO();
				g.setId(rs.getInt("id"));
				g.setGame_date(rs.getDate("game_date"));
				g.setTeamA(rs.getString("teamA"));
				g.setTeamB(rs.getString("teamB"));
				g.setTeama_winratio(rs.getFloat("teama_winratio"));
				g.setTeamb_winratio(rs.getFloat("teamb_winratio"));
				g.setWin(rs.getString("win"));
				arr.add(g);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for(int i=0;i<arr.size();i++) {
			arr.get(i).setGame_time(time(arr.get(i)));
		}
		
		
		
		return arr;

	}

	public String time(GameDTO g) {
		String time = null;
		String sql = "select To_char(game_date,'hh24:mi') from game_info where id = ?";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, g.getId());
			rs = ps.executeQuery();
			
			while(rs.next()) {
				time = rs.getString("to_char(game_date,'hh24:mi')");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return time;
	}


	public ArrayList<GameDTO> win() {
		ArrayList<GameDTO> arr = new ArrayList<>();
		String sql = "select ID, TEAMA, TEAMB, TEAMA_WINRATIO, TEAMB_WINRATIO from game_info";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while(rs.next()) {
				
				GameDTO g = new GameDTO();
				g.setId(rs.getInt("id"));
				g.setTeamA(rs.getString("teama"));
				g.setTeamB(rs.getString("teamb"));
				g.setTeama_winratio(rs.getFloat("teama_winratio"));
				g.setTeamb_winratio(rs.getFloat("teamb_winratio"));
				arr.add(g);

			}
			
			
			for(int i=0;i<arr.size();i++) {
				arr.get(i).setGame_time(time(arr.get(i)));
			}
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arr;

	}
	
	
	public int poo(String time) {
		
		String test1 = time.split(":")[0];
		String test2 = time.split(":")[1];
		String test3 = test1 + test2;
		
		int poo = Integer.parseInt(test3);
		
		return poo;
		
		
	}
	
	public void winUpdate(String win, int id) {
		
		String test=foo(id);
			
		if(test.equals("경기 시작 전 입니다.")) {
		
		String sql = "update game_info set win =? where id=?";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, win);
			ps.setInt(2, id);
			ps.executeUpdate();
				
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		}
	}
	
	public String foo(int id) {
		String test=null;
		String sql = "select win from game_info where id=?";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				test = rs.getString("win");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return test;
		
	}
	
	public ArrayList<GameDTO> goo() {
		
		ArrayList<GameDTO> arr = new ArrayList<>();
		String sql = "select * from game_info where not win='경기 시작 전 입니다.' order by id desc";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				GameDTO dto = new GameDTO();
				dto.setId(rs.getInt("id"));
				dto.setGame_date(rs.getDate("game_date"));
				dto.setTeamA(rs.getString("teama"));
				dto.setTeamB(rs.getString("teamb"));
				dto.setWin(rs.getString("win"));
				arr.add(dto);
			}
			
			for(int i=0;i<arr.size();i++) {
				arr.get(i).setGame_time(time(arr.get(i)));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return arr;
		
	}
	
	public GameDTO too(int id) {
		String sql = "select * from game_info where id=?";
		
		GameDTO g = new GameDTO();
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				
				
				g.setId(rs.getInt("id"));
				g.setGame_date(rs.getDate("game_date"));
				g.setTeamA(rs.getString("teamA"));
				g.setTeamB(rs.getString("teamB"));
				g.setTeama_winratio(rs.getFloat("teama_winratio"));
				g.setTeamb_winratio(rs.getFloat("teamb_winratio"));
				g.setWin(rs.getString("win"));


			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		
		return g;

	}
	


}
