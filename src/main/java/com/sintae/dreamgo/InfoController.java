package com.sintae.dreamgo;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public @ResponseBody Map<Object, Object> sch_search(@RequestParam("gubun") String gubun,
			@RequestParam("region") String region,
			@RequestParam(value="sch1", defaultValue="") String sch1,
			@RequestParam(value="sch2", defaultValue="") String sch2,
			@RequestParam(value="est", defaultValue="") String est,
			@RequestParam(value="thisPage", defaultValue="1") int thisPage,
			Model model){
		
		//오픈api에서 데이터를 받아올 URL 주소
		UriComponents createURL =UriComponentsBuilder.newInstance()
				.path("http://www.career.go.kr/cnet/openapi/getOpenApi")
				.queryParam("apiKey", APIKEY)
				.queryParam("svcType", "api")
				.queryParam("svcCode", "SCHOOL")
				.queryParam("contentType", "xml")
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

		//xml 파싱
		
		try {
			
			Document doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
			String totalCount=doc.select("content").select("totalCount").text();
			PageMakerAjax pka = new PageMakerAjax();
			pka.setThisPage(thisPage);
			pka.setPerPageNum(10);
			pka.setTotalCount(totalCount.isEmpty()?0:Integer.parseInt(totalCount));
			
			model.addAttribute("pka", pka);
			
			Map<Object, Object> map = new HashMap<Object, Object>();
			
			map.put("data",CreateData.createDATA(doc));
			map.put("pka", pka);
			map.put("pagination",pka.getPagination());

			
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

}
