package com.wiring.bnn.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wiring.bnn.service.JBService;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.User;




@Controller
public class JBController {
	private SqlSession session;
//	@RequestMapping(value="/book/category/{name}")
//	public String category(@PathVariable String name) {
//		System.out.println(name);
//		return "bookList";
//	}
//	

	private JBService jbservice;
	
	public void setService(JBService jbservice) {
		this.jbservice = jbservice;
	}
	
	@RequestMapping(value="/newAddress",
			method=RequestMethod.GET)
	public void addressForm(Model model){
		model.addAttribute("function","추가");
		System.out.println("주소입력폼 get방식");
		//InternalResourceView 를 사용중
	}
	
	@RequestMapping("/book/bestsellers/page/{pageNo}")
	public String bestsellers(Model model, Book book,@PathVariable int pageNo){
	
		model.addAllAttributes(jbservice.getBookList(pageNo));
		//InternalResourceView 를 사용중
		return "bestsellers";
	}

	
	@RequestMapping(value="/newAddress",
			method=RequestMethod.POST)
public String registerAddress(@ModelAttribute Address address,HttpSession session,Model model){
		/*
		System.out.println(address.getName());
		System.out.println(address.getRecipient());
		System.out.println(address.getZipcode());
		System.out.println(address.getAddress());
		System.out.println(address.getDetailedAddress());
		System.out.println(address.getPhone());
		System.out.println(address.getShippingAddress());
		*/
		
		
		//합칠때 주석 푸는것
		User user = (User)session.getAttribute("login");
		

		address.setUserNo(user.getNo());
		if(address.getShippingAddress()==null) {
			address.setShippingAddress("n");
		}
		
		jbservice.registerAddress(address);
		
		return "redirect:/mypage";
}

	
}
