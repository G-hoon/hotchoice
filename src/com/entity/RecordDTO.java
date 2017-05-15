package com.entity;

public class RecordDTO {
	private int idx;
	private int num;
	private int vote_num;
	private String nickname;
	private String vote_date;
	public RecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecordDTO(int idx, int num, int vote_num, String nickname, String vote_date) {
		super();
		this.idx = idx;
		this.num = num;
		this.vote_num = vote_num;
		this.nickname = nickname;
		this.vote_date = vote_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getVote_num() {
		return vote_num;
	}
	public void setVote_num(int vote_num) {
		this.vote_num = vote_num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getVote_date() {
		return vote_date;
	}
	public void setVote_date(String vote_date) {
		this.vote_date = vote_date;
	}
	
	
}
