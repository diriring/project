package com.cgv.s1.util;

import java.io.File;
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
	
	public boolean remove(String path, String fileName)throws Exception{
		
		path = servletContext.getRealPath(path);
		
		File file = new File(path, fileName);
		
		return file.delete();
	}
	
	public String save(MultipartFile multipartFile,String path)throws Exception{
		
		String realPath = servletContext.getRealPath(path);
		System.out.println(realPath);
		File file = new File(realPath);
		
		if(!file.exists()) {
			file.mkdir();
		}
		
		String fileName = UUID.randomUUID().toString();
		String oriName = multipartFile.getOriginalFilename();
		fileName = fileName+"_"+oriName;
		System.out.println("UUID : "+fileName);

		file = new File(file, fileName);
		FileCopyUtils.copy(multipartFile.getBytes(), file);
		
		return fileName;

	}

}