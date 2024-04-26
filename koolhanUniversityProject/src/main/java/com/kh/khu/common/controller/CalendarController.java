package com.kh.khu.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CalendarController {
	
	@RequestMapping("myCalender.st")
	public String goMyCalendar() {
	    return "common/myCalendar";
	}
	
	@ResponseBody
	@RequestMapping(value="addCalendar.st", produces="text/html; charset=utf-8")
	public void addCalencar(@RequestParam("stuNo") String stuNo,
			                  @RequestParam("title") String title,
			                  @RequestParam("start") String start,
			                  @RequestParam("end") String end,
			                  @RequestParam("color") String color
							  ) {
		
		System.out.println(stuNo);
		System.out.println(title);
		System.out.println(start);
		System.out.println(end);
		System.out.println(color);
		
		
	}
}
