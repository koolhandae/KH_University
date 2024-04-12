package com.kh.khu.classroom.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.classroom.model.dao.ClassDao;

@Service
public class ClassServiceImpl implements ClassService{

	@Autowired
	private ClassDao cDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
