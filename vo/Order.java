package com.wiring.bnn.vo;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Order {
	private int no,invoiceNo,userNo;
	private String zipcode, address, status,totalPrice;
	private Timestamp regdate;
	
	
//신태
	private int start,end;
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

	public void setRealRegdate(String realRegdate) {
		this.realRegdate = realRegdate;
	}
	public void setRealStatus(String realStatus) {
		this.realStatus = realStatus;
	}

	private String realRegdate;
	private String realStatus;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(int invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public Order() {
		// TODO Auto-generated constructor stub
	}
	
	//신태
public String getRealStatus() {
		
		if(status.equals("D")){
			realStatus = "배송중";
			
			return realStatus;
		}else if(status.equals("P")){
			realStatus = "배송준비중";
			
			
			return realStatus;
		}else if(status.equals("F")){
			realStatus = "배송완료";
			
			return realStatus;
		}else if(status.equals("R")){
			realStatus = "반품신청";
			
			return realStatus;
		}else
			
			realStatus="주문취소";			
			return realStatus;
	}

public String getRealRegdate() {
	SimpleDateFormat date = new SimpleDateFormat("YYYY년"+" "+"MM월"+" "+"d일");
	
	
	return date.format(regdate);
}
public Order(int pageNo, int numPage){
	this.end = pageNo*numPage;
	this.start = end - numPage+1;	
} 

//주영
public String getNowStatus() {
	
	switch(status) {
	
	case "P":return "배송준비중";
	case "D":return "배송중";
	case "F":return "배송완료";
	case "R":return "반품신청";
	case "C":return "주문취소";
	default : return null;	
	
	} // switch() end
	
} // getNowStatus() end 

}
