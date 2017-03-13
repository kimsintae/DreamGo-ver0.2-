package com.sintae.util;

public class PageMakerAjax {

	private int totalCount; // 총 게시글 수
	private int startPage; //페이지 시작 번호
	private int endPage; // 마지막 페이지 번호
	private boolean prev; // 이전
	private boolean next; // 다음
	private int thisPage; // 현재 페이지
	
	private int perPageNum;
	private int displayNum = 5; //한블럭당 페이지 수 10이면 10페이지까지 보여짐 & 게시글 수

	
	public int getThisPage() {
		return thisPage;
	}
	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
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
	
	private void calcData(){
		endPage = (int)(Math.ceil(thisPage/(double)displayNum)*displayNum);
		startPage = (endPage-displayNum)+1;
		int tempEndPage = (int)(Math.ceil(totalCount/(double)perPageNum));

		if(endPage>tempEndPage){
			endPage=tempEndPage;
		}
		
		prev = startPage==1?false:true;
		next = endPage*perPageNum>=totalCount?false:true;
	}
	
	public String getPagination(){

		StringBuffer sb = new StringBuffer();
		//이전페이지가 존재할 경우
		if(prev){
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
			sb.append("<li><span class='glyphicon glyphicon-step-forward' id='next'></span></li>");
		}
		
		return sb.toString();
	}
}
