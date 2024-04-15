package com.kh.khu.student.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.student.model.dao.StudentDao;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentDao sDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
