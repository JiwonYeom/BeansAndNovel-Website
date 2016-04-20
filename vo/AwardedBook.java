package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class AwardedBook {
	private int no,awardNo,bookNo;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAwardNo() {
		return awardNo;
	}
	public void setAwardNo(int awardNo) {
		this.awardNo = awardNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	public AwardedBook() {
		// TODO Auto-generated constructor stub
	}
}
