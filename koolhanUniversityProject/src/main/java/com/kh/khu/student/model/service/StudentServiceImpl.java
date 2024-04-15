package com.kh.khu.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.student.model.dao.StudentDao;
import com.kh.khu.student.model.vo.Student;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao sDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Student loginStudent(Student s) {
		return sDao.loginStudent(sqlSession, s);
	}
	
}
