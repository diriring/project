package com.cgv.s1.notice;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cgv.s1.MyJunitTest;

public class NoticeDAOTest extends MyJunitTest{

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	public void listTest() throws Exception{
		NoticeDTO noticeDTO = new NoticeDTO();
		
		List<NoticeDTO> ar = noticeDAO.list();
		
		
		assertNotNull(ar.get(0));
		
	}

}
