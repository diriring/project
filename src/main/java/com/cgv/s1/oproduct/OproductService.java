package com.cgv.s1.oproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.order.OrderDTO;
import com.cgv.s1.util.FileManager;
import com.cgv.s1.util.Pager;

@Service
public class OproductService {

	@Autowired
	private OproductDAO oproductDAO;
	
	@Autowired
	private FileManager fileManager;
	
	//oProduct Type별 출력 list(페이지별도)
	public List<OproductDTO> listType(OproductTypeDTO oproductTypeDTO) throws Exception{
		oproductTypeDTO.makeRow();
		oproductTypeDTO.makeNum(oproductDAO.totalType(oproductTypeDTO));
		return oproductDAO.listType(oproductTypeDTO);
	}
	
	
	//oProductType list
	public List<OproductTypeDTO> typeList() throws Exception{
		return oproductDAO.typeList();
	}
	
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
	public int add(OproductDTO oproductDTO, MultipartFile [] files, MultipartFile photo) throws Exception{
		
		int result = oproductDAO.add(oproductDTO);
		
		
		//썸네일
		OproductFileThumbDTO oproductFileThumbDTO = new OproductFileThumbDTO();
		//1. 파일을 HDD에 저장
		String fileName1 = fileManager.save(photo, "resources/upload/oproduct/thumbnail/");
		
		//2. 정보를 DB에 저장
		oproductFileThumbDTO.setProductNum(oproductDTO.getProductNum());
		oproductFileThumbDTO.setFileNameThumb(fileName1);
		oproductFileThumbDTO.setOriNameThumb(photo.getOriginalFilename());
		result = oproductDAO.addThumbFile(oproductFileThumbDTO);

		//디테일
		for(int i=0; i<files.length; i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			OproductFileDTO oproductFileDTO = new OproductFileDTO();
			
			String fileName = fileManager.save(files[i], "resources/upload/oproduct/");
			
			oproductFileDTO.setProductNum(oproductDTO.getProductNum());
			oproductFileDTO.setFileName(fileName);
			oproductFileDTO.setOriName(files[i].getOriginalFilename());
			
			//System.out.println(oproductFileDTO.getFileNameThumb());
			
//			//이 코드 맞는듯 1번만 생성(썸네일 따로만들어야 할듯 인생 포기)
//			if(oproductFileDTO.getFileNameThumb() == null ) {
//				//일단 할때마다 같은 파일 넣는거로 만듬(null값 안생기게 하려고)
//				String fileNameThumb = fileManager.save(photo, "resources/upload/oproduct/thumbnail/");
//				oproductFileDTO.setFileNameThumb(fileNameThumb);
//				oproductFileDTO.setOriNameThumb(photo.getOriginalFilename());
//			}		
			
			result = oproductDAO.addFile(oproductFileDTO);
		}
		

		return result;
		
	}
	
	//oProduct delete
	public int delete(OproductDTO oproductDTO) throws Exception{
		List<OproductFileDTO> ar = oproductDAO.listFile(oproductDTO);
		List<OproductFileThumbDTO> art = oproductDAO.listThumbFile(oproductDTO);
		
		int result = oproductDAO.delete(oproductDTO);
		if(result > 0) {
			for(OproductFileDTO dto: ar) {
				boolean check= fileManager.remove("resources/upload/oproduct/", dto.getFileName());
			}
			for(OproductFileThumbDTO dto: art) {
				boolean check1= fileManager.remove("resources/upload/oproduct/thumbnail/", dto.getFileNameThumb());
			}
		}
		return result;
	}
	
