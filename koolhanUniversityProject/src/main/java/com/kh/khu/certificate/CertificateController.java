package com.kh.khu.certificate;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.service.TuitionService;
import com.kh.khu.tuition.model.vo.Tuition;


@Controller
public class CertificateController {
	
	@Autowired
	private TuitionService tService;
	
	@RequestMapping("grad.certificate")
	public String gradCertificate() {
		return "certificate/graduationCertificateTemplate";
	}
	
	@RequestMapping("transcript.certificate")
	public String transcript () {
		return "certificate/transcriptTemplate";
	}
	@RequestMapping("tuition.notice")
	public ModelAndView tuitionNotice (ModelAndView mv, HttpSession session) {
		Student s = (Student)session.getAttribute("loginStudent");
		Tuition t = tService.selectTuition(s.getStudentNo());
		mv.addObject("t", t).setViewName("certificate/tuitionPaymentNotice");
		return mv;
	}
	@RequestMapping("tuition.reciept")
	public ModelAndView tuitionReciept (ModelAndView mv, HttpSession session) {
		Student s = (Student)session.getAttribute("loginStudent");
		Tuition t = tService.selectTuition(s.getStudentNo());
		mv.addObject("t", t).setViewName("certificate/proofOfPayment");
		return mv;
	}
	@RequestMapping("attending.certificate")
	public String attendingCertificate () {
		return "certificate/attendingCertificate";
	}
	
}
