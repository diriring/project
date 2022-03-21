package com.cgv.s1.board;

import java.util.List;

import com.cgv.s1.board.review.ReviewDTO;

public interface BoardDAO {
	
	//list
	public List<BoardDTO> list ()throws Exception;
}
