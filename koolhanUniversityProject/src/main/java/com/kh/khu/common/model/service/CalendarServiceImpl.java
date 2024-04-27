package com.kh.khu.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.common.model.dao.CalendarDao;
import com.kh.khu.common.model.vo.Calendar;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDao caDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCalendar(Calendar cal) {
		return caDao.insertCalendar(sqlSession, cal);
	}

	@Override
	public ArrayList<Calendar> selectCalendar(int stuNo) {
		return caDao.selectCalendar(sqlSession, stuNo);
	}
	
	
	
}
