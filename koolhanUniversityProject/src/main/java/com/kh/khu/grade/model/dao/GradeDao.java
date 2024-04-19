package com.kh.khu.grade.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
