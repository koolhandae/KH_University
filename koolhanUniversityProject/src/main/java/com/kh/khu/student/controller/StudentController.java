package com.kh.khu.student.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	
	@RequestMapping("takeOff.do")
	public String insertTakeOff(Student s, Model model, HttpSession session) {
		// System.out.println(s);
		int list = sService.insertTakeOff(s);
		
		if(list > 0) {
			session.setAttribute("alertMsg", "휴학 신청서 등록 완료");
			return "redirect:takeOff.do";
		}else {
			model.addAttribute("errorMsg", "휴학 신청서 등록 실패!");
			return "common/errorPage404";
		}
	}
	
	@RequestMapping("takeOffSelect.do")
	public void selectTakeOff() {
		
	}
	
	@RequestMapping("takeOffDetail.do")
	public void detailTakeOff() {
		
	}
	
}
