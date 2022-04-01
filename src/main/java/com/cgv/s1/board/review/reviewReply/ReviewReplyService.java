package com.cgv.s1.board.review.reviewReply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewReplyService {
		@Autowired
		private ReviewReplyDAO reviewReplyDAO;

		public List<ReviewReplyDTO> list(ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return reviewReplyDAO.list(reviewReplyDTO);
		}
		
		public int add (ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return reviewReplyDAO.add(reviewReplyDTO);
		}
		
		public int update (ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return reviewReplyDAO.update(reviewReplyDTO);
		}
		
		public int delete (ReviewReplyDTO reviewReplyDTO)throws Exception{
			
			return reviewReplyDAO.delete(reviewReplyDTO);
		}
}
