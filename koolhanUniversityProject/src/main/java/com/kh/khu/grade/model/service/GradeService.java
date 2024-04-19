package com.kh.khu.grade.model.service;

import java.util.ArrayList;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.grade.model.vo.Grade;

public interface GradeService {

	// 성적 조회 메소드
	Grade selectStudentGrade(Grade g);
	
	
	// 교수용 성적입력페이지 학생리스트 조회
	int selectGradeStuCount(int classNo);
	ArrayList<Grade> selectGradeStuList(PageInfo pi, int classNo);
	Grade selectGradeDetail(int classNo);
	
	
}
