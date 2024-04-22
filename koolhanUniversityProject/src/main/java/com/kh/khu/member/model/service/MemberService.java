package com.kh.khu.member.model.service;

import java.util.ArrayList;

import com.kh.khu.common.model.vo.PageInfo;
import java.util.List;

import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.member.model.vo.MemberAbsence;

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

	int selectMemberListCount();
	
	ArrayList<Member> selectAllMember(PageInfo mpi);
	public void getReturnStudent();
	
	public List<MemberAbsence> getTakeOffStudent();
	
	public void setReturnStudent();

	public int setTakeOffStudent(String absId);
	
	public List<AdminTuition> insertAdminTuition(AdminTuition tuition);
}
