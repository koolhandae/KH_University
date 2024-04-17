package com.kh.khu.student.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.student.model.vo.Student;

@Repository
public class StudentDao {
	
	public Student loginStudent(SqlSession sqlSession, Student s) {
		// System.out.println("dao" + s);
		return sqlSession.selectOne("studentMapper.loginStudent", s);
	}

	public int insertTakeOff(SqlSessionTemplate sqlSession, Absence a) {
		return sqlSession.insert("studentMapper.insertTakeOff", a);
	}
	
	public Student selectChkStudent(SqlSession sqlSession, String email) {
		return sqlSession.selectOne("studentMapper.selectChkStudent", email);
	}
	
	public int changePwd(SqlSession sqlSession, String memberId, String encPwd) {
		System.out.println("encPwd : " + encPwd);
		 	Map<String, String> parameters = new HashMap();
		    parameters.put("memberId", memberId);
		    parameters.put("userPwd", encPwd);
		    /*hashmap에선 키값을 mapper에 담아줘야됨!*/
		    return sqlSession.update("studentMapper.changePwd", parameters);
	}
	
	public int selectTakeOff(SqlSessionTemplate sqlSession, Absence a) {
		return sqlSession.selectOne("studentMapper.selectTakeOff", a);
	}
	
	public int insertReturnSchool(SqlSessionTemplate sqlSession, Presence p) {
		return sqlSession.insert("studentMapper.insertReturnSchool", p);
	}

	public int insertStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.insert("studentMapper.insertStudent", s);
	}
	
	public String selectStudentId(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.selectOne("studentMapper.selectStudentId", s);
	}
}
