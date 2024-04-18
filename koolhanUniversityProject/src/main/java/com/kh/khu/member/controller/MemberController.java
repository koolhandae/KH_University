package com.kh.khu.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.student.model.service.StudentServiceImpl;
import com.kh.khu.student.model.vo.Student;

@Controller
public class MemberController {

   @Autowired
   private MemberServiceImpl mService;
   
   @Autowired
   private StudentServiceImpl sService;
   
   @Autowired
   private BCryptPasswordEncoder bcryptPasswordEncoder;
   
   // 임시 로그인 메소드
   /*
   @RequestMapping("login.me")
   public String loginMember(String userId, String userPwd, HttpSession session) {
      Member m = new Member();
      m.setMemberId(userId);
      m.setMemberPwd(userPwd);
      Member loginUser = mService.loginMember(m);
      
      session.setAttribute("loginUser", loginUser);
      
      return "admin/noticeListView";
   }
   */

   @RequestMapping("login.me")
   public String loginMember(String userId, String userPwd, HttpSession session, Model model) {
      
      String encPwd = bcryptPasswordEncoder.encode(userPwd);
      System.out.println(encPwd);
      
      HashMap<String, Object> alertMsg = new HashMap<String, Object>();
      
      if(userId.startsWith("kh")) {
         
         Student s = new Student();
         s.setStudentId(userId);
         s.setStudentPwd(userPwd);
   
         Student loginStudent  = sService.loginStudent(s);
         
         System.out.println("membercontroleer = " + loginStudent);
         
         if(loginStudent != null && bcryptPasswordEncoder.matches(s.getStudentPwd(), loginStudent.getStudentPwd())){
            // 로그인성공
        	 session.setAttribute("loginStudent", loginStudent);
        	 
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "로그인 성공");
	         alertMsg.put("text", "성공적으로 로그인 됐습니다");
	         session.setAttribute("alertMsg", alertMsg);
     
	         return "redirect:/mainPage.me"; 
         }
         
      }else {
         Member m = new Member();
         m.setMemberId(userId);
         m.setMemberPwd(userPwd);
         
         Member loginUser = mService.loginMember(m);
         
         //System.out.println(loginUser);
         

         
         if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
            // 로그인 성공
        	 session.setAttribute("loginUser", loginUser);         
            
	         alertMsg.put("icon", "success");
	         alertMsg.put("title", "로그인 성공");
	         alertMsg.put("text", "성공적으로 로그인 됐습니다");
	         session.setAttribute("alertMsg", alertMsg);
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
   

   /*
   @RequestMapping("insert.me")
   public String insertMember(Member m, HttpSession session) {
      m.setMemberPwd((m.getMemberSsn().substring(0, 6)) + "1!");
      int result = mService.insertMember(m);
      if(result > 0) {
         
      }
   }
   */
}