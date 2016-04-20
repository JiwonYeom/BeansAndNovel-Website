package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;

public interface JBDAO {
	
	public int InsertAddressJB(Address address);
	
	public List<Book> selectList(Book book);
	
	public int selectTotal();
}
