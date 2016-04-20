package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class OrderDetail {
	private int no,quantity,totalPrice,bookNo,orderNo;
	private String bookCover,title,writer,publisher;
	private Timestamp regdate;
	
	
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}
	
	//해인 입력용 생성자
		public OrderDetail(int quantity, int totalPrice, int bookNo, int orderNo, String bookCover, String title,
				String writer, String publisher) {
			super();
			this.quantity = quantity;
			this.totalPrice = totalPrice;
			this.bookNo = bookNo;
			this.orderNo = orderNo;
			this.bookCover = bookCover;
			this.title = title;
			this.writer = writer;
			this.publisher = publisher;
		}
}
