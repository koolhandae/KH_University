package com.kh.khu.grade.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.grade.model.vo.Grade;

@Repository
public class GradeDao {
	
	
	public int selectGradeStuCount(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("gradeMapper.selectGradeStuCount", classNo);
	}

	public ArrayList<Grade> selectGradeStuList(SqlSessionTemplate sqlSession, int classNo) {
		return (ArrayList)sqlSession.selectList("gradeMapper.selectGradeStuList", classNo);
	}
	
	public Grade selectGradeDetail(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("gradeMapper.selectGradeDetail", classNo);
	}
	
	/*
	public int insertGradeStudent(SqlSessionTemplate sqlSession, ArrayList<Grade> gradesData) {
		System.out.println("Dao"+ gradesData);
		return sqlSession.insert("gradeMapper.insertGradeStudent", gradesData);
	}
	*/
	
	// GradeDao.java
	public int insertGradeStudent(SqlSessionTemplate sqlSession, ArrayList<Grade> gradesData) {
	    int result = 0;
//	    System.out.println("Dao"+ gradesData);
	    for (Grade grade : gradesData) {
	        result += sqlSession.insert("gradeMapper.insertGradeStudent", grade);
	    }
	    return result;
	}
	
	
	public ArrayList<Grade> selectProfessorInputStudent(SqlSessionTemplate sqlSession, int classNo) {
		
		return (ArrayList)sqlSession.selectList("gradeMapper.selectProfessorInputStudent", classNo);
	}
	
	public int updateGradeStudent(SqlSessionTemplate sqlSession, ArrayList<Grade> gradesData) {
		int result = 0;
		for (Grade grade : gradesData) {
	        result += sqlSession.update("gradeMapper.updateGradeStudent", grade);
	    }
	    return result;
	}
	
	
	public ArrayList<Course> selectScoreYear(SqlSessionTemplate sqlSession, int stuNo){
		return (ArrayList)sqlSession.selectList("studentMapper.selectScoreYear", stuNo);
	}
	
	public ArrayList<Grade> selectScoreStudent(SqlSessionTemplate sqlSession, int stuNo){
		return (ArrayList)sqlSession.selectList("gradeMapper.selectScoreStudent", stuNo);
	}
	
	public ArrayList<Grade> chooseScoreStudent(SqlSessionTemplate sqlSession, String year, String term, int stuNo){
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("stuNo", stuNo);
		parameter.put("year", year);
		parameter.put("term", term);
		
		return (ArrayList)sqlSession.selectList("gradeMapper.chooseScoreStudent", parameter);
	}
}
