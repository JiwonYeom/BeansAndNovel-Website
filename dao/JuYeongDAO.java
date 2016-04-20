package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Award;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public interface JuYeongDAO {

	// index페이지 추천도서 목록
	public List<Book> selectRecommend();
	
	// index페이지 신간도서 목록
	public List<Book> selectNew();
	
	// awards페이지 퓨울리춰상 목록
	public List<Book> selectPulitzer();
	
	// awards페이지 도우늬문학상 목록
	public List<Book> selectDouny();
	
	// awards페이지 로붸르문학상 목록
	public List<Book> selectNovel();
	
	// orderDetail페이지 상품정보 목록
	public List<OrderDetail> selectList(int orderNo);
	
	// orderDetail페이지 결제금액
	public int selectBooksTotal(int orderNo);
	
	// orderDetail페이지 주문상세정보
	public Order selectDetailInfo(int no);
	
	// orderDetail페이지 주문취소 눌렀을 때, 업데이트
	public int updateCancel(int no);
	
	// orderDetail페이지 반품신청 눌렀을 때, 업데이트
	public int updateRefund(int no);
	
}
