package com.cgv.s1.board;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import com.cgv.s1.util.Pager;

public interface BoardService {
		
		//fileDelete
		public int fileDelete(BoardFileDTO boardFileDTO)throws Exception;
		
	
		//list
		public List<BoardDTO> list(Pager pager)throws Exception;
		
		//detail
		public BoardDTO detail(BoardDTO boardDTO)throws Exception;
		
		//add
		public int add(BoardDTO boardDTO, MultipartFile [] files)throws Exception;
		
		//update
		public int update(BoardDTO boardDTO)throws Exception;
		
		//delete
		public int delete(BoardDTO boardDTO)throws Exception;


}
