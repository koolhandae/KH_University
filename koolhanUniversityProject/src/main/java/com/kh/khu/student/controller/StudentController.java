package com.kh.khu.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	
	@RequestMapping("takeOff.do")
	public String takeOffForm(HttpSession session) {
		
//		Student s = (Student)session.getAttribute("loginStudent");
//		System.out.println(s);
		 return "student/studentTakeOff";
		 
	}
	
	@RequestMapping("insertTakeOff.do")
	public String insertTakeOff(Absence a, Model model, HttpSession session) {
		 System.out.println(a);
		int list = sService.insertTakeOff(a);
		
		if(list > 0) {
			session.setAttribute("alertMsg", "휴학 신청서 등록 완료");
			return "redirect:main";
		}else {
			model.addAttribute("errorMsg", "휴학 신청서 등록 실패!");
			return "common/errorPage404";
		}
	}
	
	@RequestMapping("takeOffSelect.do")
	public void selectTakeOff(Absence a, Model model, HttpSession session) {
		int count = sService.selectTakeOff(a);
	}
	
	@RequestMapping("takeOffDetail.do")
	public void detailTakeOff() {
		
	}
	
}
