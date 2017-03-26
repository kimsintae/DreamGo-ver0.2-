package com.dreamgo.util;

import javax.servlet.http.HttpServletRequest;

public class PageMaker {

	private int totalCount; // 총 게시글 수
	private int startPage; //페이지 시작 번호
	private int endPage; // 마지막 페이지 번호
	
	private int startNum;//mysql에서 사용할 필드
	private int thisPage; // 현재 페이지
	private boolean prev; // 이전
	private boolean next; // 다음
	
	private int perPageNum = 10;//한 페이지당 보여질 게시글 수
	private int displayNum = 5; //한블럭당 페이지 수 5면 5페이지까지 보여짐

	
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	
	//mysql에서 0으로 시작이면 1페이지, 10으로 시작이면 2페이지
	public int getStartNum() {
		return (thisPage-1)*displayNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	
	private void calcData(){
		endPage = (int)(Math.ceil(thisPage/(double)displayNum)*displayNum);
		startPage = (endPage-displayNum)+1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)perPageNum));
		
		
		System.out.println("endPage : "+getEndPage()+"  / "+"temEndPage : "+tempEndPage);
		
		if(endPage>tempEndPage){
			endPage=tempEndPage;
		}
		
		//시작페이지가 1이면 이전 페이지는 없음
		//시작페이지가 1이 아니면 이전페이지 있음
		prev = startPage==1?false:true;
		
		//끝페이지*보여질게시글수가 총 게시글수 이상이면 없음
		//끝페이지*보여질게시글수가 총 게시글수 미만이면 있음
		next = endPage*perPageNum>=totalCount?false:true;
	}

	//info(ajax) pagination
	public String getAjaxPagination(){

		StringBuffer sb = new StringBuffer();
		//이전페이지가 존재할 경우
		if(prev){
			System.out.println("prev:"+prev);
			sb.append("<li><span class='glyphicon glyphicon-step-backward' id='prev'></span></li>");
			sb.append("\n");
		}
		
		
 		//페이지번호
 		//현재 페이지와 i가 같으면 active를 추가해 현재페이지를 나타냄
		String spanClas=null;
		for(int i = startPage;i<=endPage;i++){			
			if(thisPage==i){
				spanClas="active";
			}else{
				spanClas="pageNum";
			}
			sb.append("<li><span class='"+spanClas+"'>"+i+"</span></li>");
			sb.append("\n");
		}
		 

		//다음페이지가 존재할 경우
		if(next&&endPage>0){
			System.out.println("next"+next);
			sb.append("<li><span class='glyphicon glyphicon-step-forward' id='next'></span></li>");
		}
		
		return sb.toString();
	}
	
	
	//board pagination
	public String getBoardPagination(HttpServletRequest request){
		
		String ctx=request.getContextPath();
		StringBuffer sb = new StringBuffer();
		//이전페이지가 존재할 경우
		if(prev){
			System.out.println("prev:"+prev);
			sb.append("<li><a href='"+ctx+"/board/list/"+(startPage-1)+"' class='glyphicon glyphicon-step-backward' id='prev'></a></li>");
			sb.append("\n");
		}
		
		
 		//페이지번호
 		//현재 페이지와 i가 같으면 active를 추가해 현재페이지를 나타냄
		String spanClas=null;
		for(int i = startPage;i<=endPage;i++){			
			if(thisPage==i){
				spanClas="active";
			}else{
				spanClas="pageNum";
			}
			sb.append("<li><a href='"+ctx+"/board/list/"+i+"' class='"+spanClas+"'>"+i+"</a></li>");
			sb.append("\n");
		}
		 

		//다음페이지가 존재할 경우
		if(next&&endPage>0){
			System.out.println("next"+next);
			sb.append("<li><a href='"+ctx+"/board/list/"+(endPage+1)+"' class='glyphicon glyphicon-step-forward' id='next'></a></li>");
		}
		
		return sb.toString();
	}
}
