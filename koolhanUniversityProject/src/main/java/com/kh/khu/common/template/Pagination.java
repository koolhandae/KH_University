package com.kh.khu.common.template;

import org.apache.ibatis.session.RowBounds;

import com.kh.khu.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		int startPage = (currentPage - 1) /pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		
		if(endPage>maxPage) {
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	}
	
	public static RowBounds getRowBounds(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, limit);
		
		return rb;	
	}
	
}
