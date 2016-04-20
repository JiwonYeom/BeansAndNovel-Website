package com.wiring.bnn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Wishlist;

@Repository
public class JiWonDAOImpl implements JiWonDAO{
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<BookCart> selectBookCart(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("bookCart.selectBookCartJW",userNo);
	}
	
	@Override
	public int deleteCart(int cartNo) {
		// TODO Auto-generated method stub
		return session.delete("bookCart.deleteCartJW",cartNo);
	}
	
	@Override
	public int selectCartCountJW(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("bookCart.selectCartCountJW",userNo);
	}
	
	@Override
	public int selectCartSumJW(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("bookCart.selectCartSumJW",userNo);
	}
	
	@Override
	public int updateCartJW(BookCart bookCart) {
		// TODO Auto-generated method stub
		return session.update("bookCart.updateCartJW",bookCart);
	}

	//////////////위시리스트
	
	@Override
	public List<Book> selectWishlist(Wishlist wishlist) {
		// TODO Auto-generated method stub
		return session.selectList("wishlists.selectWishlistJW",wishlist);
	}
	
	@Override
	public int insertCartJW(BookCart bookCart) {
		// TODO Auto-generated method stub
		return session.insert("bookCart.insertCartJW",bookCart);
	}
	
	@Override
	public int deleteWishlistJW(int wishlistNo) {
		// TODO Auto-generated method stub
		return session.delete("wishlists.deleteWishlistJW", wishlistNo);
	}
	
	@Override
	public List<Book> wishlistOldOrderJW(Wishlist wishlist) {
		// TODO Auto-generated method stub
		return session.selectList("wishlists.wishlistOldOrderJW",wishlist);
	}
	
	////////////////bookList

	@Override
	public List<Book> selectListJW(Book book) {
		// TODO Auto-generated method stub
		return session.selectList("books.selectListJW",book);
	}
	

	@Override
	public int selectTotalJW(Book book) {
		// TODO Auto-generated method stub
		return session.selectOne("books.selectTotalJW",book);
	}
	
	@Override
	public List<Book> selectAwardJW(Book book) {
		// TODO Auto-generated method stub
		return session.selectList("books.selectAwardJW",book);
	}
	
	@Override
	public int selectAwardTotalJW(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("books.selectAwardTotalJW",no);
	}
	
	@Override
	public String selectAwardNameJW(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("awards.selectAwardNameJW",no);
	}
	
	
	@Override
	public int updateAddressJW(Address address) {
		// TODO Auto-generated method stub
		return session.update("addresses.updateAddressJW",address);
	}
}
