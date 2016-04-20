package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.User;

public interface KstService {

	
	
	/*------------------------도서 service------------------------*/
	//도서 검색 단어
	public List<Book> bookResultList(String title);
	
	//도서 검색 페이지 (데이터를 받아 페이징처리할때 이곳에서 인자를 넣어준다)
	public Map<String, Object> bookResult(int pageNo,String title,int numPage,String orderBy);
	
	//추천도서
	public Book recommendationBook(Book book);
	
	//인기도서
	public Book popularBook(Book book);
	
	//마이페이지 위시리스트
	public List<Book> getWishListBook(int userNo);
	
	//테스트 디테일
	public Book getBookKst(int no);
	/*------------------------유저 service------------------------*/
	//로그인
	public User userlogin(User user);
	
	//닉네임 수정
	public int changeNinkname(User user);
	
	//아이디 수정
	public int changeId(User user);
	
	//비밀번호 수정
	public int changePassword(User user);


	/*-----------------배송지주소 service -----------------------*/
	
	//배송지 뿌리기
	public List<Address> getAddress(int userNo);
	
	//배송지 삭제
	public int removeAddress(int no);
	
	//배송지 수정
	public int changeAddress(Address address);
	
	//배송지 업데이트 뿌리기
	public Address updateAddress(int no);
	
	//기본배송지 설정
	public int changeDefaultShippingAddress(int no);
	
	//기본배송지 해제
	public int cangeCancleShippingAddress(int no);
	
	/*-----------------주문 service -----------------------*/
	//주문 뿌리기
	public Map<String, Object> getOrderList(int pageNo,int userNo);
	
	//주문번호 검색
	public Order getOrderNumber(int no,int userNo);
	
	/*-----------------장바구니 service -----------------------*/
	
	//장바구니 뿌리기
	public List<BookCart> getBookCartList(int userNo);
	
	//장바구니 도서 수량 변경
	public int changeQuantity(BookCart bookCart);
	
	
	
	
	//추가
	public Address selectAddress(int no);
	
}
