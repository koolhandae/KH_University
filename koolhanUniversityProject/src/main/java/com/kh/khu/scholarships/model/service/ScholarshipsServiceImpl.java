package com.kh.khu.scholarships.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.scholarships.model.dao.ScholarshipsDao;

@Service
public class ScholarshipsServiceImpl implements ScholarshipsService{

	@Autowired
	private ScholarshipsDao sDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
