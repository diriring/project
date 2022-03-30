package com.cgv.s1.ocart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.util.Pager;

@Repository
public class OcartDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.cgv.s1.ocart.OcartDAO.";
	
	//카트 총 리스트(검색 용도)
	public List<OcartDTO> list(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", pager);
	}
	
	//total(검색 용도)
	public Long total(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "total", pager);
	}
	
	//카트 추가
	public int addCart(OcartDTO ocartDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"addCart", ocartDTO);
	}
	
	//카트 삭제
	public int deleteCart(OcartDTO ocartDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"deleteCart", ocartDTO);
	}
	
	//카트 수량 수정
	public int modifyCount(OcartDTO ocartDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"modifyCount", ocartDTO);
	}
	
	//카트 목록
	public List<OcartDTO> getCart(OcartDTO ocartDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getCart", ocartDTO);
	}
	
	//카트 확인
	public OcartDTO checkCart(OcartDTO ocartDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"checkCart", ocartDTO);
	}
	
	//결제 페이지 관련 주영 추가
	public OcartDTO detailCart(OcartDTO ocartDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"detailCart", ocartDTO);
	}

	
}












