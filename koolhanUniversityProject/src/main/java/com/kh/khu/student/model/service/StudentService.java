package com.kh.khu.student.model.service;

import java.util.ArrayList;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.student.model.vo.Student;

public interface StudentService {

	Student loginStudent(Student s);
	
	Student selectChkStudent(String email);
	
	int changePwd(String userId, String encPwd);
	
	// 학생용 강의 조회
	ArrayList<Course> selectCourseList(String studentId);
	
	// 학생용 강의 조회 검색
	Course searchCourse(String courseValue);
	
	
	// 강의 공지사항 게시판 조회
	int selectListCount(String classNum);
	ArrayList<ClassNotice> selectClassNoticeList(PageInfo pi, String classNum);
	
	// 강의 강의계획서 게시판 조회
	Course selectClassPlan(int classNum);
	
	// 강의 세부 공지사항 조회
	int increaseCount(int classNoticeNo);
	ClassNotice selectClassNoticeDetail(int classNoticeNo);
	
	// 이전 수강내역 조회
	ArrayList<Course> selectCourseHistory(int studentNo);

}
