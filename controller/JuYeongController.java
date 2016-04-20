package com.wiring.bnn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wiring.bnn.service.JuYeongService;
import com.wiring.bnn.vo.Award;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.OrderDetail;
import com.wiring.bnn.vo.User;

@Controller
public class JuYeongController {

	private JuYeongService juYeongService;
	
	public void setJuYeongService(JuYeongService juYeongService) {
		this.juYeongService = juYeongService;
	}
	
	@RequestMapping("/index")
	public void index(Model model) {
		
		// 추천도서 목록
		List<Book> list1 = juYeongService.getRecommendList();
		model.addAttribute("list1", list1);
		
		// 신간도서 목록
		List<Book> list2 = juYeongService.getNewList();
		model.addAttribute("list2", list2);
		
	} // index() end
	
	@RequestMapping("/book/awards")
	public String awards(Model model) {
		//상 번호 넘기기?
		
		// 퓨울리춰상 목록
		List<Book> list1 = juYeongService.getPulitzerList();
		model.addAttribute("list1", list1);
		
		// 도우늬문학상 목록
		List<Book> list2 = juYeongService.getDounyList();
		model.addAttribute("list2", list2);
		
		// 로붸르문학상 목록
		List<Book> list3 = juYeongService.getNovelList();
		model.addAttribute("list3", list3);
		
		return "awards";
	} // awards() end
	
	@RequestMapping("/orderDetail/{orderNo}")
	public String orderDetail(Model model, @PathVariable int orderNo) {
		
		//System.out.println("주문번호 :: " + orderNo);
		
		// 상품정보 목록
		List<OrderDetail> list = juYeongService.getProductsList(orderNo);
		model.addAttribute("list", list);
		
		// 상세정보
		Order order = juYeongService.getDetailInfo(orderNo);
		model.addAttribute("order", order);
		
		// 결제금액

		
		return "orderDetail";
		
	} // orderDetail() end
	
	@RequestMapping(value="/orderDetail/updateCancel/{orderNo}", method=RequestMethod.PUT)
	public String updateCancel(@PathVariable int orderNo) {
		
		System.out.println(orderNo);
		juYeongService.updateCancel(orderNo);
		
		return "redirect:/orderDetail/"+orderNo;
		
	} // updateCancel() end
	
	@RequestMapping(value="/orderDetail/updateRefund/{orderNo}", method=RequestMethod.PUT)
	public String updateRefund(@PathVariable int orderNo) {
		
		System.out.println(orderNo);
		juYeongService.updateRefund(orderNo);
		
		return "redirect:/orderDetail/"+orderNo;
		
	} // updateRefund() end
	
}
