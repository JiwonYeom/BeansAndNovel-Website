package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import com.wiring.bnn.dao.JBDAO;
import com.wiring.bnn.util.PaginateUtil;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;

public class JBServiceImpl implements JBService {
	
	private JBDAO jbdao;
	
	public void setJbdao(JBDAO jbdao) {
		this.jbdao = jbdao;
	}
	@Override
	public boolean registerAddress(Address address) {
		int result = jbdao.InsertAddressJB(address);
		
		if(result==1){
			
			return true;
			
		}
		return false;
		
	}
	@Override
	public Map<String, Object> getBookList(int pageNo) {
		
		
		int numPage = 15;
		
		int numBlock = 5;
		//서비스단에서 메서드를 제대로 선언 ///해결
		Book book = new Book(pageNo, numPage);
		
		
		//북 객체를 선언해서 pageNo와 numPage를 세팅한 후 selectList를 돌림 //해결
		
		Map<String, Object> map = new ConcurrentHashMap<>();

		//맵에 리스트를 넣어줌 ////해결
		
		
		//selectTotal로 전체 책 수를 받아옴
		int total = jbdao.selectTotal();
		
		String url = "/book/bestsellers/page/";
		
		//인자를 넣어줌 (start end니까) Book을 인자로 넣음 (맵퍼 고치고 dao도)///해결
		map.put("list", jbdao.selectList(book));
		
		PaginateUtil paginateUtil = new PaginateUtil();
		
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url);
		map.put("paginate", paginate);
		
		return map;
	}
	@Override
	public int booksTotal(int PageNo) {
		PageNo = jbdao.selectTotal();
		return PageNo;
	}
	
}
