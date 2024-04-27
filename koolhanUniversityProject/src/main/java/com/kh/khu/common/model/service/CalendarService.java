package com.kh.khu.common.model.service;

import java.util.ArrayList;

import com.kh.khu.common.model.vo.Calendar;

public interface CalendarService {

	public int insertCalendar(Calendar cal);
	
	ArrayList<Calendar> selectCalendar(int stuNo);
}
