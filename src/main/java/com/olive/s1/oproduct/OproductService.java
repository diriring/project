package com.olive.s1.oproduct;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.olive.s1.util.Pager;

@Service
public class OproductService {

	@Autowired
	private OproductDAO oproductDAO;
	
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
	public int add(OproductDTO oproductDTO) throws Exception{
		return oproductDAO.add(oproductDTO);
	}
	
	//oProduct delete
	public int delete(OproductDTO oproductDTO) throws Exception{
		return oproductDAO.delete(oproductDTO);
	}
	
	//oProduct update
	public int update(OproductDTO oproductDTO) throws Exception{
		return oproductDAO.update(oproductDTO);
	}
	
}




