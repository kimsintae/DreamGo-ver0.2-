package com.sintae.dreamgo;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;
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
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.sintae.util.CreateData;
import com.sintae.util.PageMakerAjax;

@Controller
public class InfoController {
	
	private static final Logger logger = LoggerFactory.getLogger(InfoController.class);
	private static final String APIKEY = "0e3a27591319ce0e97e4e3ec62077e8d";
	private static final String gURL = "http://www.career.go.kr/cnet/openapi/getOpenApi";
	private static final String svcType = "api";
	private static final String contentType = "xml";
	
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
		UriComponents createURL =UriComponentsBuilder.newInstance()
				.path(gURL)
				.queryParam("apiKey", APIKEY)
				.queryParam("svcType", svcType)
				.queryParam("svcCode", "SCHOOL")
				.queryParam("contentType", contentType)
				.queryParam("gubun", gubun)//구분
				.queryParam("region", region)// 지역
				.queryParam("sch1", sch1)// 학교종류
				.queryParam("sch2", sch2)// 학교유형
				.queryParam("est", est)// 설집유형
				.queryParam("thisPage", thisPage) //현재 페이지
				.queryParam("perPage", 10)//페이지당 보여질 결과수
				.build();
		String url = createURL.toString();
		logger.info(url);

	
		
		try {
			
			//xml파싱해서 객체 얻기
			Document doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
			
			//totalCount 얻기
			String totalCount=doc.select("content").select("totalCount").text();
			
			//페이징 객체 
			PageMakerAjax pka = new PageMakerAjax();
			pka.setThisPage(thisPage);
			pka.setPerPageNum(10);
			pka.setTotalCount(totalCount.isEmpty()?0:Integer.parseInt(totalCount));
			
			
			
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			map.put("data",CreateData.createDATA(doc));//데이터담기
			map.put("pka", pka);//페이징객체 넘기기
			map.put("pagination",pka.getPagination());// pagination HTML 보내기

			
			return map;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return null;
	}//sch_search
	
	
	
	//perform logic for department information
	@RequestMapping(value="/dep_search", method= RequestMethod.POST)
	public @ResponseBody Map<Object, Object> dep_search(@RequestParam("gubun")String gubun,
			@RequestParam("subject") String subject,
			@RequestParam(value="thisPage",defaultValue="1") int thisPage){
		logger.info("dep_search called!!");
		
		
		UriComponents createURL =UriComponentsBuilder.newInstance()
				.path(gURL)
				.queryParam("apiKey", APIKEY)
				.queryParam("svcType", svcType)
				.queryParam("svcCode", "MAJOR")
				.queryParam("contentType", contentType)
				.queryParam("gubun", gubun)//구분
				.queryParam("subject", subject)//계열
				.queryParam("thisPage", thisPage) //현재 페이지
				.queryParam("perPage", 10)//페이지당 보여질 결과수
				.build();
		
		String url = createURL.toString();
		logger.info(url);
		
		try {
			
			Document doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
			
			//totalCount 얻기
			String totalCount=doc.select("content").select("totalCount").text();
			
			
			PageMakerAjax pka = new PageMakerAjax();
			pka.setPerPageNum(10);
			pka.setThisPage(thisPage);
			pka.setTotalCount(totalCount.isEmpty()?0:Integer.parseInt(totalCount));

			System.out.println("페이징 객체 ======================");
			System.out.println("startPage : "+pka.getStartPage());
			System.out.println("endPage : "+pka.getEndPage());
			System.out.println("thisPage : "+pka.getThisPage());
			System.out.println("totalCount : "+pka.getTotalCount());
			
		
			System.out.println(pka.getPagination());
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			
			map.put("data", CreateData.createDATA(doc));
			map.put("pka",pka);
			map.put("pagination", pka.getPagination());
			return map;
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	//perform logic for department_detail
	@RequestMapping(value="/detail/{gubun}/{majorSeq}")
	public String d_detail(@PathVariable int majorSeq,@PathVariable String gubun){
		
		
		//url
		String url = globalURL+"svcCode=MAJOR_VIEW&"
				+ "majorSeq="+majorSeq+"&"
				+ "gubun="+gubun;
		
		logger.info(url);
		
		
		try {
			Document doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
			
			//데이터 가져오기
			System.out.println(CreateData.createDATA(doc));
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return "/info/dep_detail";
		
	}
	
	

}
