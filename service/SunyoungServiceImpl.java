package com.wiring.bnn.service;

import java.util.List;
import java.util.Map;

import com.wiring.bnn.dao.SunyoungDAO;
import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Comment;
import com.wiring.bnn.vo.Like;
import com.wiring.bnn.vo.Report;
import com.wiring.bnn.vo.Wishlist;


public class SunyoungServiceImpl implements SunyoungService {

	private Map<String, Object> dataMap;

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}

	private SunyoungDAO sunyoungDAO;

	public void setSunyoungDAO(SunyoungDAO sunyoungDAO) {
		this.sunyoungDAO = sunyoungDAO;
	}

	@Override
	public Book getBook(int no) {
		// TODO Auto-generated method stub
		return sunyoungDAO.selectOne(no);
	}

	@Override
	public int getCommentNum(int no) {
		// TODO Auto-generated method stub
		return sunyoungDAO.selectTotal(no);
	}

	@Override
	public void registerComment(Comment comment,Book book) {
		// TODO Auto-generated method stub
		
		sunyoungDAO.insertComment(comment);
		Comment cm = sunyoungDAO.selectCount(comment);
		
		//System.out.println("서비스"+cm.getRatingSum());
		//System.out.println("서비스"+cm.getRatingCount());
		
		book.setRatingSum(cm.getRatingSum());
		book.setRatingCount(cm.getRatingCount());
		
		sunyoungDAO.updateRating(book);
	}

	@Override
	public boolean removeComment(Comment comment) {
		// TODO Auto-generated method stub
		
		int size = sunyoungDAO.delete(comment);
		
		return size==1;
	}

@Override
	public boolean registerReport(Report report) {
		// TODO Auto-generated method stub
	int size = sunyoungDAO.insertReport(report);
	return size==1;
	}
	
	@Override
	public List<Comment> getCommentList(int pageNo, int bookNo, int userNo) {
		
		//한 페이지에 보여질 게시물수
		int numPage = 3;
		//한 페이지당 보여지는 페이징블록갯수
		int numBlock = 3;
		
		Comment comment = new Comment(pageNo,numPage,bookNo,userNo);
		
		List<Comment> list= sunyoungDAO.selectList(comment);
		
		for(Comment cm : list){
			int count = sunyoungDAO.selectTotalLike(cm.getNo());
			cm.setLikeCount(count);
			
		}
		
		return list; 
		
	}
	
	@Override
	public Comment getCommentTop(int no) {
		// TODO Auto-generated method stub
		
		return sunyoungDAO.selectTop(no);
	}
	
	@Override
	public int checkLike(int commentNo, int userNo) {
		// TODO Auto-generated method stub
		
		Like like = new Like();
		like.setCommentNo(commentNo);
		like.setUserNo(userNo);
		int result = sunyoungDAO.selectCheckSY(like);
		
		System.out.println("checkLike실행결과: "+result);
		
		return result;
	}
	
	@Override
	public boolean executeLike(int commentNo,int userNo) {
		// TODO Auto-generated method stub
		//기존에 라이크를 했는지 안했는지 확인
		Like like = new Like();
		like.setCommentNo(commentNo);
		like.setUserNo(userNo);
		int result =sunyoungDAO.selectCheckSY(like);
		
		System.out.println("selectCheck실행결과: "+result);
		//그 결과를 가지고 insert혹은 delete를 실행
		
		int iResult = 0;
		int dResult = 0;
		boolean finalResult = true;
		if(result!=0){
			iResult = sunyoungDAO.deleteSY(like);
			System.out.println("라이크 딜리트결과: "+iResult);
		}else if(result==0){
			dResult = sunyoungDAO.insertLike(like);
			System.out.println("라이크 인서트결과: "+dResult);
		}
		
		//if(결과) delete
		
		//else if(결과 없음) insert
		
		//인서트와 딜리트 결과 둘 다 받아와서 테스트-둘 다 1이 아닌지. 둘다 1이 아니라면 에러
		if(iResult!=1&&dResult!=1){
			//error
			finalResult = false;
		}
		sunyoungDAO.selectTotalLike(commentNo);
		
		//결과를 리턴. (true/false)
			return finalResult;
	}
	
	@Override
	public boolean registerBookCart(BookCart bookCart) {
		// TODO Auto-generated method stub
		int size = sunyoungDAO.insertBookCart(bookCart);
		
		return size==1;
	}
	
	@Override
	public boolean registerWishlist(Wishlist wishlist) {
		// TODO Auto-generated method stub
		int size = sunyoungDAO.insertWishlist(wishlist);
		return size==1;
	}
	
	
}
