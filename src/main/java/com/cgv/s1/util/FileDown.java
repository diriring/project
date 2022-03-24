package com.cgv.s1.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.cgv.s1.file.FileDTO;

@Component
public class FileDown extends AbstractView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//System.out.println("FILE DOWN 실행?");
		FileDTO fileDTO = (FileDTO)model.get("file");
		
		String oproduct =(String)model.get("oproduct");
		
		String path = "/resources/upload/"+oproduct+"/";
		
		ServletContext sc = request.getSession().getServletContext();
		
		path = sc.getRealPath(path);
		
		File file = new File(path, fileDTO.getFileName());
		
		response.setCharacterEncoding("UTF-8");
		
		response.setContentLength((int)file.length());
		
		String fileName = URLEncoder.encode(fileDTO.getOriName(), "UTF-8");
		
		response.setHeader("Content-Disposition", "attachment;filename=\""+fileName+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		FileInputStream f1 = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		
		FileCopyUtils.copy(f1, os);
		
		os.close();
		f1.close();
		
	}
	
	
	

}
