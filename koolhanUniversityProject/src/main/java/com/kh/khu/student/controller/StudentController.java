package com.kh.khu.student.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.common.model.vo.Address;
import com.kh.khu.common.template.AddressString;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.khu.classroom.model.vo.ClassDetail;
import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.student.model.vo.Student;
import com.kh.khu.student.model.service.StudentServiceImpl;
import com.kh.khu.student.model.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	@Autowired
	JavaMailSenderImpl mailSender;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

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



	@RequestMapping("insertForm.stu")
	public String insertStudentForm() {
		return "student/studentEnrollForm";
	}
	
	@RequestMapping("insert.stu")
	public ModelAndView insertMember(Student s, HttpSession session, HttpServletRequest request, ModelAndView mv, Address ad) {
		s.setStudentPwd(bcryptPasswordEncoder.encode((s.getStudentSsn().substring(0, 6)) + "1!"));
		s.setStAddress(AddressString.AddressMake(ad));
		int result = sService.insertStudent(s);
		String url = (String)session.getAttribute("url");
		if (result > 0) {
			String setFrom = "koolhandae@gmail.com";
			String toMail = s.getStEmail();
			String title = "쿨한대학교 학사정보시스템 회원 등록 확인 메일 입니다.";
			String content = "<h1 style='color:#1c4587'>임시 비밀번호 안내입니다.</h1>"
							+ "<br>"
							+ "<h4>안녕하세요.</h4>"
							+ "<h4>" + s.getStudentName() + "님의 쿨한대학교 학생 등록이 완료되었습니다.</h4>" 
							+ "<h4>로그인 아이디 : " + sService.selectStudentId(s) + "</h4><br>"
							+ "<h4>비밀번호 : 본인 생년월일 6자리 + '1!'</h4><br>"
							+ "<h4>로그인 이후 비밀번호를 변경해주세요</h4><br>"
							+ "<h3><a href='" + url.substring(0, url.lastIndexOf("/") + 1) + "' style='color:#1c4587; text-decoration:none;'>'쿨대학 홈페이지'</a>" +"</h4>"
							+ "<h5>감사합니다😀</h5><br><br>";	
			try {
				MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content, true);
	            mailSender.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			 HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "학생 등록 완료.");
	         alertMsg.put("text", "성공적으로 등록 되었습니다.");
	         session.setAttribute("alertMsg", alertMsg);

	         mv.setViewName("admin/adminEnrollForm");
		}else {
			mv.addObject("errorMsg", "회원 등록실패");
			mv.setViewName("common/errorPage404");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("verifyEmail.stu")
	public String verifyEmail(String email) {
		int result = sService.verifyEmail(email);
		
		return result == 0 ? "NNNNY" : "NNNNN";
	}
	
	@RequestMapping("certificate.issue")
	public String connectCertificateIssuePage() {
		return "student/certificateIssuingPage";
	}
	
	
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
	
	@RequestMapping("update.stu")
	public String updateStudentForm() {
		return "student/studentUpdateForm";
	}
	
	@ResponseBody
	@RequestMapping("updateAddress.stu")
	public HashMap<String, Object> updateAddress(Address a, String studentId, HttpSession session) {
		String newAddress = AddressString.AddressMake(a);
		Student s = new Student();
		s.setStudentId(studentId);
		s.setStAddress(newAddress);
		int result = sService.updateAddress(s);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			session.removeAttribute("loginStudent");
			session.setAttribute("loginStudent", sService.loginStudent(s));
			map.put("title", "주소 변경 성공");
			map.put("text", "성공적으로 주소를 변경했습니다.");
			map.put("icon", "success");
			map.put("newAddress", s.getStAddress());
		}
		
		return map;
	}
	
}
