package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.ibatis.session.SqlSession;
import com.wiring.bnn.dao.KstDAO;
import com.wiring.bnn.util.PaginateUtil;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.User;

public class KstServiceImpl implements KstService {

	private PaginateUtil paginateUtil;
	private KstDAO kstDAO;
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	public void setKstDAO(KstDAO kstDAO) {
		this.kstDAO = kstDAO;
	}
	/*-----------------------book serviceImpl-----------------------------*/
	//도서 검색 단어
	@Override
	public List<Book> bookResultList(String title){
	
		return kstDAO.selectList(title);
	}
	
	//도서 결과 페이지
	@Override
	public Map<String, Object> bookResult(int pageNo,String title,int numPage,String orderBy) {
				
				//한 페이지에 보여질 게시물 수
				//옵션에서 받아온 numPage 수
				 numPage = numPage;
				
				// 보여질 블럭 갯수
				int numBlock = 5;
		
				//뷰페이지에서 넘어오는 데이터를 다시 컨트롤러로 통해서 서비스로 오게되고 
				
				//이곳에서 set으로 데이터를 넣어준다.

				
				Book book = new Book(pageNo,numPage);
				book.setTitle(title);
				book.setOrderBy(orderBy);	
				
				List<Book> list = kstDAO.selectBookList(book);
				
				Map<String, Object> dataMap = new ConcurrentHashMap<>();
				//맵에 리스트 담기
				dataMap.put("bookList", list);
				
				int total = kstDAO.selectTotalKst(title);
/*				System.out.println("검색어:" + title);
				System.out.println("검색 결과 수: "+total);*/
				String bookTitle = "title="+title.substring(1,title.length()-1);
				
				dataMap.put("total", total);
				
				String url = "/book/search?";
				String param ="numPage="+numPage+"&"+bookTitle+"&orderBy="+orderBy+"&pageNo";
				/*System.out.println("글자수"+title.length()-1);*/
				
				//System.out.println(bookTitle);
				String paginate = paginateUtil.getBookListPaginate(pageNo, total, numPage, numBlock, url, param);
				
				//맵에 페이지네이트 담기
				dataMap.put("paginate", paginate);
		
				return dataMap;
	}
	
	
	//추천도서
	@Override
	public Book recommendationBook(Book book){
		
		// 리스트를 list에 담는다.
		List<Book> list = kstDAO.selectListRec(book);
		
		//리스트의 갯수
		int max = list.size() - 1;
		
		System.out.println(max);
		//리스트 뽑는 랜덤수
		int random = (int)(Math.random() * max);
		
		//랜덤수를 통해 list의 객체 하나를 뽑아 리턴한다.
		return list.get(random);
	}
	
	//인기도서
	public Book popularBook(Book book) {
		
		List<Book> list	 = kstDAO.selectListPopularBook(book);
			
		int max = list.size()-1;
		int random = (int)(Math.random() * max);
		
		return list.get(random);
	};
	
	//마이페이지 위시리스트
	@Override
	public List<Book> getWishListBook(int userNo) {
		// TODO Auto-generated method stub
		return kstDAO.selectListWishBook(userNo);
	}
	
	//테스트 디테일
	@Override
	public Book getBookKst(int no) {
		// TODO Auto-generated method stub
		return kstDAO.selectOneBook(no);
	}

	/*--------------------user ServiceImpl--------------------*/
	//로그인
	@Override
	public User userlogin(User user){	
		return kstDAO.selectOneKst(user);
	}
	
	//닉네임 수정
	public int changeNinkname(User user){
		return kstDAO.updateNickname(user);
	}
	
	//아이디 수정
	public int changeId(User user){
		return kstDAO.updateId(user);
	}
	
	//비밀번호 수정
	public int changePassword(User user){	
		return kstDAO.updatePassword(user);
	}
	
	
	/*--------------------배송지 ServiceImpl---------------------- */
	
	//개인정보설정(배송지)
	@Override
	public List<Address> getAddress(int userNo) {
		// TODO Auto-generated method stub
		return kstDAO.selectListAddress(userNo);
	}
	
	//배송지 삭제
	@Override
	public int removeAddress(int no) {
		// TODO Auto-generated method stub
		return kstDAO.deleteAddress(no);
	}
	
	//배송지 수정
	@Override
	public int changeAddress(Address address) {
		// TODO Auto-generated method stub
		return kstDAO.updateAddress(address);
	}
	
	//배송지 업데이트 뿌리기
	@Override
	public Address updateAddress(int no) {
		// TODO Auto-generated method stub
		return kstDAO.selectOneAddress(no);
	}
	
	//기본배송지 설정
	@Override
	public int changeDefaultShippingAddress(int no) {
		// TODO Auto-generated method stub
		return kstDAO.updateShippingAddress(no);
	}
	
	//기본배송지 해제
	@Override
	public int cangeCancleShippingAddress(int no) {
		// TODO Auto-generated method stub
		return kstDAO.updateShippingAddressCancel(no);
	}
	
	/*--------------------주문 ServiceImpl--------------------*/
	//주문 페이징
	@Override
	public Map<String, Object> getOrderList(int pageNo, int userNo) {
		// TODO Auto-generated method stub
		
		//한 페이지에 보여질 게시물 수
		int numPage = 5;
		
		// 보여질 블럭 갯수
		int numBlock = 5;
		
		
		
		//뷰페이지에서 넘어오는 데이터를 다시 컨트롤러로 통해서 서비스로 오게되고 
		
		//이곳에서 set으로 데이터를 넣어준다.
		Order order = new Order(pageNo, numPage);
		order.setUserNo(userNo);
		
		List<Order> orders = kstDAO.selectListOrder(order);
		
		Map<String, Object> dataMap = new ConcurrentHashMap<>();
		//맵에 리스트 담기
		dataMap.put("orders", orders);
		
		int total = kstDAO.selectTotalOrder(userNo);

		System.out.println("검색 결과 수: "+total);
		
		dataMap.put("total", total);
		

		
		String url = "/mypage";
		String param ="userNo="+userNo+"&pageNo";
		/*System.out.println("글자수"+title.length()-1);*/
		
		//System.out.println(bookTitle);
		String paginate = paginateUtil.getBookListPaginate(pageNo, total, numPage, numBlock, url, param);
		
		//맵에 페이지네이트 담기
		dataMap.put("paginate", paginate);
		
		return dataMap;
	}
	
	//주문번호 검색
	@Override
	public Order getOrderNumber(int no, int userNo) {
		// TODO Auto-generated method stub
		
		Order order = new Order();
		order.setNo(no);
		order.setUserNo(userNo);
		
		
		return kstDAO.selectOneOrder(order);
	}
	
	/*---------------------장바구니 ServiceImpl--------------------*/
	
	//장바구니 뿌리기
	@Override
	public List<BookCart> getBookCartList(int userNo) {
		// TODO Auto-generated method stub
		return kstDAO.selectListBookCart(userNo);
	}
	
	@Override
	public int changeQuantity(BookCart bookCart) {
		// TODO Auto-generated method stub
		return kstDAO.updateQuantity(bookCart);
	}
	
	
	
	
	
	
	
	
	///////////추가
	
@Override
	public Address selectAddress(int no) {
		// TODO Auto-generated method stub
		return kstDAO.selectOneAddress(no);
	}
}
