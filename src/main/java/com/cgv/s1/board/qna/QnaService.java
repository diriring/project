package com.cgv.s1.board.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.s1.board.BoardDTO;
import com.cgv.s1.board.BoardFileDTO;
import com.cgv.s1.board.BoardService;
import com.cgv.s1.util.FileManager;
import com.cgv.s1.util.Pager;

@Service
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileManager fileManager;
	
	public BoardFileDTO detailFile(BoardFileDTO boardFileDTO)throws Exception{
		
		return qnaDAO.detailFile(boardFileDTO);
	}

	@Override
	public List<BoardDTO> list(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		pager.makeRow();
		Long totalCount = qnaDAO.total(pager);
		pager.makeNum(totalCount);
		
		List<BoardDTO> ar = qnaDAO.list(pager);
		
		return ar;
	}

	
	public int reply(QnaDTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		BoardDTO boardDTO = qnaDAO.detail(qnaDTO);
		QnaDTO parent = (QnaDTO)boardDTO;
		
		qnaDTO.setRef(parent.getRef());
		
		qnaDTO.setStep(parent.getStep()+1);
		
		qnaDTO.setDepth(parent.getDepth()+1);
		
		int result = qnaDAO.stepUpdate(parent);
		
		result = qnaDAO.reply(qnaDTO);
		return result;
	}

	@Override
	public BoardDTO detail(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.detail(boardDTO);
	}

	@Override
	public int add(BoardDTO boardDTO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		int result = qnaDAO.add(boardDTO);
		
		for(int i = 0;i<files.length;i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/qna/");
			
			QnaFileDTO qnaFileDTO = new QnaFileDTO();
			
			qnaFileDTO.setNum(boardDTO.getNum());
			qnaFileDTO.setFileName(fileName);
			qnaFileDTO.setOriName(files[i].getOriginalFilename());
			
			result = qnaDAO.addFile(qnaFileDTO);
		
		}
		
		return result;
	}

	@Override
	public int update(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.update(boardDTO);
	}

	@Override
	public int delete(BoardDTO boardDTO) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.delete(boardDTO);
	}
	
	
	
}
