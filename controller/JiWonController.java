package com.wiring.bnn.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiring.bnn.service.JiWonService;
import com.wiring.bnn.service.KstService;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.CategoryType;
import com.wiring.bnn.vo.User;

@Controller
public class JiWonController {
	private JiWonService service;
	private KstService STservice;
	
	public void setSTservice(KstService sTservice) {
		STservice = sTservice;
	}
	public void setService(JiWonService service) {
		this.service = service;
	}
	//////////위시리스트//////////
	@RequestMapping(value="/wishlist",method=RequestMethod.GET)
	public void wishlist(Model model,HttpSession session ){
		User loginUser = (User)session.getAttribute("login");
		service.getBookList(loginUser.getNo());
		model.addAttribute("userNo",loginUser.getNo());
		model.addAttribute("wishlist",service.getWishlist(loginUser.getNo(),1));
		
	}
	
	@RequestMapping(value="/wishlist/new/{userNo}/page/{pageNo}",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Book> listOrderNew(@PathVariable int pageNo,@PathVariable int userNo,HttpSession session){
		//User loginUser = (User)session.getAttribute("loginUser");
	return service.getWishlist(userNo, pageNo);
	
	}

/*
	@RequestMapping(value="/wishlist/old/{userNo}/page/{pageNo}",produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Book> listOrderOld(@PathVariable int pageNo,@PathVariable int userNo,HttpSession session){
		//User loginUser = (User)session.getAttribute("loginUser");
		return service.listOrderbyOld(userNo, pageNo);
	}*/
	
	@RequestMapping(value="/wishlist/cart",method=RequestMethod.POST)
	@ResponseBody
	public String insertCartEntry(BookCart bookCart ,HttpSession session){
		User loginUser = (User)session.getAttribute("login");
		bookCart.setUserNo(loginUser.getNo());
		System.out.println(bookCart.getBookNo());
		boolean result = service.insertCartEntry(bookCart);
		System.out.println("추가 실행 결과: "+result);
		
		return "{\"result\":"+result+"}";
	}

	//위시리스트 삭제 메서드
	@RequestMapping(value="/wishlist/delete",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteWishlist(@RequestBody int wishlistNo){
		boolean result = service.deleteWishlist(wishlistNo);
		System.out.println("위시리스트 삭제 결과: "+result);
		return "{\"result\":"+result+"}";
	}
	
	
	
	
	/////////////북카트////////////
	@RequestMapping(value="/bookCart",method=RequestMethod.GET)
	public String bookCart(Model model,HttpSession session){
		User loginUser = (User)session.getAttribute("login");
		service.getBookList(loginUser.getNo());
		
		model.addAttribute("totalPrice",service.getCartSumPrice(loginUser.getNo()));
		model.addAttribute("totalCount",service.getCartSumQt(loginUser.getNo()));
		return "bookCart";
	}
	
	@RequestMapping(value="/displayCartList")
	@ResponseBody
	public List<BookCart> bookCart(HttpSession session){
	//장바구니에 담긴 책들을 불러오는 메서드
		User loginUser = (User)session.getAttribute("login");
		service.getBookList(loginUser.getNo());
		
		//11은 나중에 userNo로 교체
		return service.getBookList(loginUser.getNo());
	}
	
	@RequestMapping(value="/cart/delete",method=RequestMethod.DELETE)
	public String deleteCart(int itemNo){
		System.out.println("카트 삭제번호: "+itemNo);
		System.out.println("카트 삭제실행");
		boolean result = service.deleteCartEntry(itemNo);
		System.out.println("삭제결과: "+result);
		return "redirect:/bookCart";
	}
	
	
	@RequestMapping(value="/cart/update",method=RequestMethod.PUT)
	@ResponseBody
	public String fixCart( @RequestBody BookCart bookCart){
		
		System.out.println("카트번호: "+bookCart.getNo());
		System.out.println("수량: "+bookCart.getQuantity());
		boolean result = service.updateCart(bookCart);
		return "{\"result\":"+result+"}";
	}
	
	
	
	////////////////////bookList
	
	//카테고리별 리스트 불러오기
	@RequestMapping(value="/book/category/{name}/page/{pageNo}")
	public String category(@PathVariable String name,@PathVariable int pageNo,Model model) {

	CategoryType c = CategoryType.valueOf(name);
		System.out.println(name);
		int categoryNo = c.getValue();
		System.out.println(categoryNo);
		model.addAllAttributes(service.getBooksByCategory(pageNo,categoryNo,name));
		name = name.replaceAll("_", "/");
		model.addAttribute(name);
		return "bookList";
	}
	
	//가격별 리스트 불러오기
	
	@RequestMapping(value="/book/price/{salesPriceStart}-{salesPriceEnd}/page/{pageNo}")
	public String price(@PathVariable int salesPriceStart,@PathVariable int salesPriceEnd,@PathVariable int pageNo,Model model) {

		model.addAllAttributes(service.getBooksByPrice(pageNo, salesPriceStart, salesPriceEnd));
		String price = salesPriceStart+"~"+salesPriceEnd+"원";
		model.addAttribute("name",price);
		return "bookList";
	}
	
	//신작 리스트 불러오기

	@RequestMapping(value="/book/new/page/{pageNo}")
	public String newBook(@PathVariable int pageNo,Model model) {

		model.addAllAttributes(service.getNewBooks(pageNo));
		
		model.addAttribute("name","신작모음");
		return "bookList";
	}
	//특가 리스트 불러오기

	@RequestMapping(value="/book/specialPrice/page/{pageNo}")
	public String spcPrice(@PathVariable int pageNo,Model model) {

		model.addAllAttributes(service.getBooksSpcPrice(pageNo));
		
		model.addAttribute("name","특가 모음");
		return "bookList";
	}
	//컬렉션 불러오기

	@RequestMapping(value="/book/collection/page/{pageNo}")
	public String collection(@PathVariable int pageNo,Model model) {

		model.addAllAttributes(service.getCollection(pageNo));
		model.addAttribute("name","B&N 컬렉션");
		return "bookList";
	}

	//작가별 불러오기
	@RequestMapping(value="/book/writer/{writer}/page/{pageNo}")
	public String writer(@PathVariable String writer,@PathVariable int pageNo,Model model) {
	System.out.println("작가이름: "+writer);
	model.addAttribute("name",writer);
	model.addAllAttributes(service.getBooksByWriter(pageNo, writer));
			
	return "bookList";
	}
	//출판사별 불러오기
	@RequestMapping(value="/book/publisher/{publisher}/page/{pageNo}")
	public String publisher(@PathVariable String publisher,@PathVariable int pageNo,Model model) {
		System.out.println("출판사이름: "+publisher);
		model.addAttribute("name",publisher);
	model.addAllAttributes(service.getBooksByPublisher(pageNo, publisher));
	
		return "bookList";
	}
	
	//상별 불러오기
	
	@RequestMapping(value="/book/award/{awardNo}/page/{pageNo}")
	public String publisher(@PathVariable int awardNo,@PathVariable int pageNo,Model model) {
		System.out.println("상 번호: "+awardNo);
	model.addAllAttributes(service.getBooksByAward(pageNo, awardNo));
	
	
		return "bookList";
	}
	
	
	
	////////////주소 수정
	
	@RequestMapping(value="/updateAddress/{addressNo}",method=RequestMethod.GET)
	public String addressUpdateForm(Model model,@PathVariable int addressNo){
		
		model.addAttribute("original",STservice.selectAddress(addressNo));
		model.addAttribute("function","수정");
		
		return "newAddress";
	}
	
	@RequestMapping(value="/updateAddress",method=RequestMethod.PUT)
	public String addressUpdate(Address address){
		System.out.println(address.getPhone());
		if(address.getShippingAddress()==null) {
			address.setShippingAddress("n");
		}
		
		System.out.println("주소 수정결과: "+service.upateAddress(address));
		return "redirect:/mypage";
	}
}
