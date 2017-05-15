package com.entity;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String nickname;
	private String dates;
	private String gender;
	public MemberDTO(){
		super();
	}
	public MemberDTO(String userid, String passwd, String nickname, String dates, String gender) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.nickname = nickname;
		this.dates = dates;
		this.gender = gender;
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
