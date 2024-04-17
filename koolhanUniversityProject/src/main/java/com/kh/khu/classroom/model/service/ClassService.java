package com.kh.khu.classroom.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;

public interface ClassService {
	
	// 학생용 강의 조회
	ArrayList<Classroom> selectClass();
	
	// 강의 공지사항 게시판 조회
	int selectListCount();
	ArrayList<ClassNotice> selectClassNoticeList(PageInfo pi);
	
	// 강의 세부 공지사항 조회
	int increaseCount(int classNoticeNo);
	ClassNotice selectClassNoticeDetail(int classNoticeNo);
	
	// 이전 수강내역 조회
	ArrayList<Class> selectCourseHistory(int studentNo);
	
	// 강의 등록
	int insertClass(Classroom c);
	
	// 교수용 강의 리스트 조회
	ArrayList<Classroom> classSelect(String memberId);




}
