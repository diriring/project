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
	public List<OcartDTO> list(Pager pager) throws Exception{
		pager.makeRow();
		pager.makeNum(ocartDAO.total(pager));
		return ocartDAO.list(pager);
	}
	
	//결제 페이지 관련 주영 추가
	public OcartDTO detailCart(OcartDTO ocartDTO) throws Exception {
		return ocartDAO.detailCart(ocartDTO);
	}


	
}










