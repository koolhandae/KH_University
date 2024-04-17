package com.kh.khu.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
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
		//System.out.println(a);
		int list = sService.insertTakeOff(a);
		
		if(list > 0) {
			session.setAttribute("alertMsg", "휴학 신청서 등록 완료");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "휴학 신청서 등록 실패!");
			return "common/errorPage404";
		}
	}
	
	
	@RequestMapping("takeOffSelect.do")
	public String selectTakeOff(HttpSession session) {
		return "student/studentTakeOffSelect";
	}
	
	@RequestMapping("selectTakeOff.do")
	public void selectTakeOff(Absence a, Model model, HttpSession session) {
		System.out.println(a);
	}
	
	@RequestMapping("takeOffDetail.do")
	public void detailTakeOff() {
		
	}
	
	@RequestMapping("returnSchool.do")
	public String returnSchoolForm(HttpSession session) {
		return "student/studentReturnSchool";
	}
	
	@RequestMapping("insertReturnSchool.do")
	public String insertReturnSchool(Presence p, Model model , HttpSession session) {
			
		int list = sService.insertReturnSchool(p);
		
		if(list > 0) {
			session.setAttribute("alertMsg", "복학 신청서 등록 완료");
			return "redirect:/";
		}else {
			model.addAttribute("errorMsg", "복학 신청서 등록 실패!");
			return "common/errorPage404";
		}
		
	}
	
}
