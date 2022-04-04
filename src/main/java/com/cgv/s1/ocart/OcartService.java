package com.cgv.s1.ocart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.oproduct.OproductDAO;
import com.cgv.s1.oproduct.OproductDTO;
import com.cgv.s1.oproduct.OproductFileThumbDTO;
import com.cgv.s1.util.Pager;

@Service
public class OcartService {

	@Autowired
	private OcartDAO ocartDAO;
	
	@Autowired
	private OproductDAO oproductDAO;
	
	//카트 수량 수정
	public int modifyAmount(OcartDTO ocartDTO) throws Exception {
		return ocartDAO.modifyAmount(ocartDTO);
	}
	
	
	
	//카트 총 리스트(검색 용도)
	public List<OcartDTO> totalList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(ocartDAO.total(pager));
		return ocartDAO.totalList(pager);
	}
	
	//카트 추가
	public int addCart(OcartDTO ocartDTO) throws Exception{
		
		//카트 데이터 체크
		
		OcartDTO checkCart = ocartDAO.checkCart(ocartDTO);
		if(checkCart != null) {
			//ajax에서 출력
			return 2;
		}
		//적용 안될시 0리턴
		return ocartDAO.addCart(ocartDTO);
	}
	
	
	//기존
	//카트 목록(getCart)(member들어왔을때 ocartDTO로 member 넘겨줌)
	public List<OcartDTO> getCart(OcartDTO ocartDTO) throws Exception{
		//System.out.println("ser come??");
		
		//paging 처리
		ocartDTO.makeRow();
		ocartDTO.makeNum(ocartDAO.total(ocartDTO));
		
		//카트 목록 가지고 오기
		List<OcartDTO> cart = ocartDAO.getCart(ocartDTO);
		
		for(OcartDTO dto : cart){
			//함수 가지고 와서 각각 적용
			dto.Cal();
			
//			//썸네일 이미지 가지고오기
			//oproduct 생성해서
			OproductDTO oproductDTO = new OproductDTO();
//			
			//productnum 값 넣어주고
			oproductDTO.setProductNum(dto.getProductNum());
			//System.out.println(oproductDTO.getProductNum());
			
//			//oproduct통해 썸네일 파일 리스트 가져오고
			List<OproductFileThumbDTO> ar = oproductDAO.listThumbFile(oproductDTO);
			//System.out.println(ar.get(0));
			
			//그걸 세팅해줌
			dto.setThumbFilesDTOs(ar);
			
		}
		
		return cart;
	}

	//결제 페이지 관련 주영 추가
	public OcartDTO detailCart(OcartDTO ocartDTO) throws Exception {
		return ocartDAO.detailCart(ocartDTO);

	}


	
}










