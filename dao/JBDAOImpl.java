package com.wiring.bnn.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;

public class JBDAOImpl implements JBDAO{
	
	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public int InsertAddressJB(Address address) {
		
		return session.insert("addresses.InsertAddressJB", address);
	}
	
	@Override
	public List<Book> selectList(Book book) {
		return session.selectList("books.SelectBestsellerListJB",book);
	}
	
	@Override
	public int selectTotal() {
		
		return session.selectOne("books.selectTotalJB");
	}
	
}
