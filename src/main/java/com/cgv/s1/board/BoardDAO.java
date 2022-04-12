package com.cgv.s1.board;

import java.util.List;

import com.cgv.s1.board.notice.NoticeDTO;
import com.cgv.s1.util.Pager;

public interface BoardDAO {
	
	public int reply(BoardDTO boardDTO)throws Exception;
	
	public int stepUpdate(BoardDTO boardDTO)throws Exception;
	
	//addFile
	public int addFile(BoardFileDTO boardFileDTO)throws Exception;
	//list
	public List<BoardDTO> list (Pager pager)throws Exception;
	//total
	public Long total(Pager pager)throws Exception;
	
	//detail
	public BoardDTO detail(BoardDTO boardDTO) throws Exception;
	//add
	public int add(BoardDTO boardDTO) throws Exception;
	//update
	public int update(BoardDTO boardDTO) throws Exception;
	
	//delete
	public int delete(BoardDTO boardDTO)throws Exception;
	
}
