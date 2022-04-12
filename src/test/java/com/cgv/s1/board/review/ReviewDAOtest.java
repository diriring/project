package com.cgv.s1.board.review;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;
import com.cgv.s1.board.BoardDTO;
import com.cgv.s1.board.notice.NoticeDAO;
import com.cgv.s1.board.notice.NoticeDTO;

public class ReviewDAOtest extends MyJunitTest{

		@Autowired
		private NoticeDAO reviewDAO;
	
		//Insert
		@Test
		public void addTest()throws Exception{
			for(int i=0;i<100;i++) {
				NoticeDTO reviewDTO = new NoticeDTO();
				
				
				reviewDTO.setTitle("title"+i);
				reviewDTO.setWriter("writer"+i);
				reviewDTO.setContents("contents"+i);
			
				int result = reviewDAO.add(reviewDTO);
			}
			System.out.println("Insert Finish");
			//assertEquals(1, result);
		}

}
