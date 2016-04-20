package com.wiring.bnn.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Book {
	
 private int no,originalPrice,salesPrice,salesVolume,ratingSum,ratingCount,categoryNo,wishlistNo,wishUserNo;
 private String title,bookCover,writer,publisher,introduction,tableOfContents,type1,type2,stock;
 private Date publicationDate;
 private Timestamp regdate,wishRegdate;
 
 //날짜 형식 바꾸기용
 private SimpleDateFormat sdf;
 private String showDate;
 
 //페이징용
 private int start,end;
 
 //가격 받아오기용
 private int salesPriceStart,salesPriceEnd;
 
 //동적쿼리용
 private String difference,orderBy;
 private int awardNo;
 
 //레이팅 추가
 private double realRating;
 
 //정배

private String categoryName;

//순위정렬용 으로 추가
private int r;
 
 //신태
 private String searchWord;
 
 //선영
 
 //카테고리 이름 얻어오기
 private String name;
 
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
  
 //평점구하기
private double rating;

public double getRating(){
	   double rating=0.0;
	   
	   if(ratingCount!=0){
	      rating=(double)ratingSum/ratingCount;
	      System.out.println("========================");
	      System.out.println("bookno:"+no);
	      System.out.println("book rating:"+rating);
	      rating = Math.round(rating*100)/(double)100;
	      System.out.println("book rating:"+rating);
	      System.out.println("========================");
	   }
	   return rating;
	}

public void setRating(double rating) {
	this.rating = rating;
}

 
public int getAwardNo() {
	return awardNo;
}
public void setAwardNo(int awardNo) {
	this.awardNo = awardNo;
}
public String getDifference() {
	return difference;
}
public void setDifference(String difference) {
	this.difference = difference;
}

public String getOrderBy() {
	return orderBy;
}
public void setOrderBy(String orderBy) {
	if(orderBy=="recent"){
		orderBy="publication_date DESC";
	}else if(orderBy=="popularity"){
		orderBy="sales_volume ASC";
	}
	this.orderBy = orderBy;
}
public Book() {
		// TODO Auto-generated constructor stub
	}
 public Book(int pageNo, int numPage,int categoryNo,String orderBy) {
		super();
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
		this.categoryNo=categoryNo;
		this.orderBy=orderBy;
 }

 public Book(int pageNo, int numPage,int salesPriceStart,int salesPriceEnd,String orderBy) {
		super();
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
		this.salesPriceStart=salesPriceStart;
		this.salesPriceEnd=salesPriceEnd;
		this.orderBy=orderBy;
}
 
 public Book(int pageNo, int numPage,String orderBy) {
		super();
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
		this.orderBy=orderBy;
}

public int getSalesPriceStart() {
	return salesPriceStart;
}
public void setSalesPriceStart(int salesPriceStart) {
	this.salesPriceStart = salesPriceStart;
}
public int getSalesPriceEnd() {
	return salesPriceEnd;
}
public void setSalesPriceEnd(int salesPriceEnd) {
	this.salesPriceEnd = salesPriceEnd;
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

public void setWishlistNo(int wishlistNo) {
	this.wishlistNo = wishlistNo;
}

public void setWishUserNo(int wishUserNo) {
	this.wishUserNo = wishUserNo;
}
public int getNo() {
	return no;
}
public void setNo(int no) {
	this.no = no;
}
public int getOriginalPrice() {
	return originalPrice;
}
public void setOriginalPrice(int originalPrice) {
	this.originalPrice = originalPrice;
}
public int getSalesPrice() {
	return salesPrice;
}
public void setSalesPrice(int salesPrice) {
	this.salesPrice = salesPrice;
}
public int getSalesVolume() {
	return salesVolume;
}
public void setSalesVolume(int salesVolume) {
	this.salesVolume = salesVolume;
}
public int getRatingSum() {
	return ratingSum;
}
public void setRatingSum(int ratingSum) {
	this.ratingSum = ratingSum;
}
public int getRatingCount() {
	return ratingCount;
}
public void setRatingCount(int ratingCount) {
	this.ratingCount = ratingCount;
}
public int getCategoryNo() {
	return categoryNo;
}
public void setCategoryNo(int categoryNo) {
	this.categoryNo = categoryNo;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getBookCover() {
	return bookCover;
}
public void setBookCover(String bookCover) {
	this.bookCover = bookCover;
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
public String getIntroduction() {
	return introduction;
}
public void setIntroduction(String introduction) {
	this.introduction = introduction;
}
public String getTableOfContents() {
	return tableOfContents;
}
public void setTableOfContents(String tableOfContents) {
	this.tableOfContents = tableOfContents;
}
public String getType1() {
	return type1;
}
public void setType1(String type1) {
	this.type1 = type1;
}
public String getType2() {
	return type2;
}
public void setType2(String type2) {
	this.type2 = type2;
}
public String getStock() {
	return stock;
}
public void setStock(String stock) {
	this.stock = stock;
}
public Date getPublicationDate() {
	return publicationDate;
}
public void setPublicationDate(Date publicationDate) {
	this.publicationDate = publicationDate;
}
public Timestamp getRegdate() {
	return regdate;
}
public void setRegdate(Timestamp regdate) {
	
	
	this.regdate = regdate;

}
 


 
public int getWishlistNo() {
	return wishlistNo;
}

public Timestamp getWishRegdate() {
	return wishRegdate;
}
public void setWishRegdate(Timestamp wishRegdate) {
	this.wishRegdate = wishRegdate;
	sdf = new SimpleDateFormat("YYYY년 M월 d일");
	showDate = sdf.format(wishRegdate);
}

public String getShowDate() {
	return showDate;
}

public int getWishUserNo() {
	return wishUserNo;
}



//신태

public double getRealRating() {
	
	double realRating=0.0;
	
	 if(ratingCount!=0) {
	 realRating=ratingSum/ratingCount;
	 }
	 return realRating;
	 }
public void setRealRating(double realRating) {
	this.realRating = realRating;
}
public String getSearchWord() {
	return searchWord;
}
public void setSearchWord(String searchWord) {
	this.searchWord = searchWord;
}



public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public int getR() {
	return r;
}
public void setR(int r) {
	this.r = r;
}
public Book(int pageNo, int numPage){
	this.end = pageNo*numPage;
	this.start = end - numPage+1;	
}

}
