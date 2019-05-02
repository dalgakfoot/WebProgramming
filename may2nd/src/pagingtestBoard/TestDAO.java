package pagingtestBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TestDAO {

	private String url ="jdbc:oracle:thin:@192.168.19.128:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public TestDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<TestDTO> list() {
		//String sql = "select * from paging";
		String sql = "select * from paging order by num desc";
		ArrayList<TestDTO> listDto = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				TestDTO dto = new TestDTO();
				dto.setTitle(rs.getString("title"));
				dto.setNum(rs.getInt("num"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				listDto.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return listDto;
		
	}
	
	public void insert(TestDTO dto) {
		String sql = "insert into paging(num,title,pdate,count)"+" values(test_num.nextval,?,sysdate,0)";
		
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void count(String num) {
		String sql = "update paging set count=count+1 where num="+num;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalPage() {
		String sql = "select B.* from(select rownum rn, A.* from (select * from paging order by num desc)A)B where rn between 3 and 5";
		int totPage=0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {totPage = rs.getInt(1);}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return totPage;
	}
		
	
}
