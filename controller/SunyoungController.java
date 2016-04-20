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

import com.wiring.bnn.service.SunyoungService;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Comment;
import com.wiring.bnn.vo.Like;
import com.wiring.bnn.vo.Report;
import com.wiring.bnn.vo.User;
import com.wiring.bnn.vo.Wishlist;




@Controller
public class SunyoungController {

	private SunyoungService service;
	
	public void setService(SunyoungService service) {
		this.service = service;
	}

	
	
	//////////책 정보에서 일어나는 일///////
	
	
	@RequestMapping(value="/bookDetail/{no}", method=RequestMethod.GET)
	public String detail(@PathVariable int no, Model model,HttpSession session) {
		
		System.out.println("북디테일에 입장하셨습니다...ㅎ");
		
		// 없는 값일때 index로 리다이렉트
		if (no < 0) {
			return "redirect:/index";
		}
		
		//북디테일 하나 뿌리기
		Book book = service.getBook(no);
		model.addAttribute("book", book);
		
		//코멘트 전체 숫자 세기
		model.addAttribute("commentNum", service.getCommentNum(no));
		
		//1등 코멘트 뿌리기
		model.addAttribute("commentTop", service.getCommentTop(no));
		
		//유저번호와 코멘트 번호 비교 후 삭제 버튼 생성
		User login = (User)session.getAttribute("login");
		model.addAttribute("login",login);
	
		return "bookDetail";
	}
	
	
	//댓글 불러오기
	@RequestMapping(value="/commentList/{no}/page/{pageNo}/userNo/{userNo}", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<Comment> comments(@PathVariable int pageNo,@PathVariable int no,@PathVariable int userNo){
		
		
		
		return service.getCommentList(pageNo, no, userNo);
		
	}
	
	//북카트에 넣기
	@RequestMapping("/insertBookCart")
	@ResponseBody
	public String insertBookCart(BookCart bookCart, HttpSession session){
		
		System.out.println("북카트에 담기");
		
		User loginUser = (User)session.getAttribute("login");
		bookCart.setUserNo(loginUser.getNo());
		
		//bookCart.setUserNo(1);
		
		
		boolean result = service.registerBookCart(bookCart);
		
		System.out.println("북카트번호"+bookCart.getNo());
		System.out.println("북카트수량"+bookCart.getQuantity());
		System.out.println("북카트가격"+bookCart.getSalesPrice());
		System.out.println("북카트출판사"+bookCart.getPublisher());
		System.out.println("북카트작가"+bookCart.getWriter());
		System.out.println("북카트커버"+bookCart.getBookCover());
		System.out.println("북카트이름"+bookCart.getTitle());
		System.out.println("북카트쓴날짜"+bookCart.getRegdate());
		System.out.println("북카트책번호"+bookCart.getBookNo());
		
		return "{\"result\":"+result+"}";
	}
	
	//위시리스트에 넣기
	@RequestMapping("/insertWishlist")
	@ResponseBody
	public String insertWishlist(Wishlist wishlist, HttpSession session){
		
		System.out.println("위시리스트에 담기");
		
		User loginUser = (User)session.getAttribute("login");
		wishlist.setUserNo(loginUser.getNo());
		//wishlist.setUserNo(1);
		
		boolean result = service.registerWishlist(wishlist);
		
		System.out.println("위리 번호:"+wishlist.getNo());
		System.out.println("위리 날짜:"+wishlist.getRegdate());
		System.out.println("위리 책번호:"+wishlist.getBookNo());
		System.out.println("위리 유저번호:"+wishlist.getUserNo());
		
		return "{\"result\":"+result+"}";
		
	}
	
	
	//바로구매시
	@RequestMapping(value="/instantPurchase")
	public String instantPurchase(BookCart bookcart, HttpSession session){
		
		System.out.println("바로구매");
		
		User loginUser = (User)session.getAttribute("login");
		bookcart.setUserNo(loginUser.getNo());
		//bookcart.setUserNo(1);
		
		service.registerBookCart(bookcart);
		
		System.out.println("바로구매"+bookcart.getQuantity());
		System.out.println("바로구매"+bookcart.getSalesPrice());
		System.out.println("바로구매"+bookcart.getBookCover());
		System.out.println("바로구매"+bookcart.getTitle());
		System.out.println("바로구매"+bookcart.getBookNo());
		System.out.println("바로구매"+bookcart.getWriter());
		System.out.println("바로구매"+bookcart.getUserNo());
		System.out.println("바로구매"+bookcart.getPublisher());
		
		
		return "/bookCart";
	}
	
	
	
	
	
	
	
	
	
	////////댓글에서 일어나는 일/////////
	
	
	//댓글쓰기
	@RequestMapping(value="/writeComment/{no}", method=RequestMethod.POST)
	public String writeComment(Comment comment, @PathVariable int no,Book book,HttpSession session){
		
		System.out.println("댓글쓰기");
		
		comment.setBookNo(no);
		
		User loginUser = (User)session.getAttribute("login");
		comment.setUserNo(loginUser.getNo());
		comment.setNickname(loginUser.getNickname());
		//comment.setUserNo(1);
		//comment.setNickname("책사랑");
		
		service.registerComment(comment,book);
		
		System.out.println(comment.getRegdate());
		System.out.println(comment.getRating());
		System.out.println(comment.getContents());
		System.out.println(comment.getBookNo());
		System.out.println(comment.getRatingCount());
		System.out.println(comment.getRatingSum());
		System.out.println(comment.getUserNo());
		
		return "redirect:/bookDetail/{no}";

	}
	
	
	//댓글지우기
	@RequestMapping(value="/deleteComment",method=RequestMethod.DELETE)
	@ResponseBody
	public String deleteComment(@RequestBody Comment comment, HttpSession session){
		
		
		System.out.println("코멘트 삭제");
		
		User loginUser = (User)session.getAttribute("login");
		comment.setUserNo(loginUser.getNo());
		//comment.setUserNo(1);
		
		//System.out.println("코멘트번호"+comment.getNo());
		
		boolean result = service.removeComment(comment);
		
		System.out.println(result);
		
		return "{\"result\":"+result+"}";
		
	}
	
	
	//신고하기
	@RequestMapping(value="/registerReport", method=RequestMethod.POST)
	@ResponseBody
	public String registerReport(Report report, HttpSession session){
		
		System.out.println("신고하기");
		
		User loginUser = (User)session.getAttribute("login");
		report.setUserNo(loginUser.getNo());
	
		boolean result = service.registerReport(report);
		
		//System.out.println("신고 유저번호"+report.getUserNo());
		//System.out.println("신고 코멘트번호 : "+report.getCommentNo());
		
		System.out.println(result);
		
		return "{\"result\":"+result+"}"; 
	}
	
	
	
	//좋아요 
	@RequestMapping(value="/likeComment/{commentNo}")
	@ResponseBody
	public String like(@PathVariable int commentNo,HttpSession session){
		System.out.println("좋아요누름");
		System.out.println("코멘트번호: "+commentNo);
		
		User loginUser = (User)session.getAttribute("login");
		int userNo = loginUser.getNo(); 
		
		
		boolean result = service.executeLike(commentNo, userNo);
		System.out.println("라이크실행결과: "+result);
		
	return "{\"result\":"+result+"}";
	
	}
	
		
	

}
