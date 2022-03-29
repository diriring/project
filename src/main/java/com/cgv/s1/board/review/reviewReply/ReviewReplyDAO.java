package com.cgv.s1.board.review.reviewReply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewReplyDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "com.cgv.s1.board.review.reviewReply.ReviewReplyDAO.";
	
	
	
		public List<ReviewReplyDTO> list(ReviewReplyDTO reviewReplyDTO)throws Exception{
			return sqlSession.selectList(NAMESPACE+"list", reviewReplyDTO);
		}
		public int add(ReviewReplyDTO reviewReplyDTO)throws Exception {
			
			return sqlSession.insert(NAMESPACE+"add", reviewReplyDTO);
		}
		
		public int update(ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return sqlSession.update(NAMESPACE+"update", reviewReplyDTO);
		}
		public int delete(ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return sqlSession.delete(NAMESPACE+"delete", reviewReplyDTO);
		}



}
