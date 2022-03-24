package com.cgv.s1.board.review;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;
import com.cgv.s1.board.BoardDTO;

public class ReviewDAOtest extends MyJunitTest{

		@Autowired
		private ReviewDAO reviewDAO;
	
		//Insert
		@Test
		public void addTest()throws Exception{
			for(int i=0;i<100;i++) {
				ReviewDTO reviewDTO = new ReviewDTO();
				
				
				reviewDTO.setTitle("title"+i);
				reviewDTO.setWriter("writer"+i);
				reviewDTO.setContents("contents"+i);
			
				int result = reviewDAO.add(reviewDTO);
			}
			System.out.println("Insert Finish");
			//assertEquals(1, result);
		}

}
