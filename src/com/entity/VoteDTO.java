package com.entity;

public class VoteDTO {
	private int num;
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
	
	public VoteDTO(int num, String userid, String vcontent1, String vcontent2, String vcontent3, String vcontent4,
			String vcontent5, String vimage1, String vimage2, String vimage3, String vimage4, String vimage5) {
		super();
		this.num = num;
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
	}
	public VoteDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
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
