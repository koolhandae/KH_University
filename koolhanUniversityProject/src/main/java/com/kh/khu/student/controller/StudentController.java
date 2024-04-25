package com.kh.khu.student.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Classroom;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.Address;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.AddressString;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.student.model.service.StudentService;
import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.AbsenceStudent;
import com.kh.khu.student.model.vo.Presence;
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
	public ArrayList<Course>  selectCourseList(int studentNo) {

	ArrayList<Course> list = sService.selectCourseList(studentNo);
	
	//System.out.println("courseList = " + list);

	return list;

	}
	
	@ResponseBody
	@RequestMapping(value="searchCourse.st", produces="application/json; charset=utf-8")
	public Course searchCourse(@RequestParam(value="courseValue") String courseValue,
			                   @RequestParam(value="studentNo")String studentNo) {		
		
		System.out.println(courseValue);
		System.out.println(studentNo);
        Course c = new Course();  
		c = sService.searchCourse(courseValue, studentNo);
		System.out.println("searchCourse = " + c);
		
		return c;
	}
	
	@ResponseBody
	@RequestMapping(value="notice.co", produces="application/json; charset=utf-8")
	public ModelAndView selectListCount(@RequestParam(value="cpage", defaultValue="1")int currentPage, 
			                            @RequestParam(value="classNum")String classNum, ModelAndView mv, HttpSession session) {
		
		//System.out.println("CONclassNum = " + classNum);
		
		ArrayList<Course> c = sService.selectClassName(classNum);
		
		//System.out.println("course" + c);
			
		String className = c.get(0).getClassName();

		int listCount = sService.selectListCount(classNum);		
		
		 
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		//System.out.println(pi);
		
		ArrayList<ClassNotice> list = sService.selectClassNoticeList(pi, classNum);
		
		session.setAttribute("classNum", classNum);
		
		mv.addObject("pi", pi).addObject("list", list).addObject("className",className).setViewName("student/studentClassDetail");
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
	public String takeOffForm(HttpSession session, Model model) {
		// 화면상에 버튼처리를 할 수 있는 서비스
		Student student = (Student)session.getAttribute("loginStudent");
		int result = sService.selectTakeOffStudent(student.getStudentId());
		
		model.addAttribute("result", result);
		
		return "student/studentTakeOff";
	}
	
	@RequestMapping("returnSchool.do")
	public String returnSchoolForm(HttpSession session, Model model) {
		// 화면상에 버튼처리를 할 수 있는 서비스
		// 휴학생만 데이터를 보일 수 있게 한다 
		//int result = sService.getDo();
		Student student = (Student)session.getAttribute("loginStudent");
		int result = sService.selectReturnSchoolStudent(student.getStudentId());
		
		model.addAttribute("result", result);
		
		return "student/studentReturnSchool";
	}
	
	// 휴학생 데이터를 넣는다 (DB 까지)
	@RequestMapping("takeOffForm.do")
	public String takeOffFormMake(HttpSession session, Model model, AbsenceStudent student) {
		int result = sService.insertTakeOffStudent(student);
		
		model.addAttribute("result", result);
		
		if(result>0) { //성공
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "성공!");
	         alertMsg.put("text", "성공적으로 휴학 신청이 완료되었습니다");
	         session.setAttribute("alertMsg", alertMsg);
			 return "redirect:takeOffSelect.do";
		}else {
			//실패
			model.addAttribute("errorMsg","휴학 신청 실패");
			return "common/errorPage500";
		}
	}
	
	// 복학 신청 데이터를 넣는다
	@RequestMapping("returnSchoolForm.do")
	public String insertReturnSchool(Presence p, Model model , HttpSession session) {
		int result = sService.insertReturnSchool(p);
		
		model.addAttribute("result", result);
		
		if(result>0) { //성공
			HashMap<String, Object> alertMsg = new HashMap<String, Object>();
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "성공!");
	         alertMsg.put("text", "성공적으로 복학 신청이 완료되었습니다");
	         session.setAttribute("alertMsg", alertMsg);
			 return "redirect:returnSchool.do";
		}else {
			//실패
			model.addAttribute("errorMsg","복학 신청 실패");
			return "common/errorPage500";
		}
		
	}
	
	@RequestMapping("takeOffSelect.do")
	public String selectTakeOff(HttpSession session, String absId, Model model) {
		// System.out.println(absId);
		  ArrayList<Absence> a = sService.selectTakeOff(absId);
	
		  model.addAttribute("a", a);
		
		return "student/studentTakeOffSelect";
	}
	
	@RequestMapping("returnSchoolSelect.do")
	public String selectReturnSchool(HttpSession session, String preId, Model model) {
		ArrayList<Presence> p = sService.selectReturnSchool(preId);
		
		model.addAttribute("p", p);
		
		return "student/studentReturnSchoolSelect";
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
	
	@RequestMapping("noticeDetail.co")
	public String searchDetailClass(@RequestParam(value="classNum") String classNum,
			                        @RequestParam(value="cno")String cno, Model model) {
		int noticeCount = sService.increaseCount(classNum, cno);
		
		//System.out.println("noticeCount" + noticeCount);
		
		if(noticeCount>0) {
			ClassNotice cd  = sService.selectClassNoticeDetail(classNum, cno);
			model.addAttribute("cd", cd);
			
			return "student/studentClassNoticeDetail";
		}else {
			model.addAttribute("errorMsg", "수강 공지사항 세부조회에 실패하셨습니다.");
			return "common/errorPage404";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="classPlan.co", produces="application/json; charset=utf-8")
	public Classroom selectCoursePlan(String classNum){
		
		//System.out.println(classNum);
		Classroom c = sService.selectCoursePlan(classNum);
		
		//System.out.println("classPlan=" + c);
	
		return c;
	}
	
	@ResponseBody
	@RequestMapping("updatePhone.stu")
	public String updatePhone(Student s, HttpSession session) {
		int result = sService.updatePhone(s);
		session.removeAttribute("loginStudent");
		Student newSt = sService.loginStudent(s);
		session.setAttribute("loginStudent", newSt);
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	@ResponseBody
	@RequestMapping(value="userList.stu", produces="application/json; charset=utf-8")
	public ResponseEntity<HashMap<String,Object>> selectStudentList(int cpage, Student st) {
		int studentListCount = 0;
		int pageLimit = 3;
		int boardLimit = 2;
		PageInfo newSpi;
		ArrayList<Student> sList;
		if(st.getStudentName().equals("")) {
			switch(st.getStStatus()) {
				case "all":
					studentListCount = sService.selectStudentListCount();
					newSpi = Pagination.getPageInfo(studentListCount, cpage, pageLimit, boardLimit);
					sList = sService.selectAllStudent(newSpi);
					break;
				default:
					studentListCount = sService.selectStudentListCount(st.getStStatus());
					newSpi = Pagination.getPageInfo(studentListCount, cpage, pageLimit, boardLimit);
					sList = sService.selectStatusStudent(newSpi, st.getStStatus());
					break;
			}
		} 
		else {
			switch(st.getStStatus()) {
			case "all":
				studentListCount = sService.selectNameSearchStudentListCount(st.getStudentName());
				newSpi = Pagination.getPageInfo(studentListCount, cpage, pageLimit, boardLimit);
				sList = sService.selectNameSearchAllStudent(newSpi, st.getStudentName());
				break;
			default:
				studentListCount = sService.selectStatusNameSearchStudentListCount(st);
				newSpi = Pagination.getPageInfo(studentListCount, cpage, pageLimit, boardLimit);
				sList = sService.selectStatusNameSearchStudent(newSpi, st);
				break;
			}
		}
		
		for (Student s : sList) {
			switch (s.getStStatus()) {
			case "Y":
				s.setStStatus("재학");
				break;
			case "N":
				s.setStStatus("자퇴");
				break;
			case "H":
				s.setStStatus("휴학");
				break;
			case "Z":
				s.setStStatus("제적");
				break;
			case "J":
				s.setStStatus("졸업");
				break;
			}
		}
		HashMap<String, Object> response = new HashMap<>();
        response.put("sList", sList);
        response.put("spi", newSpi);
        response.put("listCount", studentListCount);
        response.put("searchName", st.getStudentName());
        return ResponseEntity.ok(response);
	}
	
	@ResponseBody
	@RequestMapping("statistic.stu")
	public HashMap<String,Object> studentStatistic(){
		System.out.println("asdasd");
		int attendStu = sService.selectNumberOfStudents("Y");
		int absenceStu = sService.selectNumberOfStudents("H");
		int expelledStu = sService.selectNumberOfStudents("Z");
		int gradStu = sService.selectNumberOfStudents("J");
		int leaveStu = sService.selectNumberOfStudents("N");
		
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("attendStu", attendStu);
		map.put("absenceStu", absenceStu);
		map.put("expelledStu", expelledStu);
		map.put("gradStu", gradStu);
		map.put("leaveStu", leaveStu);
		
		return map;

	}

	@ResponseBody
	@RequestMapping("classPlanView.st")
	public String classPlanView(@RequestParam(value="classNum")String classNum) {
		System.out.println("보여지나" + classNum);
		Classroom c = sService.classPlanView(classNum);
		
		String fileName = c.getChangeName();
		
		System.out.println(fileName);
		return fileName;
	}
	
}
