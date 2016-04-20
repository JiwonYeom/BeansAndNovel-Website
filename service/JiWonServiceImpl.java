package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;


import com.wiring.bnn.dao.JiWonDAO;
import com.wiring.bnn.util.PaginateUtil;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Wishlist;


@Service
public class JiWonServiceImpl implements JiWonService{
	private JiWonDAO dao;
	private PaginateUtil paginate;
	private int numPage,numBlock;
	private String order;
	
	Map<String, Object> dataMap;
	
	
	public void setOrder(String order) {
		this.order = order;
	}
	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public void setNumBlock(int numBlock) {
		this.numBlock = numBlock;
	}
	public void setNumPage(int numPage) {
		this.numPage = numPage;
	}
	
	public void setPaginate(PaginateUtil paginate) {
		this.paginate = paginate;
	}
	
	public void setDao(JiWonDAO dao) {
		this.dao = dao;
	}
	
	//bookCart-----
	@Override
	public List<BookCart> getBookList(int userNo) {
		// TODO Auto-generated method stub
		return dao.selectBookCart(userNo);
	}
	
	@Override
	public boolean deleteCartEntry(int cartNo) {
		int size= dao.deleteCart(cartNo);
		return size==1;
	}

	
	@Override
	public boolean updateCart(BookCart bookCart) {
		int size = dao.updateCartJW(bookCart);
		return size==1;
	}
	
	
	
	/////////////////위시리스트
	
	
	@Override
	public List<Book> getWishlist(int userNo,int pageNo) {
		int numPage=4;
		Wishlist wishlist = new Wishlist(pageNo, numPage, userNo);
			
		return dao.selectWishlist(wishlist);


	};
	
	@Override
	public List<Book> listOrderbyOld(int userNo,int pageNo) {
		int numPage=4;
		Wishlist wishlist = new Wishlist(pageNo, numPage, userNo);
			
		return dao.wishlistOldOrderJW(wishlist);
	}
	
	@Override
	public int getCartSumPrice(int userNo) {
		// TODO Auto-generated method stub
		try{
			return dao.selectCartSumJW(userNo);
		}catch(Exception e){
			return 0;
		}
		
	}
	@Override
	public int getCartSumQt(int userNo) {
		// TODO Auto-generated method stub
		try{
			return dao.selectCartCountJW(userNo);	
		}catch(Exception e){
			return 0;
		}
		
	}
	
	@Override
	public boolean insertCartEntry(BookCart bookCart) {
		
		System.out.println(bookCart.getTitle());
		System.out.println(bookCart.getBookNo());
		System.out.println(bookCart.getPublisher());
		System.out.println(bookCart.getSalesPrice());

		
		int size =dao.insertCartJW(bookCart); 
		return size==1;
	}
	
	@Override
	public boolean deleteWishlist(int wishlistNo) {
		// TODO Auto-generated method stub
		int size = dao.deleteWishlistJW(wishlistNo);
		return size==1;
	}
	
	
	
	//////////bookList
	
	///카테고리로 불러오기
	@Override
	public Map<String,Object> getBooksByCategory(int pageNo,int categoryNo,String name) {
		// TODO Auto-generated method stub
		//return dao.selectCategoryJW(no);
			

			//System.out.println("service 카테고리번호 받아오기: "+categoryNo);
			Book book = new Book(pageNo,numPage,categoryNo,order);
			//System.out.println("start: "+book.getStart()+"/end: "+book.getEnd()+"/ctgryNo: "+book.getCategoryNo());
			List<Book> list= dao.selectListJW(book);

			dataMap.put("bookList", list);
//			map.put("articleList",list);
//			map.put("paginate,"<div class='paginate'><a>"");
			
			int total = dao.selectTotalJW(book);
			String url = "/book/category/"+name+"/page/";
			
			String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
			
			System.out.println(pagingTag);
			
			dataMap.put("paginate", pagingTag);
			dataMap.put("total", total);
			return dataMap;
	}
	
	///신작
	@Override
	public Map<String, Object> getNewBooks(int pageNo) {
		String type1 = "n";
		
		Book book = new Book(pageNo,numPage,order);
		book.setType1(type1);
		
		List<Book> list= dao.selectListJW(book);

		dataMap.put("bookList", list);

		int total = dao.selectTotalJW(book);
		String url = "/book/new/page/";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		
		System.out.println(pagingTag);
		
		dataMap.put("paginate", pagingTag);
		dataMap.put("total", total);
		return dataMap;
	}
	
