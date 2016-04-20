package com.wiring.bnn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wiring.bnn.vo.Award;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

public class JuYeongDAOImpl implements JuYeongDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<Book> selectRecommend() {
		return session.selectList("books.selectRecommendJY");
	} // selectRecommend() end
	
	@Override
	public List<Book> selectNew() {
		return session.selectList("books.selectNewJY");
	} // selectNew() end
	
	@Override
	public List<Book> selectPulitzer() {
		return session.selectList("books.selectPulitzerJY");
	} // selectPulitzer() end
	
	@Override
	public List<Book> selectDouny() {
		return session.selectList("books.selectDounyJY");
	} // selectDouny() end
	
	@Override
	public List<Book> selectNovel() {
		return session.selectList("books.selectNovelJY");
	} // selectNovel() end
	
	@Override
	public List<OrderDetail> selectList(int orderNo) {
		return session.selectList("orderDetails.selectListJY",orderNo);
	} // selectList() end
	
	@Override
	public int selectBooksTotal(int orderNo) {
		return session.selectOne("orderDetails.selectBooksTotalJY",orderNo);
	} // selectBooksTotal() end
	
	@Override
	public Order selectDetailInfo(int no) {
		return session.selectOne("orders.selectDetailInfoJY",no);
	} // selectDetailInfo() end
	
	@Override
	public int updateCancel(int no) {
		return session.update("orders.updateCancelJY",no);
	} // updateCancel() end
	
	@Override
	public int updateRefund(int no) {
		return session.update("orders.updateRefundJY",no);
	} // updateRefund() end
	
}
