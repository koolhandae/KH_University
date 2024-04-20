package com.kh.khu.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public void getReturnStudent() {
		// todo: 만들어야 하는 쿼리는 복학 신청자 테이블을 조회 합니다 이걸 화면에 보여줍니다
		mDao.getReturnStudent();
		
	}

	@Override
	public void getTakeOffStudent() {
		// TODO 만들어야 하는 쿼리는 휴학 신청자 테이블을 조회합니다 이걸 화면에 보여줍니다 
		mDao.getTakeOffStudent();
	}

	@Override
	public void setReturnStudent() {
		// TODO 스튜던트의 상태데이터를 UPDATE 합니다 
		
		// TODO 복학 신청 등록 데이터를 UPdate 합니다 
	}

	@Override
	public void setTakeOffStudent() {
		// TODO 스튜던트의 상태데이터를 UPDATE 합니다 
		
		// TODO 휴학 신청 등록 데이터를 UPdate 합니다 
	}
	

	

}
