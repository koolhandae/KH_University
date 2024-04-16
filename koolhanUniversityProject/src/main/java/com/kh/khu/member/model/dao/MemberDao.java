package com.kh.khu.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.member.model.vo.Member;
import com.kh.khu.student.model.vo.Student;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public Member selectChkMember(SqlSession sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.selectChkMember", email);
	}
	
	public int changemPwd(SqlSession sqlSession, String memberId, String encPwd) {
		System.out.println("encPwd : " + encPwd);
		 	Map<String, String> parameters = new HashMap();
		    parameters.put("memberId", memberId);
		    parameters.put("userPwd", encPwd);
		    /*hashmap에선 키값을 mapper에 담아줘야됨!*/
		    return sqlSession.update("memberMapper.changemPwd", parameters);
	}
}
