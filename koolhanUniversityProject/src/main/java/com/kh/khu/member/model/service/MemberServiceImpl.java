package com.kh.khu.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.model.vo.ProfilePicture;
import com.kh.khu.member.model.dao.MemberDao;
import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.member.model.vo.MemberAbsence;
import com.kh.khu.member.model.vo.MemberPresence;
import com.kh.khu.student.model.vo.Presence;

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

<<<<<<< HEAD
=======
	@Override
	public ArrayList<Member> selectAllMember(PageInfo mpi) {
		return mDao.selectAllMember(sqlSession, mpi);
	}

	@Override
	public ArrayList<Member> selectAllMemberType(PageInfo mpi, String meType) {
		return mDao.selectAllMemberType(sqlSession, mpi, meType);
	}
	@Override
	public ArrayList<Member> selectNameSearchAllMember(PageInfo mpi, String memberName){
		return mDao.selectNameSearchAllMember(sqlSession, mpi, memberName);
	}
	
	@Override
	public int selectMemberListCount(String meType) {
		return mDao.selectMemberListCount(sqlSession, meType);
	}
	
	@Override
	public int selectNameSearchMemberListCount(String memberName) {
		return mDao.selectNameSearchMemberListCount(sqlSession, memberName);
	}
	
	@Override
	public int selectNameSearchTypeMemberListCount(Member m) {
		return mDao.selectNameSearchTypeMemberListCount(sqlSession, m);
	}
>>>>>>> ded45c113c8805428774ecb8a448e3c8a6c8911b

	@Override
	public List<MemberAbsence> getTakeOffStudent() {
		// TODO 휴학 신청자 테이블을 조회합니다 이걸 화면에 보여줍니다 
		List<MemberAbsence> list = mDao.getTakeOffStudent(sqlSession);
		return list;
	}
	
	@Override
	public int setTakeOffStudent(String absId) {
		// TODO 스튜던트의 상태데이터를 UPDATE 합니다 
		int result = mDao.changeStudentStatus(sqlSession, absId);
		// System.out.println(absId);
		// TODO 휴학 신청 등록 데이터를 UPdate 합니다 
		result = mDao.changeTakeOffStudent(sqlSession, absId);
		return result;	
	}

	@Override
	public List<MemberPresence> getReturnStudent() {
		// todo: 복학 신청자 테이블을 조회 합니다 이걸 화면에 보여줍니다
		List<MemberPresence> list = mDao.getReturnStudent(sqlSession);
		
		return list;
	}
	
	@Override
	public int setReturnStudent(String preId) {
		// TODO 스튜던트의 상태데이터를 UPDATE 합니다 
		int result = mDao.changeReturnStatus(sqlSession, preId);
		// TODO 복학 신청 등록 데이터를 UPdate 합니다 
		result = mDao.changeReturnStudent(sqlSession, preId);
		return result;
	}


	@Override
	public List<AdminTuition> insertAdminTuition(AdminTuition tuition) {
		// TODO Auto-generated method stub
		int result = mDao.insertAdminTuition(sqlSession, tuition);
		//if()
		
		List<AdminTuition> list = mDao.selectAdminTuition(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<Member> selectNameSearchTypeMember(PageInfo mpi, Member m) {
		return mDao.selectNameSearchTypeMember(sqlSession, mpi, m);
	}

	@Override
	public int updateProfilePicture(Member m) {
		return mDao.updateProfilePicture(sqlSession, m);
	}

	@Override
	public int insertProfilePicture(ProfilePicture pp) {
		return mDao.insertProfilePicture(sqlSession, pp);
	}
	

	

}
