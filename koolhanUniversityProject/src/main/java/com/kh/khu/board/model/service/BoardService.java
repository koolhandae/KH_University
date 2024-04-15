package com.kh.khu.board.model.service;

import java.util.ArrayList;

import com.kh.khu.board.model.vo.Board;
import com.kh.khu.board.model.vo.Reply;
import com.kh.khu.common.model.vo.PageInfo;

public interface BoardService {

	// 1. 커뮤니티 리스트 페이지 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 커뮤니티글 작성하기 서비스
	int insertBoard(Board b);
	
	// 3. 커뮤니티글 상세조회용 서비스
	int increaseCount(int boardNo);
	Board selectBoard(int boardNo);
	
	// 4. 커뮤니티글 삭제용 서비스
	int deleteBoard(int boardNo);
	
	// 5. 커뮤니티글 수정용 서비스
	int updateBoard(Board b);
	
	// 6. 댓글 리스트 조회 (ajax)
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 7. 댓글 작성용 서비스 (ajax)
	int insertReply(Reply r);
	
	// 댓글 수정
	int updateReply(Reply r);
	
	// 댓글 삭제
	int deleteReply(Reply r);
		
}
