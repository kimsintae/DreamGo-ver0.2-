package com.sintae.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JobDetail {

	public static List<Map<String, Object>> getDetailData(Document doc){
		
		
		//최종적으로 담아서 보낼 리스트
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();

		Map<String, Object> data = new HashMap<String, Object>();
		
		System.out.println("job_detail");	
		
		data.put("summary", doc.select("summary").text());
		data.put("aptitude", doc.select("aptitude").text());
		data.put("ability", doc.select("ability").text());
		data.put("empway", doc.select("empway").text());
		data.put("employment", doc.select("employment").text());
		data.put("salery", doc.select("salery").text());
		data.put("possibility", doc.select("possibility").text());
		data.put("preparation", doc.select("preparation").text());
		data.put("training", doc.select("training").text());
		data.put("certification", doc.select("certification").text());
		data.put("capacity", doc.select("capacity").text());
		data.put("similarjob", doc.select("similarjob").text());
		data.put("job", doc.select("job").text());

		Elements chart = doc.select("chart_item_list content");
		Elements major = doc.select("major content");

		data.put("chart",getList(chart));
		data.put("major",getList(major));
		
		list.add(data);
		
		
		System.out.println(list);
		return list;
	}//getDetailData
	
	
	public static List<Map<String, Object>> getList(Elements root){
		
		//content자식값들 담을 map
		Map<String, Object> chart_item_list=null;
		
		//content 담을 list
		List<Map<String, Object>> content = new ArrayList<Map<String,Object>>();
		
		for(Element ele:root){
			chart_item_list = new HashMap<String, Object>();
			
			for(int i=0;i<ele.children().size();i++){
				//System.out.println(ele.child(i).tagName()+" / "+ele.child(i).text());
				chart_item_list.put(ele.child(i).tagName(),ele.child(i).text());
			};			
			content.add(chart_item_list);
			System.out.println("리스트 추가");
			System.out.println("=============");
		}
			
	
		return content;
	}//getList
}
