package com.dreamgo.util;

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
import org.jsoup.nodes.Node;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.omg.CORBA.OBJECT_NOT_EXIST;

public class CreateData {

	public static Document doc;
	public static List<Map<String, Object>> createDATA(String url,String type){
		//type = true : detail, false : list
		
		
		//map을 담을 list 선언
		//여기서 객체생성하면
		//하나의 객체를 공유하기 때문에 검색결과가 이상해짐
		List<Map<String, Object>> list = null;
		Map<String, Object> map = null;
		try {

			//외부 URL을 통해 XML데이터를 가져옴
			doc = Jsoup.parse(new URL(url).openStream(),
					"UTF-8",
					"",
					Parser.xmlParser());
			//상세정보 데이터 일 경우
			if(type.equalsIgnoreCase("D")){			
				//학과 상세정보
				return DepDetail.getDetailData(doc);
			}else if(type.equalsIgnoreCase("J")){
				//직업 상세정보
				return JobDetail.getDetailData(doc);
			}
			
			
			//목록데이터 일 경우
						
				list = new ArrayList<Map<String,Object>>(); 
				
					//content 뽑아오기
				Elements eles = doc.select("content");

				for(Element ele : eles){
					
					//자식 노드들의 수
					 int nodeNum = ele.children().size();

					map = new HashMap<String, Object>();
					 
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
				
				/*int i = 0;
				for(Object item : list){
					System.out.println(i+"= "+item);
					i++;
				}*/
			
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
