package com.kh.khu.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.member.model.vo.MemberAbsence;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		//System.out.println("Dao임!!"+m);
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member selectChkMember(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectChkMember", email);
	}
	
	public int changemPwd(SqlSessionTemplate sqlSession, String memberId, String encPwd) {
		//System.out.println("encPwd : " + encPwd);
		 	Map<String, String> parameters = new HashMap();
		    parameters.put("memberId", memberId);
		    parameters.put("userPwd", encPwd);
		    /*hashmap에선 키값을 mapper에 담아줘야됨!*/
		    return sqlSession.update("memberMapper.changemPwd", parameters);
	}
	
	public String selectMemberId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectMemberId", m);
	}
	
	public int verifyEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.verifyEmail", email);
	}
	
	public int updateAddress(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateAddress",m);
	}

	public void getReturnStudent() {
		// TODO 새로만들어진 복학신청자 데이터를 가져옵니다 
	}

	public List<MemberAbsence> getTakeOffStudent(SqlSessionTemplate sqlSession) {
		// TODO 새로만들어진 복학 신청자 데이터를 가져옵니다 
		return (ArrayList)sqlSession.selectList("memberMapper.selectAbsenceStudent");
	}

	public int changeStudentStatus(SqlSessionTemplate sqlSession, String absId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateAbsenceStudent", absId);
	}

	public int changeTakeOffStudent(SqlSessionTemplate sqlSession, String absId) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateAbsenceStudentSucess", absId);
	}

	public int insertAdminTuition(SqlSessionTemplate sqlSession, AdminTuition tuition) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertAdminTuition", tuition);
	}

	public List<AdminTuition> selectAdminTuition(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdminTuition");
	}
}
