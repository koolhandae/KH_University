package com.kh.khu.member.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.khu.common.model.vo.Address;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.AddressString;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.member.model.vo.MemberAbsence;
import com.kh.khu.member.model.vo.MemberPresence;
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

	@RequestMapping("login.me")
	public String loginMember(String userId, String userPwd, HttpSession session, Model model) {

		String encPwd = bcryptPasswordEncoder.encode(userPwd);

		HashMap<String, Object> alertMsg = new HashMap<String, Object>();

		if (userId.startsWith("kh")) {
			Student s = new Student();
			s.setStudentId(userId);
			s.setStudentPwd(userPwd);

			Student loginStudent = sService.loginStudent(s);

//			//System.out.println(loginStudent);

			if (loginStudent != null && !loginStudent.getStStatus().equals("Z")
					&& !loginStudent.getStStatus().equals("N")
					&& bcryptPasswordEncoder.matches(s.getStudentPwd(), loginStudent.getStudentPwd())) {
				// 로그인성공
				session.setAttribute("loginStudent", loginStudent);

				alertMsg.put("icon", "success");
				alertMsg.put("title", "로그인 성공");
				alertMsg.put("text", "성공적으로 로그인 됐습니다");
				session.setAttribute("alertMsg", alertMsg);
				session.setAttribute("now", new Date());
				return "redirect:/mainPage.me";

				// 재직된 학생은 로그인 못함
			} else if (loginStudent != null && loginStudent.getStStatus().equals("Z")) {
				alertMsg.put("icon", "error");
				alertMsg.put("title", "로그인 실패");
				alertMsg.put("text", "재적된 학생은 로그인 하실 수 없습니다");
				session.setAttribute("alertMsg", alertMsg);
				return "redirect:/";

				// 자퇴 학생은 로그인 못함
			} else if (loginStudent != null && loginStudent.getStStatus().equals("N")) {
				alertMsg.put("icon", "error");
				alertMsg.put("title", "로그인 실패");
				alertMsg.put("text", "자퇴한 학생은 로그인 하실 수 없습니다");
				session.setAttribute("alertMsg", alertMsg);
				return "redirect:/";
			}
		} else {
			Member m = new Member();
			m.setMemberId(userId);
			m.setMemberPwd(userPwd);

			Member loginUser = mService.loginMember(m);

			if (loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
				// 로그인 성공
				session.setAttribute("loginUser", loginUser);

				alertMsg.put("icon", "success");
				alertMsg.put("title", "로그인 성공");
				alertMsg.put("text", "성공적으로 로그인 됐습니다");
				session.setAttribute("alertMsg", alertMsg);
				session.setAttribute("now", new Date());
				return "redirect:/mainPage.me";
			}
		}

		alertMsg.put("icon", "error");
		alertMsg.put("title", "로그인 실패");
		alertMsg.put("text", "아이디 또는 비밀번호가 올바르지 않습니다.");
		session.setAttribute("alertMsg", alertMsg);
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
	public ModelAndView insertMember(Member m, HttpSession session, HttpServletRequest request, ModelAndView mv,
			Address ad) {
		m.setMemberPwd(bcryptPasswordEncoder.encode((m.getMemberSsn().substring(0, 6)) + "1!"));
		m.setMeAddress(AddressString.AddressMake(ad));
		int result = mService.insertMember(m);
		String url = request.getHeader("Referer");
		if (result > 0) {
			String position = m.getMeType().equals("P") ? "교수" : "교직원";
			String setFrom = "koolhandae@gmail.com";
			String toMail = m.getMeEmail();
			String title = "쿨한대학교 학사정보시스템 회원 등록 확인 메일 입니다.";
			String content = "<h1 style='color:#1c4587'>임시 비밀번호 안내입니다.</h1>" + "<br>" + "<h4>안녕하세요.</h4>" + "<h4>"
					+ m.getMemberName() + "님의 쿨한대학교 " + position + " 등록이 완료되었습니다.</h4>" + "<h4>로그인 아이디 : "
					+ mService.selectMemberId(m) + "</h4><br>" + "<h4>비밀번호 : 본인 생년월일 6자리 + '1!'</h4><br>"
					+ "<h4>로그인 이후 비밀번호를 변경해주세요</h4><br>" + "<h3><a href='" + url.substring(0, url.lastIndexOf("/") + 1)
					+ "' style='color:#1c4587; text-decoration:none;'>'쿨대학 홈페이지'</a>" + "</h4>"
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
		} else {
			mv.addObject("errorMsg", "회원 등록실패");
			mv.setViewName("common/errorPage404");
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping("verifyEmail.me")
	public String verifyEmail(String email) {
		int result = mService.verifyEmail(email);

		return result == 0 ? "NNNNY" : "NNNNN";
	}

	@ResponseBody
	@RequestMapping("updateAddress.me")
	public HashMap<String, Object> updateAddress(Address a, String memberId, HttpSession session) {
		String newAddress = AddressString.AddressMake(a);
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMeAddress(newAddress);
		int result = mService.updateAddress(m);
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mService.loginMember(m));
			map.put("title", "주소 변경 성공");
			map.put("text", "성공적으로 주소를 변경했습니다.");
			map.put("icon", "success");
			map.put("newAddress", m.getMeAddress());
		}
		return map;
	}

	@RequestMapping("update.me")
	public String updateAdminForm() {
		return "admin/adminUpdateForm";
	}

	@ResponseBody
	@RequestMapping(value = "userList.me", produces = "application/json; charset=utf-8")
	public ResponseEntity<HashMap<String, Object>> selectStudentList(int cpage, Member me) {
		int memberListCount = 0;
		int pageLimit = 3;
		int boardLimit = 2;
		PageInfo mpi;
		ArrayList<Member> mList;
		if (me.getMemberName().equals("")) {
			switch (me.getMeType()) {
			case "all":
				memberListCount = mService.selectMemberListCount();
				mpi = Pagination.getPageInfo(memberListCount, cpage, pageLimit, boardLimit);
				mList = mService.selectAllMember(mpi);
				// System.out.println(memberListCount);
				break;
			default:
				memberListCount = mService.selectMemberListCount(me.getMeType());
				mpi = Pagination.getPageInfo(memberListCount, cpage, pageLimit, boardLimit);
				mList = mService.selectAllMemberType(mpi, me.getMeType());
				// System.out.println(memberListCount);
				break;
			}
		} else {
			switch (me.getMeType()) {
			case "all":
				memberListCount = mService.selectNameSearchMemberListCount(me.getMemberName());
				mpi = Pagination.getPageInfo(memberListCount, cpage, pageLimit, boardLimit);
				mList = mService.selectNameSearchAllMember(mpi, me.getMemberName());
				// System.out.println(memberListCount);
				break;
			default:
				memberListCount = mService.selectNameSearchTypeMemberListCount(me);
				mpi = Pagination.getPageInfo(memberListCount, cpage, pageLimit, boardLimit);
				mList = mService.selectNameSearchTypeMember(mpi, me);
				// System.out.println(memberListCount);
				break;
			}
		}

		// System.out.println(mList);

		for (Member m : mList) {
			if (m.getMeType().equals("A")) {
				m.setMeType("교직원");
			} else {
				m.setMeType("교수");
			}
			if (m.getMeStatus().equals("Y")) {
				m.setMeStatus("재직");
			} else {
				m.setMeStatus("퇴직");
			}
		}
		// System.out.println(memberListCount);
		HashMap<String, Object> response = new HashMap<>();
		response.put("mList", mList);
		response.put("mpi", mpi);
		response.put("listCount", memberListCount);
		response.put("searchName", me.getMemberName());
		return ResponseEntity.ok(response);
	}

	@RequestMapping("adminReturnSchool.me")
	public String adminReturnSchool(Model model) {
		// todo 복학 신청자 리스트를 가져와서 승인 버튼으로 승인할 수 있게 해준다
		List<MemberPresence> list = mService.getReturnStudent();

		model.addAttribute("list", list);

		return "admin/adminReturnShcoolSelect";
	}

	@RequestMapping(value = "adminReturnSchoolForm.me", produces = "json/application; utf-8")
	public String adminReturnSchoolForm(Model model, String preId) {
		// todo 복학 신청자 리스트를 가져와서 승인 버튼으로 승인할 수 있게 해준다
		int result = mService.setReturnStudent(preId);
		List<MemberPresence> list = mService.getReturnStudent();

//		return "redirect:adminReturnSchool.me";
		return new Gson().toJson(list);
	}

	@RequestMapping("admintakeOffSelect.me")
	public String adminTakeOff(Model model) {
		// 휴학생 select
		List<MemberAbsence> list = mService.getTakeOffStudent();

		model.addAttribute("list", list);

		return "admin/adminTakeOffSelect";
	}

	@ResponseBody
	@RequestMapping(value = "admintakeOffSelectForm.me", produces = "json/application; utf-8")
	public String adminTakeOffForm(Model model, String absId) {
		// absence 테이블 tbStatus | student 테이블 stStatus update
		int result = mService.setTakeOffStudent(absId);
		List<MemberAbsence> list = mService.getTakeOffStudent();
		// model.addAttribute("list", list);

		return new Gson().toJson(list);
	}

	@RequestMapping("tuitionMakeSelect.me")
	public String adminTuitionMake(Model model, AdminTuition tuition) {
		List<AdminTuition> list = mService.insertAdminTuition(tuition);

		model.addAttribute("list", list);
		return "admin/adminTuitionMake";
	}

}