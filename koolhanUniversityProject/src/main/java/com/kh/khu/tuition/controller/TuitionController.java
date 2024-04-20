package com.kh.khu.tuition.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.khu.tuition.model.service.TuitionService;
import com.kh.khu.tuition.model.vo.AdminTuitionMake;
import com.kh.khu.tuition.model.vo.Tuition;


@Controller
public class TuitionController {
	
	@Autowired
	private TuitionService tService;
	
	@RequestMapping("tuitionBill.do")
	public String tuitionBillForm(String studentId, Tuition t, Model model, HttpSession session) {
		
		ArrayList<Tuition> list = tService.tuitionBillForm(t);
		
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
			session.setAttribute("alertMsg", "등록금 납부가 성공적을 완료 되었습니다.");
			return "student/studentTuition";
		}else {
			model.addAttribute("errorMsg", "등록금 납부 실패!");
			return "common/errorPage404";
		}
	}
	
	@RequestMapping("tuitionMake.ad")
	public String tuitionMakeForm(HttpSession session, AdminTuitionMake at) {
		ArrayList<AdminTuitionMake> atList = tService.tuitionMakeForm(at);
		
		return "admin/adminTuitionMake";
	}
	
	/*
	 * @RequestMapping("tuitionMakeInsert.ad") public String
	 * selectTuitionMake(AdminTuitionMake at, Model model, HttpSession session) {
	 * int result = tService. }
	 */
	
}
