package com.kh.khu.grade.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.grade.model.dao.GradeDao;
import com.kh.khu.grade.model.vo.Grade;

@Service
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeDao gDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Grade selectStudentGrade(Grade g) {
		return null;
	}



	@Override
	public int selectGradeStuCount(int classNo) {
		return gDao.selectGradeStuCount(sqlSession, classNo);
	}

	@Override
	public ArrayList<Grade> selectGradeStuList(PageInfo pi, int classNo) {
		return gDao.selectGradeStuList(sqlSession, classNo);
	}



	@Override
	public Grade selectGradeDetail(int classNo) {
		return gDao.selectGradeDetail(sqlSession, classNo);
	}



	@Override
	public int insertGradeStudent(ArrayList<Grade> gradesData ) {
		//System.out.println("서비스"+ gradesData);
		return gDao.insertGradeStudent(sqlSession, gradesData);
	}


	
	
	@Override
	public ArrayList<Grade> selectProfessorInputStudent(int classNo) {
		return gDao.selectProfessorInputStudent(sqlSession, classNo);
	}



	@Override
	public int updateGradeStudent(ArrayList<Grade> gradesData) {
		return gDao.updateGradeStudent(sqlSession,gradesData);
	}
	
}
