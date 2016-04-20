package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class BookCart {
	private int no,quantity,salesPrice,bookNo,userNo,totalPrice,totalCount;
	private String bookCover,title,publisher,writer;
	private Timestamp regdate;
	
	//해인
	private int eachTotal;

	
	public int getTotalPrice() {
		return totalPrice;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getSalesPrice() {
		return salesPrice;
	}
	public void setSalesPrice(int salesPrice) {
		this.salesPrice = salesPrice;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getBookCover() {
		return bookCover;
	}
	public void setBookCover(String bookCover) {
		this.bookCover = bookCover;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	} 
	
	public BookCart() {
		// TODO Auto-generated constructor stub
	}
	
	
	//해인
	public int getEachTotal() {
		return eachTotal;
	}
	public void setEachTotal(int eachTotal) {
		this.eachTotal = eachTotal;
	}
}
