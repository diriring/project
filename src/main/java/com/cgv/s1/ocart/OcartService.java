package com.cgv.s1.ocart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.util.Pager;

@Service
public class OcartService {

	@Autowired
	private OcartDAO ocartDAO;
	
	//카트 총 리스트(검색 용도)
	public List<OcartDTO> totalList(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(ocartDAO.total(pager));
		return ocartDAO.totalList(pager);
	}
	
	//카트 추가
	public int addCart(OcartDTO ocartDTO) throws Exception{
		int result = 1;
		return result;
	}
	
	
	//카트 목록(getCart)
	public List<OcartDTO> getCart(OcartDTO ocartDTO) throws Exception{
		ocartDTO.makeRow();
		ocartDTO.makeNum(ocartDAO.total(ocartDTO));
		return ocartDAO.getCart(ocartDTO);
	}

	

	
}










