package com.kh.khu.grade.model.service;

import com.kh.khu.grade.model.vo.Grade;

public interface GradeService {

	// 성적 조회 메소드
	Grade selectStudentGrade(Grade g);
}
