package com.sintae.util;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;

public class CreateData {

	public static Document doc;
	public static List<Map<String, String>> createDATA(String url){
		
		//map을 담을 list 선언
		List<Map<String, String>> list = null;
		Map<String, String> map = null;
		try {
			
			
			//외부 URL을 통해 XML데이터를 가져옴
			doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
				
				list = new ArrayList<Map<String,String>>(); 
				
					//content 뽑아오기
				Elements eles = doc.select("content");
				
				for(Element ele : eles){
					
					//자식 노드들의 수
					 int nodeNum = ele.children().size();

					map = new HashMap<String, String>();
					 
					//content의 자식 노드수만큼 for문을 돌림
					 for(int i = 0 ; i < nodeNum ; i++){		
							 //데이터 담기
						 String value= ele.child(i).text();
						 String name = ele.child(i).tagName();
						 
						 //값이 null일 경우 빈칸으로 넣기
						 if(value.equals("null")){
							 value="";
						 }
						 map.put(name, value);
						 
					 }
					
					list.add(map);
					 
				}//for
				

				System.out.println("담겨진 값들 : "+list);
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		
		return list;
	}
	
	public static int getTotalCount(){
		return Integer.parseInt(doc.select("content").select("totalCount").text());
	}

}
