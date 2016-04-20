package com.wiring.bnn.service;

import java.util.List;

import com.wiring.bnn.vo.Award;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public interface JuYeongService {

	// index페이지 추천도서 목록
	public List<Book> getRecommendList();
	
	// index페이지 신간도서 목록
	public List<Book> getNewList();
	
	// awards페이지 퓨울리춰상 목록
	public List<Book> getPulitzerList();
	
	// awards페이지 도우늬문학상 목록
	public List<Book> getDounyList();
	
	// awards페이지 로붸르문학상 목록
	public List<Book> getNovelList();
	
	// orderDetail페이지 상품정보 목록
	public List<OrderDetail> getProductsList(int orderNo);
	
	// orderDetail페이지 결제금액
	public int getBooksTotal(int orderNo);
	
	// orderDetail페이지 주문상세정보
	public Order getDetailInfo(int no);
	
	// orderDetail페이지 주문취소 눌렀을 때, 업데이트
	public int updateCancel(int no);
	
	// orderDetail페이지 반품신청 눌렀을 때, 업데이트
	public int updateRefund(int no);
	
}
