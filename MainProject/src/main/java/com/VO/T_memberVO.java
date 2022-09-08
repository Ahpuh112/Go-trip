package com.VO;

public class T_memberVO {

	private String id;
	private String nick;
	private int birth;
	private String mbti;
	private String joinDate;
	private String memType;

	public T_memberVO(String id, String nick, int birth, String mbti, String memType) {
		this.id = id;
		this.nick = nick;
		this.birth = birth;
		this.mbti = mbti;
		this.memType = memType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	
	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public int getBirth() {
		return birth;
	}

	public void setBirth(int birth) {
		this.birth = birth;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	
	
}

	
