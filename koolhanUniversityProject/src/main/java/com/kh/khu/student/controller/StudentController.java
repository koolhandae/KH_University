package com.kh.khu.student.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.common.model.vo.Address;
import com.kh.khu.common.template.AddressString;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	@Autowired
	JavaMailSenderImpl mailSender;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
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
	
}
