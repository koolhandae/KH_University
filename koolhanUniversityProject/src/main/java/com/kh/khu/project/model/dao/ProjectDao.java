package com.kh.khu.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project pj) {
		System.out.println("project Dao"+pj);

		return sqlSession.insert("projectMapper.insertProject", pj);
	}
	
	public ArrayList<Project> selectProjectList(SqlSessionTemplate sqlSession, String memberId){
		return (ArrayList)sqlSession.selectList("projectMapeer.selectProjectList", memberId);
		
	}
	
}
