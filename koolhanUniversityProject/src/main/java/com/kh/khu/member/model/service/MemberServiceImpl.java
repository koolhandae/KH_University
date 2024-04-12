package com.kh.khu.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.member.model.dao.MemberDao;
import com.kh.khu.member.model.vo.Member;

@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberDao mDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

}
