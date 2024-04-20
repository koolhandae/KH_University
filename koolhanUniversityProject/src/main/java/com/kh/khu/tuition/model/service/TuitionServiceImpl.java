package com.kh.khu.tuition.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.tuition.model.dao.TuitionDao;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;

@Service
public class TuitionServiceImpl implements TuitionService{

	@Autowired
	private TuitionDao tDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int insertTuitionPay(Tuition t) {
		System.out.println(t);
		return tDao.insertTuitionPay(sqlSession, t);
	}


	@Override
	public ArrayList<Tuition> tuitionBillForm(Tuition t) {
		return tDao.tuitionBillForm(sqlSession, t);
	}


	@Override
	public ArrayList<AdminTuitionMake> tuitionMakeForm(AdminTuitionMake at) {
		System.out.println(at);
		return tDao.tuitionMakeForm(sqlSession, at);
	}
	
}
