package com.kh.khu.member.model.service;

import com.kh.khu.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 메소드
	Member loginMember(Member m);
	
	// 교직원 / 교수 추가 메소드
	int insertMember(Member m);
	
	Member selectChkMember(String email);
	
	int changemPwd(String userId, String encPwd);
	
	// 회원 가입시 아이디 확인용 메소드
	String selectMemberId(Member m);
	
	int verifyEmail(String email);
	
	int updateAddress(Member m);

	public void getReturnStudent();
	
	public void getTakeOffStudent();
	
	public void setReturnStudent();

	public void setTakeOffStudent();
}
