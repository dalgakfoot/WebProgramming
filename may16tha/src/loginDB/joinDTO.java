package loginDB;

public class joinDTO {
	private String id;
	private String pwd;
	private String phoneNo;
	private String addr;
	private int gameMoney;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getGameMoney() {
		return gameMoney;
	}
	public void setGameMoney(int gameMoney) {
		this.gameMoney = gameMoney;
	}
}
