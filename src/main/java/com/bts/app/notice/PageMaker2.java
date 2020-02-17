package com.bts.app.notice;

public class PageMaker2 {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private PagingCriteria2 cri2;
	
	public PageMaker2(PagingCriteria2 cri2,int total){
		this.cri2=cri2;
		int realEnd = (int)(Math.ceil((total * 1.0) / cri2.getAmount()));
		this.endPage = (int)(Math.ceil(cri2.getPageNum() / 10.0) * 10);
		this.startPage = getEndPage()-9;
		
		if(realEnd < this.endPage) {
			this.endPage=realEnd;
		}
		
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage()>1;
		
	}
	
	public PagingCriteria2 getCri() {
		return cri2;
	}

	public void setCri(PagingCriteria2 cri2) {
		this.cri2 = cri2;
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

}
