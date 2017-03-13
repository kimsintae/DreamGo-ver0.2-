package com.sintae.util;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import org.jsoup.select.Elements;

public class CreateData {


	public static List<Map<String, String>> createDATA(Document doc){
		
		//map을 담을 list 선언
		List<Map<String, String>> list = null;
		Map<String, String> map = null;

			
			list = new ArrayList<Map<String,String>>(); 
			
			System.out.println(HttpURLConnection.HTTP_BAD_REQUEST);
			
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
		
		
		return list;
	}

}
