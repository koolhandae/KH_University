package com.kh.khu.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.member.model.dao.MemberDao;
import com.kh.khu.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		// System.out.println("service" + m);
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public Member selectChkMember(String email) {
		return mDao.selectChkMember(sqlSession, email);
	}

	@Override
	public int changemPwd(String memberId, String encPwd) {
		return mDao.changemPwd(sqlSession, memberId, encPwd);
	}

	@Override
	public String selectMemberId(Member m) {
		return mDao.selectMemberId(sqlSession, m);
	}

	@Override
	public int verifyEmail(String email) {
		return mDao.verifyEmail(sqlSession, email);
	}

	@Override
	public int updateAddress(Member m) {
		return mDao.updateAddress(sqlSession, m);
	}

	@Override
	public ArrayList<Member> selectAllMember(PageInfo mpi) {
		return mDao.selectAllMember(sqlSession, mpi);
	}

	@Override
	public int selectMemberListCount() {
		return mDao.selectMemberListCount(sqlSession);
	}
	

	

}
