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
import org.jsoup.nodes.Node;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.omg.CORBA.OBJECT_NOT_EXIST;

public class CreateData {

	public static Document doc;
	public static List<Map<String, Object>> createDATA(String url,boolean type){
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
			if(type){
				System.out.println("detail");
				
				
				Map<String, Object> c_tags = new HashMap<String, Object>();//태그
				Map<String, Object> unChild = new HashMap<String, Object>();//자식노드없음
				Map<String, String> tags_data = null;
				list = new ArrayList<Map<String,Object>>();
				Elements eles = doc.select("datasearch>content");
				
				//상세정보 받아서 넘길 list
				List<Map<String, String>> tags_list = null;
				
				System.out.println("------------------------");		
				//dataSearch의 자식들
				for(Element ele : eles){
					
					//content의 자식들
					for(Element dEle:ele.children()){
						String name = dEle.tagName();
						String value = dEle.text();												
						System.out.println(name);
						//자식노드가 있는 태그들
						if(dEle.children().size()>0){
							
							 /**********   필요한 데이터 뽑기  ********/
								 if(name.equals("enter_field")||
									name.equals("university")||
									name.equals("main_subject")){
									 
									 
									System.out.println("아래 for문 tag의 회전수? : "+dEle.children().size());
									tags_list = new ArrayList<Map<String,String>>();
									//태그들의 자식수만큼 회전
									for(Element ddEle :dEle.children()){
										tags_data = new HashMap<String, String>();//태그의 자식 값 담기
										
										//자손 content 뽑기
										
										 for(Element dddEle : ddEle.children()){	
		 
											String dddname = dddEle.tagName();
											String dddvalue = dddEle.text();

											
											tags_data.put(dddname, dddvalue);
																
										 }//for
										 tags_list.add(tags_data);
										 //map에 담은 content의 내용을 list에 담기
										 
									}//for
									
									c_tags.put(dEle.tagName(), tags_list);
									
									
									
								 }else{
									 
									 /**********   차트 데이터 뽑기  ********/
									
									 

									 
								 } //dEle if
								 
						}else{
							
						//자식노드 없는 태그들
							unChild.put(name, value);
						}//dEle if
					
					}//for rele
				}//for ele
				
				//순수데이터
				System.out.println(c_tags);
				
				//순수데이터 넘기기
				list.add(c_tags);
				list.add(unChild);
				
				return list;
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
			
				System.out.println(list);
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
