package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class Award {
	private int no;
	private Timestamp regdate;
	private String name;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Award() {
		// TODO Auto-generated constructor stub
	}
}
