package com.cgv.s1.oproduct;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cgv.s1.ocart.OcartDTO;
import com.cgv.s1.util.Pager;

@Repository
public class OproductDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.cgv.s1.oproduct.OproductDAO.";

	//oProduct Type별 리스트
	public List<OproductDTO> listType(OproductTypeDTO oproductTypeDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"listType", oproductTypeDTO);
	}
	
	//total oProductType별(검색 용도) - 이게 지금 사용중인건가?
	public Long total(OproductTypeDTO oproductTypeDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "total", oproductTypeDTO);
	}
	
	//oProductType List
	public List<OproductTypeDTO> typeList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"typeList");
	}
	
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
    	//System.out.println("oproductfile : " + oproductFileDTO.getFileNum());
    	return sqlSession.delete(NAMESPACE+"deleteFile", oproductFileDTO);
    }
    
    
	//fileThumb add 
	public int addThumbFile(OproductFileThumbDTO oproductFileThumbDTO) throws Exception{
    	 return sqlSession.insert(NAMESPACE+"addThumbFile", oproductFileThumbDTO);
	}
	 
	//fileThumb detail 
	public OproductFileThumbDTO detailThumbFile(OproductFileThumbDTO oproductFileThumbDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"detailThumbFile", oproductFileThumbDTO);
	}
	  
	//fileThumb list 
    public List<OproductFileThumbDTO> listThumbFile(OproductDTO oproductDTO) throws Exception{ 
    	return sqlSession.selectList(NAMESPACE+"listThumbFile", oproductDTO); 
    }	 

    //fileThumb Delete
    public int deleteThumbFile(OproductFileThumbDTO oproductFileThumbDTO) throws Exception{
    	//System.out.println("oproductfileDTO : " + oproductFileThumbDTO.getFileNumThumb());
    	return sqlSession.delete(NAMESPACE+"deleteThumbFile", oproductFileThumbDTO);
    }
    
    
    
    
    
    //file Deletelist(새로만든것 fileupdate 때문에)
    //public List<OproductFileDTO> listFileDelete(OproductFileDTO oproductFileDTO) throws Exception{
    //	return sqlSession.selectList(NAMESPACE+"listFileDelete", oproductFileDTO);
    //}
    
}
