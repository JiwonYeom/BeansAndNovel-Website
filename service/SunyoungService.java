package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;

import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Comment;
import com.wiring.bnn.vo.Like;
import com.wiring.bnn.vo.Report;
import com.wiring.bnn.vo.Wishlist;

public interface SunyoungService {
	
	public Book getBook(int no);
	
	public List<Comment> getCommentList(int pageNo, int bookNo, int userNo);
	
	public int getCommentNum(int no);
	
	public void registerComment(Comment comment,Book book);
	
	public boolean removeComment(Comment comment);
	
	public boolean registerReport(Report report);
	
	public Comment getCommentTop(int no);
	
	public boolean executeLike(int commentNo,int userNo);
	
	public int checkLike(int commentNo,int userNo);
	
	public boolean registerBookCart(BookCart bookCart);
	
	public boolean registerWishlist(Wishlist wishlist);
}
