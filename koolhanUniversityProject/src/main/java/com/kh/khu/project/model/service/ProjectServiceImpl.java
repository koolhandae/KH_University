package com.kh.khu.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.project.model.dao.ProjectDao;
import com.kh.khu.project.model.vo.Project;

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
		System.out.println("project Service"+pj);
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



}
