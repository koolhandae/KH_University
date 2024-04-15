package com.kh.khu.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.khu.member.model.service.MemberServiceImpl;
import com.kh.khu.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl mService;
	
	// 임시 로그인 메소드
	@RequestMapping("login.me")
	public String loginMember(String userId, String userPwd, HttpSession session) {
		Member m = new Member();
		m.setMemberId(userId);
		m.setMemberPwd(userPwd);
		Member loginUser = mService.loginMember(m);
		
		session.setAttribute("loginUser", loginUser);
		
		return "admin/noticeListView";
	}
	
//	@RequestMapping("insert.me")
//	public String insertMember(Member m, HttpSession session) {
//		m.setMemberPwd((m.getMemberSsn().substring(0, 6)) + "1!");
//		int result = mService.insertMember(m);
//		if(result > 0) {
//			
//		}
//	}
//	
}
