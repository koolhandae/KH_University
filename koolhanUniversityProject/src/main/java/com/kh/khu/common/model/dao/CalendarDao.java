package com.kh.khu.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.common.model.vo.Calendar;

@Repository
public class CalendarDao {

	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.insert("calendarMapper.insertCalendar", cal);
	}
	
	public ArrayList<Calendar> selectCalendar(SqlSessionTemplate sqlSession, int stuNo){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCalendar", stuNo);
	}
}
