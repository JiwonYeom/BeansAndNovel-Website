package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Wishlist;

public interface JiWonService {
	///////북카트
	public List<BookCart> getBookList(int userNo);
	public boolean deleteCartEntry(int cartNo);
	public int getCartSumPrice(int userNo);
	public int getCartSumQt(int userNo);
	public boolean updateCart(BookCart bookCart);
	
	///////위시리스트
	public List<Book> getWishlist(int userNo,int pageNo);
	public List<Book> listOrderbyOld(int userNo,int pageNo);
	public boolean insertCartEntry(BookCart bookCart);
	public boolean deleteWishlist(int wishlistNo);
	
	
	////////북리스트
	public Map<String,Object> getBooksByCategory(int pageNo,int categoryNo,String name);
	public Map<String,Object> getBooksByPrice(int pageNo,int salesPriceStart,int salesPriceEnd);
	public Map<String,Object> getNewBooks(int pageNo);
	public Map<String,Object> getBooksSpcPrice(int pageNo);
	public Map<String,Object> getCollection(int pageNo);
	public Map<String,Object> getBooksByWriter(int pageNo,String writer);
	public Map<String,Object> getBooksByPublisher(int pageNo,String publisher);
	public Map<String, Object> getBooksByAward(int pageNo,int awardNo);
	
	
	////////주소
	public boolean upateAddress(Address address);
	
}
