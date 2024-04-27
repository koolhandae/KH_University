package com.kh.khu.common.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.khu.common.model.service.CalendarServiceImpl;
import com.kh.khu.common.model.vo.Calendar;

@Controller
public class CalendarController {
	
	@Autowired
	private CalendarServiceImpl caService;
	
	
	@RequestMapping("myCalender.st")
	public String goMyCalendar() {
	    return "common/myCalendar";
	}
	
	@ResponseBody
	@RequestMapping(value="addCalendar.st", produces="text/html; charset=utf-8")
	public Model addCalencar(@RequestParam("stuNo") int stuNo,
			                  @RequestParam("title") String title,
			                  @RequestParam("start") String start,
			                  @RequestParam("end") String end,
			                  @RequestParam("color") String color,
							  HttpSession session, Model model) {
		
		System.out.println(stuNo);
		System.out.println(title);
		System.out.println(start);
		System.out.println(end);
		System.out.println(color);
		
		Calendar cal = new Calendar();
		cal.setStudentNo(stuNo);
		cal.setCalTitle(title);
		cal.setCalStartDate(start);
		cal.setCalEndDate(end);
		cal.setBackgroundColor(color);
		
		System.out.println(cal);
		
		int result  = caService.insertCalendar(cal);
		System.out.println(result);

		model.addAttribute("result", result);
		return model;
	}
	
	@ResponseBody
	@RequestMapping(value="selectCal.st",  produces="application/json; charset=utf-8")
	public String selectCalendar (@RequestParam(value="stuNo") int stuNo) {
		System.out.println(stuNo);
		
		ArrayList<Calendar> cList = caService.selectCalendar(stuNo);
		
		System.out.println("일정리스트" + cList);
		
		return new Gson().toJson(cList);
	}
}
