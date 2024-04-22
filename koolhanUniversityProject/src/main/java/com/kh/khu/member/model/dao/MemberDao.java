package com.kh.khu.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.Member;

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
	
	public ArrayList<Member> selectAllMember(SqlSessionTemplate sqlSession, PageInfo mpi){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMember", null, Pagination.getRowBounds(mpi));
	}
	
	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemberListCount");
	}
	
}
