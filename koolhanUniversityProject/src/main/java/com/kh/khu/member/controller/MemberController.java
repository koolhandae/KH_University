package com.kh.khu.member.controller;

import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.common.model.vo.Address;
import com.kh.khu.common.template.AddressString;
import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.student.model.service.StudentServiceImpl;
import com.kh.khu.student.model.vo.Student;

@Controller
public class MemberController {
	
	@Autowired
	JavaMailSenderImpl mailSender;

	@Autowired
	private MemberServiceImpl mService;

	@Autowired
	private StudentServiceImpl sService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 임시 로그인 메소드
	/*
	 * @RequestMapping("login.me") public String loginMember(String userId, String
	 * userPwd, HttpSession session) { Member m = new Member();
	 * m.setMemberId(userId); m.setMemberPwd(userPwd); Member loginUser =
	 * mService.loginMember(m);
	 * 
	 * session.setAttribute("loginUser", loginUser);
	 * 
	 * return "admin/noticeListView"; }
	 */

	@RequestMapping("login.me")
	public String loginMember(String userId, String userPwd, HttpSession session, Model model, HttpServletRequest request) {
		session.setAttribute("url", request.getRequestURL().toString());
		String encPwd = bcryptPasswordEncoder.encode(userPwd);
		System.out.println(encPwd);

		if (userId.startsWith("kh")) {

			Student s = new Student();
			s.setStudentId(userId);
			s.setStudentPwd(userPwd);

			Student loginStudent = sService.loginStudent(s);

			if (loginStudent != null
					&& bcryptPasswordEncoder.matches(s.getStudentPwd(), loginStudent.getStudentPwd())) {
				// 로그인성공
				session.setAttribute("loginStudent", loginStudent);
				session.setAttribute("alertMsg", "로그인에 성공하셨습니다!");

				return "redirect:/mainPage.me";
			}

		} else {
			Member m = new Member();
			m.setMemberId(userId);
			m.setMemberPwd(userPwd);

			Member loginUser = mService.loginMember(m);

			// System.out.println(loginUser);

			if (loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
				// 로그인 성공
				session.setAttribute("loginUser", loginUser);
				session.setAttribute("alertMsg", "로그인에 성공하셨습니다!");
				return "redirect:/mainPage.me";
			}
		}
		session.setAttribute("alertMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
		return "redirect:/";

	}

	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("forgot.me")
	public String forgotMember() {
		return "common/forgotPassword";
	}
	
	@RequestMapping("insertForm.me")
	public String insertMemberForm() {
		return "admin/adminEnrollForm";
	}

	@RequestMapping("insert.me")
	public ModelAndView insertMember(Member m, HttpSession session, HttpServletRequest request, ModelAndView mv, Address ad) {
		m.setMemberPwd(bcryptPasswordEncoder.encode((m.getMemberSsn().substring(0, 6)) + "1!"));
		m.setMeAddress(AddressString.AddressMake(ad));
		int result = mService.insertMember(m);
		String url = (String)session.getAttribute("url");
		if (result > 0) {
			String position = m.getMeType().equals("P")? "교수" : "교직원";
			String setFrom = "koolhandae@gmail.com";
			String toMail = m.getMeEmail();
			String title = "쿨한대학교 학사정보시스템 회원 등록 확인 메일 입니다.";
			String content = "<h1 style='color:#1c4587'>임시 비밀번호 안내입니다.</h1>"
							+ "<br>"
							+ "<h4>안녕하세요.</h4>"
							+ "<h4>" + m.getMemberName() + "님의 쿨한대학교 " + position + " 등록이 완료되었습니다.</h4>" 
							+ "<h4>로그인 아이디 : " + mService.selectMemberId(m) + "</h4><br>"
							+ "<h4>비밀번호 : 본인 생년월일 6자리 + '1!'</h4><br>"
							+ "<h4>로그인 이후 비밀번호를 변경해주세요</h4><br>"
							+ "<h3><a href='" + url + "' style='color:#1c4587; text-decoration:none;'>'쿨대학 홈페이지'</a>" +"</h4>"
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
	         alertMsg.put("title", position + " 등록 완료.");
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