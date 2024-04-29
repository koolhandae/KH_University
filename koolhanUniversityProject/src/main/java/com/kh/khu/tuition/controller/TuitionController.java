package com.kh.khu.tuition.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.service.TuitionService;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;
import com.kh.khu.tuition.model.vo.TuitionStudentMake;


@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService tService;
	
	@RequestMapping("tuitionBill.do")
	public String tuitionBillForm(Model model, HttpSession session) {
		
		Student student = (Student)session.getAttribute("loginStudent");
		
		String studentId = student.getStudentId();
		
		ArrayList<Tuition> list = tService.tuitionBillForm(studentId);
		
		
		model.addAttribute("studentId", studentId);
		model.addAttribute("list", list);

		
		return "student/studentTuitionBill";
	}

	@RequestMapping("tuitionPayForm.do")
	public String tuitionPayForm(HttpSession session) {
		return "student/studentTuitionPay";
	}
	
	@RequestMapping("tuitionPay.do")
	public String insertTuitionPay(Tuition t, Model model, HttpSession session) {
		
		int list = tService.insertTuitionPay(t);
		
		if(list > 0) {
			//session.setAttribute("alertMsg", "등록금 납부가 성공적을 완료 되었습니다.");
			return "student/studentTuition";
		}else {
			model.addAttribute("errorMsg", "등록금 납부 실패!");
			return "common/errorPage404";
		}
	}
	
	@RequestMapping("tuitionMake.ad")
	public String tuitionMakeForm(HttpSession session, AdminTuitionMake at) {
		// 특정 년도의 학기의 등록금 정보를 저장 (화면에서 넘긴 값을 db 에 저장)
		//int result = tService.insertTuitionMake();
		// 저장된 연도의 데이터를 화면에 보낸다
		//ArrayList<AdminTuitionMake> atList = tService.tuitionMakeForm();
		
		return "admin/adminTuitionMake";
	}
	
	@RequestMapping("tuitionIssu.ad")
	public String tuitionIssueForm(HttpSession session, Model model) {
		// 가장 최신 학기의 등록금 데이터를 화면에 ReadOnly 로 출력한다 
		AdminTuitionMake t = tService.latestTuition();
		
		model.addAttribute("tuition", t);
		
		return "admin/adminTuitionIssue";
	}
	
	// todo: readOnly 로 사용된 등록금 정보를 화면에서 받아온다
	@RequestMapping("tuitionMakeStudent.ad")
	public String tuitionMakeStudent(HttpSession session, Model model) {
		
		List<TuitionStudentMake> studens = tService.makeTuitionStudent();
		
		model.addAttribute("list", studens);
		
		AdminTuitionMake t = tService.latestTuition();
		model.addAttribute("tuition", t);
		
		return "admin/adminTuitionIssue";
	}
	
	@RequestMapping("takeOffSelect.ad")
	public String takeOffSelect(HttpSession session) {
		return "admin/takeOffSelect";
	}
	
	/*
	 * @RequestMapping("tuitionMakeInsert.ad") public String
	 * selectTuitionMake(AdminTuitionMake at, Model model, HttpSession session) {
	 * int result = tService. }
	 */
	
}
