package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public interface HaeInDAO {
	
	//로그인
	public User selectLoginUser(User user);
	
	
	//회원가입
	public int insertUser(User user);
	
	
	//해당유저의 주소 모두 보여주기
	public List<Address> selectAllAddresses(int no);
	
	
	//해당 유저가 선택한 주소 보여주기
	public Address selectOneAddress(int no);
	
	
	//주소 선택시 선택하기
	//public int updateAddressToChoose(Address address);
	
	//주소 선택시 전에 선택한 주소 선택 취소하기
	//public int updateAddressType(Address address);
	
	
	//구매시 카트에 담았던 책정보 보여주기
	public List<BookCart> selectBookListInCart(int no);
	
	
	//총 결제금액
	public int selectBooksTotal(int no);
	
	
	//주문했을 때 주문번호 추가
	public int insertOrder(Order order);
	
	//주문상세정보 추가
	public int insertOrderDetail(OrderDetail orderDetail);
	
	
	//책정보 보여주기
	public Book selectBookToBuy(int no);
	
	
	//재고 업데이트 하기
	public int updateStocks(OrderDetail detail);
	
	
	//장바구니 비우기
	public int deleteBooksInCart(int no);
	
	
	//주문번호 보여주기
	public Order selectOneOrder(int no);
	
	

}
