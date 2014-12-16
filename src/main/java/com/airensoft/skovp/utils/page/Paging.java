package com.airensoft.skovp.utils.page;

public class Paging {
	private static final int PAGE_BLOCK = 5;
	private static final int PAGE_COUNT = 20;
	private int currentPage;
	private int totalCount;
	private int totalPage;
	private int pageOfBlock;
	private int currentBlock;
	private int startRow;
	private int endRow;
	
	public Paging(int currentPage, int totalCount) {
		totalPage = pageOfBlock = currentBlock = startRow = endRow = 0;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		calulratorPaging();
	}

	private void calulratorPaging() {
		// vcase OVP는 현재 페이지 값을 0 부터 시작한다.
		currentPage 	= (currentPage == 0) ? 1 : currentPage + 1;
		totalPage 		= (totalCount % PAGE_COUNT < PAGE_COUNT) ? (totalCount / PAGE_COUNT) + 1 : totalCount / PAGE_COUNT;
		pageOfBlock 	= (totalPage % PAGE_BLOCK < PAGE_BLOCK) ? totalPage / PAGE_BLOCK + 1 : totalPage / PAGE_BLOCK;
		startRow 		= (currentPage % PAGE_BLOCK == 0) ? ((currentPage / PAGE_BLOCK - 1) * PAGE_BLOCK + 1) : ((currentPage / PAGE_BLOCK) * PAGE_BLOCK + 1);
		currentBlock	= startRow/5 + 1;
		int endTemp 	= (currentPage % PAGE_BLOCK == 0) ? ((currentPage / PAGE_BLOCK) * PAGE_BLOCK) : ((currentPage / PAGE_BLOCK + 1) * PAGE_BLOCK);
		endRow 			= (endTemp * PAGE_COUNT > totalCount) ? totalPage : endTemp;
		
	}


	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageOfBlock() {
		return pageOfBlock;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}

	public void setPageOfBlock(int pageOfBlock) {
		this.pageOfBlock = pageOfBlock;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public static int getPageBlock() {
		return PAGE_BLOCK;
	}

	public static int getPageCount() {
		return PAGE_COUNT;
	}

	@Override
	public String toString() {
		StringBuffer stb = new StringBuffer();
		stb.append("\r\n====== paging Info ======\r\n");
		stb.append("currentPage: " + getCurrentPage() + "\r\n");
		stb.append("totalCount: " + getTotalCount() + "\r\n");
		stb.append("totalPage: " + getTotalPage() + "\r\n");
		stb.append("pageOfBlock: " + getPageOfBlock() + "\r\n");
		stb.append("currentBlock: " + getCurrentBlock() + "\r\n");
		stb.append("startRow: " + getStartRow() + "\r\n");
		stb.append("endRow: " + getEndRow() + "\r\n");
		stb.append("==============================\r\n");
		return stb.toString();
	}
}
