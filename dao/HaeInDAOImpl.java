package com.wiring.bnn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public class HaeInDAOImpl implements HaeInDAO {
	
	private  SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	//로그인
	@Override
	public User selectLoginUser(User user) {
		return session.selectOne("users.selectLoginUserHI",user);
	}
	
	//회원가입
	@Override
	public int insertUser(User user) {
		return session.insert("users.insertUserHI", user);
	}
	
	//해당 유저의 주소 모두 보여주기
	@Override
	public List<Address> selectAllAddresses(int no) {
		return session.selectList("addresses.selectAllAddressesHI",no);
	}
	
	//해당 유저가 선택한 주소 보여주기
	@Override
	public Address selectOneAddress(int no) {
		return session.selectOne("addresses.selectOneAddressHI", no);
	}
	
//	//주소 선택시 선택하기
//	@Override
//	public int updateAddressToChoose(Address address) {
//		return session.update("addresses.chooseAddressHI", address);
//	}
//	
//	//주소 선택시 전에 선택한 주소 선택 취소하기
//	@Override
//	public int updateAddressType(Address address) {
//		return session.update("addresses.dontWantThatAddressHI", address);
//	}
	
	//구매시 카트에 담았던 책정보 보여주기
	@Override
	public List<BookCart> selectBookListInCart(int no) {
		return session.selectList("bookCart.selectBookListInCartHI", no);
	}
	
	//총 결제금액
	@Override
	public int selectBooksTotal(int no) {
		return session.selectOne("bookCart.selectBooksTotalHI", no);
	}
	
	//주문했을 때 주문번호 추가
	@Override
	public int insertOrder(Order order) {
		return session.insert("orders.insertOrderHI", order);
	}
	@Override
	public int insertOrderDetail(OrderDetail orderDetail) {
		return session.insert("orderDetails.insertOrderDetailHI", orderDetail);
	}
	
	//책정보 보여주기
	@Override
	public Book selectBookToBuy(int no) {
		return session.selectOne("books.selectBookToBuyHI", no);
	}
	
	//재고 업데이트
	@Override
	public int updateStocks(OrderDetail detail) {
		return session.update("books.updateStocksHI", detail);
	}
	
	//장바구니 비우기
	@Override
	public int deleteBooksInCart(int no) {
		return session.delete("bookCart.deleteBooksInCartHI",no);
	}

	//주문번호 보여주기
	@Override
	public Order selectOneOrder(int no) {
		return session.selectOne("orders.selectOrderNumHI",no);
	}

}
