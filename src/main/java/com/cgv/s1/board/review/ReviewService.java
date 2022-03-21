package com.cgv.s1.board.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.board.BoardDAO;
import com.cgv.s1.board.BoardService;
import com.cgv.s1.board.BoardDTO;

@Service
public class ReviewService implements BoardService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List<BoardDTO> list() throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.list();
	}
	
}
