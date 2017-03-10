package com.sintae.dreamgo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	private static final String APIKEY = "0e3a27591319ce0e97e4e3ec62077e8d";
	
	//intro !
	@RequestMapping("/intro")
	public String intro(){
		
		logger.info("intro page called!");
		
		return "intro";
	}
	
	//job_info !!
	@RequestMapping("/info/job_info")
	public String job_info(){
		logger.info("job_info page called!");
		return "/info/job_info";
	}
	
	//dep_info !!
	@RequestMapping("/info/dep_info")
	public String dep_info(){
		logger.info("dep_info page called!");
		return "/info/dep_info";
	}
	
	//sch_info !!
	@RequestMapping("/info/sch_info")
	public String sch_info(){
		logger.info("sch_info page called!");
		return "/info/sch_info";
	}
	
	//apti_test !!
	@RequestMapping("/aptitudeTest/apti_test")
	public String apti_test(){
		logger.info("apti_test page called!");
		return "/aptitudeTest/apti_test";
	}
	
	//job_detail !!
	@RequestMapping("/info/job_detail")
	public String job_detail(){
		logger.info("job_detail page called!");
		return "/info/job_detail";
	}
	
	//dep_detail !!
	@RequestMapping("/info/dep_detail")
	public String dep_detail(){
		logger.info("dep_detail page called!");
		return "/info/dep_detail";
	}
	
	
	
	/* ---------------------------------로직 처리------------------------------------- */
	
	
	
	
	//perform logic for school information
	@RequestMapping(value="/sch_info/search", method= RequestMethod.POST)
	public void sch_search(@RequestParam("gubun") String gubun){
		
		
		logger.info("sch_search() is called " );
		logger.info("넘어온 gubun : "+gubun);
		
		
	}

}
