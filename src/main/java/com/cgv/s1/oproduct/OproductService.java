package com.cgv.s1.oproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.s1.util.FileManager;
import com.cgv.s1.util.Pager;

@Service
public class OproductService {

	@Autowired
	private OproductDAO oproductDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//oProduct list
	public List<OproductDTO> list(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(oproductDAO.total(pager));
		return oproductDAO.list(pager);
	}
	
	//oProduct detail
	public OproductDTO detail(OproductDTO oproductDTO) throws Exception{
		return oproductDAO.detail(oproductDTO);
	}
	
	//oProduct add
	public int add(OproductDTO oproductDTO, MultipartFile [] files) throws Exception{
		
		int result = oproductDAO.add(oproductDTO);
		for(int i=0; i<files.length; i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			String fileName = fileManager.save(files[i], "resources/upload/oproduct/");
			OproductFileDTO oproductFileDTO = new OproductFileDTO();
			oproductFileDTO.setProductNum(oproductDTO.getProductNum());
			oproductFileDTO.setFileName(fileName);
			oproductFileDTO.setOriName(files[i].getOriginalFilename());
			result = oproductDAO.addFile(oproductFileDTO);
		}
		return result;
	}
	
	//oProduct delete
	public int delete(OproductDTO oproductDTO) throws Exception{
		//List<OproductFileDTO> ar = oproductDAO.listFile(oproductDTO);
		int result = oproductDAO.delete(oproductDTO);
//		if(result > 0) {
//			for(OproductFileDTO dto: ar) {
//				boolean check= fileManager.remove("resources/upload/oproduct/", dto.getFileName());
//			}
//		}
		return result;
	}
	
	//oProduct update
	public int update(OproductDTO oproductDTO) throws Exception{
		return oproductDAO.update(oproductDTO);
	}
	
	
	//oProduct detailFile
	public OproductFileDTO detailFile(OproductFileDTO oproductFileDTO) throws Exception{ 
		return oproductDAO.detailFile(oproductFileDTO);
	}
	 
}




