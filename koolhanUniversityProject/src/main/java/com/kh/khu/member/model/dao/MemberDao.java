package com.kh.khu.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.common.template.Pagination;
import com.kh.khu.member.model.vo.AdminTuition;
import com.kh.khu.member.model.vo.Member;
import com.kh.khu.member.model.vo.MemberAbsence;
import com.kh.khu.member.model.vo.MemberPresence;
import com.kh.khu.student.model.vo.Presence;

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

	public ArrayList<Member> selectAllMemberType(SqlSessionTemplate sqlSession, PageInfo mpi, String meType){
		return (ArrayList)sqlSession.selectList("memberMapper.selectAllMemberType", meType, Pagination.getRowBounds(mpi));
	}
	
	public ArrayList<Member> selectNameSearchAllMember(SqlSessionTemplate sqlSession, PageInfo mpi, String memberName){
		return (ArrayList)sqlSession.selectList("memberMapper.selectNameSearchAllMember", memberName, Pagination.getRowBounds(mpi));
	}
	
	public ArrayList<Member> selectNameSearchTypeMember(SqlSessionTemplate sqlSession, PageInfo mpi, Member m){
		return (ArrayList)sqlSession.selectList("memberMapper.selectNameSearchTypeMember", m, Pagination.getRowBounds(mpi));
	}
	
	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectMemberListCount");
	}
	
	public int selectMemberListCount(SqlSessionTemplate sqlSession, String meType) {
		return sqlSession.selectOne("memberMapper.selectMemberListCountType", meType);
	}
	
	public int selectNameSearchMemberListCount(SqlSessionTemplate sqlSession, String memberName) {
		return sqlSession.selectOne("memberMapper.selectNameSearchMemberListCount", memberName);
	}
	
	public int selectNameSearchTypeMemberListCount(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.selectNameSearchTypeMemberListCount", m);
	}
	
	public List<MemberPresence> getReturnStudent(SqlSessionTemplate sqlSession) {
		// TODO 새로 만들어진 복학신청자 데이터를 가져옵니다 
		return (ArrayList)sqlSession.selectList("memberMapper.selectPresenceStudent");
	}

	public List<MemberAbsence> getTakeOffStudent(SqlSessionTemplate sqlSession) {
		// TODO 새로 만들어진 휴학 신청자 데이터를 가져옵니다 
		return (ArrayList)sqlSession.selectList("memberMapper.selectAbsenceStudent");
	}

	public int changeStudentStatus(SqlSessionTemplate sqlSession, String absId) {
		return sqlSession.update("memberMapper.updateAbsenceStudent", absId);
		
	}

	public int changeTakeOffStudent(SqlSessionTemplate sqlSession, String absId) {
		return sqlSession.update("memberMapper.updateAbsenceStudentSuccess", absId);
	}

	public int changeReturnStatus(SqlSessionTemplate sqlSession, String preId) {
		return sqlSession.update("memberMapper.updatePresenceStudent", preId);
	}

	public int changeReturnStudent(SqlSessionTemplate sqlSession, String preId) {
		return sqlSession.update("memberMapper.updatePresenceStudentSuccess", preId);
	}
	
	public int insertAdminTuition(SqlSessionTemplate sqlSession, AdminTuition tuition) {
		return sqlSession.insert("memberMapper.insertAdminTuition", tuition);
	}
	
	

	public List<AdminTuition> selectAdminTuition(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdminTuition");
	}


}
