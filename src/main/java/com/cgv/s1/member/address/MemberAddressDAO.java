package com.cgv.s1.member.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.member.MemberDTO;
import com.cgv.s1.util.Pager;

@Repository
public class MemberAddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.member.address.MemberAddressDAO.";
	
	public List<MemberAddressDTO> listPage(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE+"listPage", pager);
	}
	
	public Long total(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total", memberDTO);
	}
	
	public List<MemberAddressDTO> list(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"list", memberDTO);
	}
	
	public MemberAddressDTO addressDetail(MemberAddressDTO memberAddressDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"addressDetail", memberAddressDTO);
	}
	
	public int add(MemberAddressDTO memberAddressDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"add", memberAddressDTO);
	}
	
	public int delete(MemberAddressDTO memberAddressDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", memberAddressDTO);
	}
	
	public int update(MemberAddressDTO memberAddressDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", memberAddressDTO);
	}
		
}
