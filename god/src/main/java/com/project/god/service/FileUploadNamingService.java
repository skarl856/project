/**
 * 
 */
package com.project.god.service;

/**
 * 업로드된 파일 중복 방지를 위한  접미사 처리 
 * 
 * @author god
 *
 */
public interface FileUploadNamingService {
	
	String parseFilePostfix(int productId, String destFile);
	String getOriginalFilename(int productId, String fileName);

}