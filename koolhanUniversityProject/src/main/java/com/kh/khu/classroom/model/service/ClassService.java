package com.kh.khu.classroom.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.khu.classroom.model.vo.ClassBoard;
import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;

public interface ClassService {
	

	
	// 강의 등록
	int insertClass(Classroom c);
	
	// 교수용 강의 리스트 조회
	ArrayList<Classroom> classSelect(String memberId);
	
	// 교수용 강의 리스트 페이지 
	int selectClassListCount(String memberId);
	ArrayList<Classroom> selectClassList(PageInfo pi,String memberId);
	
	// 교수용 강의 상세조회 페이지
	Classroom selectClassDetail(int classNo);
	
	// 교수용 강의 삭제
	int delectClass(int classNo);
	
	// 교수용 강의 수정
	int professorClassUpdate(Classroom c);



	// 강의실 자유게시판 글 개수
	int selectBoardListCount(String classNum);
	
	// 강의실 자유게시판 리스트 조회
	ArrayList<ClassBoard> selectClassBoardList(PageInfo pi, String classNum);
	
	
	// 강의실 자유게시판 상세 조회
	int classBoardCount(String bno, String classNum);
	ClassBoard selectClassDetailBoard(String bno, String classNum);

	int insertClassBoard(ClassBoard cb);
	
}