	//oProduct update
	public int update(OproductDTO oproductDTO, MultipartFile [] files, MultipartFile photo) throws Exception{
		int result = oproductDAO.update(oproductDTO);
		
		//디테일
		for(int i=0; i<files.length; i++) {
			if(files[i].isEmpty()) {
				continue;
			}
			OproductFileDTO oproductFileDTO = new OproductFileDTO();
			String fileName = fileManager.save(files[i], "resources/upload/oproduct/");
			
			oproductFileDTO.setProductNum(oproductDTO.getProductNum());
			oproductFileDTO.setFileName(fileName);
			oproductFileDTO.setOriName(files[i].getOriginalFilename());

			result = oproductDAO.addFile(oproductFileDTO);
		}
		
		if(photo == null) {
			return result;
		}else {
			//썸네일
			OproductFileThumbDTO oproductFileThumbDTO = new OproductFileThumbDTO();
			//1. 파일을 HDD에 저장
			String fileName1 = fileManager.save(photo, "resources/upload/oproduct/thumbnail/");
			
			//2. 정보를 DB에 저장
			oproductFileThumbDTO.setProductNum(oproductDTO.getProductNum());
			oproductFileThumbDTO.setFileNameThumb(fileName1);
			oproductFileThumbDTO.setOriNameThumb(photo.getOriginalFilename());
			result = oproductDAO.addThumbFile(oproductFileThumbDTO);

		}
		return result;
	}
	
	
	//oProduct detailFile
	public OproductFileDTO detailFile(OproductFileDTO oproductFileDTO) throws Exception{ 
		return oproductDAO.detailFile(oproductFileDTO);
	}
	 
	//oProduct deleteFile(ajax 작동시 진행)
	public int deleteFile(OproductFileDTO oproductFileDTO, OproductDTO oproductDTO) throws Exception{
		//HDD에서 없애기 ++
		List<OproductFileDTO> ar = oproductDAO.listFile(oproductDTO);
		int result = oproductDAO.deleteFile(oproductFileDTO);
		//System.out.println("deleteFile: " + result);
		if(result > 0) {
			for(OproductFileDTO dto: ar) {
				if(dto.getFileName().equals(oproductFileDTO.getFileName())) {
					boolean check= fileManager.remove("resources/upload/oproduct/", dto.getFileName());
				}
			}

		}
		return result;
	}
	
	
	//oProduct deleteFileThumb(ajax 작동시 진행)
	public int deleteFileThumb(OproductFileThumbDTO oproductFileThumbDTO, OproductDTO oproductDTO) throws Exception{
		//System.out.println(oproductFileThumbDTO.getFileNameThumb());
		//HDD에서 없애기 ++
		List<OproductFileThumbDTO> ar = oproductDAO.listThumbFile(oproductDTO);
		int result = oproductDAO.deleteThumbFile(oproductFileThumbDTO);
		//System.out.println("deleteFileDTO: " + result);
		if(result > 0) {
			for(OproductFileThumbDTO dto: ar) {
				if(dto.getFileNameThumb().equals(oproductFileThumbDTO.getFileNameThumb())) {
					boolean check= fileManager.remove("resources/upload/oproduct/thumbnail/", dto.getFileNameThumb());
				}
			}
		}
		return result;
	}
	
	//주문 조회 관련 주영 추가
	public List<OproductDTO> productCart(OrderDTO orderDTO) throws Exception {
		return oproductDAO.productCart(orderDTO);
	}
	
	//주문 결제 시 재고/판매수 변경
	public int stockAdd(OcartDTO ocartDTO) throws Exception {
		return oproductDAO.stockAdd(ocartDTO);
	}
	
	public int stockSubtract(OcartDTO ocartDTO) throws Exception {
		return oproductDAO.stockSubtract(ocartDTO);
	}
	
	public int saleAdd(OcartDTO ocartDTO) throws Exception {
		return oproductDAO.saleAdd(ocartDTO);
	}
	
	public int saleSubtract(OcartDTO ocartDTO) throws Exception {
		return oproductDAO.saleSubtract(ocartDTO);
	}
	
	//주문 결제 시 재고/판매수 변경(0408 재석 만들어보는중)
	public int stockAdd(int productAmount) throws Exception {
		return oproductDAO.stockAdd(productAmount);
	}
	
	public int stockSubtract(int productAmount) throws Exception {
		return oproductDAO.stockSubtract(productAmount);
	}
	
	public int saleAdd(int productAmount) throws Exception {
		return oproductDAO.saleAdd(productAmount);
	}
	
	public int saleSubtract(int productAmount) throws Exception {
		return oproductDAO.saleSubtract(productAmount);
	}
	

}




