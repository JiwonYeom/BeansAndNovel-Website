
package com.wiring.bnn.controller;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Choose;
import org.apache.taglibs.standard.tag.common.fmt.RequestEncodingSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wiring.bnn.service.KstService;
import com.wiring.bnn.vo.Address;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Order;
import com.wiring.bnn.vo.User;

@Controller
public class SinTaeController {
	
	private KstService kstService;
	public void setKstService(KstService kstService) {
		this.kstService = kstService;
	}
	
	/*------------------------------bookcart 컨트롤------------------------------------ */
	//링크를 타서 컨트롤러에 도달할수없을때는 import를 이용해서 한다 !!
	

	@RequestMapping("/header")
	public String bookcartList(HttpSession session,Model model){
		
		User loginUser = (User)session.getAttribute("login");
		int userNo;
		try {
			//만약 유저번호가 없을시 nullpoint 잡고 들어감
		    userNo = loginUser.getNo();
	
		} catch (Exception e) {
			System.out.println("nullPointer 잡음");
			return "/template/header";
		}
		
		model.addAttribute("bookCartList",kstService.getBookCartList(userNo));
		//System.out.println("유저 번호 : "+userNo);		
		//System.out.println("장바구니 팝업! ");

		return"/template/header";
	}
	
	@RequestMapping(value="/updateQuantity/{no}",method=RequestMethod.PUT)
	public String updateQuantity(@PathVariable int no,String quantity, BookCart bookCart){	
/*		System.out.println("수량 수정 ");
		System.out.println("장바구니 도서 번호: "+bookCart.getNo());
		System.out.println("수량 : "+quantity);*/
		
		kstService.changeQuantity(bookCart);
		return "redirect:/index";
	}
	
	
	
	/*-----------------------------사이드 바 컨트롤--------------------------- */
	
	
	//링크를 타서 컨트롤러에 도달할수없을때는 import를 이용해서 한다 !!

	@RequestMapping("/sidebar")
	public String header(Model model,Book book) {
		
	//추천도서	
	Book recommendationBook =  kstService.recommendationBook(book);	
	/*	System.out.println("여기는 헤더 컨트롤러");*/
/*	System.out.println("==================================");
	System.out.println("추천 번호 :"+recommendationBook.getNo());
	System.out.println("추천도서 책이름 :"+recommendationBook.getTitle());*/
	model.addAttribute("recommendationBook",recommendationBook);
	
	//인기도서
	Book popularBook = kstService.popularBook(book);
/*	System.out.println("==================================");
	System.out.println("인기도서 책이름: "+popularBook.getTitle());*/
	model.addAttribute("popularBook",popularBook);
	
	return "/template/sidebar";
	}

	
	
	

	/*----------------------------user 관련 컨트롤------------------------ */
	
	//로그인 
	@RequestMapping(value="/session", method=RequestMethod.POST)
	public String userLogin(@RequestHeader String referer, 
												User user,
												HttpSession session,
												RedirectAttributes ra){
		
		//System.out.println("아이디 :"+user.getId());
		//System.out.println("비밀번호 :"+user.getPassword());
		
		User login = kstService.userlogin(user);
		
		//System.out.println("디비에서 넘어온 user : "+login);
		session.setAttribute("login", login);
		
		if(login != null){
			return "redirect:"+referer;		
		}else{
			ra.addFlashAttribute("loginMsg","아이디가 없거나 비밀번호가 틀립니다.");
			
			return "redirect:"+referer;
		}
		
	}
	
	//로그아웃
	@RequestMapping(value="/session", method=RequestMethod.DELETE)
	public String userLogout(HttpSession session,@RequestHeader String referer){
		
		session.removeAttribute("login");
		
		return "redirect:"+referer;
	}
	
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public void update(){
		System.out.println("이곳은 계정설정 페이지");
	}
	
	//닉네임 수정
	@RequestMapping(value="/updateNickname/{no}", method=RequestMethod.PUT)
	public String changeNinkname(User user,RedirectAttributes ra,HttpSession session){
		
/*		System.out.println("바뀔 닉네임 :" + user.getNickname());
		System.out.println("바뀔 번호 :" + user.getNo());*/
		
	 int result	 = kstService.changeNinkname(user);
		
	 if(result==1){
		 ra.addFlashAttribute("updateMsg","수정 되었습니다.");
		 return "redirect:/mypage";
	 }
	 	 ra.addFlashAttribute("updateMsg","다시 시도해주세요.");
		 return "redirect:/mypage";
	}
	
	//아이디 수정
	@RequestMapping(value="/updateId/{no}", method=RequestMethod.PUT)
	public String changeId(User user,RedirectAttributes ra,HttpSession session){
		
		User loginUser = (User)session.getAttribute("login");
		String userPwd = loginUser.getPassword();
		String pwd = user.getPassword();
		
/*		System.out.println("==============================");
		System.out.println("바뀔 아이디 :" + user.getId());
		System.out.println("비밀번호 확인 :" + pwd);
		System.out.println("로그인 한 유저 비밀번호: "+userPwd);*/
	
		//만약 로그인한 유저의 비밀번호와 입력한 비밀번호가 같을 때 수정

		
		if(pwd.equals(userPwd)){
			kstService.changeId(user);
			ra.addFlashAttribute("updateMsg","수정 되었습니다.");
			return "redirect:/mypage";
		}
			ra.addFlashAttribute("updateMsg","비밀번호를 확인해주세요");
			return "redirect:/update";
	}
		
