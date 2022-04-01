package com.cgv.s1.board.review;

import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.s1.board.BoardDAO;
import com.cgv.s1.board.BoardService;
import com.cgv.s1.board.qna.QnaDTO;
import com.cgv.s1.util.FileManager;
import com.cgv.s1.util.Pager;
import com.cgv.s1.board.BoardDTO;
import com.cgv.s1.board.BoardFileDTO;

@Service
public class ReviewService implements BoardService {
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileManager fileManager;
	
	public BoardFileDTO detailFile(BoardFileDTO boardFileDTO)throws Exception{
		
		return reviewDAO.detailFile(boardFileDTO);
	}

	
	
	
	
	
	public int reply(ReviewDTO reviewDTO) throws Exception {
		// TODO Auto-generated method stub
		BoardDTO boardDTO = reviewDAO.detail(reviewDTO);
		ReviewDTO parent = (ReviewDTO)boardDTO;
		
		reviewDTO.setRef(parent.getRef());
		
		reviewDTO.setStep(parent.getStep()+1);
		
		reviewDTO.setDepth(parent.getDepth()+1);
		
		int result = reviewDAO.stepUpdate(parent);
		
		result = reviewDAO.reply(reviewDTO);
		
		return result;
	}





	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		
		pager.makeRow();
		
		Long totalCount = reviewDAO.total(pager);
		pager.makeNum(totalCount);
		
		List<BoardDTO> ar = reviewDAO.list(pager);
		
		return ar;
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.detail(boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		// TODO Auto-generated method stub
		int result = reviewDAO.add(boardDTO);
		System.out.println("서비스 result아래");
		//1.하드디스크 저장
		for(int i = 0;i<files.length;i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/review/");
			//2.DB저장
			ReviewFileDTO reviewFileDTO = new ReviewFileDTO();
			reviewFileDTO.setNum(boardDTO.getNum());
			System.out.println("파일num"+reviewFileDTO.getNum());
			reviewFileDTO.setFileName(fileName);
			
			System.out.println("파일name"+reviewFileDTO.getFileName());
			reviewFileDTO.setOriName(files[i].getOriginalFilename());
			
			System.out.println("오리name"+reviewFileDTO.getOriName());
			result = reviewDAO.addFile(reviewFileDTO);
			System.out.println("여기서 에런가");
		}
		
		
		return result;
	}
	
	

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.update(boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return reviewDAO.delete(boardDTO);
	}
	
	
	
}
