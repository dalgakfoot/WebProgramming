package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class totoDAO {
	private String url = "jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection	con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public totoDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<totoDTO> list(int lower , int upper){
//		String sql = "select * from toto_board";
//		String sql = "select * from toto_board order by idgroup desc, step asc";
		String sql = "select B.* from(select rownum rn,A.* from(select * from toto_board order by id desc)A)B where rn between "+ lower + " and " + upper;
		ArrayList<totoDTO> lists = new ArrayList<totoDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				totoDTO dto = new totoDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				dto.setUserid(rs.getString("userid"));
				lists.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	public ArrayList<totoDTO> gmList(){
		String sql = "select * from gm order by num desc";
		ArrayList<totoDTO> list = new ArrayList<totoDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				totoDTO dto = new totoDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("pdate"));
				dto.setHit(rs.getInt("hit"));
				list.add(dto);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public void write_save(String name, String title, String content) {
		String sql = "insert into toto_board(id,name,title,content,hit,idgroup,step,indent)" 
				     + "values(toto_board_seq.nextval,?,?,?,0,toto_board_seq.currval,0,0)";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void write_save_gm(String title, String content) {
		String sql = "insert into gm(num,name,title,content,pdate,hit)" 
			     + "values(gm_que.nextval,'Manager',?,?,sysdate,0)";		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public totoDTO contentView(String id, int chk) {
		
		if(chk == 0) {
			upHit(id);
		}		
		String sql="select * from toto_board where id=?";
		totoDTO dto = new totoDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public totoDTO contentView_gm(int chk, String id , String num) {	
		if(chk == 0) {
			upHit_gm(num);
		}		
		String sql = "select * from gm where num=?";
		
		totoDTO dto = new totoDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setHit(rs.getInt("hit"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("pdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;	
	}
	
	public void upHit(String id) {
		String sql = "update toto_board set hit=hit+1 where id=?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void upHit_gm(String num) {
		String sql = "update gm set hit=hit+1 where num=?";
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, num);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void reply(int num , String id, String content) {
		String sql = "insert into toto_reply(comment_num,comment_board,comment_id,comment_date,comment_parent,comment_content)" 
			     + "values(toto_reply_seq.nextval,?,?,sysdate,?,?)";
			
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.setString(2, id);
			ps.setInt(3, 1);
			ps.setString(4, content);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<totoDTO> showReply(int num){
		String sql = "select comment_id,comment_date,comment_content,comment_num from toto_reply where comment_board=?";
		ArrayList<totoDTO> list = new ArrayList<totoDTO>();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				totoDTO dto = new totoDTO();
				dto.setUserid(rs.getString("comment_id"));
				dto.setSavedate(rs.getTimestamp("comment_date"));
				dto.setContent(rs.getString("comment_content"));
				dto.setNum(rs.getInt("comment_num"));
				list.add(dto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public totoDTO modifyView(int num) {
		String sql = "select name,title,content from toto_board where id=?";
		totoDTO dto = new totoDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
				
		return dto;		
	}
	
	public totoDTO modifyView_gm(int num) {
		String sql = "select name,title,content from gm where num=?";
		totoDTO dto = new totoDTO();
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}				
		return dto;
	}
	
	
	
	public void modify(String name, String title, String content, int num) {
		String sql = "update toto_board set name=?,title=?,content=? where id=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setInt(4, num);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void modify_gm(String name, String title, String content, int num) {
		String sql ="update gm set name=?,title=?,content=? where num=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setInt(4, num);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int num) {
		String sql = "delete from toto_board where id=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("삭제완료");
	}
	
	public void delete_gm(int num) {
		String sql = "delete from gm where num=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, num);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("삭제완료");
	}
	
	
	
	//글의 전체 수 
		public int totalPage() {
			String sql = "select count(*) from toto_board";
			int totPage=0;
			try {
				con = DriverManager.getConnection(url,user,pwd);
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				if(rs.next()) {
					totPage = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return totPage;
		}
		
		public ArrayList<totoDTO> searchList(String a) {
			System.out.println(a);
			String sql = "select * from toto_board where title like '%"+a+"%' order by id desc";
			ArrayList<totoDTO> arrdto = new ArrayList<totoDTO>();
			try {
				con = DriverManager.getConnection(url,user,pwd);
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				
				while(rs.next()) {
					totoDTO dto = new totoDTO();
					dto.setId(rs.getInt("id"));
					dto.setName(rs.getString("name"));
					dto.setTitle(rs.getString("title"));
					dto.setContent(rs.getString("content"));
					dto.setSavedate(rs.getTimestamp("savedate"));
					dto.setHit(rs.getInt("hit"));
					dto.setIdgroup(rs.getInt("idgroup"));
					dto.setStep(rs.getInt("step"));
					dto.setIndent(rs.getInt("indent"));
					dto.setUserid(rs.getString("userid"));
					arrdto.add(dto);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return arrdto;		
		}
		
		public void reply_delete(int id, int num) {
			String sql = "delete from toto_reply where comment_board=? and comment_num=?";
			try {
				con = DriverManager.getConnection(url,user,pwd);
				ps = con.prepareStatement(sql);
				ps.setInt(1, id);
				ps.setInt(2, num);
				ps.execute();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("댓글삭제");
		}
}