	//비밀번호 수정
	@RequestMapping(value="/updatePassword/{no}", method=RequestMethod.PUT)
	public String changePassword(User user,RedirectAttributes ra){
		
		/*System.out.println("바뀔 닉네임 :" + user.getPassword());*/
		
	 int result	 = kstService.changePassword(user);
		
	 if(result==1){
		 ra.addFlashAttribute("updateMsg","수정 되었습니다.");
		 return "redirect:/mypage";
	 }
	 	 ra.addFlashAttribute("updateMsg","다시 시도해주세요.");
		 return "redirect:/mypage";
	}
	
	/*---------------------------- mypage 관련 컨트롤------------------------ */
	//해당 유저 배송지 뿌리기
	@RequestMapping("/mypage")
	public void getUserAddress(Model model,HttpSession session,@RequestParam(required=true,defaultValue="1") int pageNo){
		
		User user=  (User)session.getAttribute("login");
		
		//System.out.println("넘어온 유저 번호 "+user.getNo());
		int userNo = user.getNo();
		List<Address> list = kstService.getAddress(userNo);
		model.addAttribute("addressList",list);
		model.addAllAttributes(kstService.getOrderList(pageNo, userNo));
		
		
		//위시리스트 뿌리기
		List<Book> wishList = kstService.getWishListBook(userNo);
		System.out.println("사이즈 :"+list.size());
		model.addAttribute("wishList",wishList);
	}
	
	//주문번호 검색
	@RequestMapping(value="/searchOrder",method=RequestMethod.GET)
	public String searchOrder(int orderNo,Order order,Model model,HttpSession session){
		User user =(User)session.getAttribute("login");
	    
		int userNo= user.getNo();
		int no = orderNo;
	    //System.out.println("주문번호 검색");
		//System.out.println("검색할 주문번호 :"+orderNo);
		//System.out.println("주문번호를 가진 유저 번호 :"+userNo);
		
		List<Address> list = kstService.getAddress(userNo);
		model.addAttribute("addressList",list);
		
		Order result =  kstService.getOrderNumber(no, userNo);
		
		//System.out.println("결과값 : "+result);
		model.addAttribute("orderNumber","orderNumber");
		model.addAttribute("orderNumber",kstService.getOrderNumber(no, userNo));
		
		return "/mypage";
	}
	
	//배송지 삭제
	@RequestMapping(value="/mypage/{no}",method=RequestMethod.DELETE)
	public String removeAddress(@PathVariable int no){
		
		/*System.out.println("삭제될 주소 번호 : " + no);*/
		
		kstService.removeAddress(no);
		return "redirect:/mypage";
	}
	
//	//배송지 수정
//	@RequestMapping("/addressUpdate")
//	public String addressBook(Model model,int no){	
//		/*System.out.println("이곳은 배송지수정 페이지!");*/
//		/*System.out.println("뿌려질 번호 : "+no);*/
//		model.addAttribute("address",kstService.updateAddress(no));
//		model.addAttribute("updateFun","수정");
//		return "newAddress";
//	}
//	
//	@RequestMapping(value="/addressUpdate/{no}",method=RequestMethod.PUT)
//	public String addressUpdate(@PathVariable int no,Address address){
//		
//		
//		/*System.out.println("넘어온 배송지 번호 "+no);*/
//		kstService.changeAddress(address);
//		
//		/*System.out.println("이곳은 배송지수정 완료!");*/
//		return "redirec:/mypage";
//	}
//	
//	@RequestMapping("/addAddress")
//	public String addAddress(Model model){
//		
//		model.addAttribute("updateFun","추가");
//		
//		/*System.out.println("이곳은 배송지추가 페이지!");*/
//		
//		return "newAddress";
//	}
	
	//기본 배송지 설정
	@RequestMapping(value="/updateShippingAddress/{no}",method=RequestMethod.PUT)
	public String updateShippingAddress(@PathVariable int no){	
		/*System.out.println("넘어온 번호 : " + no );*/
		int result = kstService.changeDefaultShippingAddress(no);
		return "redirect:/mypage";
	}
	
	//기본배송지 해제
	@RequestMapping(value="/updateShippingAddressCancel/{no}",method=RequestMethod.PUT)
	public String updateShippingAddressCancel(@PathVariable int no){	
		int result = kstService.cangeCancleShippingAddress(no);
		return "redirect:/mypage";
	}
	

	/*----------------------------book 관련 컨트롤------------------------ */
	
	
	
	
	@RequestMapping("/book/search")
	public String bookResultPage(String title,
			@RequestParam(required=true,defaultValue="8") int numPage,
			@RequestParam(required=true,defaultValue="rating_sum/rating_count") String orderBy,
								Model model ,
								@RequestParam(required=true,defaultValue="1") int pageNo){
		title = "%"+title+"%";

		System.out.println("============이곳은 도서 검색 페이지==============");
		System.out.println("보여질 갯수 "+numPage);
		System.out.println("검색 도서명 : " +title);	
		System.out.println("정렬순 : " +orderBy);	
		
		model.addAllAttributes(kstService.bookResult(pageNo, title, numPage, orderBy));
		
		title = title.replaceAll("%", "");
		model.addAttribute("title",title);
		return "bookSearchList";
	}
	
	
	
}
