package com.kh.khu.project.model.service;

import java.util.ArrayList;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.project.model.vo.Project;

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
	
	
}
