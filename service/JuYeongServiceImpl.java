package com.wiring.bnn.service;

import java.util.List;

import com.wiring.bnn.dao.JuYeongDAO;
import com.wiring.bnn.vo.Award;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public class JuYeongServiceImpl implements JuYeongService {

	private JuYeongDAO juYeongDAO;
	
	public void setJuYeongDAO(JuYeongDAO juYeongDAO) {
		this.juYeongDAO = juYeongDAO;
	}
	
	@Override
	public List<Book> getRecommendList() {
		return juYeongDAO.selectRecommend();
	} // getRecommendList() end
	
	@Override
	public List<Book> getNewList() {
		return juYeongDAO.selectNew();
	} // getNewList() end
	
	@Override
	public List<Book> getPulitzerList() {
		return juYeongDAO.selectPulitzer();
	} // getPulitzerList() end
	
	@Override
	public List<Book> getDounyList() {
		return juYeongDAO.selectDouny();
	} // getDounyList() end
	
	@Override
	public List<Book> getNovelList() {
		return juYeongDAO.selectNovel();
	} // getNovelList() end
	
	@Override
	public List<OrderDetail> getProductsList(int orderNo) {
		//System.out.println("주문번호:::" + orderNo);
		return juYeongDAO.selectList(orderNo);
	} // getProductsList() end
	
	@Override
	public int getBooksTotal(int orderNo) {
		//System.out.println("주문번호::::"+ orderNo);
		return juYeongDAO.selectBooksTotal(orderNo);
	} // getBooksTotal() end
	
	@Override
	public Order getDetailInfo(int no) {
		//System.out.println("주문번호 : "+no);
		return juYeongDAO.selectDetailInfo(no);
	} // getDetailInfo() end
	
	@Override
	public int updateCancel(int no) {
		//System.out.println("취소업데이트 주문번호 : "+no);
		return juYeongDAO.updateCancel(no);
	} // updateCancel() end
	
	@Override
	public int updateRefund(int no) {
		//System.out.println("반품업데이트 주문번호 : "+no);
		return juYeongDAO.updateRefund(no);
	}
	
}
