package com.kh.khu.certificate;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Student;
import com.kh.khu.tuition.model.service.TuitionService;
import com.kh.khu.tuition.model.vo.Tuition;


@Controller
public class CertificateController {
	
	@Autowired
	private TuitionService tService;
	@Autowired
	private StudentService sService;
	
	@RequestMapping("grad.certificate")
	public String gradCertificate() {
		return "certificate/graduationCertificateTemplate";
	}
	
	@RequestMapping("transcript.certificate")
	public ModelAndView transcript (ModelAndView mv, HttpSession session) {
		Student s = (Student)session.getAttribute("loginStudent");
		ArrayList<Student> gradeList = sService.selectTranscript(s);
		double grade = 0;
		int credit = 0;
		for(Student st : gradeList) {
			switch(st.getGrade()) {
			case "A+":
				grade += 4.5;
				break;
			case "A":
				grade += 4;
				break;
			case "B+":
				grade += 3.5;
				break;
			case "B":
				grade += 3.0;
				break;
			case "C+":
				grade += 2.5;
				break;
			case "C":
				grade += 2.0;
				break;
			case "D+":
				grade += 1.5;
				break;
			case "D":
				grade += 1.0;
				break;
			case "F":
				grade += 0;
				break;
			};
			credit += st.getClassScore();
		}
		grade = Math.round((grade/gradeList.size())*100)/100.0;
		mv.addObject("allCredit", credit).addObject("gradePoint", grade).addObject("gradeList",gradeList).setViewName("certificate/transcriptTemplate");
		return mv;
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
