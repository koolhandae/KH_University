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
	public ArrayList<AdminTuitionMake> tuitionMakeForm() {

		return tDao.tuitionMakeForm(sqlSession);
	}


	@Override
	public int insertTuitionMake() {
		int result = tDao.insertTuitionMake(sqlSession);
		return 0;
	}


	@Override
	public AdminTuitionMake latestTuition() {
		// 가장 최신의 등록금 데이터를 가져온다 (좀 더 정확성이 필요)
		AdminTuitionMake t = tDao.latestTution();
		return null;
	}


	@Override
	public String makeTuitionStudent(AdminTuitionMake t) {
		// TODO 기존 등록금_학생 데이터 전체를 지운다 
		tDao.deleteAllTuitionStudent();
		
		// TODO 학생데이터를 가져온다 (상태가 = 재학중) dao 필요
		//List student = 
		
		// TODO 장학금 대상자를 선별하기 위해 다른 개발자가 만든 성적 데이터를 가져온다 
		//List studnet
		
		// TODO 장학금이 포함된 데이터를 학생 + 등록금 AdminTuitionMake 를 셋팅해서 INSERT 한다 
		//int result
		
		// TODO 화면에 보여질 등록금 납부 대상자를 화면에 출력한다 
		//List tuision_studen
		
		return null;
	}
	

	

	
}
