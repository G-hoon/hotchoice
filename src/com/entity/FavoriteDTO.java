package com.entity;

public class FavoriteDTO {

	private int num;
	private String nickname;
	
	public FavoriteDTO(int num, String nickname) {
		super();
		this.num = num;
		this.nickname = nickname;
	}
	public FavoriteDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	
	
}
