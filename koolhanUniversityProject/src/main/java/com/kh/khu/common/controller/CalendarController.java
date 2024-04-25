package com.kh.khu.common.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class CalendarController {
	
	@RequestMapping("myCalender.do")
	public String goMyCalendar() {
		return "common/myCalendar";
	}
	
}
