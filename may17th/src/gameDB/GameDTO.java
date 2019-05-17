package gameDB;

import java.sql.Date;

public class GameDTO {

	private int id;
	private Date game_date;
	private String game_time;
	private String teamA;
	private String teamB;
	private String win;
	
	private float teama_winratio;
	private float teamb_winratio;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getGame_date() {
		return game_date;
	}
	public void setGame_date(Date game_date) {
		this.game_date = game_date;
	}
	public String getTeamA() {
		return teamA;
	}
	public void setTeamA(String teamA) {
		this.teamA = teamA;
	}
	public String getTeamB() {
		return teamB;
	}
	public void setTeamB(String teamB) {
		this.teamB = teamB;
	}
	public String getWin() {
		return win;
	}
	public void setWin(String win) {
		this.win = win;
	}
	public String getGame_time() {
		return game_time;
	}
	public void setGame_time(String game_time) {
		this.game_time = game_time;
	}
	public float getTeama_winratio() {
		return teama_winratio;
	}
	public void setTeama_winratio(float teama_winratio) {
		this.teama_winratio = teama_winratio;
	}
	public float getTeamb_winratio() {
		return teamb_winratio;
	}
	public void setTeamb_winratio(float teamb_winratio) {
		this.teamb_winratio = teamb_winratio;
	}
	
	
	
	
}
