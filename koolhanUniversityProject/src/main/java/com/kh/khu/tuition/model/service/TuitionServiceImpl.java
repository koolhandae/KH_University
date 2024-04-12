package com.kh.khu.tuition.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.tuition.model.dao.TuitionDao;

@Service
public class TuitionServiceImpl implements TuitionService{

	@Autowired
	private TuitionDao tDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
