package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Wishlist;


public interface JiWonDAO {
	//bookCart DAO들
	//책 리스트 불러오기
	public List<BookCart> selectBookCart(int userNo);
	
	//카트 아이템 삭제하기
	public int deleteCart(int cartNo);
	
	
	//카트 아이템 합계
	public int selectCartSumJW(int userNo);
	//카트 아이템 총수량
	public int selectCartCountJW(int userNo);
	
	//마지막 주문하기 시 장바구니 업데이트
	public int updateCartJW(BookCart bookCart);
	
	//위시리스트에서 장바구니로 책 더하는 메서드
	public int insertCartJW(BookCart bookCart);
	
	///////////////////wishlist DAO들////////////////////
	//위시리스트 불러오기
	public List<Book> selectWishlist(Wishlist wishlist);
	
	//위시리스트 삭제하기
	public int deleteWishlistJW(int wishlistNo);
	
	//위시리스트 오래된 순으로 불러오기
	public List<Book> wishlistOldOrderJW(Wishlist wishlist);
	
	
	//bookList DAO들

	public List<Book> selectListJW(Book book);
	//전체 책 갯수
	public int selectTotalJW(Book book);
	//award전용 select
	public List<Book> selectAwardJW(Book book);
	//award전용 selectTotal
	public int selectAwardTotalJW(int no);
	//award이름 불러오기
	public String selectAwardNameJW(int no);
	
	
	//주소 DAO
	public int updateAddressJW(Address address);
}
