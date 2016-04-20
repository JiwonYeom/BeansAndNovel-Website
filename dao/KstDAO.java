package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.User;

public interface KstDAO {

	
	/*-----------------book DAO ------------------------ */
	//도서 검색결과창
	public List<Book> selectList(String title);
	
	//도서 총 갯수
	public int selectTotalKst(String title);
	
	//도서 리스트
	public List<Book> selectBookList(Book book);
	
	//추천 도서
	public List<Book> selectListRec(Book book);
	
	//인기 도서
	public List<Book> selectListPopularBook(Book book);
	
	//마이페이지 위시리스트
	public List<Book> selectListWishBook(int userNo);

	//디테일 테스트
	public Book selectOneBook(int no);
	
	
	
	
	
	/*-----------------user DAO ------------------------ */
	//로그인
	public User selectOneKst(User user);
	
	//닉네임 수정
	public int updateNickname(User user);
	
	//아이디 수정
	public int updateId(User user);

	//비밀번호 수정
	public int updatePassword(User user);

	
	/*-----------------address DAO -----------------------*/
	
	//배송지
	public List<com.wiring.bnn.vo.Address> selectListAddress(int userNo); 
	
	//배송지삭제
	public int deleteAddress(int no);
	
	//배송지수정
	public int updateAddress(com.wiring.bnn.vo.Address address);
	
	//배송지 뿌리기
	public com.wiring.bnn.vo.Address selectOneAddress(int no);
	
	//기본배송지 설정
	public int updateShippingAddress(int no);
	
	//기본배송지 해제
	public int updateShippingAddressCancel(int no);
	
	
	/*-----------------order DAO -----------------------*/
	//총 주문갯수
	public int selectTotalOrder(int userNo);
	
	//주문 조회
	public List<Order> selectListOrder(Order order);
	
	//주문번호 검색
	public Order selectOneOrder(Order order);
	
	
	/*-----------------bookCart DAO -----------------------*/
	//장바구니 리스트
	public List<BookCart> selectListBookCart(int userNo);
	
	//장바구니 도서 수량 변경
	public int updateQuantity(BookCart bookCart);
}
