package com.kh.khu.grade.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
