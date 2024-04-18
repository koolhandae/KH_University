package com.kh.khu.student.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.vo.ClassDetail;
import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.service.StudentServiceImpl;
import com.kh.khu.student.model.vo.Student;

@Controller
public class StudentController {

  @Autowired
   private StudentServiceImpl sService;
	
	@RequestMapping("showCourse.st")
	public String showCourseList() {
		return "student/studentClassPage";
	}
	
	@ResponseBody
	@RequestMapping(value="selectCourse.st", produces="application/json; charset=utf-8")
	public ArrayList<Course>  selectCourseList(String studentId) {

	System.out.println(studentId);	
	
	ArrayList<Course> list = sService.selectCourseList(studentId);
	
	//System.out.println("courseList = " + list);

	return list;

	}
	
	@ResponseBody
	@RequestMapping(value="searchCourse.st", produces="application/json; charset=utf-8")
	public Course searchCourse(String courseValue) {		
		
        Course c = new Course();  
		c = sService.searchCourse(courseValue);
		System.out.println("searchCourse = " + c);
		
		return c;
	}
	
	@ResponseBody
	@RequestMapping(value="notice.co", produces="application/json; charset=utf-8")
	public ModelAndView selectListCount(@RequestParam(value="cpage", defaultValue="1")int currentPage, String classNum, ModelAndView mv) {
		
		System.out.println("classNum = " + classNum);
		
		int listCount = sService.selectListCount(classNum);		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		ArrayList<ClassNotice> list = sService.selectClassNoticeList(pi, classNum);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("classNum", classNum).setViewName("student/studentClassDetail");
		return mv;
		
	}
}
