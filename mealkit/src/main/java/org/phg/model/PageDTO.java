package org.phg.model;

import java.util.ArrayList;

public class PageDTO {
	// 현재 pageNumber
	private int pageNum;
	// 한 페이지 당 보이는 게시글 건수
	private int amount;
	
	// 전체 게시물(리뷰) 수
	private int totalCount;
	
	// 현재페이지 기준 페이저 시작페이지
	private int startPage;
	// 현재페이지 기준 페이저 끝 페이지
	private int endPage;
	// 이전버튼 여부
	private boolean prev;
	// 다음버튼 여부
	private boolean next;
	
	// 검색해서 가져올 리뷰 수(amount)만큼 가져옴
	private ArrayList<ReviewDTO> reviews;
	
	// 검색해서 가져올 이벤트 수(amount)만큼 가져옴
	private ArrayList<EventDTO> events;
	
	// 검색해서 가져올 할인항목 (amount)만큼 가져옴
	private ArrayList<CartMainDTO> discounts;
	
	// 검색해서 가져올 QnA항목 (amount)만큼 가져옴
	private ArrayList<QnADTO> qnas;
	
	
	// 생성자를 이용한 초기화
	public PageDTO(){
		this(1, 8);
	}
	public PageDTO(int pageNum, int amount){
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	// pageNum, amount, totalCount가 정해져 있을 때 나머지 변수들을 계산하는 메서드
	public void setPageMaker() {
		// startPage 설정
		startPage = (((pageNum-1)/10)*10) + 1;
		// endPage 설정		
		if(totalCount > (startPage+8)*amount){
			endPage = startPage + 9;
		}else{
			endPage = (totalCount - (startPage-1)*amount) / amount + startPage;
		}
		
		// 이전버튼 여부
		if(startPage > 1) {
			prev = true;
		}else {
			prev = false;
		}
		// 다음버튼 여부
		if(totalCount > (startPage+9)*amount) {
			next = true;
		}else {
			next = false;
		}
	}	

	
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public ArrayList<ReviewDTO> getReviews() {
		return reviews;
	}
	public void setReviews(ArrayList<ReviewDTO> reviews) {
		this.reviews = reviews;
	}
	public int gettotalCount() {
		return totalCount;
	}
	public void settotalCount(int totalCount) {
		this.totalCount = totalCount;
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
	public ArrayList<EventDTO> getEvents() {
		return events;
	}
	public void setEvents(ArrayList<EventDTO> events) {
		this.events = events;
	}
	public ArrayList<CartMainDTO> getDiscounts() {
		return discounts;
	}
	public void setDiscounts(ArrayList<CartMainDTO> discounts) {
		this.discounts = discounts;
	}
	public ArrayList<QnADTO> getQnas() {
		return qnas;
	}
	public void setQnas(ArrayList<QnADTO> qnas) {
		this.qnas = qnas;
	}
	
	
	@Override
	public String toString() {
		return "PageDTO [pageNum=" + pageNum + ", amount=" + amount + ", totalCount=" + totalCount + ", startPage="
				+ startPage + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", reviews=" + reviews
				+ ", events=" + events + ", discounts=" + discounts + ", qnas=" + qnas + "]";
	}
	
}
