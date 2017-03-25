package com.dreamgo.util;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class UploadUtil {

	private static String uploadPath = "C:\\Users\\kim\\Desktop\\workspace\\DreamGo\\src\\main\\webapp\\resources\\upload";
	public static String upload(MultipartFile profile)throws Exception{
		System.out.println(uploadPath);
		//파일이름의 중복을 피하기 위한 고유키값 생성 
		UUID uKey = UUID.randomUUID();
		
		//고유한 키값과 파일이름으로 저장될 파일명 생성
		String savedFileName = uKey.toString()+"_"+profile.getOriginalFilename();
		
		//경로와 파일
		File target = new File(uploadPath, savedFileName);
		//파일 실제 업로드
		FileCopyUtils.copy(profile.getBytes(), target);
		
		
		System.out.println("저장될 파일 이름 : "+savedFileName);
		
		return savedFileName;
	}
	
	
	
}
