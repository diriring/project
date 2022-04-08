package com.cgv.s1.oproduct.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.s1.oproduct.OproductFileDTO;
import com.cgv.s1.util.FileManager;


@Service
public class OproductReviewService {
	@Autowired
	private OproductReviewDAO oproductReviewDAO;
	
	@Autowired
	private FileManager fileManager;
	 
	public OproductReviewFileDTO detailFile(OproductReviewFileDTO oproductReviewFileDTO)throws Exception{
		
		return oproductReviewDAO.detailFile(oproductReviewFileDTO);
	}
	
	public List<OproductReviewDTO> list(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		
		
		return oproductReviewDAO.list(oproductReviewDTO);
	}
	
	public int add(OproductReviewDTO oproductReviewDTO, MultipartFile [] files)throws Exception{
		
		int result = oproductReviewDAO.add(oproductReviewDTO);
		System.out.println("여기까진되나 ?");
		for(int i = 0;i<files.length;i++) {
			
			if(files[i].isEmpty()) {
				continue;
			}
			
			String fileName = fileManager.save(files[i], "resources/upload/oproductReview/");
				
			OproductReviewFileDTO oproductFReviewFileDTO = new OproductReviewFileDTO();
			oproductFReviewFileDTO.setNum(oproductReviewDTO.getNum());
			oproductFReviewFileDTO.setFileName(fileName);
			oproductFReviewFileDTO.setOriName(files[i].getOriginalFilename());
			result = oproductReviewDAO.addFile(oproductFReviewFileDTO);
		}
		
		return result;
	}
	
	public int update(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		return oproductReviewDAO.update(oproductReviewDTO);
	}
	
	public int delete(OproductReviewDTO oproductReviewDTO)throws Exception{
		
		int result = oproductReviewDAO.delete(oproductReviewDTO);
		
//		List<OproductReviewFileDTO> ar = oproductReviewDAO.listFile(oproductReviewDTO);
//		if(result>0) {
//			
//			for(OproductReviewFileDTO dto : ar) {
//				boolean check = fileManager.remove("resources/upload/oproductReview/", dto.getFileName());
//				
//			}
//			
//		}
		
		return result;
	}
}
