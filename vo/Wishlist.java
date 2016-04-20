package com.wiring.bnn.vo;

import java.sql.Timestamp;


public class Wishlist {
	private int no,userNo,bookNo;
	private Timestamp regdate;

	//페이징용
	private int start,end;
	
	 public Wishlist(int pageNo, int numPage,int userNo) {
			super();
			this.end = pageNo*numPage;
			this.start = end-numPage+1;
			this.userNo = userNo;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
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
	

	public Wishlist() {
		// TODO Auto-generated constructor stub
	}
}
