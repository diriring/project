package com.cgv.s1.board.notice;

import java.text.SimpleDateFormat;
import java.util.Date;
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
public class NoticeService implements BoardService {
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private FileManager fileManager;
	
	
	
	
	@Override
	public int fileDelete(BoardFileDTO boardFileDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.fileDelete(boardFileDTO);
	}






	public BoardFileDTO detailFile(BoardFileDTO boardFileDTO)throws Exception{
		
		return noticeDAO.detailFile(boardFileDTO);
	}

	
	
	
	
	
	public int reply(NoticeDTO noticeDTO) throws Exception {
		// TODO Auto-generated method stub
		BoardDTO boardDTO = noticeDAO.detail(noticeDTO);
		NoticeDTO parent = (NoticeDTO)boardDTO;
		
		noticeDTO.setRef(parent.getRef());
		
		noticeDTO.setStep(parent.getStep()+1);
		
		noticeDTO.setDepth(parent.getDepth()+1);
		
		int result = noticeDAO.stepUpdate(parent);
		
		result = noticeDAO.reply(noticeDTO);
		
		return result;
	}





	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		
		
		
		
		
		pager.makeRow();
		
		Long totalCount = noticeDAO.total(pager);
		pager.makeNum(totalCount);
		
		List<BoardDTO> ar = noticeDAO.list(pager);
		
		
		
		
		return ar;
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return noticeDAO.detail(boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO, MultipartFile [] files) throws Exception {
		// TODO Auto-generated method stub
		int result = noticeDAO.add(boardDTO);
		System.out.println("????????? result??????");
		//1.??????????????? ??????
		for(int i = 0;i<files.length;i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/notice/");
			//2.DB??????
			NoticeFileDTO noticeFileDTO = new NoticeFileDTO();
			noticeFileDTO.setNum(boardDTO.getNum());
			System.out.println("??????num"+noticeFileDTO.getNum());
			noticeFileDTO.setFileName(fileName);
			
			System.out.println("??????name"+noticeFileDTO.getFileName());
			noticeFileDTO.setOriName(files[i].getOriginalFilename());
			
			System.out.println("??????name"+noticeFileDTO.getOriName());
			result = noticeDAO.addFile(noticeFileDTO);
			System.out.println("????????? ?????????");
		}
		
		
		return result;
	}
	
	

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		
		
		
		return noticeDAO.update(boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		List<BoardFileDTO> ar = noticeDAO.listFile(boardDTO);
		
		int result = noticeDAO.delete(boardDTO);
		
		if(result>0) {
			for(BoardFileDTO dto: ar) {
				boolean check = fileManager.remove("resources/upload/notice/", dto.getFileName());
			}
		}
		
		return result;
	}
	
	
	
}
