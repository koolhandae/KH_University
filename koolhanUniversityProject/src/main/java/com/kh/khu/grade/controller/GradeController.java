package com.kh.khu.grade.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.classroom.model.service.ClassService;
import com.kh.khu.classroom.model.service.ClassServiceImpl;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.grade.model.service.GradeService;
import com.kh.khu.grade.model.vo.Grade;
import com.kh.khu.member.model.vo.Member;

@Controller
public class GradeController {

	@Autowired
	private GradeService gService;
	
	@Autowired
	private ClassService cService;
	
	@RequestMapping("professorGradeStuList.co")
	public ModelAndView selectGradeStuList(@RequestParam(value="cpage", defaultValue="1")int currentPage,ModelAndView mv,int gno ) {
		// gno라는 키값을 가져왔음
		// g no에는 상세조회하고자 하는 해당 게시글 번호가 담겨있음
		
		int listCount = gService.selectGradeStuCount(gno);
		
		
		Grade g = gService.selectGradeDetail(gno);
		//model.addAttribute("g",g);
		//return "professor/professorGradeStudentList";
		
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		//진짜로 목록조회
		ArrayList<Grade> list = gService.selectGradeStuList(pi, gno);
		mv.addObject("pi",pi)
		  .addObject("list",list)
		  .addObject("gd",g)
		  .setViewName("professor/professorGradeStudentList");
		
		return mv;
		
	}
	
}
