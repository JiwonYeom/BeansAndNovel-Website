package com.wiring.bnn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wiring.bnn.service.HaeInService;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;


@Controller
public class HaeInController {

	private HaeInService service;

	public void setService(HaeInService service) {
		this.service = service;
	}

	
	// 회원가입폼
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {
		return "join";
	}

	
	// 회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user) {

		service.createNewUser(user);

		return "redirect:/index";
	}

	
	// 주문 및 결제
	@RequestMapping(value = "/purchase", method = RequestMethod.GET)
	public String purchaseForm(HttpSession session, Model model, User user, Order order) {
		
		User loginUser = (User) session.getAttribute("login");
		
		//System.out.println(loginUser.getNo());
		 
		//해당유저의 주소 모두 보여주기
		model.addAttribute("address", service.showAllAddresses(loginUser.getNo()));
		  
		//해당 유저가 선택한 주소 보여주기
		model.addAttribute("oneAddress",service.showOneAddress(loginUser.getNo()));
		
//		//주소 선택시 선택하기
//		service.chooseAddress(address);
//				 
//		//주소 선택시 전에 선택한 주소 선택 취소하기
//		service.dontWantThatAddress(address);
		
		//구매시 카트에 담았던 책정보 보여주기
		List<BookCart> bookList = service.showBookListInCart(loginUser.getNo());
		model.addAttribute("bookList", bookList);
		session.setAttribute("bookcart", bookList);
		
		//총 결제금액
		int total = service.showBooksTotal(loginUser.getNo());
		session.setAttribute("total", total);
		
		return "purchase";
		
	}

	// 주문 및 결제시 장바구니 삭제, 주문, 주문디테일 테이블에 추가, 재고 update
	@RequestMapping(value = "/purchaseFinished", method = RequestMethod.POST)
	public String purchase(String bookNo,String quantity,Order order, String cartNo) {
		
//		User loginUser = (User)session.getAttribute("loginUser");
//		
//		order.setUserNo(loginUser.getNo());

		
//		order.setZipcode("12345");
//		order.setAddress("우리집뒷산");
		
		System.out.println("bookNo : "+bookNo);
		System.out.println("quantity : "+quantity);
		System.out.println("우편번호 : "+order.getZipcode());
		System.out.println("주소 : "+order.getAddress());
		System.out.println("총액 : "+order.getTotalPrice());
		System.out.println("유저번호 : "+order.getUserNo());
		
		//주문했을 때 주문번호 추가
		service.createOrder(bookNo, quantity, order, cartNo);

		return "redirect:/purchaseFinished/"+order.getNo();
	}

	//주문완료창
	@RequestMapping("/purchaseFinished/{no}")
	public String purchaseFinished(@PathVariable int no, Model model) {
		
		Order result = service.showOrder(no);
		
		model.addAttribute("orderList",result);
		
		return "purchaseFinished";
		
		
	}

}
