package com.wiring.bnn.vo;

import java.sql.Timestamp;

public class Comment {
	private int no,rating,userNo,bookNo;
	private String nickname,contents;
	private Timestamp regdate;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	
///////선영
	
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
	public Comment(int pageNo, int numPage) {
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
	}
	
	public Comment(int pageNo, int numPage, int bookNo, int userNo) {
		this.end = pageNo*numPage;
		this.start = end-numPage+1;
		this.bookNo = bookNo;
		this.userNo = userNo;
	}
	
	private int ratingSum, ratingCount;

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
	
	public int likes;
	
	public int getLikes() {
		return likes;
	}
	public void setLike(int likes) {
		this.likes = likes;
	}
	
	
	private int likeCount;
	
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	private String realDate;


	public String getRealDate() {
		return realDate;
	}
	public void setRealDate(String realDate) {
		this.realDate = realDate;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	
	
}
