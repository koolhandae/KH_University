package com.kh.khu.notice.model.service;

import java.util.ArrayList;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.notice.model.vo.Notice;

public interface NoticeService {
	
	// 공지사항 리스트 페이지 (페이징)
	// 공지사항 조회
	int selectListCount();
	ArrayList<Notice> selectList(PageInfo pi); 
	
	// 공지사항 작성하기
	int insertNotice(Notice n);
	
	// 공지사항 상세 조회
	Notice selectNotice(int noticeNo);
	
	// 공지사항 수정
	int updateNotice(Notice n);
	
	// 공지사항 삭제
	int deleteNotice(Notice n);
}
