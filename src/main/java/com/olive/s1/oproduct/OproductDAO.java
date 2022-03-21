package com.olive.s1.oproduct;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.olive.s1.util.Pager;

@Repository
public class OproductDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.olive.s1.oproduct.OproductDAO.";
	
	//oProduct list
	public List<OproductDTO> list(Pager pager) throws Exception{
		return sqlSession.selectList(NAMESPACE+"list", pager);
	}
	
	//oProduct Pager total
	public Long total(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"total", pager);
	}
	
	//oProduct detail
	public OproductDTO detail(OproductDTO oproductDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detail", oproductDTO);
	}
	
	//oProduct add
	public int add(OproductDTO oproductDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"add", oproductDTO);
	}
	
	//oProduct delete
	public int delete(OproductDTO oproductDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", oproductDTO);
	}
	
	//oProduct update
	public int update(OproductDTO oproductDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", oproductDTO);
	}

}




