package org.huamuzhen.oa.domain.entity;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

public class Pagination implements Pageable {
	/**
	 * If there is to many pages will show the pages as group by this number set
	 */
	private final int PAGE_GROUP_PAGES = 5;
	private int total;
	private int currentPage = 1;
	private int pageSize = 15;
	private int pages;
	private int begin;
	private int end;
	
	public int getTotal() {
		return this.total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPages() {
		if (pages == 0) {
			caculate();
		}
		return this.pages;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLastBegin() {
		return getBegin(getSection() - 1);
	}

	public int getNextBegin() {
		int res = getBegin(getSection() + 1);
		return res <= getPages() ? res : -1;
	}

	public int getSection() {
		int section = currentPage / PAGE_GROUP_PAGES;
		section = currentPage % PAGE_GROUP_PAGES == 0 ? section : section + 1;
		return section;
	}

	public int getBegin() {
		if (begin == 0) {
			begin = getBegin(getSection());
		}
		return begin;
	}

	private int getBegin(int section) {
		return (section - 1) * PAGE_GROUP_PAGES + 1;
	}

	public int getEnd() {
		if (end == 0) {
			end = getBegin() + PAGE_GROUP_PAGES - 1;
		}
		if (end > getPages()) {
			end = getPages();
		}
		return end;
	}

	private void caculate() {
		pages = total / pageSize;
		pages = total % pageSize == 0 ? pages : pages + 1;
	}

	@Override
	public int getPageNumber() {
		return this.getCurrentPage();
	}

	@Override
	public int getOffset() {
		return (getPageNumber() - 1) * this.getPageSize();
	}

	@Override
	public Sort getSort() {
		// TODO Auto-generated method stub
		return null;
	}
}
