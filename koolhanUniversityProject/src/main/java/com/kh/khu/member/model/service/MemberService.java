package com.kh.khu.member.model.service;

import com.kh.khu.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);
	
	int insertMember(Member m);

}
