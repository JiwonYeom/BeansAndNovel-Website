package com.wiring.bnn.service;

import java.util.ArrayList;
import java.util.List;

import com.wiring.bnn.dao.HaeInDAO;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public class HaeInServiceImpl implements HaeInService {
	
	private HaeInDAO dao;
	public void setDao(HaeInDAO dao) {
		this.dao = dao;
	}
	
	//로그인
	@Override
	public User getLoginUser(User user) {
		return dao.selectLoginUser(user);
	}
	
	//회원가입
	@Override
	public int createNewUser(User user) {
		return dao.insertUser(user);
	}
	
	//해당유저의 주소 모두 보여주기
	@Override
	public List<Address> showAllAddresses(int no) {
		return dao.selectAllAddresses(no);
	}
	
	//해당 유저가 선택한 주소 보여주기
	@Override
	public Address showOneAddress(int no) {
		return dao.selectOneAddress(no);
	}
	
//	//주소 선택시 선택하기
//	@Override
//	public int chooseAddress(Address address) {
//		return dao.updateAddressToChoose(address);
//	}
//	
//	//주소 선택시 전에 선택한 주소 선택 취소하기
//	@Override
//	public int dontWantThatAddress(Address address) {
//		return dao.updateAddressType(address);
//	}
	
	//구매시 카트에 담았던 책정보 보여주기
	@Override
	public List<BookCart> showBookListInCart(int no) {
		return dao.selectBookListInCart(no);
	}
	
	//총 결제금액
	@Override
	public int showBooksTotal(int no) {
		return dao.selectBooksTotal(no);
	}

	//주문했을 때 주문번호 추가, 장바구니 비우기, 재고테이블 업데이트
	@Override
	public void createOrder(String bookNo,String quantity,Order order, String cartNo) {
		
		
		dao.insertOrder(order);
		
		//System.out.println("인서트될 주문번호: "+order.getNo());
		System.out.println("책번호들:"+bookNo);
		
		
		String[] nos = bookNo.split(",");
		String[] quantities = quantity.split(",");
		String[] cartNos = cartNo.split(",");
		
		List<OrderDetail> details = new ArrayList<>();
		
		for(int i = 0; i < nos.length ; i++) {
			
			int no = Integer.parseInt(nos[i]);
			int q = Integer.parseInt(quantities[i]);
			int cn = Integer.parseInt(cartNos[i]);
			
			System.out.println("카트넘버 : "+cn);

			//bookDAO.getBook(no);
			Book book = dao.selectBookToBuy(no);
			
				int totalPrice = book.getSalesPrice()*q;
				String bookCover = book.getBookCover();
				String title = book.getTitle();
				String writer = book.getWriter();
				String publisher = book.getPublisher();
			
			
			OrderDetail orderDetail  = new OrderDetail(q, totalPrice, no, order.getNo(), bookCover, title, writer, publisher);
			
			
			int result = dao.insertOrderDetail(orderDetail);
			System.out.println(no+"번 입력결과: "+result);
			
			
			//book테이블에 stock칼럼을 update
			int update = dao.updateStocks(orderDetail);
			System.out.println("책 수량 업데이트 : "+update);
			
			//장바구니에서 삭제
			//장바구니 번호 필요
			int delete = dao.deleteBooksInCart(cn);
			System.out.println("장바구니 삭제 결과 : "+delete);
			
		}//for end
		
		
		
	}
	
	
	//주문번호 보여주기
	@Override
	public Order showOrder(int no) {
		return dao.selectOneOrder(no);
	}
}
