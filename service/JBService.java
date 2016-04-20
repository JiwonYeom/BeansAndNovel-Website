package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;

import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.User;

public interface JBService {
	
	public boolean registerAddress(Address address);
	
	public Map<String, Object> getBookList(int pageNo);
	
	public int booksTotal(int PageNo);
}
