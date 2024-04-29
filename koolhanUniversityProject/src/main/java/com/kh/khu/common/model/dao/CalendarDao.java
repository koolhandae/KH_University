package com.kh.khu.common.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
	
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar cal) {
		return sqlSession.update("calendarMapper.updateCalendar", cal);
	}
	
	public int deleteCalendar(SqlSessionTemplate sqlSession, int stuNo, int calNo) {
		Map<String, Object> parameter = new HashMap<String, Object>();
		parameter.put("stuNo", stuNo);
		parameter.put("calNo", calNo);
		
		return sqlSession.update("calendarMapper.deleteCalendar", parameter);
	}
}