	///특가
	public Map<String,Object> getBooksSpcPrice(int pageNo) {
		String difference = "yes";
		
		Book book = new Book(pageNo,numPage,order);
		book.setDifference(difference);;
		
		List<Book> list= dao.selectListJW(book);

		dataMap.put("bookList", list);
		int total = dao.selectTotalJW(book);
		String url = "/book/specialPrice/page/";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		
		System.out.println(pagingTag);
		
		dataMap.put("paginate", pagingTag);
		dataMap.put("total", total);
		return dataMap;
	};
	
	///컬렉션
	public Map<String,Object> getCollection(int pageNo) {
		
		String type2 = "c";
		
		Book book = new Book(pageNo,numPage,order);
		book.setType2(type2);
		
		List<Book> list= dao.selectListJW(book);

		dataMap.put("bookList", list);

		
		int total = dao.selectTotalJW(book);
		String url = "/book/collection/page/";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		
		System.out.println(pagingTag);
		
		dataMap.put("paginate", pagingTag);
		dataMap.put("total", total);
		return dataMap;
	};
	
	///가격으로 불러오기
	@Override
	public Map<String,Object> getBooksByPrice(int pageNo,int salesPriceStart,int salesPriceEnd) {
		// TODO Auto-generated method stub
		//return dao.selectCategoryJW(no);

			Book book = new Book(pageNo,numPage,salesPriceStart,salesPriceEnd,order);
			List<Book> list= dao.selectListJW(book);
		
			dataMap.put("bookList", list);
//			map.put("articleList",list);
//			map.put("paginate,"<div class='paginate'><a>"");
			int total = dao.selectTotalJW(book);
			String url = "";
			
			String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
			
			dataMap.put("paginate", pagingTag);
			dataMap.put("total", total);
			return dataMap;
	}
	
	//작가로 불러오기
	
	@Override
	public Map<String, Object> getBooksByWriter(int pageNo, String writer) {
		// TODO Auto-generated method stub
		Book book = new Book(pageNo,numPage,order);
		
		
		book.setWriter(writer);
		
		List<Book> list= dao.selectListJW(book);
	
		dataMap.put("bookList", list);
//		map.put("articleList",list);
//		map.put("paginate,"<div class='paginate'><a>"");
		int total = dao.selectTotalJW(book);
		String url = "";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		dataMap.put("total", total);
		dataMap.put("paginate", pagingTag);
		return dataMap;
		
	}
	
	
	//출판사로 불러오기
	
	@Override
	public Map<String, Object> getBooksByPublisher(int pageNo, String publisher) {
		Book book = new Book(pageNo,numPage,order);
		book.setPublisher(publisher);
		
		List<Book> list= dao.selectListJW(book);
	
		dataMap.put("bookList", list);
//		map.put("articleList",list);
//		map.put("paginate,"<div class='paginate'><a>"");
		int total = dao.selectTotalJW(book);
		String url = "";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		dataMap.put("total", total);
		dataMap.put("paginate", pagingTag);
		return dataMap;
	}
	
	////상으로 불러오기
	@Override
	public Map<String, Object> getBooksByAward(int pageNo,int awardNo) {
		Book book = new Book(pageNo,numPage,order);
		book.setAwardNo(awardNo);
		//System.out.println("상번호: "+awardNo);
		//System.out.println("페이지번호: "+pageNo);
		String awardName = dao.selectAwardNameJW(awardNo);
		List<Book> list= dao.selectAwardJW(book);
		//System.out.println(list);
		dataMap.put("bookList", list);
//		map.put("articleList",list);
//		map.put("paginate,"<div class='paginate'><a>"");
		int total = dao.selectAwardTotalJW(awardNo);
		//System.out.println("상 토탈: "+total);
		String url = "";
		
		String pagingTag = paginate.getPaginate(pageNo, total, numPage, numBlock, url);
		
		dataMap.put("paginate", pagingTag);
		dataMap.put("name", awardName);
		dataMap.put("total", total);
		return dataMap;
	}

	
	
	/////주소
	@Override
	public boolean upateAddress(Address address) {
		// TODO Auto-generated method stub
		int size =  dao.updateAddressJW(address);
		return size==1;
	}
	

}
