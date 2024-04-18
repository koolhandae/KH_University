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




}
