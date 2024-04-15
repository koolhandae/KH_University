package com.kh.khu.member.model.service;

import com.kh.khu.member.model.vo.Member;

public interface MemberService {
	
	// 로그인 메소드
	Member loginMember(Member m);
	
	// 교직원 / 교수 추가 메소드
	int insertMember(Member m);
	
	
	

}
