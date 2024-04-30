package com.kh.khu.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.project.model.dao.ProjectDao;
import com.kh.khu.project.model.vo.Project;
import com.kh.khu.project.model.vo.StudentProject;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private ProjectDao pDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public ArrayList<Project> selectIngProjectList(Project pj) {
		return null;
	}

	@Override
	public ArrayList<Project> selectDoneProjectList(Project pj) {
		return null;
	}

	@Override
	public ArrayList<Project> selectMissProjectList(Project pj) {
		return null;
	}

	@Override
	public ArrayList<Project> selectProjectList(String memberId) {
		return pDao.selectProjectList(sqlSession, memberId);
	}

	@Override
	public int insertProject(Project pj) {
//		System.out.println("project Service"+pj);
		return pDao.insertProject(sqlSession, pj);
	}

	@Override
	public int updateProject(Project pj) {
		return 0;
	}

	@Override
	public int deleteProject(Project pj) {
		return 0;
	}

	@Override
	public int selectProfessorProjectListCount(String memberId) {
		return pDao.selectProfessorProjectListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Project> selectProfessorProjectList(PageInfo pi, String memberId) {
		return pDao.selectProfessorProjectList(sqlSession,pi, memberId);
	}

	@Override
	public Project selectProfessorProjectDetail(int pjNo) {
		return pDao.selectProfessorProjectDetail(sqlSession, pjNo);
	}
	
	/*
	@Override
	public int insertProjectAlarm(Project pj) {
		return pDao.insertProjectAlarm(sqlSession, pj);
	}
	*/

	@Override
	public ArrayList<Course> selectCourseStudent(String classNo) {
		return pDao.selectCourseStudent(sqlSession, classNo);
	}
	
	@Override
	public int insertStuProjectTable(int sno, String classNo) {
		return pDao.insertStuProjectTable(sqlSession, sno, classNo);
	}

	@Override
	public ArrayList<StudentProject> selectStudentProject(String classNum, int studentNo) {
		return pDao.selectStudentProject(sqlSession, classNum, studentNo);
	}

	@Override
	public int ingProjectCount(String classNum, int studentNo) {
		return pDao.ingProjectCount(sqlSession, classNum, studentNo);
	}

	@Override
	public int missProjectCount(String classNum, int studentNo) {
		return pDao.missProjectCount(sqlSession, classNum, studentNo);
	}

	@Override
	public int doneProjectCount(String classNum, int studentNo) {
		return pDao.doneProjectCount(sqlSession, classNum, studentNo);
	}

	@Override
	public Project projectViewStudent(String pjNo) {
		return pDao.projectViewStudent(sqlSession, pjNo);
	}

	@Override
	public int enrollProjectStudent(StudentProject sp) {
		return pDao.enrollProjectStudent(sqlSession, sp);
	}

	@Override
	public ArrayList<StudentProject> selectStudentDoneProject(int studentNo, String classNum) {
		return pDao.selectStudentDoneProject(sqlSession, studentNo, classNum);
	}

	@Override
	public ArrayList<StudentProject> selectStudentNoneProject(int studentNo, String classNum) {
		return pDao.selectStudentNoneProject(sqlSession, studentNo, classNum);
	}

	@Override
	public StudentProject projectFileView(int studentNo, String classNum, String pjno) {
		return pDao.projectFileView(sqlSession, studentNo, classNum, pjno);
	}

	@Override
	public ArrayList<StudentProject> stuPjFileDownload(int pjNo) {
		return pDao.stuPjFileDownload(sqlSession, pjNo);
	}


	




}
