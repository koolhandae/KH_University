package com.kh.khu.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public ArrayList<Project> selectProjectList() {
		return null;
	}

	@Override
	public int insertProject(Project pj) {
		return 0;
	}

	@Override
	public int updateProject(Project pj) {
		return 0;
	}

	@Override
	public int deleteProject(Project pj) {
		return 0;
	}

}
