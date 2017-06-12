package com.entity;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String nickname;
	private String dates;
	private String gender;
	private String picture;
	private int state;
	
	public MemberDTO(){
		super();
	}

	public MemberDTO(String userid, String passwd, String nickname, String dates, String gender, String picture,
			int state) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.nickname = nickname;
		this.dates = dates;
		this.gender = gender;
		this.picture = picture;
		this.state = state;
	}
	
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	
	
	
}
