package com.kh.khu.classroom.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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





}
