package com.wiring.bnn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.User;

public class KstDAOImpl implements KstDAO {


	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	

	/* ---------------book DAOImpl --------------- */
	
	//도서 검색 단어
	@Override
	public List<Book> selectList(String title){
	
		return session.selectList("books.selectListKst",title);
	}
	
	//도서 총 게시물 수
	@Override
	public int selectTotalKst(String title){
		
		return session.selectOne("books.selectBookTotalKst",title);
	}
	
	//도서 검색 결과페이지
	@Override
	public List<Book> selectBookList(Book book){
		
		return session.selectList("books.selectBookListKst",book);
	}
	
	//추천 도서
	public List<Book> selectListRec(Book book){
		return session.selectList("books.selectListRecommendation",book);
	}
	
	//인기 도서
	@Override
	public List<Book> selectListPopularBook(Book book) {
		// TODO Auto-generated method stub
		return session.selectList("books.selectListPopularBook",book);
	}
	
	//마이페이지 위시리스트
	@Override
	public List<Book> selectListWishBook(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("books.selectListWishBook",userNo);
	}
	
	//테스트 디테일
	@Override
	public Book selectOneBook(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("books.selectOneBook",no);
	}
	
	
	/* ---------------user DAOImpl --------------- */
	
	//로그인
	@Override
	public User selectOneKst(User user){
		return session.selectOne("users.selectOneKst",user);
	}
	
	//아이디 수정
	@Override
	public int updateNickname(User user){
		return session.update("users.updateNicknameKst",user);
	}
	
	//비밀번호 수정
	@Override
	public int updateId(User user){
		return session.update("users.updateIdKst",user);
	}
	
	//비밀번호 수정
	@Override
	public int updatePassword(User user){
		return session.update("users.updatePasswordKst",user);
	}

	
	/*--------------------배송지 DAOImpl-------------------- */
	//배송지 뿌리기
	@Override
	public List<Address> selectListAddress(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("addresses.selectListAddress",userNo);
	}
	//배송지 삭제
	@Override
	public int deleteAddress(int no) {
		// TODO Auto-generated method stub
		return session.delete("addresses.deleteAddress",no);
	}
	//배송지 수정
	@Override
	public int updateAddress(Address address) {
		// TODO Auto-generated method stub
		return session.update("addresses.updateAddress",address);
	}
	
	//배송지 업데이트 뿌리기
	@Override
	public Address selectOneAddress(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("addresses.selectOneAddress",no);
	}
	
	//기본배송지 설정
	@Override
	public int updateShippingAddress(int no) {
		// TODO Auto-generated method stub
		return session.update("addresses.updateShippingAddress",no);
	}
	
	//기본배송지 해제
	@Override
		public int updateShippingAddressCancel(int no) {
			// TODO Auto-generated method stub
			return session.update("addresses.updateShippingAddressCancel",no);
	}
	
	/*--------------------주문 DAOImpl-------------------- */
	//주문 총 갯수
	@Override
	public int selectTotalOrder(int userNo) {
		// TODO Auto-generated method stub
		return session.selectOne("orders.selectTotalOrder",userNo);
	}
	
	//주문 뿌리기
	@Override
	public List<Order> selectListOrder(Order order) {
		// TODO Auto-generated method stub
		return session.selectList("orders.selectListOrder",order);
	}
	
	//주문번호 검색
	@Override
	public Order selectOneOrder(Order order) {
		// TODO Auto-generated method stub
		return session.selectOne("orders.selectOneOrder",order);
	}
	
	/*--------------------장바구니 DAOImpl-------------------- */
	
	//장바구니 리스트
	@Override
	public List<BookCart> selectListBookCart(int userNo) {
		// TODO Auto-generated method stub
		return session.selectList("bookCart.selectListBookCart",userNo);
	}
	
	//장바구니 도서 수량 변경
	@Override
	public int updateQuantity(BookCart bookCart) {
		// TODO Auto-generated method stub
		return session.update("bookCart.updateQuantity",bookCart);
	}
}
