package com.dreamgo.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class DepDetail {

	public static ArrayList<Map<String, Object>> getDetailData(Document doc){
		System.out.println("dep_detail");
		
		
		Map<String, Object> c_tags = new HashMap<String, Object>();//태그
		Map<String, Object> unChild = new HashMap<String, Object>();//자식노드없음
		Map<String, String> tags_data = null;
		ArrayList<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
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
				//자식노드가 있는 태그들
				if(dEle.children().size()>0){
					System.out.println(name+dEle.children().size());
					 /**********   필요한 데이터 뽑기  ********/
						 if(name.equals("enter_field")||
							name.equals("university")||
							name.equals("main_subject")){

							 //System.out.println("아래 for문 tag의 회전수? : "+dEle.children().size());
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
						 }else if(name.equals("chartdata")){
							 
							 /**********   차트 데이터 뽑기  ********/
							
							
							 
							 // chartData > content의 자식들 > 태그
							for(Element content_c:dEle.child(0).children()){
								tags_list = new ArrayList<Map<String,String>>();
							
								//System.out.println("태그이름 : "+content_c.tagName());
								
								//charData > content > 각 태그 의 content 태그
								for(Element tags_c : content_c.children()){
									//System.out.println("\t\t\t태그 자식 : "+tags_c.tagName());
										
										tags_data = new HashMap<String, String>();//태그의 자식 값 담기
										for(Element based : tags_c.children()){
											
											//charData > content > 각 태그 의 content 태그 > 자식들
											//System.out.println("\t\t\t\t 마지막 태그  : "+based.tagName()+" / "+based.text());
											
											tags_data.put(based.tagName(), based.text());
										}
										tags_list.add(tags_data);							
								}
								c_tags.put(content_c.tagName(), tags_list);
							}//for
							//System.out.println(c_tags);
						 }//else if
						 
				}else{
					
				//자식노드 없는 태그들
					unChild.put(name, value);
				}//dEle if
			
			}//for rele
		}//for ele
		
		//순수데이터
		//System.out.println(c_tags);
		
		//순수데이터 넘기기
		list.add(c_tags);
		list.add(unChild);
		
		return list;
	}
}
