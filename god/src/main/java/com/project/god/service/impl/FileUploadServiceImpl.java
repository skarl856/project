/**
 * 
 */
package com.project.god.service.impl;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.god.domain.FileVO;
import com.project.god.service.FileUploadNamingService;
import com.project.god.service.FileUploadService;

import lombok.extern.slf4j.Slf4j;

/**
 * FileUploadService Impl
 * 
 * @author god
 *
 */
@Service
@Slf4j
public class FileUploadServiceImpl implements FileUploadService {
	
	@Autowired
	private FileSystemResource uploadDirResource; // 업로드 파일 처리
	
	@Autowired
	private FileUploadNamingService fileNamingSvc;

	@Override
	public FileVO storeUploadFile(int productId, MultipartFile file) {
		
		log.info(" 첨부 파일 저장 서비스 ");
		
		FileOutputStream fos = null;
		String fileName = "";
		FileVO fileVO = new FileVO();
		String result = "파일 저장에 성공하였습니다. ";
		
		// 업로드 파일 처리
		if (file.isEmpty() || file == null) {
			
			 result = "첨부 파일이 없습니다. ";
			 log.debug(result);
		
		} else { // 파일 유효성 점검
		   
		     fileName = file.getOriginalFilename();
		     
		     log.info(" 신규 글번호 : {}", productId);
		     
		     try {
	    	 	// 업로드 파일 형식 변환(시작) : 추가
				fileName = fileNamingSvc.parseFilePostfix(productId, fileName);
				log.info(" 실제 업로드 파일명 : {}", fileName);
				// 업로드 파일 형식 변환(끝) : 추가
	    	 
	    	 	byte[] bytes = file.getBytes();
	   
	            File outFileName = new File(uploadDirResource.getPath() + fileName);
	            fos = new FileOutputStream(outFileName);
	             
	            fos.write(bytes);
		         
		     } catch (IOException e) {
		    	 
		    	 result = "파일 처리중 오류가 발생하였습니다.";
		         log.info(result);
		         e.printStackTrace();
		         		        		 
		     } finally { // 자원 반납
		           
				 try {    
			       if (fos!=null) fos.close();
				       
				 } catch (IOException e) {
					 result = "파일 처리중 오류가 발생하였습니다. ";
					 log.info(" FileUploadService storeUploadFile IOE : " + result);
				     e.printStackTrace();
				 }
		     }
		     
		}
		// fileVO.setMsg(result);
		// fileVO.setFileName(fileName);
		
		return fileVO;
	}
}