package com.kh.khu.project.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.common.model.vo.PageInfo;
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
	
	public int selectProfessorProjectListCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("projectMapper.selectProfessorProjectListCount", memberId);
	}
	
	public ArrayList<Project> selectProfessorProjectList(SqlSessionTemplate sqlSession,PageInfo pi, String memberId ){
		int offset = (pi.getCurrentPage()-1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectProfessorProjectList", memberId, rowBounds );
	}

	public Project selectProfessorProjectDetail(SqlSessionTemplate sqlSession, int pjNo) {
		return sqlSession.selectOne("projectMapper.selectProfessorProjectDetail",pjNo);
	}
	
	/*
	public int insertProjectAlarm(SqlSessionTemplate sqlSession, Project pj) {
		return sqlSession.insert("projectMapper.insertProjectAlarm", pj);
				//"projectMapper.selectProfessorProjectDetail",pjNo
	}
	*/
	
}
