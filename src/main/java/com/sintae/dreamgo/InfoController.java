package com.sintae.dreamgo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sintae.util.CreateData;
import com.sintae.util.PageMakerAjax;

@Controller
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	private static final String globalURL = 
			"http://www.career.go.kr/cnet/openapi/getOpenApi?"
			+ "apiKey=0e3a27591319ce0e97e4e3ec62077e8d&"
			+ "svcType=api&"
			+ "contentType=xml&";
	@Autowired
	ServletContext context; 
	
	
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
	
	/* ---------------------------------로직 처리------------------------------------- */
	
	
	
	
	//perform logic for school information
	@RequestMapping(value="/sch_info/search", method= RequestMethod.POST)
	public @ResponseBody Map<Object, Object> sch_search(@RequestParam("gubun") String gubun,
			@RequestParam("region") String region,
			@RequestParam(value="sch1", defaultValue="") String sch1,
			@RequestParam(value="sch2", defaultValue="") String sch2,
			@RequestParam(value="est", defaultValue="") String est,
			@RequestParam(value="thisPage", defaultValue="1") int thisPage,
			Model model){
		
		//오픈api에서 데이터를 받아올 URL 주소		
		String url = globalURL+""
				+ "svcCode=SCHOOL&"
				+ "gubun="+gubun+"&"
				+ "region="+region+"&"
				+ "sch1="+sch1+"&"
				+ "sch2="+sch2+"&"
				+ "est="+est+"&"
				+ "thisPage="+thisPage+"&"
				+ "perPage=10";
		
		logger.info(url);
		
			//데이터 뽑아오기
			List<Map<String, Object>> dataList = CreateData.createDATA(url,"");

			int totalCount = CreateData.getTotalCount();
			
			//페이징 객체 
			PageMakerAjax pka = new PageMakerAjax();
			pka.setThisPage(thisPage);
			pka.setTotalCount(totalCount==0?0:totalCount);
			
			
			
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			
			map.put("data",dataList);//데이터담기
			map.put("pka", pka);//페이징객체 넘기기
			map.put("pagination",pka.getPagination());// pagination HTML 보내기

		return map;
	}//sch_search
	
	
	
	//perform logic for department information
	@RequestMapping(value="/dep_search", method= RequestMethod.POST)
	public @ResponseBody Map<Object, Object> dep_search(@RequestParam("gubun")String gubun,
			@RequestParam("subject") String subject,
			@RequestParam(value="thisPage",defaultValue="1") int thisPage){
		
		logger.info("dep_search called!!");
	
		//url
		String url = globalURL+""
				+ "svcCode=MAJOR&"
				+ "gubun="+gubun+"&"
				+ "subject="+subject+"&"
				+ "thisPage="+thisPage+"&"
				+ "perPage=10";
		logger.info(url);

		//데이터 뽑아오기
		List<Map<String, Object>> dataList = CreateData.createDATA(url,"");
		
		//총 결과수
		int totalCount = CreateData.getTotalCount();
		
			PageMakerAjax pka = new PageMakerAjax();
			pka.setThisPage(thisPage);
			pka.setTotalCount(totalCount==0?0:totalCount);

			System.out.println("페이징 객체 ======================");
			System.out.println("startPage : "+pka.getStartPage());
			System.out.println("endPage : "+pka.getEndPage());
			System.out.println("thisPage : "+pka.getThisPage());
			System.out.println("totalCount : "+pka.getTotalCount());
			
		
			System.out.println(pka.getPagination());
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			
			map.put("data", dataList);
			map.put("pka",pka);
			map.put("pagination", pka.getPagination());
			return map;
	}
	
	
	//perform logic for department_detail
	@RequestMapping(value="/detail/{gubun}/{majorSeq}")
	public String d_detail(@PathVariable int majorSeq,
			@PathVariable String gubun,
			Model model){
				
		//url
		String url = globalURL+"svcCode=MAJOR_VIEW&"
				+ "majorSeq="+majorSeq+"&"
				+ "gubun="+gubun;
		
			logger.info(url);
			
			List<Map<String, Object>> data = CreateData.createDATA(url,"d");
			
			model.addAttribute("data",data);
			model.addAttribute("gubun", gubun);
			System.out.println("최종적으로 보내질 데이터 : " +data);
		return "/info/dep_detail";
		
	}
	

	//perform logic for job information
	@RequestMapping(value="/job_search", method= RequestMethod.POST)
	public @ResponseBody Map<String, Object> job_search(@RequestParam("gubun") String gubun,
			@RequestParam(value="pgubn",defaultValue="") String pgubn,
			@RequestParam(value="category",defaultValue="") String category,
			@RequestParam(value="thisPage",defaultValue="1") int thisPage){
		
		
		
		String url = globalURL+""
				+ "svcCode=JOB&"
				+ "gubun="+gubun+"&"
				+ "category="+category+"&"
				+ "pgubn="+pgubn+"&"
				+ "thisPage="+thisPage+"&"
				+ "perPage="+10;
		
		logger.info(url);
		logger.info("job_search page called !");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Map<String, Object>> dataList = CreateData.createDATA(url, "");
		int totalCount = CreateData.getTotalCount();
		logger.info("최종 데이터 : "+dataList);
		
		
		//페이징 객체
		PageMakerAjax pka = new PageMakerAjax();
		pka.setThisPage(thisPage);
		pka.setTotalCount(totalCount==0?0:totalCount);


		
		System.out.println("시작페이지 : "+pka.getStartPage());
		System.out.println("끝페이지 : "+pka.getEndPage());
		System.out.println("다음버튼 : "+pka.isNext());
		System.out.println("총검색수 : "+pka.getTotalCount());
		
		System.out.println("===========");
		System.out.println("페이징 : "+pka.getPagination());
		
		map.put("data", dataList);
		map.put("pka", pka);//페이징객체 넘기기
		map.put("pagination", pka.getPagination());
		
		
		//logger.info(map.toString());
		return map;
	}

	//peform logic for job_detail
	@RequestMapping(value="/detail/{jobdicseq}", method= RequestMethod.POST)
	public String job_detail(@PathVariable("jobdicseq") String jobdicSeq,Model model,
			@RequestParam("salary") String salary,
			@RequestParam("profession") String profession){
		logger.info("job_detail page called !");
		
		String url = globalURL+""
				+ "svcCode=JOB_VIEW&"
				+ "jobdicSeq="+jobdicSeq;
		
		logger.info(url);
		model.addAttribute("salary", salary);
		model.addAttribute("profession", profession);
		model.addAttribute("data",CreateData.createDATA(url, "J"));
		return "/info/job_detail";
	}
}
