package com.kh.khu.project.model.service;

import java.util.ArrayList;

import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.project.model.vo.StudentProject;

public interface ProjectService {

	// 과제 게시판 미완료 조회 메소드
	ArrayList<Project> selectIngProjectList(Project pj);
	
	// 과제 게시판 완료 조회 메소드
	ArrayList<Project> selectDoneProjectList(Project pj);
		
	// 과제 게시판 미제출 조회 메소드
	ArrayList<Project> selectMissProjectList(Project pj);
	
	// 과제 리스트 조회
	ArrayList<Project> selectProjectList(String memberId);
	
	// 과제 게시판 등록
	int insertProject(Project pj);
	
	// 과제 게시판 수정
	int updateProject(Project pj);
	
	// 과제 삭제
	int deleteProject(Project pj);
	

	// 교수용 과제 리스트 페이지
	int selectProfessorProjectListCount(String memberId);
	ArrayList<Project> selectProfessorProjectList(PageInfo pi, String memberId);
	
	// 교수용 과제 상세조회 페이지
	Project selectProfessorProjectDetail(int pjNo);
	
	// 교수 과제 등록시 테이블 인서트위한 학생번호 조회
	//Project selectProjectNo();
	//int pjNo = Project.
	ArrayList<Course> selectCourseStudent(String classNo);
	int insertStuProjectTable(int sno, String classNo);
	
	// 학생용 과제 상세페이지
	ArrayList<StudentProject> selectStudentProject(String classNum, int studentNo);
	int ingProjectCount(String classNum, int studentNo);
	int missProjectCount(String classNum, int studentNo);
	int doneProjectCount(String classNum, int studentNo);
	
	// 학생용 과제 내용 조회 페이지
	Project projectViewStudent(String pjno);
	
	// 학생 과제 등록
	int enrollProjectStudent(StudentProject sp);
	
	// 과제등록 완료페이지 조회
	ArrayList<StudentProject> selectStudentDoneProject(int studentNo, String classNum);
	
	// 과제등록 누락페이지 조회
	ArrayList<StudentProject> selectStudentNoneProject(int studentNo, String classNum);
	
	
}
