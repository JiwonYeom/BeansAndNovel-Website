package com.wiring.bnn.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.wiring.bnn.vo.Book;
import com.wiring.bnn.vo.BookCart;
import com.wiring.bnn.vo.Comment;
import com.wiring.bnn.vo.Like;
import com.wiring.bnn.vo.Report;
import com.wiring.bnn.vo.Wishlist;

public class SunyoungDAOImpl implements SunyoungDAO {

	private SqlSession session;
	
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public Book selectOne(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("books.selectOneSY", no);
	}
	
	@Override
	public List<Comment> selectList(Comment comment) {
		// TODO Auto-generated method stub
		return session.selectList("comments.selectListSY", comment);
	}
	
	@Override
	public int selectTotal(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectTotalSY", no);
	}
	
	@Override
	public int insertComment(Comment comment) {
		// TODO Auto-generated method stub
		return session.insert("comments.insertSY", comment);
	}
	
	@Override
	public int delete(Comment comment) {
		// TODO Auto-generated method stub
		return session.delete("comments.deleteSY", comment);
	}
	
	@Override
	public int insertReport(Report report) {
		// TODO Auto-generated method stub
		return session.insert("reports.insertSY", report);
	}
	
	@Override
	public Comment selectCount(Comment comment) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectCountSY", comment);
	}
	
	@Override
	public int updateRating(Book book) {
		// TODO Auto-generated method stub
		return session.update("books.updateRatingSY", book);
	}
	
	@Override
	public Comment selectTop(int no) {
		// TODO Auto-generated method stub
		return session.selectOne("comments.selectTopSY", no);
	}
	
	@Override
	public int selectCheckSY(Like like) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectCheckSY", like);
	}
	@Override
	public int deleteSY(Like like) {
		// TODO Auto-generated method stub
		return session.delete("likes.deleteSY",like);
	}
	
	
	@Override
	public int insertLike(Like like) {
		// TODO Auto-generated method stub
		return session.insert("likes.insertSY", like);
	}
	
	@Override
	public int insertBookCart(BookCart bookCart) {
		// TODO Auto-generated method stub
		return session.insert("bookCart.insertSY", bookCart);
	}
	
	@Override
	public int insertWishlist(Wishlist wishlist) {
		// TODO Auto-generated method stub
		return session.insert("wishlists.insertSY", wishlist);
	}
	
	@Override
	public int selectTotalLike(int commentNo) {
		// TODO Auto-generated method stub
		return session.selectOne("likes.selectTotalSY", commentNo);
	}
	
}
