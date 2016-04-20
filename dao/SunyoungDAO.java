package com.wiring.bnn.dao;

import java.util.List;

import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Comment;
import com.wiring.bnn.vo.Like;
import com.wiring.bnn.vo.Report;
import com.wiring.bnn.vo.Wishlist;

public interface SunyoungDAO {
	
	//책 한 권 정보 뿌리긔
	public Book selectOne(int no);
	
	//코멘트 리스트 뿌리긔
	public List<Comment> selectList(Comment comment);
	
	//코멘트 갯수 세긔
	public int selectTotal(int no);
	
	//코멘트 쓰긔
	public int insertComment(Comment comment);
	
	//코멘트 지우기
	public int delete(Comment comment);
	
	//코멘트 전체갯수, 전제 더한 수 구하기
	public Comment selectCount(Comment comment);
	
	//코멘트 갯수 북에 업데이트
	public int updateRating(Book book);
	
	//like많이 받은 1등 코멘트 구하기
	public Comment selectTop(int no);
	
	//좋아요 되어있는지 확인
	public int selectCheckSY(Like like);
	
	//좋아요 누르기
	public int insertLike(Like like);
	
	//좋아요 삭제하기
	public int deleteSY(Like like);
	
	//좋아요 갯수 구하기
	public int selectTotalLike(int commentNo);
	
	//신고버튼 누를시
	public int insertReport(Report report);
	
	//장바구니에 넣기
	public int insertBookCart(BookCart bookCart);
	
	//위시리스트에 넣기
	public int insertWishlist(Wishlist wishlist);

}
