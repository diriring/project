package com.cgv.s1.oproduct;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.util.Pager;

@Repository
public class OproductDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.cgv.s1.oproduct.OproductDAO.";

	// oProduct list
	public List<OproductDTO> list(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "list", pager);
	}

	// oProduct Pager total
	public Long total(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "total", pager);
	}

	// oProduct detail
	public OproductDTO detail(OproductDTO oproductDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "detail", oproductDTO);
	}

	// oProduct add
	public int add(OproductDTO oproductDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "add", oproductDTO);
	}

	// oProduct delete
	public int delete(OproductDTO oproductDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "delete", oproductDTO);
	}

	// oProduct update
	public int update(OproductDTO oproductDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "update", oproductDTO);
	}

	//file add 
	public int addFile(OproductFileDTO oproductFileDTO) throws Exception{
    	 return sqlSession.insert(NAMESPACE+"addFile", oproductFileDTO);
	}
	 
	//file detail 
	public OproductFileDTO detailFile(OproductFileDTO oproductFileDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailFile", oproductFileDTO);
	}
	  
	//file list 
    public List<OproductFileDTO> listFile(OproductDTO oproductDTO) throws Exception{ 
    	return sqlSession.selectList(NAMESPACE+"listFile", oproductDTO); 
    }	 

    //file Delete
    public int deleteFile(OproductFileDTO oproductFileDTO) throws Exception{
    	return sqlSession.delete(NAMESPACE+"deleteFile", oproductFileDTO);
    }
    
    //file Deletelist(새로만든것 fileupdate 때문에)
    //public List<OproductFileDTO> listFileDelete(OproductFileDTO oproductFileDTO) throws Exception{
    //	return sqlSession.selectList(NAMESPACE+"listFileDelete", oproductFileDTO);
    //}
    
}
