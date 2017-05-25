package com.entity;

public class ListDTO {
	private int num;
	private String author;
	private String title;
	private String content;
	private String writeday;
	private int readcnt;
	private String userid;
	private String vcontent1;
	private String vcontent2;	
	private String vcontent3;
	private String vcontent4;
	private String vcontent5;
	private String vimage1;
	private String vimage2;
	private String vimage3;
	private String vimage4;
	private String vimage5;
	private Integer votecount1;
	private Integer votecount2;
	private Integer votecount3;
	private Integer votecount4;
	private Integer votecount5;
	private Integer vote_num;

	
	
	
	@Override
	public String toString() {
		return "ListDTO [num=" + num + ", author=" + author + ", title=" + title + ", content=" + content
				+ ", writeday=" + writeday + ", readcnt=" + readcnt + ", userid=" + userid + ", vcontent1=" + vcontent1
				+ ", vcontent2=" + vcontent2 + ", vcontent3=" + vcontent3 + ", vcontent4=" + vcontent4 + ", vcontent5="
				+ vcontent5 + ", vimage1=" + vimage1 + ", vimage2=" + vimage2 + ", vimage3=" + vimage3 + ", vimage4="
				+ vimage4 + ", vimage5=" + vimage5 + ", votecount1=" + votecount1 + ", votecount2=" + votecount2
				+ ", votecount3=" + votecount3 + ", votecount4=" + votecount4 + ", votecount5=" + votecount5
				+ ", vote_num=" + vote_num + "]";
	}


	public ListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public ListDTO(int num, String author, String title, String content, String writeday, int readcnt, String userid,
			String vcontent1, String vcontent2, String vcontent3, String vcontent4, String vcontent5, String vimage1,
			String vimage2, String vimage3, String vimage4, String vimage5, Integer votecount1, Integer votecount2,
			Integer votecount3, Integer votecount4, Integer votecount5, Integer vote_num) {
		super();
		this.num = num;
		this.author = author;
		this.title = title;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.userid = userid;
		this.vcontent1 = vcontent1;
		this.vcontent2 = vcontent2;
		this.vcontent3 = vcontent3;
		this.vcontent4 = vcontent4;
		this.vcontent5 = vcontent5;
		this.vimage1 = vimage1;
		this.vimage2 = vimage2;
		this.vimage3 = vimage3;
		this.vimage4 = vimage4;
		this.vimage5 = vimage5;
		this.votecount1 = votecount1;
		this.votecount2 = votecount2;
		this.votecount3 = votecount3;
		this.votecount4 = votecount4;
		this.votecount5 = votecount5;
		this.vote_num = vote_num;
	}


	public Integer getVote_num() {
		return vote_num;
	}


	public void setVote_num(Integer vote_num) {
		this.vote_num = vote_num;
	}

	

	public Integer getVotecount1() {
		return votecount1;
	}


	public void setVotecount1(Integer votecount1) {
		this.votecount1 = votecount1;
	}


	public Integer getVotecount2() {
		return votecount2;
	}


	public void setVotecount2(Integer votecount2) {
		this.votecount2 = votecount2;
	}


	public Integer getVotecount3() {
		return votecount3;
	}


	public void setVotecount3(Integer votecount3) {
		this.votecount3 = votecount3;
	}


	public Integer getVotecount4() {
		return votecount4;
	}


	public void setVotecount4(Integer votecount4) {
		this.votecount4 = votecount4;
	}


	public Integer getVotecount5() {
		return votecount5;
	}


	public void setVotecount5(Integer votecount5) {
		this.votecount5 = votecount5;
	}


	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getVcontent1() {
		return vcontent1;
	}
	public void setVcontent1(String vcontent1) {
		this.vcontent1 = vcontent1;
	}
	public String getVcontent2() {
		return vcontent2;
	}
	public void setVcontent2(String vcontent2) {
		this.vcontent2 = vcontent2;
	}
	public String getVcontent3() {
		return vcontent3;
	}
	public void setVcontent3(String vcontent3) {
		this.vcontent3 = vcontent3;
	}
	public String getVcontent4() {
		return vcontent4;
	}
	public void setVcontent4(String vcontent4) {
		this.vcontent4 = vcontent4;
	}
	public String getVcontent5() {
		return vcontent5;
	}
	public void setVcontent5(String vcontent5) {
		this.vcontent5 = vcontent5;
	}
	public String getVimage1() {
		return vimage1;
	}
	public void setVimage1(String vimage1) {
		this.vimage1 = vimage1;
	}
	public String getVimage2() {
		return vimage2;
	}
	public void setVimage2(String vimage2) {
		this.vimage2 = vimage2;
	}
	public String getVimage3() {
		return vimage3;
	}
	public void setVimage3(String vimage3) {
		this.vimage3 = vimage3;
	}
	public String getVimage4() {
		return vimage4;
	}
	public void setVimage4(String vimage4) {
		this.vimage4 = vimage4;
	}
	public String getVimage5() {
		return vimage5;
	}
	public void setVimage5(String vimage5) {
		this.vimage5 = vimage5;
	}
	
	
}
