package com.wiring.bnn.service;

import java.util.List;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public interface HaeInService {

	//로그인
	public User getLoginUser(User user);
	
	
	//회원가입
	public int createNewUser(User user);
	
	
	//해당유저의 주소 모두 보여주기
	public List<Address> showAllAddresses(int no);
	
	
	//해당 유저가 선택한 주소 보여주기
	public Address showOneAddress(int no);
	
	
//	//주소 선택시 선택하기
//	public int chooseAddress(Address address);
//		
//	//주소 선택시 전에 선택한 주소 선택 취소하기
//	public int dontWantThatAddress(Address address);
	
	
	//구매시 카트에 담았던 책정보 보여주기
	public List<BookCart> showBookListInCart(int no);
	
	
	//총 결제금액
	public int showBooksTotal(int no);
	
	
	//주문했을 때 주문번호 추가
	public void createOrder(String bookNo,String quantity,Order order, String cartNo);
	
	
	//주문번호 보여주기
	public Order showOrder(int no);
	
}

