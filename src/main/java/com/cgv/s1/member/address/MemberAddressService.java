package com.cgv.s1.member.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.util.Pager;

@Service
public class MemberAddressService {
	
	@Autowired
	private MemberAddressDAO memberAddressDAO;
	
	public List<MemberAddressDTO> listPage(MemberDTO memberDTO, Pager pager) throws Exception {
		pager.makeRow();
		pager.makeNum(memberAddressDAO.total(memberDTO));
		pager.setId(memberDTO.getId());
		return memberAddressDAO.listPage(pager);
	}
	
	public List<MemberAddressDTO> list(MemberDTO memberDTO) throws Exception {
		return memberAddressDAO.list(memberDTO);
	}
	
	public MemberAddressDTO addressDetail(MemberAddressDTO memberAddressDTO) throws Exception {
		return memberAddressDAO.addressDetail(memberAddressDTO);
	}
	
	public int add(MemberAddressDTO memberAddressDTO) throws Exception {
		return memberAddressDAO.add(memberAddressDTO);
	}
	
	public int delete(MemberAddressDTO memberAddressDTO) throws Exception {
		return memberAddressDAO.delete(memberAddressDTO);
	}
	
	public int update(MemberAddressDTO memberAddressDTO) throws Exception {
		return memberAddressDAO.update(memberAddressDTO);
	}

}
