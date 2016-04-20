package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class Stock {
	private int no, addStock, bookNo;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getAddStock() {
		return addStock;
	}
	public void setAddStock(int addStock) {
		this.addStock = addStock;
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
	
	public Stock() {
		// TODO Auto-generated constructor stub
	}
}
