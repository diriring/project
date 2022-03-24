package com.cgv.s1.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileManager {

	@Autowired
	private ServletContext servletContext;
	
	//저장
	public String save(MultipartFile multipartFile, String path) throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		Calendar ca = Calendar.getInstance();
		long l = ca.getTimeInMillis();
		String oriName = multipartFile.getOriginalFilename();
		String fileName = l+"_"+oriName;
		
		fileName = UUID.randomUUID().toString();
		fileName = fileName + "_" + oriName;
		
		file = new File(file, fileName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;
	}
	
	//제거
	public boolean remove(String path, String fileName) throws Exception{
		path = servletContext.getRealPath(path);
		File file = new File(path, fileName);
		return file.delete();
	}
	
	
}
