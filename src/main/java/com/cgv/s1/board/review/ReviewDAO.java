package com.cgv.s1.board.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.board.BoardDAO;
import com.cgv.s1.board.BoardDTO;
@Repository
public class ReviewDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.cgv.s1.board.review.ReviewDAO.";

	@Override
	public List<BoardDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"list");
	}
	
	
}
