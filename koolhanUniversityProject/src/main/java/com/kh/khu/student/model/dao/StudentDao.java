package com.kh.khu.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.khu.student.model.vo.Absence;
import com.kh.khu.student.model.vo.Presence;
import com.kh.khu.classroom.model.vo.ClassNotice;
import com.kh.khu.classroom.model.vo.Course;
import com.kh.khu.common.model.vo.PageInfo;
import com.kh.khu.student.model.vo.Student;

@Repository
public class StudentDao {
	
	/* 학생 로그인 */
	public Student loginStudent(SqlSession sqlSession, Student s) {
		// System.out.println("dao" + s);
		return sqlSession.selectOne("studentMapper.loginStudent", s);
	}
	
	/*학생 비밀번호 찾기 메일 유효성*/
	public Student selectChkStudent(SqlSession sqlSession, String email) {
		return sqlSession.selectOne("studentMapper.selectChkStudent", email);
	}
	
	/*학생 비밀번호 찾기*/
	public int changePwd(SqlSession sqlSession, String memberId, String encPwd) {
		System.out.println("encPwd : " + encPwd);
		 	Map<String, String> parameters = new HashMap();
		    parameters.put("memberId", memberId);
		    parameters.put("userPwd", encPwd);
		    /*hashmap에선 키값을 mapper에 담아줘야됨!*/
		    return sqlSession.update("studentMapper.changePwd", parameters);
	}
	
	/* 학생 수강 강의 조회*/
	public ArrayList<Course> selectCourseList(SqlSession sqlsession, String studentId){
		
		return (ArrayList)sqlsession.selectList("studentMapper.selectCourseList", studentId);
	}
	
	/* 학생 수강 강의 검색*/
	public Course searchCourse(SqlSession sqlSession, String courseValue) {

		System.out.println("sDao" + sqlSession.selectOne("studentMapper.searchCourse", courseValue));
		
		return sqlSession.selectOne("studentMapper.searchCourse", courseValue);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항) 개수*/
	public int selectListCount(SqlSession sqlSession, String classNum) {
		System.out.println("DaoclassNum = " + classNum);
		return sqlSession.selectOne("classMapper.selectListCount", classNum);
	}
	
	/* 학생 수강 강의 세부 조회 (공지사항)*/
	public ArrayList<ClassNotice> selectClassNoticeList(SqlSession sqlSession, PageInfo pi, String classNum){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("classMapper.selectClassNoticeList", classNum, rowBounds);
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
	public int verifyEmail(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("studentMapper.verifyEmail", email);
	}
}
