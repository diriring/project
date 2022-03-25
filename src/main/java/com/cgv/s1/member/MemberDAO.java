package com.cgv.s1.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.cgv.s1.member.MemberDAO.";
	
	public int join(MemberDTO memberDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	public MemberDTO login(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"login", memberDTO);
	}
	
	public MemberDTO mypage(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"mypage", memberDTO);
	}
	
	public int delete(MemberDTO memberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"delete", memberDTO);
	}
	
	public int update(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"update", memberDTO);
	}
	
	public int pwUpdate(MemberDTO memberDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"pwUpdate", memberDTO);
	}
	
	public int idCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"idCheck", memberDTO);
	}
	
	public int emailCheck(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"emailCheck", memberDTO);
	}
	
}
